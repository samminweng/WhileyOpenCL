package wyopcl.interpreter.bytecode;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import wycc.util.Pair;
import wyil.lang.Codes;
import wyil.lang.Constant;
import wyopcl.interpreter.Interpreter;
import wyopcl.interpreter.StackFrame;

public class NewMapInterpreter extends Interpreter {
	private static NewMapInterpreter instance;	
	public NewMapInterpreter(){		
	}
	
	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static NewMapInterpreter getInstance(){
		if (instance == null){
			instance = new NewMapInterpreter();
		}
		return instance;
	}
	
	
	public void interpret(Codes.NewMap code, StackFrame stackframe) {
		int linenumber = stackframe.getLine();
		
		Map<Constant, Constant> values = new HashMap<Constant, Constant>();
		int length = code.operands().length/2;
		for(int i = 0; i< length; i++){
			Constant key = stackframe.getRegister(code.operand(i*2));
			Constant value = stackframe.getRegister(code.operand(i*2+1));
			values.put(key, value);
		}
		
		Constant.Map result = Constant.V_MAP(values);
		stackframe.setRegister(code.target(), result);
		printMessage(stackframe, code.toString(), "%"+ code.target() + "("+result+")");	
		stackframe.setLine(++linenumber);
		
		
	}
	
	
	
}
