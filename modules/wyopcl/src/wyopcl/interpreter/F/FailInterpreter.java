package wyopcl.interpreter.F;

import static wycc.lang.SyntaxError.internalFailure;
import wyil.lang.Codes;
import wyopcl.interpreter.Interpreter;
import wyopcl.interpreter.StackFrame;

public class FailInterpreter extends Interpreter {
	private static FailInterpreter instance;	
	public FailInterpreter(){
	}

	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static FailInterpreter getInstance(){
		if (instance == null){
			instance = new FailInterpreter();
		}
		return instance;
	}
	
	public void interpret(Codes.Fail code, StackFrame stackframe) {
		//Throw out an assertion error.
		throw new RuntimeException(code.message.value);
		//internalFailure(code.message, "FailInterpreter.java", null);
		
	}
	
	
}
