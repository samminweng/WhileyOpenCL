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
		Constant opeand = stackframe.getRegister(code.operand);
		String givenfield = code.field;
		Constant result = null;
		if (code.fieldType() instanceof Type.Method){
			//Temporarily solve the method problem for println....
			NameID name = new NameID(getModule().id(), givenfield);
			result = Constant.V_LAMBDA(name, (Type.Method)code.fieldType());
		}else{
			
			Constant.Record record = (Constant.Record)opeand;
			//Reads a record value from an operand register	
			Constant field = record.values.get(givenfield);			
			result = Converter.copyConstant(field);
		}

		stackframe.setRegister(code.target, result);	
		printMessage(stackframe, code.toString(), "%"+ code.target + "("+result+")");
												   //"%"+code.operand+ "("+opeand+")");
		stackframe.setLine(++linenumber);



	}

}
