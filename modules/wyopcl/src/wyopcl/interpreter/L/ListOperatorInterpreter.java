package wyopcl.interpreter.L;

import static wycc.lang.SyntaxError.internalFailure;

import java.util.ArrayList;

import wyil.lang.Codes;
import wyil.lang.Constant;
import wyopcl.interpreter.Interpreter;
import wyopcl.interpreter.StackFrame;

public class ListOperatorInterpreter extends Interpreter{
	private static ListOperatorInterpreter instance;	
	public ListOperatorInterpreter(){
	}

	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static ListOperatorInterpreter getInstance(){
		if (instance == null){
			instance = new ListOperatorInterpreter();
		}
		return instance;
	}


	public void interpret(Codes.ListOperator code, StackFrame stackframe) {
		int linenumber = stackframe.getLine();		
		//Read the list from two operands.
		Constant.List left = (Constant.List) stackframe.getRegister(code.operand(0));
		Constant.List right = (Constant.List) stackframe.getRegister(code.operand(1));
		//Perform the list operation (e.g. append two lists)
		Constant.List result = null;
		switch(code.kind){
		case APPEND:
			//Create a new array list to append the left and right list.
			ArrayList<Constant> values = new ArrayList<Constant>();
			values.addAll(left.values);
			values.addAll(right.values);			
			result = Constant.V_LIST(values);
			break;
		case LEFT_APPEND:
			left.values.addAll(right.values);
			result = Constant.V_LIST(left.values);
			break;
		case RIGHT_APPEND:
			right.values.addAll(left.values);
			result = Constant.V_LIST(right.values);
			break;
		default:
			internalFailure("Not implemented!", "ListOperatorInterpreter.java", null);
			break;
		}
		//Set the result to the target register.
		stackframe.setRegister(code.target(), result);
		printMessage(stackframe, code.toString(), "%"+ code.target() + "("+result+")\n");
		stackframe.setLine(++linenumber);
	}
	
}
