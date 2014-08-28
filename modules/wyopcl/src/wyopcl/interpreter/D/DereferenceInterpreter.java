package wyopcl.interpreter.D;

import wyil.lang.Codes;
import wyil.lang.Constant;
import wyopcl.interpreter.Interpreter;
import wyopcl.interpreter.StackFrame;

public class DereferenceInterpreter extends Interpreter {
	private static DereferenceInterpreter instance;

	public DereferenceInterpreter() {
	}

	/* Implement the Singleton pattern to ensure this class has one instance. */
	public static DereferenceInterpreter getInstance() {
		if (instance == null) {
			instance = new DereferenceInterpreter();
		}
		return instance;
	}
	
	public void interpret(Codes.Dereference code, StackFrame stackframe) {
		int linenumber = stackframe.getLine();
		//Get the reference constant
		Constant reference = stackframe.getRegister(code.operand(0));
		//Deference it
		
		//Set it the target register.
		stackframe.setRegister(code.target(), reference);
		printMessage(stackframe, code.toString(),"%"+code.target()+"("+reference+")");
		stackframe.setLine(++linenumber);
	}
}
