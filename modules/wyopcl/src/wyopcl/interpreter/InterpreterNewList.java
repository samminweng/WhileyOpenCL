package wyopcl.interpreter;

import java.util.ArrayList;

import wyil.lang.Codes;
import wyil.lang.Constant;

public class InterpreterNewList extends Interpreter {
	private static InterpreterNewList instance;	
	public InterpreterNewList(){		
	}
	
	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static InterpreterNewList getInstance(){
		if (instance == null){
			instance = new InterpreterNewList();
		}
		return instance;
	}
	

	public void interpret(Codes.NewList code, StackFrame stackframe) {
		int linenumber = stackframe.getLine();
		ArrayList<Constant> values = new ArrayList<Constant>();
		for (int operand : code.operands) {
			Constant elem = stackframe.getRegister(operand);			
			values.add(elem);
		}
		Constant.List list = Constant.V_LIST(values);
		int reg = code.target;
		stackframe.setRegister(reg, list);
		System.out.println("#"+linenumber+" ["+code+"]\n>"
				+"%" + reg + "(" + list+")\n");
		stackframe.setLine(++linenumber);
	}

}
