package wyopcl;

import static wycc.lang.SyntaxError.internalFailure;

import java.io.IOException;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import wybs.lang.Build;
import wybs.lang.Build.Project;
import wybs.lang.Builder;
import wycc.lang.SyntaxError;
import wycc.util.Logger;
import wycc.util.Pair;
import wyfs.lang.Path;
import wyfs.lang.Path.Root;
import wyil.lang.Code;
import wyil.lang.CodeBlock;
import wyil.lang.CodeBlock.Entry;
import wyil.lang.WyilFile;
import wyil.lang.WyilFile.Case;
import wyil.lang.WyilFile.FunctionOrMethodDeclaration;
import wyopcl.interpreter.Interpreter;
import wyopcl.interpreter.InterpreterAssertOrAssume;
import wyopcl.interpreter.InterpreterAssign;
import wyopcl.interpreter.InterpreterBinArithOp;
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
import wyopcl.interpreter.InterpreterNop;
import wyopcl.interpreter.InterpreterReturn;

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
				for(CodeBlock blk : mcase.body()){
					blocktable.put(name, blk);
					//Get the CodeBlock object from the symboltable.
					SymbolTable symbol = new SymbolTable(blk);					
					//Pre-scan the code block and keep the symbol label map.					
					for(int pos = 0; pos <blk.size(); pos++){
						Entry entry = blk.get(pos);
						Code code = entry.code;
						if(code instanceof Code.LoopEnd){
							String label = ((Code.LoopEnd)code).label;							
							//Go to the next statement after the loop end.
							int line = pos+1;
							symbol.addLabelLoc(label+"LoopEnd", line);
							//Display the message.
							System.out.println(label+"LoopEnd--->"+line);
						}else if(code instanceof Code.Label){
							//Put the label map into the queue.
							String label = ((Code.Label)code).label;
							symbol.addLabelLoc(label, pos);
							System.out.println(label+"--->"+pos);
						}else if(code instanceof Code.Loop){								
							//This case includes Code.Loop and Code.ForAll
							String label = ((Code.Loop)code).target;
							symbol.addLabelLoc(label, pos);
							System.out.println(label+"--->"+pos);
						}

					}

					symboltable.put(blk, symbol);


				}
			}
		}

	}

	

	protected void interpret(WyilFile module){
		//Get the main method
		for(FunctionOrMethodDeclaration method: module.functionOrMethod("main")){
			for(Case mcase:method.cases()){
				for(CodeBlock block : mcase.body()){
					//this.interpret(block);
					blockstack.push(new StackFrame(block,0, method.name(), -1));
				}
			}
		}

		while(!blockstack.isEmpty()){
			StackFrame frame = blockstack.peek();
			CodeBlock block = frame.getBlock();			
			//SymbolTable symbol = symboltable.get(block);
			int linenumber = frame.getLine();
			if(linenumber < block.size()){
				Entry entry = block.get(linenumber);				
				this.dispatch(entry, frame);
			}else{
				//Finish this block and pop it up from the stack.
				blockstack.pop();
			}
		}
	}


	private void dispatch(Entry entry, StackFrame stackframe) {	
		Code code = entry.code;

		try{
			if (code instanceof Code.AssertOrAssume) {			
				InterpreterAssertOrAssume.getInstance().interpret((Code.AssertOrAssume)code, stackframe);
			} else if (code instanceof Code.Assign) {			
				InterpreterAssign.getInstance().interpret((Code.Assign)code, stackframe);
			} else if (code instanceof Code.BinArithOp) {			
				InterpreterBinArithOp.getInstance().interpret((Code.BinArithOp)code, stackframe);
			} else if (code instanceof Code.BinListOp) {
				internalFailure("Not implemented!", filename, entry);
			} else if (code instanceof Code.BinSetOp) {
				internalFailure("Not implemented!", filename, entry);
			} else if (code instanceof Code.BinStringOp) {
				internalFailure("Not implemented!", filename, entry);
			} else if (code instanceof Code.Convert) {			
				InterpreterConvert.getInstance().interpret((Code.Convert)code, stackframe);
			} else if (code instanceof Code.Const) {			
				InterpreterConst.getInstance().interpret((Code.Const)code, stackframe);
			} else if (code instanceof Code.Debug) {
				internalFailure("Not implemented!", filename, entry);
			} else if (code instanceof Code.Dereference) {
				internalFailure("Not implemented!", filename, entry);
			} else if (code instanceof Code.FieldLoad) {		
				InterpreterFieldLoad.getInstance().interpret((Code.FieldLoad)code, stackframe);			
			} else if (code instanceof Code.ForAll) {				
				InterpreterForAll.getInstance().interpret((Code.ForAll)code, stackframe);
			} else if (code instanceof Code.Goto) {	
				InterpreterGoto.getInstance().interpret((Code.Goto)code, stackframe);
			} else if (code instanceof Code.If) {
				InterpreterIf.getInstance().interpret((Code.If)code, stackframe);			
			} else if (code instanceof Code.IfIs) {
				internalFailure("Not implemented!", filename, entry);
			} else if (code instanceof Code.IndirectInvoke) {			
				InterpreterIndirectInvoke.getInstance().interpret((Code.IndirectInvoke)code, stackframe);
			} else if (code instanceof Code.Invoke) {			
				InterpreterInvoke.getInstance().interpret((Code.Invoke)code, stackframe);
			} else if (code instanceof Code.Invert) {
				internalFailure("Not implemented!", filename, entry);
			} else if (code instanceof Code.LoopEnd) {
				InterpreterLoopEnd.getInstance().interpret((Code.LoopEnd)code, stackframe);									
			} else if (code instanceof Code.Label) {
				InterpreterLabel.getInstance().interpret((Code.Label)code, stackframe);
			} else if (code instanceof Code.Lambda) {
				internalFailure("Not implemented!", filename, entry);
			} else if (code instanceof Code.LengthOf) {			
				InterpreterLengthOf.getInstance().interpret((Code.LengthOf)code, stackframe);
			} else if (code instanceof Code.IndexOf) {			
				InterpreterIndexOf.getInstance().interpret((Code.IndexOf)code, stackframe);
			} else if (code instanceof Code.Loop) {			
				InterpreterLoop.getInstance().interpret((Code.Loop)code, stackframe);			
			} else if (code instanceof Code.Move) {
				internalFailure("Not implemented!", filename, entry);
			} else if (code instanceof Code.NewMap) {
				internalFailure("Not implemented!", filename, entry);
			} else if (code instanceof Code.NewList) {			
				InterpreterNewList.getInstance().interpret((Code.NewList)code, stackframe);
			} else if (code instanceof Code.NewRecord) {
				internalFailure("Not implemented!", filename, entry);
			} else if (code instanceof Code.NewSet) {
				internalFailure("Not implemented!", filename, entry);
			} else if (code instanceof Code.NewTuple) {
				internalFailure("Not implemented!", filename, entry);
			} else if (code instanceof Code.Return) {			
				InterpreterReturn.getInstance().interpret((Code.Return)code, stackframe);
			} else if (code instanceof Code.NewObject) {
				internalFailure("Not implemented!", filename, entry);
			} else if (code instanceof Code.Nop) {
				InterpreterNop.getInstance().interpret((Code.Nop)code, stackframe);
			} else if (code instanceof Code.SubList) {
				internalFailure("Not implemented!", filename, entry);
			} else if (code instanceof Code.SubString) {
				internalFailure("Not implemented!", filename, entry);
			} else if (code instanceof Code.Switch) {
				internalFailure("Not implemented!", filename, entry);
			} else if (code instanceof Code.Throw) {
				internalFailure("Not implemented!", filename, entry);
			} else if (code instanceof Code.TryCatch) {
				internalFailure("Not implemented!", filename, entry);
			} else if (code instanceof Code.TupleLoad) {
				internalFailure("Not implemented!", filename, entry);
			} else if (code instanceof Code.UnArithOp) {
				internalFailure("Not implemented!", filename, entry);
			} else if (code instanceof Code.Update) {
				internalFailure("Not implemented!", filename, entry);
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
