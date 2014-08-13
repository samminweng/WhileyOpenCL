package wyopcl.interpreter.L;

import wyil.lang.Codes;
import wyil.lang.Constant;
import wyopcl.interpreter.Interpreter;
import wyopcl.interpreter.Interpreter.StackFrame;

public class LambdaInterpreter extends Interpreter {
	private static LambdaInterpreter instance;	
	public LambdaInterpreter(){		
	}
	
	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static LambdaInterpreter getInstance(){
		if (instance == null){
			instance = new LambdaInterpreter();
		}
		return instance;
	}
	
	public void interpret(Codes.Lambda code, StackFrame stackframe) {
		int linenumber = stackframe.getLine();
		Constant result = Constant.V_LAMBDA(code.name, code.type());
		stackframe.setRegister(code.target(), result);;
		printMessage(stackframe, code.toString(), "%"+ code.target() + "("+result+")");
		stackframe.setLine(++linenumber);
	}
	
}
