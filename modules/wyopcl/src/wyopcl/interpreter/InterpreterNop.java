package wyopcl.interpreter;

import wyil.lang.Code;

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
	

	public void interpret(Code.Nop code, StackFrame stackframe) {		
		int linenumber = stackframe.getLine();
		System.out.println("#"+linenumber+" ["+code+"]\n>\n");
		stackframe.setLine(++linenumber);
	}
}
