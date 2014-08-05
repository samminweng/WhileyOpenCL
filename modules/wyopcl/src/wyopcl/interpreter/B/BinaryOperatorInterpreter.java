package wyopcl.interpreter.B;

import java.math.BigInteger;
import java.util.ArrayList;

import wyil.lang.Codes;
import wyil.lang.Constant;
import wyopcl.interpreter.Interpreter;

public class BinaryOperatorInterpreter extends Interpreter {

	private static BinaryOperatorInterpreter instance;	
	public BinaryOperatorInterpreter(){
	}

	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static BinaryOperatorInterpreter getInstance(){
		if (instance == null){
			instance = new BinaryOperatorInterpreter();
		}
		return instance;
	}

	
	private Constant performOperation(Constant left, Constant right, Codes.BinaryOperator code){

		Constant result = null;
		byte leftValue, rightValue;
		int pos;
		// Check the operator
		switch (code.kind) {
		case ADD:			
			result = ((Constant.Integer)left).add((Constant.Integer)right);
			break;
		case SUB:			
			result = ((Constant.Integer)left).subtract((Constant.Integer)right);		
			break;
		case MUL:			
			result = ((Constant.Integer)left).multiply((Constant.Integer)right);			
			break;
		case DIV:
			result = ((Constant.Integer)left).divide((Constant.Integer)right);			
			break;
		case REM:		
			result = ((Constant.Integer)left).remainder((Constant.Integer)right);			
			break;
		case RANGE:
			//Create a List.
			ArrayList<Constant> values = new ArrayList<Constant>();
			//Iterates the numbers in the range.
			BigInteger start = ((Constant.Integer)left).value;
			BigInteger end = ((Constant.Integer)right).value;
			while(!start.equals(end)){
				values.add(Constant.V_INTEGER(start));
				start = start.add(BigInteger.ONE);		
			}
			//Put the list into the result.
			result = Constant.V_LIST(values);		
			break;
		case BITWISEAND:
			leftValue = ((Constant.Byte)left).value;
			rightValue = ((Constant.Byte)right).value;
			result = Constant.V_BYTE((byte)(leftValue & rightValue));
			break;
		case BITWISEOR:
			leftValue = ((Constant.Byte)left).value;
			rightValue = ((Constant.Byte)right).value;
			result = Constant.V_BYTE((byte)(leftValue | rightValue));
			break;
		case BITWISEXOR:
			leftValue = ((Constant.Byte)left).value;
			rightValue = ((Constant.Byte)right).value;
			result = Constant.V_BYTE((byte)(leftValue ^ rightValue));
			break;
		case LEFTSHIFT:
			leftValue = ((Constant.Byte)left).value;
			pos = ((Constant.Integer)right).value.intValue();
			result = Constant.V_BYTE((byte)(leftValue << pos));
			break;
		case RIGHTSHIFT:
			leftValue = ((Constant.Byte)left).value;
			pos = ((Constant.Integer)right).value.intValue();
			//0x000000FF is added to avoid leftValue being casted to integer
			//before shifting and to fill the zeros to the left.
			leftValue = (byte)((0x000000FF & leftValue)>>pos);
			result = Constant.V_BYTE(leftValue);
			break;
		default:
			throw new RuntimeException("unknown binary expression encountered");
			//break;
		}
		
		return result;
	}
	

	public void interpret(Codes.BinaryOperator code, StackFrame stackframe) {
		int linenumber = stackframe.getLine();
		
		//Constant leftOperand = stackframe.getRegister(code.leftOperand);
		Constant left = stackframe.getRegister(code.operand(0));
		//Constant rightOperand = stackframe.getRegister(code.rightOperand);
		Constant right = stackframe.getRegister(code.operand(1));
		
		Constant result = performOperation(left, right, code);
		stackframe.setRegister(code.target(), result);
		printMessage(stackframe, code.toString(), "%"+ code.target() + "("+result+")");
		stackframe.setLine(++linenumber);
	}

}
