package wyopcl.interpreter.L;

import static wycc.lang.SyntaxError.internalFailure;
import wyil.lang.Codes;
import wyil.lang.Constant;
import wyopcl.interpreter.Interpreter;
import wyopcl.interpreter.Interpreter.StackFrame;

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
		//Constant.List left = (Constant.List) stackframe.getRegister(code.leftOperand);
		//Constant.List right = (Constant.List) stackframe.getRegister(code.rightOperand);
		Constant.List left = (Constant.List) stackframe.getRegister(code.operand(0));
		Constant.List right = (Constant.List) stackframe.getRegister(code.operand(1));
		//Perform the list operation (e.g. append two lists)
		if (code.kind == Codes.ListOperatorKind.APPEND){
			left.values.addAll(right.values);			
			Constant.List result = Constant.V_LIST(left.values);
			//Set the result to the target register.
			stackframe.setRegister(code.target(), result);
			printMessage(stackframe, code.toString(), "%"+ code.target() + "("+result+")\n");
			
		}else{
			internalFailure("Not implemented!", "InterpreterBinListOp.java", null);
		}	
		stackframe.setLine(++linenumber);
	}
	
}
