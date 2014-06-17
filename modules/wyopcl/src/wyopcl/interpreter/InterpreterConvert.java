package wyopcl.interpreter;

import wyil.lang.Codes;
import wyil.lang.Constant;
import wyil.lang.Type;

public class InterpreterConvert extends Interpreter {
	private static InterpreterConvert instance;	
	public InterpreterConvert(){
	}
	
	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static InterpreterConvert getInstance(){
		if (instance == null){
			instance = new InterpreterConvert();
		}
		return instance;
	}
	
	public void interpret(Codes.Convert code, StackFrame stackframe) {
		int linenumber = stackframe.getLine();
		Constant operand = stackframe.getRegister(code.operand);
		//Type assignedType = code.assignedType();
		Type resultType = code.result;
		Constant result = Converter.convertToConstant(operand, resultType);
		stackframe.setRegister(code.target, result);
		printMessage(stackframe, code.toString(), "%"+ code.target + "("+result+")");
		stackframe.setLine(++linenumber);
	}

}
