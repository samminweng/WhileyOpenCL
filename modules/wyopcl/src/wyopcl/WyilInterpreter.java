package wyopcl;

import static wycc.lang.SyntaxError.internalFailure;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.net.URLClassLoader;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import wybs.lang.Build;
import wybs.lang.Build.Project;
import wybs.lang.Builder;
import wycc.lang.NameID;
import wycc.lang.SyntaxError;
import wycc.util.Logger;
import wycc.util.Pair;
import wyfs.lang.Path;
import wyfs.lang.Path.ID;
import wyfs.lang.Path.Root;
import wyil.io.WyilFileReader;
import wyil.lang.Code;
import wyil.lang.Code.Block;
import wyil.lang.Codes;
import wyil.lang.Constant;
import wyil.lang.Type;
import wyil.lang.Type.FunctionOrMethod;
import wyil.lang.WyilFile;
import wyil.lang.WyilFile.Case;
import wyil.lang.WyilFile.FunctionOrMethodDeclaration;
import wyopcl.interpreter.Interpreter;
import wyopcl.interpreter.InterpreterAssertOrAssume;
import wyopcl.interpreter.InterpreterAssign;
import wyopcl.interpreter.InterpreterBinaryOperator;
import wyopcl.interpreter.InterpreterListOperator;
import wyopcl.interpreter.InterpreterConst;
import wyopcl.interpreter.InterpreterConvert;
import wyopcl.interpreter.InterpreterFieldLoad;
import wyopcl.interpreter.InterpreterForAll;
import wyopcl.interpreter.InterpreterGoto;
import wyopcl.interpreter.InterpreterIf;
import wyopcl.interpreter.InterpreterIndexOf;
import wyopcl.interpreter.InterpreterIndirectInvoke;
import wyopcl.interpreter.InterpreterInvoke;
import wyopcl.interpreter.InterpreterLabel;
import wyopcl.interpreter.InterpreterLengthOf;
import wyopcl.interpreter.InterpreterLoop;
import wyopcl.interpreter.InterpreterLoopEnd;
import wyopcl.interpreter.InterpreterNewList;
import wyopcl.interpreter.InterpreterNewRecord;
import wyopcl.interpreter.InterpreterNop;
import wyopcl.interpreter.InterpreterReturn;
import wyopcl.interpreter.InterpreterStringOperator;
import wyopcl.interpreter.InterpreterSubList;
import wyopcl.interpreter.InterpreterTryCatch;
import wyopcl.interpreter.InterpreterUpdate;

public class WyilInterpreter extends Interpreter implements Builder{
	protected final Build.Project project;
	protected String filename;
	
	/**
	 * For logging information.
	 */
	protected Logger logger = Logger.NULL;

	public WyilInterpreter(Build.Project project) {
		this.project = project;
	}

	@Override
	public Project project() {
		return project;
	}

	public void setLogger(Logger logger) {
		this.logger = logger;
	}
	
	
	

	@SuppressWarnings("unchecked")
	@Override
	public Set<wyfs.lang.Path.Entry<?>> build(
			Collection<Pair<wyfs.lang.Path.Entry<?>, Root>> delta)
					throws IOException {
		Runtime runtime = Runtime.getRuntime();
		long start = System.currentTimeMillis();
		long memory = runtime.freeMemory();
		
		HashSet<Path.Entry<?>> generatedFiles = new HashSet<Path.Entry<?>>();
		for(Pair<Path.Entry<?>,Path.Root> p : delta) {
			//Path.Root dst = p.second();
			Path.Entry<WyilFile> sf = (Path.Entry<WyilFile>) p.first();
			WyilFile module = sf.read();
			setModule(module);
			this.filename = module.filename();
			this.preprocessor(module);
			//Get started with the main method.
			this.interpret(module);
		}

		long endTime = System.currentTimeMillis();
		logger.logTimedMessage("Wyil interpreter completed.\nFile:" + filename,
				(endTime - start), memory - runtime.freeMemory());
		return generatedFiles;
	}

