package wyopcl.interpreter.bytecode;

import wyil.lang.Codes;
import wyil.lang.Constant;
import wyopcl.interpreter.Interpreter;
import wyopcl.interpreter.StackFrame;

public class ThrowInterpreter extends Interpreter {
	private static ThrowInterpreter instance;	
	public ThrowInterpreter(){		
	}

	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static ThrowInterpreter getInstance(){
		if (instance == null){
			instance = new ThrowInterpreter();
		}
		return instance;
	}
	
	public void interpret(Codes.Throw code, StackFrame stackframe) {
		int linenumber = stackframe.getLine();
		Constant result = stackframe.getRegister(code.operand);
		//Pop up the current block
		if(blockstack.size() > 1){
			blockstack.pop();
		}
		//Return to the caller
		StackFrame caller = blockstack.peek();
		//Put the result to the caller's register table at index of 1.
		caller.setRegister(1, result);
		linenumber = symboltable.get(caller.getBlock()).getCatchPos();
		caller.setLine(linenumber);
		printMessage(stackframe, code.toString(),"%"+code.operand+"="+result);	
	}
	
	
}
