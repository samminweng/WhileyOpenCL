package wyopcl.interpreter;

import static wycc.lang.SyntaxError.internalFailure;

import java.util.HashMap;

import wycc.lang.NameID;
import wyfs.lang.Path;
import wyil.lang.Codes;
import wyil.lang.Constant;
import wyil.lang.Type;
import wyil.lang.Type.FunctionOrMethod;
import wyil.lang.Type.Method;
import wyil.lang.WyilFile;

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
		Constant result = null;
		Type fieldType = code.fieldType();
		if(fieldType instanceof Type.Record){
			HashMap<String, Constant> values = new HashMap<String, Constant>();
			//Extract the value of a given field.			
			if(record != null){
				values.put(givenfield, record.values.get(givenfield));	
			}else{
				//For the cases of method field load, e.g. println, out....
				values.put(givenfield, Constant.V_TYPE(code.type.field(givenfield)));
				//Write the given value to the target register.
				result = Constant.V_RECORD(values);
			}
		}else if (fieldType instanceof Type.Method){
			NameID name;			
			//Get the module
			WyilFile module2 = getModule();
			//Temporarily solve the method problem for println....
			if(givenfield.equals("println")){
				name = new NameID(module2.id(), "println");
			}else{
				name = new NameID(module2.id(), givenfield);
			}
			result = Constant.V_LAMBDA(name, (Type.Method)fieldType);
		}else{
			result = record.values.get(givenfield);
			//internalFailure("Not implemented!", "InterpreterFieldLoad.java", null);
		}
		
		stackframe.setRegister(code.target, result);	
		printMessage(stackframe, code.toString(), "%"+ code.target + "("+result+")\n");
		stackframe.setLine(++linenumber);
		
	}

}
