package wyopcl.interpreter;

import static wycc.lang.SyntaxError.internalFailure;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map.Entry;
import java.util.Set;
import java.util.Stack;

import wybs.lang.Build.Project;
import wybs.lang.Builder;
import wycc.lang.SyntaxError;
import wycc.util.Logger;
import wycc.util.Pair;
import wyfs.lang.Path;
import wyfs.lang.Path.Root;
import wyil.lang.Code;
import wyil.lang.Code.Block;
import wyil.lang.Codes;
import wyil.lang.Constant;
import wyil.lang.Type;
import wyil.lang.Type.FunctionOrMethod;
import wyil.lang.WyilFile;
import wyil.lang.WyilFile.Case;
import wyil.lang.WyilFile.FunctionOrMethodDeclaration;
import wyopcl.interpreter.bytecode.AssertOrAssumeInterpreter;
import wyopcl.interpreter.bytecode.AssignInterpreter;
import wyopcl.interpreter.bytecode.BinaryOperatorInterpreter;
import wyopcl.interpreter.bytecode.ConstantInterpreter;
import wyopcl.interpreter.bytecode.ConvertInterpreter;
import wyopcl.interpreter.bytecode.DebugInterpreter;
import wyopcl.interpreter.bytecode.DereferenceInterpreter;
import wyopcl.interpreter.bytecode.FailInterpreter;
import wyopcl.interpreter.bytecode.FieldLoadInterpreter;
import wyopcl.interpreter.bytecode.ForAllInterpreter;
import wyopcl.interpreter.bytecode.GotoInterpreter;
import wyopcl.interpreter.bytecode.IfInterpreter;
import wyopcl.interpreter.bytecode.IfIsInterpreter;
import wyopcl.interpreter.bytecode.IndexOfInterpreter;
import wyopcl.interpreter.bytecode.IndirectInvokeInterpreter;
import wyopcl.interpreter.bytecode.InvertInterpreter;
import wyopcl.interpreter.bytecode.InvokeInterpreter;
import wyopcl.interpreter.bytecode.LabelInterpreter;
import wyopcl.interpreter.bytecode.LambdaInterpreter;
import wyopcl.interpreter.bytecode.LengthOfInterpreter;
import wyopcl.interpreter.bytecode.ListOperatorInterpreter;
import wyopcl.interpreter.bytecode.LoopEndInterpreter;
import wyopcl.interpreter.bytecode.LoopInterpreter;
import wyopcl.interpreter.bytecode.NewListInterpreter;
import wyopcl.interpreter.bytecode.NewMapInterpreter;
import wyopcl.interpreter.bytecode.NewObjectInterpreter;
import wyopcl.interpreter.bytecode.NewRecordInterpreter;
import wyopcl.interpreter.bytecode.NewSetInterpreter;
import wyopcl.interpreter.bytecode.NewTupleInterpreter;
import wyopcl.interpreter.bytecode.NopInterpreter;
import wyopcl.interpreter.bytecode.ReturnInterpreter;
import wyopcl.interpreter.bytecode.SetOperatorInterpreter;
import wyopcl.interpreter.bytecode.StringOperatorInterpreter;
import wyopcl.interpreter.bytecode.SubListInterpreter;
import wyopcl.interpreter.bytecode.SubStringInterpreter;
import wyopcl.interpreter.bytecode.SwitchInterpreter;
import wyopcl.interpreter.bytecode.ThrowInterpreter;
import wyopcl.interpreter.bytecode.TryCatchInterpreter;
import wyopcl.interpreter.bytecode.TupleLoadInterpreter;
import wyopcl.interpreter.bytecode.UnaryOperatorInterpreter;
import wyopcl.interpreter.bytecode.UpdateInterpreter;

/*Declare the abstract Interpreter class, methods and variables. */
public class Interpreter implements Builder {
	//Store a hashmap inside a hashmap.
	protected static HashMap<String, HashMap<FunctionOrMethod, Block>> blocktable = new HashMap<String, HashMap<FunctionOrMethod, Block>>();
	protected static Stack<StackFrame> blockstack = new Stack<StackFrame>();
	protected static SymbolTable symboltable = new SymbolTable();
	protected static InterpreterConfiguration config;
	
	public Interpreter(){	
		
	}	
	
	public Interpreter(InterpreterConfiguration config){
		Interpreter.config = config;
	}
	
	/**
	 * Passing the additional arguments from console to the interpreter.
	 */
	public String[] getArgs() {
		return (String[]) config.getProperty("arguments");
	}
	
	public WyilFile getModule() {
		return (WyilFile) config.getProperty("module");
	}

	public boolean isVerbose() {
		return (boolean) config.getProperty("verbose");
	}	
	
	
	@Override
	public Project project() {
		return (Project) config.getProperty("project");
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
			config.setProperty("module", module);
			config.setProperty("filename", module.filename());
			this.preprocessor(module);
			//Get started with the main method.
			this.interpret(module);
		}

