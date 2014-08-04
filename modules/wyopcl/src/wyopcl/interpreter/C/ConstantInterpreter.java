package wyopcl.interpreter.C;

import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Constant;
import wyil.lang.Type;
import wyopcl.interpreter.Interpreter;
import wyopcl.interpreter.Interpreter.StackFrame;

public class ConstantInterpreter extends Interpreter {
	private static ConstantInterpreter instance;	
	public ConstantInterpreter(){
	}
	
	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static ConstantInterpreter getInstance(){
		if (instance == null){
			instance = new ConstantInterpreter();
		}
		return instance;
	}


	public void interpret(Codes.Const code, StackFrame stackframe) {		
		// Add the register
		int linenumber = stackframe.getLine();
		Constant result = code.constant;
		stackframe.setRegister(code.target(), result);

		printMessage(stackframe, code.toString(), "%"+ code.target() + "("+result+")");
		//Set the next line number
		stackframe.setLine(++linenumber);
	}

}
