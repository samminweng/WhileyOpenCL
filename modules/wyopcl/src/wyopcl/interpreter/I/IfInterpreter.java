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
	
	
	private boolean compare(Codes.Comparator op, Constant left, Constant right){
		Constant.Set leftSet, rightSet;
		
		boolean satisfiable = false;
		switch (op) {
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
		case IN:			
			if(right instanceof Constant.Set){
				rightSet = (Constant.Set)right;
				int leftValue = ((Constant.Integer)left).value.intValue();
				if(rightSet.values.contains(leftValue)){
					satisfiable = true;
				}
			}else if (right instanceof Constant.List){
				Constant.List list = (Constant.List)right;
				if(list.values.contains(left)){
					satisfiable = true;
				}
			}			
			break;
		case SUBSET:
			leftSet = (Constant.Set)left;
			rightSet = (Constant.Set)right;
			if(rightSet.values.contains(leftSet.values)){
				satisfiable = true;
			}
			break;
		case SUBSETEQ:
			leftSet = (Constant.Set)left;
			rightSet = (Constant.Set)right;
			satisfiable = rightSet.values.containsAll(leftSet.values);
			break;
		default:			
			satisfiable = true;
			throw new RuntimeException("unknown comparator encountered:"+op);
		}
		
		return satisfiable;
	}	

	public void interpret(Codes.If code, StackFrame stackframe) {				
		int linenumber = stackframe.getLine();
		Constant left = stackframe.getRegister(code.leftOperand);
		Constant right = stackframe.getRegister(code.rightOperand);
		boolean satisfiable = false;
		satisfiable = compare(code.op, left, right);
		
		if(satisfiable){
			//Go to the if branch
			Block block = stackframe.getBlock();
			linenumber = symboltable.get(block).getBlockPosByLabel(code.target);
		}else{
			linenumber++;
		}
		printMessage(stackframe, code.toString(), "(" +satisfiable+")");
		stackframe.setLine(linenumber);

	}

}
