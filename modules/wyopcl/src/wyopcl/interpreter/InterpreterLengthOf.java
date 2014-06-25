package wyopcl.interpreter;

import static wycc.lang.SyntaxError.internalFailure;

import java.math.BigInteger;

import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Constant;
import wyil.lang.Type;

public class InterpreterLengthOf extends Interpreter{
	private static InterpreterLengthOf instance;	
	public InterpreterLengthOf(){		
	}
	
	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static InterpreterLengthOf getInstance(){
		if (instance == null){
			instance = new InterpreterLengthOf();
		}
		return instance;
	}

	
	public void interpret(Codes.LengthOf code, StackFrame stackframe) {
		int linenumber = stackframe.getLine();
		
		//Read a effective collection (list, set or map) from the operand register.
		Constant collection = stackframe.getRegister(code.operand);
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
		stackframe.setRegister(code.target, result);
		printMessage(stackframe, code.toString(), "%"+ code.target + "("+result+")");
		stackframe.setLine(++linenumber);
	}
}
