package wyopcl.interpreter.F;

import static wycc.lang.SyntaxError.internalFailure;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;

import wycc.lang.NameID;
import wyfs.lang.Path;
import wyil.lang.Codes;
import wyil.lang.Constant;
import wyil.lang.Type;
import wyil.lang.Type.EffectiveRecord;
import wyil.lang.Type.FunctionOrMethod;
import wyil.lang.Type.Method;
import wyil.lang.WyilFile;
import wyopcl.interpreter.Closure;
import wyopcl.interpreter.Utility;
import wyopcl.interpreter.Interpreter;
import wyopcl.interpreter.StackFrame;

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
		String givenfield = code.field;
		Constant constant = stackframe.getRegister(code.operand(0));
		Constant result = null;
		if (constant instanceof Constant.Type){
			//Temporarily solve the method problem for println....
			NameID name = new NameID(getModule().id(), givenfield);
			result = Constant.V_LAMBDA(name, (Type.Method)code.fieldType());			
		}else if (constant instanceof Constant.Record){
			Constant.Record record = (Constant.Record)constant;
			//Reads a record value from an operand register	
			Constant field = record.values.get(givenfield);			
			result = Utility.copyConstant(field);
		}else{
			internalFailure("Not implemented!", "FieldLoadInterpreter.java", null);
		}

		stackframe.setRegister(code.target(), result);	
		printMessage(stackframe, code.toString(), "%"+ code.target() + "("+result+")");
		stackframe.setLine(++linenumber);
	}

}
