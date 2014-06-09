package wyopcl.interpreter;

import wyil.lang.Codes;
import wyopcl.interpreter.Interpreter.StackFrame;

public class InterpreterTryCatch extends Interpreter{
	private static InterpreterTryCatch instance;	
	public InterpreterTryCatch(){		
	}

	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static InterpreterTryCatch getInstance(){
		if (instance == null){
			instance = new InterpreterTryCatch();
		}
		return instance;
	}

	public void interpret(Codes.TryCatch code, StackFrame stackframe) {
		int linenumber = stackframe.getLine();
		System.out.println("#"+linenumber+" ["+code+"]\n>\n");
		stackframe.setLine(++linenumber);
		
	}
	
}
