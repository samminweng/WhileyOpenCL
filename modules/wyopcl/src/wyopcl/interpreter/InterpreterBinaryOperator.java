package wyopcl.interpreter;

import java.math.BigInteger;
import java.util.ArrayList;

import wyil.lang.Codes;
import wyil.lang.Constant;

public class InterpreterBinaryOperator extends Interpreter {

	private static InterpreterBinaryOperator instance;	
	public InterpreterBinaryOperator(){
	}

	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static InterpreterBinaryOperator getInstance(){
		if (instance == null){
			instance = new InterpreterBinaryOperator();
		}
		return instance;
	}


	public void interpret(Codes.BinaryOperator code, StackFrame stackframe) {
		//System.out.println("code.target"+code.target);
		int linenumber = stackframe.getLine();
		Constant result = null;
		Constant leftOperand = stackframe.getRegister(code.leftOperand);
		Constant rightOperand = stackframe.getRegister(code.rightOperand);
		Constant.Integer left, right;
		left = (Constant.Integer) leftOperand;
		right = (Constant.Integer) rightOperand;
		String msg = "";
		// Check the operator
		switch (code.kind) {
		case ADD:
			result = left.add(right);			
			break;
		case SUB:			
			result = left.subtract(right);		
			break;
		case MUL:			
			result = left.multiply(right);			
			break;
		case DIV:
			result = left.divide(right);			
			break;
		case REM:		
			result = left.remainder(right);			
			break;
		case RANGE:
			left = (Constant.Integer) leftOperand;
			right = (Constant.Integer) rightOperand;
			//Create a List.
			ArrayList<Constant> values = new ArrayList<Constant>();
			//Iterates the numbers in the range.
			BigInteger start = left.value;
			BigInteger end = right.value;
			while(!start.equals(end)){
				values.add(Constant.V_INTEGER(start));
				start = start.add(BigInteger.ONE);		
			}
			//Put the list into the result.
			result = Constant.V_LIST(values);
			stackframe.setRegister(code.target, result);			
			break;
		case BITWISEAND:
			throw new RuntimeException("Not implemented!");
			//break;
		case BITWISEOR:
			throw new RuntimeException("Not implemented!");
			//break;
		case BITWISEXOR:
			throw new RuntimeException("Not implemented!");
			//break;
		case LEFTSHIFT:
			throw new RuntimeException("Not implemented!");
			//break;
		case RIGHTSHIFT:
			throw new RuntimeException("Not implemented!");
			//break;
		default:
			throw new RuntimeException("unknown binary expression encountered");
			//break;
		}
		stackframe.setRegister(code.target, result);
		//msg += "%"+code.leftOperand+"(" + left + ") %" +code.rightOperand+"("+ right 
		//		+") %" + code.target + "(" + result + ")";
		
		//System.out.println("#"+linenumber+" ["+code+"]\n>"+msg+ "\n");
		printMessage(stackframe, code.toString(), "%"+ code.target + "("+result+")");
		stackframe.setLine(++linenumber);
	}

}
