package wyopcl.interpreter;

import static wycc.lang.SyntaxError.internalFailure;
import wyil.lang.Codes;
import wyil.lang.Constant;
import wyopcl.interpreter.Interpreter.StackFrame;

public class InterpreterStringOperator extends Interpreter {
	private static InterpreterStringOperator instance;	
	public InterpreterStringOperator(){		
	}

	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static InterpreterStringOperator getInstance(){
		if (instance == null){
			instance = new InterpreterStringOperator();
		}
		return instance;
	}
	
	public void interpret(Codes.StringOperator code, StackFrame stackframe) {		
		int linenumber = stackframe.getLine();
		//Read two string from the operands
		Constant.Strung left = (Constant.Strung)stackframe.getRegister(code.operand(0));
		Constant.Strung right = (Constant.Strung)stackframe.getRegister(code.operand(1));
		//Check the operator
		Constant.Strung result = null;
		if (code.kind == Codes.StringOperatorKind.APPEND){
			//Append two strings
			result = Constant.V_STRING(left.value + right.value);
			//Write the result to the target register.
			stackframe.setRegister(code.target(), result);
		}else{
			internalFailure("Not implemented!", "InterpreterStringOperator.java", null);
		}
		
		printMessage(stackframe, code.toString(),"%"+code.target()+"("+result+")");
		stackframe.setLine(++linenumber);
	}
	
	
	
	
	
}
