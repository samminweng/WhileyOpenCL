package wyopcl.interpreter.B;

import static wycc.lang.SyntaxError.internalFailure;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.math.MathContext;
import java.math.RoundingMode;
import java.util.ArrayList;

import wyil.lang.Codes;
import wyil.lang.Constant;
import wyopcl.interpreter.Interpreter;
import wyopcl.interpreter.StackFrame;

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
			if(left instanceof Constant.Integer){
				result = ((Constant.Integer)left).add((Constant.Integer)right);
			}else if (left instanceof Constant.Decimal){
				 result = ((Constant.Decimal)left).add(((Constant.Decimal)right));
			}else {
				internalFailure("Not implemented!", "BinaryOperatorInterpreter.java", null);
			}			
			break;
		case SUB:			
			if(left instanceof Constant.Integer){
				result = ((Constant.Integer)left).subtract((Constant.Integer)right);
			}else if (left instanceof Constant.Decimal){
				 result = ((Constant.Decimal)left).subtract(((Constant.Decimal)right));
			}else {
				internalFailure("Not implemented!", "BinaryOperatorInterpreter.java", null);
			}
			break;
		case MUL:		
			if(left instanceof Constant.Integer){
				result = ((Constant.Integer)left).multiply((Constant.Integer)right);
			}else if (left instanceof Constant.Decimal){
				 result = ((Constant.Decimal)left).multiply(((Constant.Decimal)right));
			}else {
				internalFailure("Not implemented!", "BinaryOperatorInterpreter.java", null);
			}
			break;
		case DIV:			
			if(left instanceof Constant.Integer){
				result = ((Constant.Integer)left).divide((Constant.Integer)right);
			}else if (left instanceof Constant.Decimal){
				Constant.Decimal dividend = (Constant.Decimal)left;
				Constant.Decimal divisor = (Constant.Decimal)right;
				//In the case of (1/3), the division result is infinite.
				BigDecimal division = dividend.value.divide(divisor.value, MathContext.DECIMAL128);
				result = Constant.V_DECIMAL(new BigDecimal(division.toString()));
			}else {
				internalFailure("Not implemented!", "BinaryOperatorInterpreter.java", null);
			}
			break;
		case REM:		
			
			if(left instanceof Constant.Integer){
				result = ((Constant.Integer)left).remainder((Constant.Integer)right);
			}else if (left instanceof Constant.Decimal){
				internalFailure("Not implemented!", "BinaryOperatorInterpreter.java", null);
			}else {
				internalFailure("Not implemented!", "BinaryOperatorInterpreter.java", null);
			}
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
			byte value = (byte) (leftValue & rightValue);
			result = Constant.V_BYTE(value);
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
			internalFailure("unknown binary expression encountered", "BinaryOperatorInterpreter.java", null);
			break;
		}
		
		return result;
	}
	

	public void interpret(Codes.BinaryOperator code, StackFrame stackframe) {
		int linenumber = stackframe.getLine();		
		Constant left = stackframe.getRegister(code.operand(0));		
		Constant right = stackframe.getRegister(code.operand(1));		
		Constant result = performOperation(left, right, code);
		stackframe.setRegister(code.target(), result);
		printMessage(stackframe, code.toString(), "%"+ code.target() + "("+result+")");
		stackframe.setLine(++linenumber);
	}

}
