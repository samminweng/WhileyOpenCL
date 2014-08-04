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
import wyopcl.interpreter.InterpreterReturn;
import wyopcl.interpreter.InterpreterUpdate;
import wyopcl.interpreter.A.AssertOrAssumeInterpreter;
import wyopcl.interpreter.A.AssignInterpreter;
import wyopcl.interpreter.B.BinaryOperatorInterpreter;
import wyopcl.interpreter.C.ConstantInterpreter;
import wyopcl.interpreter.C.ConvertInterpreter;
import wyopcl.interpreter.D.DebugInterpreter;
import wyopcl.interpreter.F.FieldLoadInterpreter;
import wyopcl.interpreter.F.ForAllInterpreter;
import wyopcl.interpreter.G.GotoInterpreter;
import wyopcl.interpreter.I.IfInterpreter;
import wyopcl.interpreter.I.IfIsInterpreter;
import wyopcl.interpreter.I.IndexOfInterpreter;
import wyopcl.interpreter.I.IndirectInvokeInterpreter;
import wyopcl.interpreter.I.InvokeInterpreter;
import wyopcl.interpreter.L.LabelInterpreter;
import wyopcl.interpreter.L.LengthOfInterpreter;
import wyopcl.interpreter.L.ListOperatorInterpreter;
import wyopcl.interpreter.L.LoopInterpreter;
import wyopcl.interpreter.L.LoopEndInterpreter;
import wyopcl.interpreter.N.NewListInterpreter;
import wyopcl.interpreter.N.NewMapInterpreter;
import wyopcl.interpreter.N.NewRecordInterpreter;
import wyopcl.interpreter.N.NewTupleInterpreter;
import wyopcl.interpreter.N.NopInterpreter;
import wyopcl.interpreter.S.SetOperatorInterpreter;
import wyopcl.interpreter.S.StringOperatorInterpreter;
import wyopcl.interpreter.S.SubListInterpreter;
import wyopcl.interpreter.T.TryCatchInterpreter;
import wyopcl.interpreter.T.TupleLoadInterpreter;

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
	
	private void scanLabelsinBlock(Block blk){
		//Create the Symbol table from the symboltable.
		SymbolTable symbol = new SymbolTable(blk);					
		//Pre-scan the code block and keep the symbol label map.
		for(int pos = 0; pos <blk.size(); pos++){
			Block.Entry entry = blk.get(pos);
			Code code = entry.code;
			String label = null;
			int line = pos;
			if(code instanceof Codes.LoopEnd){
				label = ((Codes.LoopEnd)code).label;							
				//Go to the next statement after the loop end.
				line = pos+1;
				symbol.addLabelLoc(label+"LoopEnd", line);														
			}else if(code instanceof Codes.TryEnd){
				label = ((Codes.TryEnd)code).label;
				symbol.addTryCatchLoc(label, line);
			}else if(code instanceof Codes.Label){
				//Put the label map into the queue.
				label = ((Codes.Label)code).label;
				symbol.addLabelLoc(label, line);							
			}else if(code instanceof Codes.Loop){								
				//This case includes Code.Loop and Code.ForAll
				label = ((Codes.Loop)code).target;
				symbol.addLabelLoc(label, line);							
			}else if(code instanceof Codes.TryCatch){
				Codes.TryCatch trycatch = ((Codes.TryCatch)code);
				label = trycatch.target;
				symbol.addTryCatchLoc(label, line);
			} else{
				//Do nothing
			}
			printPreprocessorMessage(label, line);
		}

		symboltable.put(blk, symbol);
	}
	

	/*Scans the methods*/
	protected void preprocessor(WyilFile module){

		for(WyilFile.FunctionOrMethodDeclaration method : module.functionOrMethods()) {
			String name = method.name();
			for(Case mcase : method.cases()){
				Block pre = mcase.precondition();
				if(pre != null){
					blocktable.put(name+"pre", pre);
					scanLabelsinBlock(pre);
				}
				
				Block blk = mcase.body();
				blocktable.put(name, blk);
				scanLabelsinBlock(blk);
				Block post = mcase.postcondition();
				if(post != null){
					blocktable.put(name+"post", post);
					scanLabelsinBlock(post);
				}
			
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
					//Create a List of Constant objects.
					ArrayList<Constant> arguments = new ArrayList<Constant>();
					for(String arg: args){
						arguments.add(Constant.V_STRING(arg));
					}
					//Replace the value of args with the argument list.
					values.put("args", Constant.V_LIST(arguments));


					mainframe.setRegister(index, Constant.V_RECORD(values));
					index++;
				}

				blockstack.push(mainframe);				
			}
		}

		while(!blockstack.isEmpty()){
			StackFrame stackframe = blockstack.peek();
			Block block = stackframe.getBlock();
			int linenumber = stackframe.getLine();
			if(linenumber < block.size()){
				Block.Entry entry = block.get(linenumber);				
				this.dispatch(entry, stackframe);
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
				AssertOrAssumeInterpreter.getInstance().interpret((Codes.AssertOrAssume)code, stackframe);
			} else if (code instanceof Codes.Assign) {			
				AssignInterpreter.getInstance().interpret((Codes.Assign)code, stackframe);
			} else if (code instanceof Codes.BinaryOperator) {			
				BinaryOperatorInterpreter.getInstance().interpret((Codes.BinaryOperator)code, stackframe);
			} else if (code instanceof Codes.ListOperator) {
				ListOperatorInterpreter.getInstance().interpret((Codes.ListOperator)code, stackframe);
			} else if (code instanceof Codes.StringOperator) {
				StringOperatorInterpreter.getInstance().interpret((Codes.StringOperator)code, stackframe);
			} else if (code instanceof Codes.Convert) {			
				ConvertInterpreter.getInstance().interpret((Codes.Convert)code, stackframe);
			} else if (code instanceof Codes.Const) {			
				ConstantInterpreter.getInstance().interpret((Codes.Const)code, stackframe);
			} else if (code instanceof Codes.Debug) {
				DebugInterpreter.getInstance().interpret((Codes.Debug)code, stackframe);
			} else if (code instanceof Codes.Dereference) {
				internalFailure("Not implemented!", filename, entry);
			} else if (code instanceof Codes.FieldLoad) {		
				FieldLoadInterpreter.getInstance().interpret((Codes.FieldLoad)code, stackframe);			
			} else if (code instanceof Codes.ForAll) {				
				ForAllInterpreter.getInstance().interpret((Codes.ForAll)code, stackframe);
			} else if (code instanceof Codes.Goto) {	
				GotoInterpreter.getInstance().interpret((Codes.Goto)code, stackframe);
			} else if (code instanceof Codes.If) {
				IfInterpreter.getInstance().interpret((Codes.If)code, stackframe);			
			} else if (code instanceof Codes.IfIs) {
				IfIsInterpreter.getInstance().interpret((Codes.IfIs)code, stackframe);
			} else if (code instanceof Codes.IndirectInvoke) {			
				IndirectInvokeInterpreter.getInstance().interpret((Codes.IndirectInvoke)code, stackframe);
			} else if (code instanceof Codes.Invoke) {			
				InvokeInterpreter.getInstance().interpret((Codes.Invoke)code, stackframe);
			} else if (code instanceof Codes.Invert) {
				internalFailure("Not implemented!", filename, entry);
			} else if (code instanceof Codes.LoopEnd) {
				LoopEndInterpreter.getInstance().interpret((Codes.LoopEnd)code, stackframe);									
			} else if (code instanceof Codes.Label) {
				LabelInterpreter.getInstance().interpret((Codes.Label)code, stackframe);
			} else if (code instanceof Codes.Lambda) {
				internalFailure("Not implemented!", filename, entry);
			} else if (code instanceof Codes.LengthOf) {			
				LengthOfInterpreter.getInstance().interpret((Codes.LengthOf)code, stackframe);
			} else if (code instanceof Codes.IndexOf) {			
				IndexOfInterpreter.getInstance().interpret((Codes.IndexOf)code, stackframe);
			} else if (code instanceof Codes.Loop) {			
				LoopInterpreter.getInstance().interpret((Codes.Loop)code, stackframe);			
			} else if (code instanceof Codes.Move) {
				internalFailure("Not implemented!", filename, entry);
			} else if (code instanceof Codes.NewMap) {
				NewMapInterpreter.getInstance().interpret((Codes.NewMap)code, stackframe);
			} else if (code instanceof Codes.NewList) {			
				NewListInterpreter.getInstance().interpret((Codes.NewList)code, stackframe);
			} else if (code instanceof Codes.NewRecord) {
				NewRecordInterpreter.getInstance().interpret((Codes.NewRecord)code, stackframe);
			} else if (code instanceof Codes.NewSet) {
				internalFailure("Not implemented!", filename, entry);
			} else if (code instanceof Codes.NewTuple) {
				NewTupleInterpreter.getInstance().interpret((Codes.NewTuple)code, stackframe);
			} else if (code instanceof Codes.Return) {			
				InterpreterReturn.getInstance().interpret((Codes.Return)code, stackframe);
			} else if (code instanceof Codes.NewObject) {
				internalFailure("Not implemented!", filename, entry);
			} else if (code instanceof Codes.Nop) {
				NopInterpreter.getInstance().interpret((Codes.Nop)code, stackframe);
			} else if (code instanceof Codes.SetOperator){
				SetOperatorInterpreter.getInstance().interpret((Codes.SetOperator)code, stackframe);
			} else if (code instanceof Codes.SubList) {
				SubListInterpreter.getInstance().interpret((Codes.SubList)code, stackframe);
			} else if (code instanceof Codes.SubString) {
				internalFailure("Not implemented!", filename, entry);
			} else if (code instanceof Codes.Switch) {
				internalFailure("Not implemented!", filename, entry);
			} else if (code instanceof Codes.Throw) {
				internalFailure("Not implemented!", filename, entry);
			} else if (code instanceof Codes.TryCatch) {
				TryCatchInterpreter.getInstance().interpret((Codes.TryCatch)code, stackframe);
			} else if (code instanceof Codes.TupleLoad) {
				TupleLoadInterpreter.getInstance().interpret((Codes.TupleLoad)code, stackframe);
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
