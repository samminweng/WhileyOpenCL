package wyopcl.interpreter;

import static wycc.lang.SyntaxError.internalFailure;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Stack;

import wycc.util.Logger;
import wyil.lang.Code;
import wyil.lang.Code.Block;
import wyil.lang.Codes;
import wyil.lang.Constant;
import wyil.lang.Constant.Type;
import wyil.lang.Type.FunctionOrMethod;
import wyil.lang.WyilFile;
import wyil.lang.WyilFile.FunctionOrMethodDeclaration;

/*Declare the abstract Interpreter class, methods and variables. */
public abstract class Interpreter {
	//Store a hashmap inside a hashmap.
	private static HashMap<String, HashMap<FunctionOrMethod, Block>> blocktable = new HashMap<String, HashMap<FunctionOrMethod, Block>>();
	protected static Stack<StackFrame> blockstack = new Stack<StackFrame>();
	protected static HashMap<Block, SymbolTable> symboltable = new HashMap<Block, SymbolTable>();
	protected static InterpreterConfiguration config;
	
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
