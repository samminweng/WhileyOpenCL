package wyopcl.interpreter;

import wyil.lang.Codes;
import wyil.lang.Constant;

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
		stackframe.getName();
		Constant left = stackframe.getRegister(code.leftOperand);
		Constant right = stackframe.getRegister(code.rightOperand);
		
		String msg = "%"+ code.leftOperand+"(" + left+")";
		boolean isSatisfied = false;
		switch (code.op) {
		case EQ:
			msg += " == ";
			if(left.compareTo(right)==0){
				isSatisfied = true;				
			}else{
				//Stop the loop.
				
			}
			break;
		case NEQ:
			msg += " != ";
			if(left.compareTo(right)==0){
				isSatisfied = true;
			}else{
				//Stop the loop.
				
			}			
			break;
		case LT:
			msg += " < ";
			if (left.compareTo(right) < 0) {
				isSatisfied = true;
			}else{
				//Stop the loop.				
			}
			break;
		case LTEQ:
			msg += " <= ";
			if (left.compareTo(right) <= 0) {
				isSatisfied = true;
			}else{
				//Stop the loop.				
			} 
			break;
		case GT:
			msg += " > ";
			if (left.compareTo(right) > 0) {
				isSatisfied = true;
			}else{
				//Stop the loop.				
			}
			break;
		case GTEQ:
			msg += " >= ";
			if (left.compareTo(right) >= 0) {
				isSatisfied = true;				
			}else{
				
			}
			break;
		default:
			// internalFailure("unknown if condition encountered",filename,stmt);
			return;
		}
		
		msg += "%"+ code.rightOperand+"(" + right+") => "+isSatisfied;
		printMessage(stackframe, code.toString(), msg);
		stackframe.setLine(++linenumber);
	}
	
	
	
}
