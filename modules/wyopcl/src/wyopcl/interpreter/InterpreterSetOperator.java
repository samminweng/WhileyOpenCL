package wyopcl.interpreter;

import static wycc.lang.SyntaxError.internalFailure;

import java.util.ArrayList;
import java.util.Collection;

import wyil.lang.Codes;
import wyil.lang.Constant;
import wyopcl.interpreter.Interpreter.StackFrame;

public class InterpreterSetOperator extends Interpreter{
	private static InterpreterSetOperator instance;	
	public InterpreterSetOperator(){		
	}
	
	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static InterpreterSetOperator getInstance(){
		if (instance == null){
			instance = new InterpreterSetOperator();
		}
		return instance;
	}
	

	public void interpret(Codes.SetOperator code, StackFrame stackframe) {		
		int linenumber = stackframe.getLine();
		
		//Read two set values
		Constant left = stackframe.getRegister(code.leftOperand);
		Constant right = stackframe.getRegister(code.rightOperand);
		
		//Perform the operation
		Constant result = null;
		switch(code.kind){
		case UNION:
			internalFailure("Not implemented!", "InterpreterSetOperator.java", null);
			
			break;
		case LEFT_UNION:
			Constant.Set lhs = (Constant.Set)left;
			Collection<Constant> values = new ArrayList<Constant>();
			values.add(right);
			Constant.Set rhs = Constant.V_SET(values);			
			result = lhs.union(rhs);			
			break;
		case RIGHT_UNION:
			internalFailure("Not implemented!", "InterpreterSetOperator.java", null);
			break;
		case INTERSECTION:
			internalFailure("Not implemented!", "InterpreterSetOperator.java", null);
			break;
		default:
			internalFailure("Not implemented!", "InterpreterSetOperator.java", null);
		
		}
		//Write the result to target register.
		stackframe.setRegister(code.target, result);
		printMessage(stackframe, code.toString(),"%"+code.target+"("+result+")");
		stackframe.setLine(++linenumber);
	}
	
	

}
