package wyopcl.interpreter.bytecode;

import wyil.lang.Codes;
import wyil.lang.Constant;
import wyopcl.interpreter.Interpreter;
import wyopcl.interpreter.StackFrame;

public class SubStringInterpreter extends Interpreter {
	private static SubStringInterpreter instance;	
	public SubStringInterpreter(){		
	}

	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static SubStringInterpreter getInstance(){
		if (instance == null){
			instance = new SubStringInterpreter();
		}
		return instance;
	}
	
	public void interpret(Codes.SubString code, StackFrame stackframe) {
		int linenumber = stackframe.getLine();
		Constant result = null;		
		Constant.Strung source = (Constant.Strung)stackframe.getRegister(code.operand(0));
		Constant.Integer beginIndex = (Constant.Integer)stackframe.getRegister(code.operand(1));
		Constant.Integer endIndex = (Constant.Integer)stackframe.getRegister(code.operand(2));
		
		String substring = source.value.substring(beginIndex.value.intValue(), endIndex.value.intValue());
		result = Constant.V_STRING(substring);
		stackframe.setRegister(code.target(), result);
		printMessage(stackframe, code.toString(), "%"+code.target() + "("+result+")");
		stackframe.setLine(++linenumber);		
	}
}
