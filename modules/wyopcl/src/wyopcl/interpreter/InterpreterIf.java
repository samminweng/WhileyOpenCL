package wyopcl.interpreter;

import wyil.lang.Code;
import wyil.lang.CodeBlock;
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
	
	

	public void interpret(Code.If code, StackFrame stackframe) {				
		int linenumber = stackframe.getLine();
		Constant.Integer left = (Constant.Integer) stackframe.getRegister(code.leftOperand);
		Constant.Integer right = (Constant.Integer) stackframe.getRegister(code.rightOperand);
		
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
		//Store the result
		//Constant.Bool result = Constant.V_BOOL(satisfiable);
		//stackframe.setRegister(Integer.parseInt(code.target), result);
		
		System.out.println("#"+linenumber+" ["+code+"]\n>"+msg+"\n");
		
		
		if(satisfiable){
			//Go to the branch
			CodeBlock block = stackframe.getBlock();
			String label = code.target;
			linenumber = symboltable.get(block).getBlockPosByLabel(label);
		}else{
			linenumber++;
		}
		
		stackframe.setLine(linenumber);

	}

}
