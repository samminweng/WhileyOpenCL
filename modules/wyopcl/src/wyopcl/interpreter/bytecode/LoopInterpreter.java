package wyopcl.interpreter.bytecode;

import wyil.lang.Codes;
import wyopcl.interpreter.Interpreter;
import wyopcl.interpreter.StackFrame;
/**
 * Interprets <code>Codes.Loop</code> bytecode.
 * @author Min-Hsien Weng
 * @see wyil.lang.Codes.Loop
 *
 */
public class LoopInterpreter extends Interpreter {
	private static LoopInterpreter instance;	
	private LoopInterpreter(){}
	
	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static LoopInterpreter getInstance(){
		if (instance == null){
			instance = new LoopInterpreter();
		}
		return instance;
	}
	
	
	public void interpret(Codes.Loop code, StackFrame stackframe) {
		int linenumber = stackframe.getLine();
		//Code.Block block = stackframe.getBlock();
		//linenumber = symboltable.get(block).getBlockPosByLabel(code.target);
		printMessage(stackframe, code.toString(), "("+code.target+")");
		stackframe.setLine(++linenumber);
	}

}
