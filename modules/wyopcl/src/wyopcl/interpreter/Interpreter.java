package wyopcl.interpreter;

import static wycc.lang.SyntaxError.internalFailure;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Stack;

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
	protected static HashMap<String, HashMap<FunctionOrMethod, Block>> blocktable = new HashMap<String, HashMap<FunctionOrMethod, Block>>();
	protected static Stack<StackFrame> blockstack = new Stack<StackFrame>();
	protected static HashMap<Block, SymbolTable> symboltable = new HashMap<Block, SymbolTable>();
	protected static boolean verbose = false;
	protected static boolean verify = false;
	protected static WyilFile module;
	protected String[] args;
	
	/**
	 * Passing the additional arguments from console to the interpreter.
	 */
	public String[] getArgs() {
		return args;
	}

	public void setArgs(String[] args) {
		this.args = args;
	}
	
	
	public static boolean isVerify() {
		return verify;
	}

	public void setVerify(boolean verify) {
		Interpreter.verify = verify;
	}
	
	public static WyilFile getModule() {
		return module;
	}
	
	public void setModule(WyilFile module) {
		Interpreter.module = module;
	}


	public static boolean isVerbose() {
		return verbose;
	}
	
	public void setVerbose(boolean verbose) {
		Interpreter.verbose = verbose;
	}
	
	
	public void printMessage(StackFrame stackframe, String input, String output){
		if(verbose){
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