		long endTime = System.currentTimeMillis();
		Logger logger = (Logger) config.getProperty("logger");
		logger.logTimedMessage("Wyil interpreter completed.\nFile:" + config.getProperty("filename"),
				(endTime - start), memory - runtime.freeMemory());
		return generatedFiles;
	}
	
	
	/**
	 * Adds or returns the Function blocks (HashMap) by method names.
	 * @param name the name of function or method
	 * @return the function blocks (a hashmap)
	 */
	public static HashMap<FunctionOrMethod, Block> addFuncBlocksByName(String name){
		if(!blocktable.containsKey(name)){
			return new HashMap<FunctionOrMethod, Block>();
		}else{
			return blocktable.get(name);
		}
	}
	/**
	 * Updates the function or method blocks in the HashMap.
	 * @param name the name of function or method
	 * @param blocks the function blocks (Hashmap<FunctionOrMethod, Block>)
	 */
	public static void updateFuncBlocks(String name, HashMap<FunctionOrMethod, Block> blocks){
		blocktable.put(name, blocks);
	}
	
	
	private void scanLabelsinBlock(Block blk){					
		//Pre-scan the code block and keep the symbol label map.
		for(int pos = 0; pos <blk.size(); pos++){
			Block.Entry entry = blk.get(pos);
			Code code = entry.code;
			String label = null;
			if(code instanceof Codes.LoopEnd){
				label = ((Codes.LoopEnd)code).label+"LoopEnd";							
				//Go to the next statement after the loop end.
				symboltable.addLabelLoc(blk, label, pos+1);														
			}else if(code instanceof Codes.TryEnd){
				symboltable.addLabelLoc(blk, ((Codes.TryEnd) code).label, pos);
			}else if(code instanceof Codes.Label){
				//Put the label map into the queue.
				label = ((Codes.Label)code).label;
				symboltable.addLabelLoc(blk, label, pos);							
			}else if (code instanceof Codes.ForAll){
				label = ((Codes.Loop)code).target;
				symboltable.addLabelLoc(blk, label, pos);
			}else if(code instanceof Codes.Loop){								
				//This case includes Code.Loop and Code.ForAll
				label = ((Codes.Loop)code).target;
				symboltable.addLabelLoc(blk, label, pos);							
			}else if(code instanceof Codes.TryCatch){
				symboltable.addTryCatchLoc((Codes.TryCatch)code, pos);
			}else{
				//Do nothing
			}
			
			if(label != null && isVerbose()){
					System.out.println(label+"--->"+pos);
			}
		}
	}
	
	/*Scans the methods*/
	protected void preprocessor(WyilFile module){
		String id = module.id().toString();
		for(WyilFile.FunctionOrMethodDeclaration method : module.functionOrMethods()) {
			String name = id+":"+method.name();
			HashMap<FunctionOrMethod, Block> blocks = addFuncBlocksByName(name);
			for(Case mcase : method.cases()){
				List<Block.Entry> entries = new ArrayList<Block.Entry>();
				//Add the entries in the precondition.
				List<Block> pre_list = mcase.precondition();
				if(pre_list != null){
					Iterator<Block> iterator = pre_list.iterator();
					while(iterator.hasNext()){
						Block pre = iterator.next();
						entries.addAll(pre);
					}
					
				}	
				//Add the entries in the body block.
				Block blk = mcase.body();
				entries.addAll(blk);
				
				//Add the entries in the postcondition.
				List<Block> post_list = mcase.postcondition();
				if(post_list != null){
					Iterator<Block> iterator = post_list.iterator();
					while(iterator.hasNext()){
						Block post = iterator.next();
						entries.addAll(post);
					}					
				}
								
				Block block = new Block(blk.numInputs(), entries);
				blocks.put(method.type(), block);				
				scanLabelsinBlock(block);
			}
			
			updateFuncBlocks(name, blocks);
		}

	}
	
	
	/**
	 * Get the function block by name plus type (if provided)
	 * @param name the name of method or function
	 * @param functionOrMethod the method or function types
	 * @return the function block that contains a list of bytecode. 
	 */
	public static Block getFuncBlockByName(String name, FunctionOrMethod... functionOrMethod){
		//Get the Hashmap of function block by name	
		//Get the Block for the corresponding function/method.
		if(blocktable.containsKey(name)){
			HashMap<FunctionOrMethod, Block> hashMap = blocktable.get(name);
			if (functionOrMethod == null || functionOrMethod.length == 0){	
				return (Block) hashMap.values().toArray()[0];
			}else{
				return hashMap.get(functionOrMethod[0]);
			}
		}else{
			return null;
		}		
	}
	
	protected void interpret(WyilFile module){
		//Get the main method
		for(FunctionOrMethodDeclaration method: module.functionOrMethod("main")){
			for(Case mcase:method.cases()){
				Block block = mcase.body();				
				StackFrame mainframe = new StackFrame(1, block,0, method.name(), -1);
				//Put a Constant.Record to the register 0.				
				int index = 0;
				for(wyil.lang.Type param : method.type().params()){
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
					for(String arg: getArgs()){
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
				DereferenceInterpreter.getInstance().interpret((Codes.Dereference)code, stackframe);
			} else if (code instanceof Codes.Fail) {
				FailInterpreter.getInstance().interpret((Codes.Fail)code, stackframe);
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
				InvertInterpreter.getInstance().interpret((Codes.Invert)code, stackframe);
			} else if (code instanceof Codes.LoopEnd) {
				LoopEndInterpreter.getInstance().interpret((Codes.LoopEnd)code, stackframe);									
			} else if (code instanceof Codes.Label) {
				LabelInterpreter.getInstance().interpret((Codes.Label)code, stackframe);
			} else if (code instanceof Codes.Lambda) {
				LambdaInterpreter.getInstance().interpret((Codes.Lambda)code, stackframe);
			} else if (code instanceof Codes.LengthOf) {			
				LengthOfInterpreter.getInstance().interpret((Codes.LengthOf)code, stackframe);
			} else if (code instanceof Codes.IndexOf) {			
				IndexOfInterpreter.getInstance().interpret((Codes.IndexOf)code, stackframe);
			} else if (code instanceof Codes.Loop) {			
				LoopInterpreter.getInstance().interpret((Codes.Loop)code, stackframe);			
			} else if (code instanceof Codes.Move) {
				internalFailure("Not implemented!", (String)config.getProperty("filename"), entry);
			} else if (code instanceof Codes.NewMap) {
				NewMapInterpreter.getInstance().interpret((Codes.NewMap)code, stackframe);
			} else if (code instanceof Codes.NewList) {			
				NewListInterpreter.getInstance().interpret((Codes.NewList)code, stackframe);
			} else if (code instanceof Codes.NewRecord) {
				NewRecordInterpreter.getInstance().interpret((Codes.NewRecord)code, stackframe);
			} else if (code instanceof Codes.NewSet) {
				NewSetInterpreter.getInstance().interpret((Codes.NewSet)code, stackframe);
			} else if (code instanceof Codes.NewTuple) {
				NewTupleInterpreter.getInstance().interpret((Codes.NewTuple)code, stackframe);
			} else if (code instanceof Codes.Return) {			
				ReturnInterpreter.getInstance().interpret((Codes.Return)code, stackframe);
			} else if (code instanceof Codes.NewObject) {
				NewObjectInterpreter.getInstance().interpret((Codes.NewObject)code, stackframe);
			} else if (code instanceof Codes.Nop) {
				NopInterpreter.getInstance().interpret((Codes.Nop)code, stackframe);
			} else if (code instanceof Codes.SetOperator){
				SetOperatorInterpreter.getInstance().interpret((Codes.SetOperator)code, stackframe);
			} else if (code instanceof Codes.SubList) {
				SubListInterpreter.getInstance().interpret((Codes.SubList)code, stackframe);
			} else if (code instanceof Codes.SubString) {
				SubStringInterpreter.getInstance().interpret((Codes.SubString)code, stackframe);
			} else if (code instanceof Codes.Switch) {
				SwitchInterpreter.getInstance().interpret((Codes.Switch)code, stackframe);
			} else if (code instanceof Codes.Throw) {
				ThrowInterpreter.getInstance().interpret((Codes.Throw)code, stackframe);
			} else if (code instanceof Codes.TryCatch) {
				TryCatchInterpreter.getInstance().interpret((Codes.TryCatch)code, stackframe);
			} else if (code instanceof Codes.TupleLoad) {
				TupleLoadInterpreter.getInstance().interpret((Codes.TupleLoad)code, stackframe);
			} else if (code instanceof Codes.UnaryOperator){
				UnaryOperatorInterpreter.getInstance().interpret((Codes.UnaryOperator)code, stackframe);
			} else if (code instanceof Codes.Update) {
				UpdateInterpreter.getInstance().interpret((Codes.Update)code, stackframe);
			} else {
				internalFailure("unknown wyil code encountered (" + code + ")", (String)config.getProperty("filename"), entry);
			}
		} catch (SyntaxError ex) {
			throw ex;	
		} catch (Exception ex) {		
			internalFailure(ex.getMessage(), (String)config.getProperty("filename"), entry, ex);
		}

	}	
	
	
	public void printMessage(StackFrame stackframe, String input, String output){
		if(isVerbose()){
			System.out.println(stackframe.getDepth()+" "+stackframe.getName()+"."+stackframe.getLine()
					+" ["+input+"] "+output+"\n");
		}
		
	}

	public void printVerificationMessage(StackFrame stackframe, String input, String output){
		System.err.println(stackframe.getDepth()+" "+stackframe.getName()+"."+stackframe.getLine()
					+" ["+input+"] "+output+"\n");
		System.exit(-1);
	}
	
}
