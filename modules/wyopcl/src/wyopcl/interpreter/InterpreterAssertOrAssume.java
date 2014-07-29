package wyopcl.interpreter;

import static wycc.lang.SyntaxError.internalFailure;
import wyil.lang.Codes;
import wyil.lang.Constant;
import wyil.lang.Constant.Set;

public class InterpreterAssertOrAssume extends Interpreter {
	private static InterpreterAssertOrAssume instance;	
	public InterpreterAssertOrAssume(){
	}
	
	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static InterpreterAssertOrAssume getInstance(){
		
		if (instance == null){
			instance = new InterpreterAssertOrAssume();
		}
	
		return instance;
	}
	
	
	public void interpret(Codes.AssertOrAssume code, StackFrame stackframe) {				
		
		int linenumber = stackframe.getLine();
		Constant left = stackframe.getRegister(code.leftOperand);
		Constant right = stackframe.getRegister(code.rightOperand);
		
		boolean result = false;
		switch (code.op) {
		case EQ:
			if(left.compareTo(right)==0){
				result = true;				
			}
			break;
		case NEQ:
			if(left.compareTo(right)!=0){
				result = true;
			}			
			break;
		case LT:
			if (left.compareTo(right) < 0) {
				result = true;
			}
			break;
		case LTEQ:
			if (left.compareTo(right) <= 0) {
				result = true;
			}
			break;
		case GT:			
			if (left.compareTo(right) > 0) {
				result = true;
			}
			break;
		case GTEQ:			
			if (left.compareTo(right) >= 0) {
				result = true;				
			}
			break;
		case IN:			
			Constant.Set set = (Constant.Set)right;
			//Check if the left is one of elements in the right.
			if(set.values.contains(left)){
				result = true;
			}
			//System.out.println(code);
			break;
		default:
			internalFailure("unknown if condition encountered","InterpreterAssertOrAssume.java",null);
		}
		printMessage(stackframe, code.toString(), "("+result+")");
		
		//Check if result is false. 
		if(!result){
			//If so, then the assertion is violated. Then display the messages.
			printVerificationMessage(stackframe, code.toString(), code.msg);			
		}
		
		stackframe.setLine(++linenumber);
	}
	
	
	
}
