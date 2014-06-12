package wyopcl.interpreter;

import java.util.HashMap;

import wyil.lang.Codes;
import wyil.lang.Constant;
import wyil.lang.Type;

public class InterpreterFieldLoad extends Interpreter {
	private static InterpreterFieldLoad instance;	
	public InterpreterFieldLoad(){
	}
	
	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static InterpreterFieldLoad getInstance(){
		if (instance == null){
			instance = new InterpreterFieldLoad();
		}
		return instance;
	}
	
	
	public void interpret(Codes.FieldLoad code, StackFrame stackframe) {
		int linenumber = stackframe.getLine();		
		//Reads a record value from an operand register
		Constant.Record record = (Constant.Record)stackframe.getRegister(code.operand);
		String givenfield = code.field;
		HashMap<String, Constant> values = new HashMap<String, Constant>();
		
		//Extract the value of a given field.
		Type fieldType = code.type.field(givenfield);
		values.put(givenfield, Constant.V_TYPE(fieldType));	
		//Write the given value to the target register.
		Constant result = Constant.V_RECORD(values);
		stackframe.setRegister(code.target, result);	
		printMessage(stackframe, code.toString(), "%"+ code.target + "("+result+")\n");
		stackframe.setLine(++linenumber);
		
	}

}
