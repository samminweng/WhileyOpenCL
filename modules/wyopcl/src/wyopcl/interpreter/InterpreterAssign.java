package wyopcl.interpreter;

import wyil.lang.Codes;
import wyil.lang.Constant;

public class InterpreterAssign extends Interpreter {
	private static InterpreterAssign instance;	
	public InterpreterAssign(){
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
		int operand = code.operand;
		int target = code.target;
		Constant result = stackframe.getRegister(operand);
		stackframe.setRegister(target, result);
		System.out.println("#"+linenumber+" ["+code+"]\n>"
				+"%" + operand+ "("+ result +") %"+ target + "("+result+")\n");
		stackframe.setLine(++linenumber);
	}

}
