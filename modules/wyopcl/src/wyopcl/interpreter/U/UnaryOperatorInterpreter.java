package wyopcl.interpreter.U;

import static wycc.lang.SyntaxError.internalFailure;

import java.math.BigInteger;

import wyil.lang.Codes;
import wyil.lang.Codes.UnaryOperatorKind;
import wyil.lang.Constant;
import wyopcl.interpreter.DecimalFraction;
import wyopcl.interpreter.Interpreter;
import wyopcl.interpreter.Interpreter.StackFrame;

public class UnaryOperatorInterpreter extends Interpreter {
	private static UnaryOperatorInterpreter instance;	
	public UnaryOperatorInterpreter(){		
	}

	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static UnaryOperatorInterpreter getInstance(){
		if (instance == null){
			instance = new UnaryOperatorInterpreter();
		}
		return instance;
	}
	
	private Constant performArithmetic(UnaryOperatorKind kind, Constant number){
		Constant result = null;
		if(number instanceof Constant.Integer){
			Constant.Integer integer = (Constant.Integer)number;
			switch(kind){
			case NEG:
				result = Constant.V_INTEGER(integer.value.negate());
				break;
			case NUMERATOR:
				internalFailure("Not implemented!", "UnaryOperatorInterpreter.java", null);
				break;
			case DENOMINATOR:
				internalFailure("Not implemented!", "UnaryOperatorInterpreter.java", null);
				break;
			default:
				internalFailure("Not implemented!", "UnaryOperatorInterpreter.java", null);
			}
		}else if(number instanceof Constant.Decimal){
			DecimalFraction fraction;
			Constant.Decimal decimal = (Constant.Decimal)number;
			switch(kind){
			case NEG:
				result = Constant.V_DECIMAL(decimal.value.negate());
				break;
			case NUMERATOR:
				fraction = new DecimalFraction(decimal.value);
				result = Constant.V_INTEGER(BigInteger.valueOf(fraction.getNumerator()));
				break;			
			case DENOMINATOR:
				fraction = new DecimalFraction(decimal.value);
				result = Constant.V_INTEGER(BigInteger.valueOf(fraction.getNumerator()));
				break;			
			default:
				internalFailure("Not implemented!", "UnaryOperatorInterpreter.java", null);
				
			}
			
		}else{
			internalFailure("Not implemented!", "UnaryOperatorInterpreter.java", null);
		}
		
		return result;
	}
	
	
	public void interpret(Codes.UnaryOperator code, StackFrame stackframe) {
		int linenumber = stackframe.getLine();
		Constant result = null;
		Constant number = stackframe.getRegister(code.operand(0));
		
		result = performArithmetic(code.kind, number);
		
		stackframe.setRegister(code.target(), result);
		printMessage(stackframe, code.toString(), "%"+code.target() + "("+result+")");
		stackframe.setLine(++linenumber);
		
		
	}
	
}
