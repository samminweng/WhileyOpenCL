package wyopcl.interpreter.T;

import wyil.lang.Codes;
import wyopcl.interpreter.Interpreter;
import wyopcl.interpreter.Interpreter.StackFrame;

public class TryCatchInterpreter extends Interpreter{
	private static TryCatchInterpreter instance;	
	public TryCatchInterpreter(){		
	}

	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static TryCatchInterpreter getInstance(){
		if (instance == null){
			instance = new TryCatchInterpreter();
		}
		return instance;
	}

	public void interpret(Codes.TryCatch code, StackFrame stackframe) {
		int linenumber = stackframe.getLine();
		printMessage(stackframe, code.toString(),"");
		stackframe.setLine(++linenumber);
		
	}
	
}
