package wyopcl.interpreter;

import java.math.BigInteger;

import wyil.lang.Code;
import wyil.lang.Constant;

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
		Constant.List list = (Constant.List) stackframe.getRegister(code.operand);
		Constant.Integer length;
		//if(list != null){
		length = Constant.V_INTEGER(BigInteger.valueOf(list.values.size()));
		//}else{
		//	length = Constant.V_INTEGER(BigInteger.ZERO);
		//}
		
		
		stackframe.setRegister(code.target, length);
		System.out.println("#"+linenumber+" ["+code+"]\n>"+
						"%"+ code.target + "(" + length +") %" + code.operand+"("+ list+")\n");
		stackframe.setLine(++linenumber);
	}
}
