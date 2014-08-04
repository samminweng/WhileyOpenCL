package wyopcl.interpreter.C;

import wyil.lang.Codes;
import wyil.lang.Constant;
import wyil.lang.Type;
import wyopcl.interpreter.Converter;
import wyopcl.interpreter.Interpreter;
import wyopcl.interpreter.Interpreter.StackFrame;

public class ConvertInterpreter extends Interpreter {
	private static ConvertInterpreter instance;	
	public ConvertInterpreter(){
	}
	
	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static ConvertInterpreter getInstance(){
		if (instance == null){
			instance = new ConvertInterpreter();
		}
		return instance;
	}
	
	public void interpret(Codes.Convert code, StackFrame stackframe) {
		int linenumber = stackframe.getLine();
		//Read a value from the operand register.
		//Constant value = stackframe.getRegister(code.operand);
		Constant value = stackframe.getRegister(code.operand(0));
		//Convert it to the given type.
		Type assignedType = code.assignedType();
		Type resultType = code.result;
		Constant result = Converter.convertToConstant(value, assignedType, resultType);
		stackframe.setRegister(code.target(), result);
		printMessage(stackframe, code.toString(), "%"+ code.target() + "("+result+")");
		stackframe.setLine(++linenumber);
	}

}
