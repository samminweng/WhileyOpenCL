package wyopcl.interpreter;

import wyil.lang.Codes;
import wyil.lang.Constant;

public class InterpreterLoop extends Interpreter {
	private static InterpreterLoop instance;	
	public InterpreterLoop(){		
	}
	
	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static InterpreterLoop getInstance(){
		if (instance == null){
			instance = new InterpreterLoop();
		}
		return instance;
	}
	
	
	public void interpret(Codes.Loop code, StackFrame stackframe) {
		int linenumber = stackframe.getLine();
//		for (int modifiedOperand:code.modifiedOperands){
//			Constant operand = stackframe.getRegister(modifiedOperand);			
//		}		
		printMessage(stackframe, code.toString(), "("+code.target+")");
		
		stackframe.setLine(++linenumber);
	}

}
