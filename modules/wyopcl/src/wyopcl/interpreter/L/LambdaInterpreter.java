package wyopcl.interpreter.L;

import static wycc.lang.SyntaxError.internalFailure;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import wyil.lang.Codes;
import wyil.lang.Constant;
import wyil.lang.Code.Block;
import wyopcl.interpreter.Closure;
import wyopcl.interpreter.Interpreter;
import wyopcl.interpreter.StackFrame;

public class LambdaInterpreter extends Interpreter {
	private static LambdaInterpreter instance;

	public LambdaInterpreter() {
	}

	/* Implement the Singleton pattern to ensure this class has one instance. */
	public static LambdaInterpreter getInstance() {
		if (instance == null) {
			instance = new LambdaInterpreter();
		}
		return instance;
	}

	public void interpret(Codes.Lambda code, StackFrame stackframe) {
		int linenumber = stackframe.getLine();
		Collection<Constant> parameters = new ArrayList<Constant>();
		for(int operand: code.operands()){
			if(operand <0){
				parameters.add(null);
			}else{
				parameters.add(stackframe.getRegister(operand));
			}
		}
		
		Constant.Tuple tuple = Constant.V_TUPLE(parameters);
		//Create a Constant.Closure 
		Constant.Lambda lambda = Constant.V_LAMBDA(code.name, code.type());
		Constant.Type returntype = Constant.V_TYPE(code.assignedType());
		Closure result = new Closure(lambda, tuple, returntype);		
		stackframe.setRegister(code.target(), result);
		printMessage(stackframe, code.toString(),
				"%" + code.target() + "(" + result + ")\n");
		stackframe.setLine(++linenumber);
	}

}
