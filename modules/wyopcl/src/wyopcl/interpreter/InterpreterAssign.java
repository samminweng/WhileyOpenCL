package wyopcl.interpreter;

import wyil.lang.Codes;
import wyil.lang.Constant;

public class InterpreterAssign extends Interpreter {
	private static InterpreterAssign instance;	
	public InterpreterAssign(){
		super();
	}

	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static InterpreterAssign getInstance(){
		if (instance == null){
			instance = new InterpreterAssign();
		}
		return instance;
	}

	public void interpret(Codes.Assign code, StackFrame stackframe) {
		int linenumber = stackframe.getLine();
		//Constant value = stackframe.getRegister(code.operand);
		Constant value = stackframe.getRegister(code.operand(0));
		
		//Copy the value 
		Constant result = Converter.copyConstant(value);
		stackframe.setRegister(code.target(), result);		
		printMessage(stackframe, code.toString(), "%"+ code.target() + "("+result+")");
		stackframe.setLine(++linenumber);
	}

}
