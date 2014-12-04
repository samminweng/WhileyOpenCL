package wyopcl.interpreter.bytecode;

import wyil.lang.Codes;
import wyil.lang.Code.Block;
import wyopcl.interpreter.Interpreter;
import wyopcl.interpreter.StackFrame;
/**
 * Interprets <code>Codes.Goto</code> bytecode.
 * @author Min-Hsien Weng
 * @see wyil.lang.Codes.Goto
 *
 */
public class GotoInterpreter extends Interpreter {
	private static GotoInterpreter instance;	
	private GotoInterpreter(){	}
	
	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static GotoInterpreter getInstance(){
		if (instance == null){
			instance = new GotoInterpreter();
		}
		return instance;
	}
	
	public void interpret(Codes.Goto code, StackFrame stackframe){		
		int linenumber = stackframe.getLine();	
		
		Block block = stackframe.getBlock();
		linenumber = symboltable.get(block).getBlockPosByLabel(code.target);
		stackframe.setLine(linenumber);
		
		printMessage(stackframe, code.toString(),
				  code.target + "("+linenumber+")");
		
	}
	
	
}
