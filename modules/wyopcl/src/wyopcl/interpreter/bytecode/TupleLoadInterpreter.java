package wyopcl.interpreter.bytecode;

import wyil.lang.Codes;
import wyil.lang.Constant;
import wyopcl.interpreter.Interpreter;
import wyopcl.interpreter.StackFrame;

public class TupleLoadInterpreter extends Interpreter{
	private static TupleLoadInterpreter instance;	
	public TupleLoadInterpreter(){		
	}
	
	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static TupleLoadInterpreter getInstance(){
		if (instance == null){
			instance = new TupleLoadInterpreter();
		}
		return instance;
	}

	public void interpret(Codes.TupleLoad code, StackFrame stackframe) {		
		int linenumber = stackframe.getLine();
		//Read the tuple from the operand register.
		Constant.Tuple tuple = (Constant.Tuple)stackframe.getRegister(code.operand(0));
		//Write the tuple
		Constant result = tuple.values.get(code.index);
		stackframe.setRegister(code.target(), result);
		printMessage(stackframe, code.toString(), "%"+code.target()+"="+result);
		stackframe.setLine(++linenumber);
	}
	
}
