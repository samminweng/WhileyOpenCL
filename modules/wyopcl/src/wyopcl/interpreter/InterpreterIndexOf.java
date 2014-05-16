package wyopcl.interpreter;

import wyil.lang.Code;
import wyil.lang.Constant;
import wyil.lang.Type;

public class InterpreterIndexOf extends Interpreter {
	private static InterpreterIndexOf instance;	
	public InterpreterIndexOf(){		
	}
	
	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static InterpreterIndexOf getInstance(){
		if (instance == null){
			instance = new InterpreterIndexOf();
		}
		return instance;
	}
	
	public void interpret(Code.IndexOf code, StackFrame stackframe) {		
		int linenumber = stackframe.getLine();
		String msg = "";
		Constant.List left = (Constant.List) stackframe.getRegister(code.leftOperand);
		Constant item = null;
		Constant right = null;
		if (code.assignedType() instanceof Type.Int){
			right = (Constant.Integer) stackframe.getRegister(code.rightOperand);
			item = left.values.get(((Constant.Integer)right).value.intValue());
		}
		stackframe.setRegister(code.target, item);
		
		msg += " %"+code.leftOperand+" ("+left+") %"+code.rightOperand +" (" +right
				+") %"+code.target + "("+item+")";	
		
		System.out.println("#"+linenumber+" ["+code+"]\n>"+msg+"\n");
		stackframe.setLine(++linenumber);
	}

}
