package wyopcl.interpreter.S;

import static wycc.lang.SyntaxError.internalFailure;
import wyil.lang.Codes;
import wyil.lang.Constant;
import wyopcl.interpreter.Interpreter;
import wyopcl.interpreter.StackFrame;

public class StringOperatorInterpreter extends Interpreter {
	private static StringOperatorInterpreter instance;	
	public StringOperatorInterpreter(){		
	}

	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static StringOperatorInterpreter getInstance(){
		if (instance == null){
			instance = new StringOperatorInterpreter();
		}
		return instance;
	}
	
	public void interpret(Codes.StringOperator code, StackFrame stackframe) {		
		int linenumber = stackframe.getLine();
		//Read two string from the operands
		Constant.Strung left = (Constant.Strung)stackframe.getRegister(code.operand(0));
		Constant right = stackframe.getRegister(code.operand(1));
		//Check the operator
		Constant.Strung result = null;
		switch (code.kind){
		case APPEND:
			//Check the type of right operand before appending those two operands.
			if (right instanceof Constant.Strung){
				result = Constant.V_STRING(left.value + ((Constant.Strung)right).value);			
			}else{
				internalFailure("Not implemented!", "InterpreterStringOperator.java", null);
			}
			break;
		case LEFT_APPEND:
			if(right instanceof Constant.Char){
				char c = ((Constant.Char)right).value;
				result = Constant.V_STRING(left.value + c);
			}else{
				internalFailure("Not implemented!", "InterpreterStringOperator.java", null);
				
			}
			
		break;
		default:
			internalFailure("Not implemented!", "InterpreterStringOperator.java", null);
		
		}
		//Write the result to the target register.
		stackframe.setRegister(code.target(), result);
		
		printMessage(stackframe, code.toString(),"%"+code.target()+"("+result+")");
		stackframe.setLine(++linenumber);
	}
	
	
	
	
	
}
