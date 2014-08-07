package wyopcl.interpreter.N;

import java.util.ArrayList;
import java.util.Collection;

import wyil.lang.Codes;
import wyil.lang.Constant;
import wyopcl.interpreter.Interpreter;
import wyopcl.interpreter.Interpreter.StackFrame;

public class NewSetInterpreter extends Interpreter {
	private static NewSetInterpreter instance;	
	public NewSetInterpreter(){		
	}
	
	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static NewSetInterpreter getInstance(){
		if (instance == null){
			instance = new NewSetInterpreter();
		}
		return instance;
	}
	
	
	public void interpret(Codes.NewSet code, StackFrame stackframe) {
		int linenumber = stackframe.getLine();
		Collection<Constant> values = new ArrayList<Constant>();
		
		for(int operand:code.operands()){
			Constant value = stackframe.getRegister(operand);
			values.add(value);
		}
		
		Constant.Set result = Constant.V_SET(values);
		stackframe.setRegister(code.target(), result);
		printMessage(stackframe, code.toString(),"%"+code.target()+"("+result+")");
		stackframe.setLine(++linenumber);
	}
	
	
}