	/*Scans the methods*/
	protected void preprocessor(WyilFile module){
			
		for(WyilFile.FunctionOrMethodDeclaration method : module.functionOrMethods()) {
			String name = method.name();
			for(Case mcase : method.cases()){
				Block blk = mcase.body();			
					blocktable.put(name, blk);
					//Get the CodeBlock object from the symboltable.
					SymbolTable symbol = new SymbolTable(blk);					
					//Pre-scan the code block and keep the symbol label map.					
					for(int pos = 0; pos <blk.size(); pos++){
						Block.Entry entry = blk.get(pos);
						Code code = entry.code;
						if(code instanceof Codes.LoopEnd){
							String label = ((Codes.LoopEnd)code).label;							
							//Go to the next statement after the loop end.
							int line = pos+1;
							symbol.addLabelLoc(label+"LoopEnd", line);
							//Display the message.
							if(verbose){
								System.out.println(label+"LoopEnd--->"+line);
							}
							
						}else if(code instanceof Codes.Label){
							//Put the label map into the queue.
							String label = ((Codes.Label)code).label;
							symbol.addLabelLoc(label, pos);
							if(verbose){
								System.out.println(label+"--->"+pos);
							}
							
						}else if(code instanceof Codes.Loop){								
							//This case includes Code.Loop and Code.ForAll
							String label = ((Codes.Loop)code).target;
							symbol.addLabelLoc(label, pos);
							if(verbose){
								System.out.println(label+"--->"+pos);
							}							
						}else{
							//Do nothing
						}

					}

					symboltable.put(blk, symbol);
			}
		}

	}
	
	
	

	protected void interpret(WyilFile module){
		//Get the main method
		for(FunctionOrMethodDeclaration method: module.functionOrMethod("main")){
			for(Case mcase:method.cases()){
				Block block = mcase.body();				
				StackFrame mainframe = new StackFrame(1, block,0, method.name(), -1);
				
				//Put a Constant.Record to the regiter 0.				
				int index = 0;
				for(Type param : method.type().params()){
					//The values are used to create the Constant.Record.
					HashMap<String, Constant> values = new HashMap<String, Constant>();
					//put 'args' and 'out' fields into values.
					Iterator<Entry<String, Type>> iterator = ((Type.Record)param).fields().entrySet().iterator();
					while(iterator.hasNext()){
						Entry<String, Type> next = iterator.next();
						values.put(next.getKey(), Constant.V_TYPE(next.getValue()));
					}
					//Values = {[string] args,{method(any) => void print,method(any) => void println} out} 
					if(args.length > 0 ){
						ArrayList<Constant> arguments = new ArrayList<Constant>();
						for(String arg: args){
							arguments.add(Constant.V_STRING(arg));
						}
						//Replace the value of args with the argument list.
						values.put("args", Constant.V_LIST(arguments));
					}
					
					mainframe.setRegister(index, Constant.V_RECORD(values));
					index++;
				}
				
				blockstack.push(mainframe);				
			}
		}

		while(!blockstack.isEmpty()){
			StackFrame frame = blockstack.peek();
			Block block = frame.getBlock();
			int linenumber = frame.getLine();
			if(linenumber < block.size()){
				Block.Entry entry = block.get(linenumber);				
				this.dispatch(entry, frame);
			}else{
				//Finish this block and pop it up from the stack.
				blockstack.pop();
			}
		}
	}


