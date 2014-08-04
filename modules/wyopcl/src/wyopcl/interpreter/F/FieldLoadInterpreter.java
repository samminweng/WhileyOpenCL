package wyopcl.interpreter.F;

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
import wyopcl.interpreter.Converter;
import wyopcl.interpreter.Interpreter;
import wyopcl.interpreter.Interpreter.StackFrame;

public class FieldLoadInterpreter extends Interpreter {
	private static FieldLoadInterpreter instance;	
	public FieldLoadInterpreter(){
	}

	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static FieldLoadInterpreter getInstance(){
		if (instance == null){
			instance = new FieldLoadInterpreter();
		}
		return instance;
	}


	public void interpret(Codes.FieldLoad code, StackFrame stackframe) {
		int linenumber = stackframe.getLine();
		//Constant opeand = stackframe.getRegister(code.operand);
		Constant operand = stackframe.getRegister(code.operand(0));
		String givenfield = code.field;
		Constant result = null;
		if (code.fieldType() instanceof Type.Method){
			//Temporarily solve the method problem for println....
			NameID name = new NameID(getModule().id(), givenfield);
			result = Constant.V_LAMBDA(name, (Type.Method)code.fieldType());
		}else{
			
			Constant.Record record = (Constant.Record)operand;
			//Reads a record value from an operand register	
			Constant field = record.values.get(givenfield);			
			result = Converter.copyConstant(field);
		}

		stackframe.setRegister(code.target(), result);	
		printMessage(stackframe, code.toString(), "%"+ code.target() + "("+result+")");
		stackframe.setLine(++linenumber);
	}

}
