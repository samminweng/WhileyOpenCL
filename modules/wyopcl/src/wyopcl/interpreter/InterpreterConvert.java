package wyopcl.interpreter;

import wyil.lang.Code;
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
	
	public void interpret(Code.Convert code, StackFrame stackframe) {
		int linenumber = stackframe.getLine();
		Constant operand = stackframe.getRegister(code.operand);
		int target = code.target;
		Type assignedType = code.assignedType();
		Type resultType = code.result;
		Constant result = null;
		String msg = "";
		if (resultType instanceof Type.Any) {
			//No needs to convert the type of the operand.
			result = operand;
			stackframe.setRegister(target, result);
			msg += "%"+target+"("+result+") assignedType:("+assignedType+")"
					+ " resultType:("+resultType+")";
		}else{
			throw new RuntimeException("Not implemented!");
		}
		System.out.println("#"+linenumber+" ["+code+"]\n>"+msg+"\n");
		
		stackframe.setLine(++linenumber);
	}

}
