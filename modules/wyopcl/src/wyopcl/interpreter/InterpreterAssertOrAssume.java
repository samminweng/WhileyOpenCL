package wyopcl.interpreter;

import java.util.HashMap;

import wyil.lang.Code;
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
	
	
	public void interpret(Code.AssertOrAssume code, StackFrame stackframe) {				
		
		int linenumber = stackframe.getLine();
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
		System.out.println("#"+linenumber+" ["+code+"]\n>"+msg+"\n");
		stackframe.setLine(++linenumber);
	}
	
	
	
}
