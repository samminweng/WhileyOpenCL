package wyopcl.interpreter.bytecode;

import wyil.lang.Codes;
import wyil.lang.Constant;
import wyopcl.interpreter.Interpreter;
import wyopcl.interpreter.StackFrame;
/**
 * Interprets <code>Codes.Const</code> bytecode.
 * @author Min-Hsien Weng
 * @see wyil.lang.Codes.Const
 *
 */
public class ConstantInterpreter extends Interpreter {
	private static ConstantInterpreter instance;
	
	private ConstantInterpreter(){	}
	
	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static ConstantInterpreter getInstance(){
		if (instance == null){
			instance = new ConstantInterpreter();
		}
		return instance;
	}


	public void interpret(Codes.Const code, StackFrame stackframe) {		
		// Add the register
		int linenumber = stackframe.getLine();
		Constant result = (Constant)code.constant;
		stackframe.setRegister(code.target(), result);
		printMessage(stackframe, code.toString(), "%"+ code.target() + "("+result+")");
		//Set the next line number
		stackframe.setLine(++linenumber);
	}

}
