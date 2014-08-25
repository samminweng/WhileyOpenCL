package wyopcl.interpreter.L;

import wyil.lang.Codes;
import wyil.lang.Constant;
import wyopcl.interpreter.Interpreter;
import wyopcl.interpreter.StackFrame;

public class LoopInterpreter extends Interpreter {
	private static LoopInterpreter instance;	
	public LoopInterpreter(){		
	}
	
	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static LoopInterpreter getInstance(){
		if (instance == null){
			instance = new LoopInterpreter();
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