	private void dispatch(Block.Entry entry, StackFrame stackframe) {	
		Code code = entry.code;

		try{
			if (code instanceof Codes.AssertOrAssume) {			
				InterpreterAssertOrAssume.getInstance().interpret((Codes.AssertOrAssume)code, stackframe);
			} else if (code instanceof Codes.Assign) {			
				InterpreterAssign.getInstance().interpret((Codes.Assign)code, stackframe);
			} else if (code instanceof Codes.BinaryOperator) {			
				InterpreterBinaryOperator.getInstance().interpret((Codes.BinaryOperator)code, stackframe);
			} else if (code instanceof Codes.ListOperator) {
				InterpreterListOperator.getInstance().interpret((Codes.ListOperator)code, stackframe);
			} else if (code instanceof Codes.StringOperator) {
				InterpreterStringOperator.getInstance().interpret((Codes.StringOperator)code, stackframe);
			} else if (code instanceof Codes.Convert) {			
				InterpreterConvert.getInstance().interpret((Codes.Convert)code, stackframe);
			} else if (code instanceof Codes.Const) {			
				InterpreterConst.getInstance().interpret((Codes.Const)code, stackframe);
			} else if (code instanceof Codes.Debug) {
				internalFailure("Not implemented!", filename, entry);
			} else if (code instanceof Codes.Dereference) {
				internalFailure("Not implemented!", filename, entry);
			} else if (code instanceof Codes.FieldLoad) {		
				InterpreterFieldLoad.getInstance().interpret((Codes.FieldLoad)code, stackframe);			
			} else if (code instanceof Codes.ForAll) {				
				InterpreterForAll.getInstance().interpret((Codes.ForAll)code, stackframe);
			} else if (code instanceof Codes.Goto) {	
				InterpreterGoto.getInstance().interpret((Codes.Goto)code, stackframe);
			} else if (code instanceof Codes.If) {
				InterpreterIf.getInstance().interpret((Codes.If)code, stackframe);			
			} else if (code instanceof Codes.IfIs) {
				internalFailure("Not implemented!", filename, entry);
			} else if (code instanceof Codes.IndirectInvoke) {			
				InterpreterIndirectInvoke.getInstance().interpret((Codes.IndirectInvoke)code, stackframe);
			} else if (code instanceof Codes.Invoke) {			
				InterpreterInvoke.getInstance().interpret((Codes.Invoke)code, stackframe);
			} else if (code instanceof Codes.Invert) {
				internalFailure("Not implemented!", filename, entry);
			} else if (code instanceof Codes.LoopEnd) {
				InterpreterLoopEnd.getInstance().interpret((Codes.LoopEnd)code, stackframe);									
			} else if (code instanceof Codes.Label) {
				InterpreterLabel.getInstance().interpret((Codes.Label)code, stackframe);
			} else if (code instanceof Codes.Lambda) {
				internalFailure("Not implemented!", filename, entry);
			} else if (code instanceof Codes.LengthOf) {			
				InterpreterLengthOf.getInstance().interpret((Codes.LengthOf)code, stackframe);
			} else if (code instanceof Codes.IndexOf) {			
				InterpreterIndexOf.getInstance().interpret((Codes.IndexOf)code, stackframe);
			} else if (code instanceof Codes.Loop) {			
				InterpreterLoop.getInstance().interpret((Codes.Loop)code, stackframe);			
			} else if (code instanceof Codes.Move) {
				internalFailure("Not implemented!", filename, entry);
			} else if (code instanceof Codes.NewMap) {
				internalFailure("Not implemented!", filename, entry);
			} else if (code instanceof Codes.NewList) {			
				InterpreterNewList.getInstance().interpret((Codes.NewList)code, stackframe);
			} else if (code instanceof Codes.NewRecord) {
				InterpreterNewRecord.getInstance().interpret((Codes.NewRecord)code, stackframe);
			} else if (code instanceof Codes.NewSet) {
				internalFailure("Not implemented!", filename, entry);
			} else if (code instanceof Codes.NewTuple) {
				internalFailure("Not implemented!", filename, entry);
			} else if (code instanceof Codes.Return) {			
				InterpreterReturn.getInstance().interpret((Codes.Return)code, stackframe);
			} else if (code instanceof Codes.NewObject) {
				internalFailure("Not implemented!", filename, entry);
			} else if (code instanceof Codes.Nop) {
				InterpreterNop.getInstance().interpret((Codes.Nop)code, stackframe);
			} else if (code instanceof Codes.SubList) {
				InterpreterSubList.getInstance().interpret((Codes.SubList)code, stackframe);
			} else if (code instanceof Codes.SubString) {
				internalFailure("Not implemented!", filename, entry);
			} else if (code instanceof Codes.Switch) {
				internalFailure("Not implemented!", filename, entry);
			} else if (code instanceof Codes.Throw) {
				internalFailure("Not implemented!", filename, entry);
			} else if (code instanceof Codes.TryCatch) {
				InterpreterTryCatch.getInstance().interpret((Codes.TryCatch)code, stackframe);
			} else if (code instanceof Codes.TupleLoad) {
				internalFailure("Not implemented!", filename, entry);
			} else if (code instanceof Codes.Update) {
				InterpreterUpdate.getInstance().interpret((Codes.Update)code, stackframe);
			} else {
				internalFailure("unknown wyil code encountered (" + code + ")", filename, entry);
			}
		}catch (SyntaxError ex) {
			throw ex;
		} catch (Exception ex) {		
			internalFailure(ex.getMessage(), filename, entry, ex);
		}

	}




	
	




}
