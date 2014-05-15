package wyopcl.interpreter;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashMap;

import wyil.lang.Code;
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

	
	public void interpret(Code.LengthOf code, StackFrame stackframe) {
		int linenumber = stackframe.getLine();
		int target = code.target;
		int operand = code.operand;
		Constant.List list = (Constant.List) stackframe.getRegister(operand);
		Constant.Integer length = Constant.V_INTEGER(BigInteger.valueOf(list.values.size()));
		
		stackframe.setRegister(target, length);
		System.out.println("#"+linenumber+" ["+code+"]\n>"+
						"%"+ target + "(" + length +") %" + operand+"("+ list+")\n");
		stackframe.setLine(++linenumber);
	}
}
