package wyopcl.interpreter.N;

import java.util.ArrayList;

import wyil.lang.Codes;
import wyil.lang.Constant;
import wyopcl.interpreter.Interpreter;
import wyopcl.interpreter.StackFrame;

public class NewListInterpreter extends Interpreter {
	private static NewListInterpreter instance;	
	public NewListInterpreter(){		
	}
	
	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static NewListInterpreter getInstance(){
		if (instance == null){
			instance = new NewListInterpreter();
		}
		return instance;
	}
	

	public void interpret(Codes.NewList code, StackFrame stackframe) {
		int linenumber = stackframe.getLine();
		ArrayList<Constant> values = new ArrayList<Constant>();
		for (int operand : code.operands()) {
			Constant elem = stackframe.getRegister(operand);			
			values.add(elem);
		}
		Constant.List result = Constant.V_LIST(values);
		stackframe.setRegister(code.target(), result);
		printMessage(stackframe, code.toString(), "%"+ code.target() + "("+result+")");	
		stackframe.setLine(++linenumber);
	}

}
