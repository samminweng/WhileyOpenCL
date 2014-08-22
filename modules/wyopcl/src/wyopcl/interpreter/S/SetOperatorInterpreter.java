package wyopcl.interpreter.S;

import static wycc.lang.SyntaxError.internalFailure;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.List;

import wyil.lang.Codes;
import wyil.lang.Constant;
import wyopcl.interpreter.Interpreter;
import wyopcl.interpreter.Interpreter.StackFrame;

public class SetOperatorInterpreter extends Interpreter{
	private static SetOperatorInterpreter instance;	
	public SetOperatorInterpreter(){		
	}
	
	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static SetOperatorInterpreter getInstance(){
		if (instance == null){
			instance = new SetOperatorInterpreter();
		}
		return instance;
	}
	

	public void interpret(Codes.SetOperator code, StackFrame stackframe) {		
		int linenumber = stackframe.getLine();
		
		//Read two set values
		Constant left = stackframe.getRegister(code.operand(0));
		Constant right = stackframe.getRegister(code.operand(1));
		
		//Perform the operation
		Constant result = null;
		Constant.Set lhs = null, rhs=null;
		switch(code.kind){
		case UNION:
			lhs = (Constant.Set)left;
			rhs = (Constant.Set)right;
			result = lhs.union(rhs);
			//internalFailure("Not implemented!", "InterpreterSetOperator.java", null);
			break;
		case LEFT_UNION:
			//Collection<Constant> values = new ArrayList<Constant>();
			lhs = (Constant.Set)left;
			Collection<Constant> list = new LinkedHashSet<Constant>();
			list.add(right);
			result = lhs.union(Constant.V_SET(list));
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
		stackframe.setRegister(code.target(), result);
		printMessage(stackframe, code.toString(),"%"+code.target()+"("+result+")");
		stackframe.setLine(++linenumber);
	}
	
}
