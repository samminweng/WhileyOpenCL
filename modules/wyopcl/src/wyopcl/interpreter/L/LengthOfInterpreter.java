package wyopcl.interpreter.L;

import static wycc.lang.SyntaxError.internalFailure;

import java.math.BigInteger;

import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Constant;
import wyil.lang.Type;
import wyopcl.interpreter.Interpreter;
import wyopcl.interpreter.Interpreter.StackFrame;

public class LengthOfInterpreter extends Interpreter{
	private static LengthOfInterpreter instance;	
	public LengthOfInterpreter(){		
	}
	
	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static LengthOfInterpreter getInstance(){
		if (instance == null){
			instance = new LengthOfInterpreter();
		}
		return instance;
	}

	
	public void interpret(Codes.LengthOf code, StackFrame stackframe) {
		int linenumber = stackframe.getLine();
		
		//Read a effective collection (list, set or map) from the operand register.
		//Constant collection = stackframe.getRegister(code.operand);
		Constant collection = stackframe.getRegister(code.operand(0));
		int length = 0;
		if(collection instanceof Constant.List){
			//Cast the collection to a List.
			length = ((Constant.List)collection).values.size();
		}else if (collection instanceof Constant.Record){
			length = ((Constant.Record)collection).values.size();
		}else if (collection instanceof Constant.Strung){
			length = ((Constant.Strung)collection).value.length();
		}else if(collection instanceof Constant.Set){
			length = ((Constant.Set)collection).values.size();
		} else{
			internalFailure("Not implemented!", "InterpreterLengthOf.java", null);
		}
		
		//Write the length to register.
		Constant result =  Constant.V_INTEGER(BigInteger.valueOf(length));
		stackframe.setRegister(code.target(), result);
		printMessage(stackframe, code.toString(), "%"+ code.target() + "("+result+")");
		stackframe.setLine(++linenumber);
	}
}
