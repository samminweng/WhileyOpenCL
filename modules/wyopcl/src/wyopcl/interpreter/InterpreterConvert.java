package wyopcl.interpreter;

import wyil.lang.Codes;
import wyil.lang.Constant;
import wyil.lang.Type;

public class InterpreterConvert extends Interpreter {
	private static InterpreterConvert instance;	
	public InterpreterConvert(){
	}
	
	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static InterpreterConvert getInstance(){
		if (instance == null){
			instance = new InterpreterConvert();
		}
		return instance;
	}
	
	public void interpret(Codes.Convert code, StackFrame stackframe) {
		int linenumber = stackframe.getLine();
		Constant operand = stackframe.getRegister(code.operand);
		Type assignedType = code.assignedType();
		Type resultType = code.result;
		Constant result = null;
		String msg = "";
		if (resultType instanceof Type.Any) {
			//No needs to convert the type of the operand.
			result = operand;
		} else if (resultType instanceof Type.List){
			result = (Constant.List) operand;
		} else{
			throw new RuntimeException("Not implemented!");
		}
		
		stackframe.setRegister(code.target, result);
		//msg += "%"+code.target+"("+result+") assigned Type:("+assignedType+")"
		//		+ " result Type:("+resultType+")";
		
		//System.out.println("#"+linenumber+" ["+code+"]\n>"+msg+"\n");
		printMessage(stackframe, code.toString(), "%"+ code.target + "("+result+")\n");
		stackframe.setLine(++linenumber);
	}

}
