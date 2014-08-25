package wyopcl.interpreter.N;

import wyil.lang.Codes;
import wyopcl.interpreter.Interpreter;
import wyopcl.interpreter.StackFrame;

public class NopInterpreter extends Interpreter {
	private static NopInterpreter instance;	
	public NopInterpreter(){		
	}
	
	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static NopInterpreter getInstance(){
		if (instance == null){
			instance = new NopInterpreter();
		}
		return instance;
	}
	

	public void interpret(Codes.Nop code, StackFrame stackframe) {		
		int linenumber = stackframe.getLine();
		printMessage(stackframe, code.toString(),"");
		stackframe.setLine(++linenumber);
	}
}
