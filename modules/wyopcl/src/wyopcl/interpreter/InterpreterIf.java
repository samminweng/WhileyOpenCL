package wyopcl.interpreter;

import wyil.lang.Codes;
import wyil.lang.Code.Block;
import wyil.lang.Constant;

public class InterpreterIf extends Interpreter {
	private static InterpreterIf instance;	
	public InterpreterIf(){
		
	}
	
	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static InterpreterIf getInstance(){
		if (instance == null){
			instance = new InterpreterIf();
		}
		return instance;
	}
	
	

	public void interpret(Codes.If code, StackFrame stackframe) {				
		int linenumber = stackframe.getLine();
		Constant left = stackframe.getRegister(code.leftOperand);
		Constant right = stackframe.getRegister(code.rightOperand);
		
		String msg = "%" + code.leftOperand + "(" + left+") ";	
		boolean satisfiable = false;
		switch (code.op) {
		case EQ:
			msg += " == ";	
			if (left.compareTo(right) == 0){
				satisfiable = true;		
			}
			break;
		case NEQ:
			msg += " != ";		
			if (left.compareTo(right) != 0) {				
				satisfiable = true;
			}
			break;
		case LT:
			msg += " < ";
			if (left.compareTo(right) < 0) {				
				satisfiable = true;
			}
			break;
		case LTEQ:
			msg += " <= ";
			if (left.compareTo(right) <= 0) {				
				satisfiable = true;
			}
			break;
		case GT:
			msg += " > ";			
			if (left.compareTo(right) > 0) {				
				satisfiable = true;
			}
			break;
		case GTEQ:
			msg += " >= ";
			if (left.compareTo(right) >= 0) {				
				satisfiable = true;				
			}
			break;
		default:			
			satisfiable = true;
			throw new RuntimeException("unknown if condition encountered:" + code);
			
		}
		
		msg += "%" + code.rightOperand + "(" + right + ") => "+satisfiable;
		
		if(satisfiable){
			//Go to the branch
			Block block = stackframe.getBlock();
			linenumber = symboltable.get(block).getBlockPosByLabel(code.target);
		}else{
			linenumber++;
		}
		printMessage(stackframe, code.toString(), code.target + "("+linenumber+")\n");
		stackframe.setLine(linenumber);

	}

}
