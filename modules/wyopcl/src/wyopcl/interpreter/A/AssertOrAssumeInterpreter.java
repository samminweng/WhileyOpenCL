package wyopcl.interpreter.A;

import static wycc.lang.SyntaxError.internalFailure;
import wyil.lang.Codes;
import wyil.lang.Constant;
import wyopcl.interpreter.Interpreter;
import wyopcl.interpreter.StackFrame;

public class AssertOrAssumeInterpreter extends Interpreter {
	private static AssertOrAssumeInterpreter instance;	
	public AssertOrAssumeInterpreter(){
	}
	
	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static AssertOrAssumeInterpreter getInstance(){
		
		if (instance == null){
			instance = new AssertOrAssumeInterpreter();
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
			break;
		case SUBSET:
			result = ((Constant.Set)right).values.containsAll(((Constant.Set)left).values);	
			break;
		case SUBSETEQ:
			result = ((Constant.Set)right).values.containsAll(((Constant.Set)left).values);			
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
