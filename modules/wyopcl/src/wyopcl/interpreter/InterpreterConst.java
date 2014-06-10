package wyopcl.interpreter;

import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Constant;

public class InterpreterConst extends Interpreter {
	private static InterpreterConst instance;	
	public InterpreterConst(){
	}
	
	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static InterpreterConst getInstance(){
		if (instance == null){
			instance = new InterpreterConst();
		}
		return instance;
	}


	public void interpret(Codes.Const code, StackFrame stackframe) {		
		// Add the register
		int linenumber = stackframe.getLine();
		Constant result = code.constant;
		stackframe.setRegister(code.target, code.constant);
		//System.out.println("#"+linenumber+" ["+code+"]\n>"
		//		+ "%"+ code.target + "(" + code.constant+")\n");
		printMessage(stackframe, code.toString(), "%"+ code.target + "("+result+")\n");
		//Set the next line number
		stackframe.setLine(++linenumber);
	}

}
