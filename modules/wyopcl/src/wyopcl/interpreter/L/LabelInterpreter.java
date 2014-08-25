package wyopcl.interpreter.L;

import wyil.lang.Codes;
import wyopcl.interpreter.Interpreter;
import wyopcl.interpreter.StackFrame;

public class LabelInterpreter extends Interpreter {
	private static LabelInterpreter instance;	
	public LabelInterpreter(){		
	}
	
	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static LabelInterpreter getInstance(){
		if (instance == null){
			instance = new LabelInterpreter();
		}
		return instance;
	}
	
	public void interpret(Codes.Label code, StackFrame stackframe) {
		int linenumber = stackframe.getLine();
		printMessage(stackframe, code.toString(), "("+code.label+")");
		stackframe.setLine(++linenumber);
	}

}
