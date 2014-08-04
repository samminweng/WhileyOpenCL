package wyopcl.interpreter.I;

import wyil.lang.Codes;
import wyil.lang.Code.Block;
import wyil.lang.Constant;
import wyopcl.interpreter.Interpreter;
import wyopcl.interpreter.Interpreter.StackFrame;

public class IfInterpreter extends Interpreter {
	private static IfInterpreter instance;	
	public IfInterpreter(){
		
	}
	
	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static IfInterpreter getInstance(){
		if (instance == null){
			instance = new IfInterpreter();
		}
		return instance;
	}
	
	

	public void interpret(Codes.If code, StackFrame stackframe) {				
		int linenumber = stackframe.getLine();
		Constant left = stackframe.getRegister(code.leftOperand);
		Constant right = stackframe.getRegister(code.rightOperand);
		boolean satisfiable = false;
		switch (code.op) {
		case EQ:			
			if (left.compareTo(right) == 0){
				satisfiable = true;		
			}
			break;
		case NEQ:				
			if (left.compareTo(right) != 0) {				
				satisfiable = true;
			}
			break;
		case LT:			
			if (left.compareTo(right) < 0) {				
				satisfiable = true;
			}
			break;
		case LTEQ:			
			if (left.compareTo(right) <= 0) {				
				satisfiable = true;
			}
			break;
		case GT:					
			if (left.compareTo(right) > 0) {				
				satisfiable = true;
			}
			break;
		case GTEQ:			
			if (left.compareTo(right) >= 0) {				
				satisfiable = true;				
			}
			break;
		default:			
			satisfiable = true;
			throw new RuntimeException("unknown if condition encountered:" + code);
			
		}
		
		if(satisfiable){
			//Go to the branch
			Block block = stackframe.getBlock();
			linenumber = symboltable.get(block).getBlockPosByLabel(code.target);
		}else{
			linenumber++;
		}
		printMessage(stackframe, code.toString(), "(" +satisfiable+")");
		stackframe.setLine(linenumber);

	}

}
