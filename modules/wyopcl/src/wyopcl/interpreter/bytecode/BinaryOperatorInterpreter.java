package wyopcl.interpreter.bytecode;

import static wycc.lang.SyntaxError.internalFailure;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.math.MathContext;
import java.math.RoundingMode;
import java.util.ArrayList;

import wyil.lang.Codes;
import wyil.lang.Constant;
import wyil.lang.Constant.Decimal;
import wyopcl.interpreter.DecimalFraction;
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
		byte leftValue, rightValue;
		int pos;
		// Check the operator
		switch (code.kind) {
		case ADD:
			if(left instanceof Constant.Integer){
				return ((Constant.Integer)left).add((Constant.Integer)right);
			}else if (left instanceof Constant.Decimal){
				return ((Constant.Decimal)left).add(((Constant.Decimal)right));
			}else if (left instanceof Constant.Char){
				//Char + char
				int add = ((Constant.Char)left).value + ((Constant.Char)right).value;
				//Return a Char
				return Constant.V_CHAR((char)add);
			} else {
				internalFailure("Not implemented!", "BinaryOperatorInterpreter.java", null);
				return null;
			}
		case SUB:			
			if(left instanceof Constant.Integer){
				return ((Constant.Integer)left).subtract((Constant.Integer)right);
			}else if (left instanceof Constant.Decimal){
				return ((Constant.Decimal)left).subtract(((Constant.Decimal)right));
			}else if (left instanceof Constant.Char){
				// Char - Char
				char left_char = ((Constant.Char)left).value;
				char right_char = ((Constant.Char)right).value;
				//Subtract one char with another.
				int diff = left_char -  right_char;
				//Return the integeral diff.
				return Constant.V_INTEGER(BigInteger.valueOf(diff));
			} else {
				internalFailure("Not implemented!", "BinaryOperatorInterpreter.java", null);
				return null;
			}		
		case MUL:		
			if(left instanceof Constant.Integer){
				return ((Constant.Integer)left).multiply((Constant.Integer)right);
			}else if (left instanceof Constant.Decimal){
				return ((Constant.Decimal)left).multiply(((Constant.Decimal)right));
			}else if (left instanceof Constant.Char){
				//Char * char
				int mul = (int)((Constant.Char)left).value * (int)((Constant.Char)right).value;
				return Constant.V_INTEGER(BigInteger.valueOf(mul));
			}else {
				internalFailure("Not implemented!", "BinaryOperatorInterpreter.java", null);
				return null;
			}
		case DIV:			
			if(left instanceof Constant.Integer){
				return ((Constant.Integer)left).divide((Constant.Integer)right);
			}else if (left instanceof Constant.Decimal){
				Constant.Decimal num = (Constant.Decimal)left;
				Constant.Decimal denum = (Constant.Decimal)right;
				try{
					return num.divide(denum);
				}catch(ArithmeticException ex){
					//In the case of (1/3), the division result is infinite.
					return DecimalFraction.V_DecimalFraction(num, denum);
				}
			}else if (left instanceof DecimalFraction){
				DecimalFraction left_dec = (DecimalFraction)left;
				Constant.Decimal right_dec = (Constant.Decimal)right;
				
				internalFailure("Not implemented!", "BinaryOperatorInterpreter.java", null);
				return null;
			} else {
				internalFailure("Not implemented!", "BinaryOperatorInterpreter.java", null);
				return null;
			}			
		case REM:
			if(left instanceof Constant.Integer){
				return ((Constant.Integer)left).remainder((Constant.Integer)right);
			}else {
				internalFailure("Not implemented!", "BinaryOperatorInterpreter.java", null);
				return null;
			}			
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
			return Constant.V_LIST(values);
		case BITWISEAND:
			leftValue = ((Constant.Byte)left).value;
			rightValue = ((Constant.Byte)right).value;
			byte value = (byte) (leftValue & rightValue);
			return Constant.V_BYTE(value);			
		case BITWISEOR:
			leftValue = ((Constant.Byte)left).value;
			rightValue = ((Constant.Byte)right).value;
			return Constant.V_BYTE((byte)(leftValue | rightValue));		
		case BITWISEXOR:
			leftValue = ((Constant.Byte)left).value;
			rightValue = ((Constant.Byte)right).value;
			return Constant.V_BYTE((byte)(leftValue ^ rightValue));			
		case LEFTSHIFT:
			leftValue = ((Constant.Byte)left).value;
			pos = ((Constant.Integer)right).value.intValue();
			return Constant.V_BYTE((byte)(leftValue << pos));			
		case RIGHTSHIFT:
			leftValue = ((Constant.Byte)left).value;
			pos = ((Constant.Integer)right).value.intValue();
			//0x000000FF is added to avoid leftValue being casted to integer
			//before shifting and to fill the zeros to the left.
			leftValue = (byte)((0x000000FF & leftValue)>>pos);
			return Constant.V_BYTE(leftValue);			
		default:
			internalFailure("unknown binary expression encountered", "BinaryOperatorInterpreter.java", null);
			return null;			
		}
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
