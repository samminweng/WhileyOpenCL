package wyopcl.interpreter.D;

import wyil.lang.Codes;
import wyil.lang.Constant;
import wyopcl.interpreter.Interpreter;
import wyopcl.interpreter.Interpreter.StackFrame;

public class DebugInterpreter extends Interpreter{
	private static DebugInterpreter instance;	
	public DebugInterpreter(){		
	}
	
	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static DebugInterpreter getInstance(){
		if (instance == null){
			instance = new DebugInterpreter();
		}
		return instance;
	}	
	
	public void interpret(Codes.Debug code, StackFrame stackframe) {	
		int linenumber = stackframe.getLine();
		//Read a string from operand register.
		Constant.Strung str = (Constant.Strung)stackframe.getRegister(code.operand);
		//print it to the console.
		System.out.println(str);
		printMessage(stackframe, code.toString(),"");
		stackframe.setLine(++linenumber);
	}
	
}
