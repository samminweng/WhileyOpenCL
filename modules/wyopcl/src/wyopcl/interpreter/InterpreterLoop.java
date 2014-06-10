package wyopcl.interpreter;

import wyil.lang.Codes;
import wyil.lang.Constant;

public class InterpreterLoop extends Interpreter {
	private static InterpreterLoop instance;	
	public InterpreterLoop(){		
	}
	
	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static InterpreterLoop getInstance(){
		if (instance == null){
			instance = new InterpreterLoop();
		}
		return instance;
	}
	
	
	public void interpret(Codes.Loop code, StackFrame stackframe) {
		int linenumber = stackframe.getLine();
		//String label = code.target;
		//int target = Integer.parseInt(code.target);
		String str ="";
		for (int modifiedOperand:code.modifiedOperands){
			Constant operand = stackframe.getRegister(modifiedOperand);
			str += " %"+modifiedOperand + "("+operand+")";
		}
		
		
		//Constant.Strung label = Constant.V_STRING(code.target);		
		//stackframe.setRegister(target, label);
		//System.out.println("#"+linenumber+" ["+code+"]\n>"
		//		 + "(" + label +")"+ str+"\n");
		printMessage(stackframe, code.toString(), "("+code.target+")\n");
		
		stackframe.setLine(++linenumber);
	}

}
