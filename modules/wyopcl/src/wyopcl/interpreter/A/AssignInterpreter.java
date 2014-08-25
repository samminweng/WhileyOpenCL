package wyopcl.interpreter.A;

import wyil.lang.Codes;
import wyil.lang.Constant;
import wyopcl.interpreter.Utility;
import wyopcl.interpreter.Interpreter;

public class AssignInterpreter extends Interpreter {
	private static AssignInterpreter instance;	
	public AssignInterpreter(){
		super();
	}

	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static AssignInterpreter getInstance(){
		if (instance == null){
			instance = new AssignInterpreter();
		}
		return instance;
	}

	public void interpret(Codes.Assign code, StackFrame stackframe) {
		int linenumber = stackframe.getLine();
		Constant value = stackframe.getRegister(code.operand(0));
	
		//Copy the value 
		Constant result = Utility.copyConstant(value);
		stackframe.setRegister(code.target(), result);		
		printMessage(stackframe, code.toString(), "%"+ code.target() + "("+result+")");
		stackframe.setLine(++linenumber);
	}

}
