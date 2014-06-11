package wyopcl.interpreter;

import wyil.lang.Codes;

public class InterpreterNop extends Interpreter {
	private static InterpreterNop instance;	
	public InterpreterNop(){		
	}
	
	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static InterpreterNop getInstance(){
		if (instance == null){
			instance = new InterpreterNop();
		}
		return instance;
	}
	

	public void interpret(Codes.Nop code, StackFrame stackframe) {		
		int linenumber = stackframe.getLine();
		printMessage(stackframe, code.toString(),"");
		stackframe.setLine(++linenumber);
	}
}
