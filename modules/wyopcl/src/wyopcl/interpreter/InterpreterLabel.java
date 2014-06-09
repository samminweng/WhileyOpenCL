package wyopcl.interpreter;

import wyil.lang.Codes;

public class InterpreterLabel extends Interpreter {
	private static InterpreterLabel instance;	
	public InterpreterLabel(){		
	}
	
	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static InterpreterLabel getInstance(){
		if (instance == null){
			instance = new InterpreterLabel();
		}
		return instance;
	}
	
	public void interpret(Codes.Label code, StackFrame stackframe) {
		int linenumber = stackframe.getLine();
		System.out.println("#"+linenumber+" ["+code+"]\n>"
				+"("+ code.label+")\n");
		stackframe.setLine(++linenumber);
	}

}
