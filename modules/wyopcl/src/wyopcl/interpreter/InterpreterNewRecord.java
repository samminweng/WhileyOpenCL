package wyopcl.interpreter;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

import wyil.lang.Codes;
import wyil.lang.Constant;
import wyil.lang.Type;
import wyopcl.interpreter.Interpreter.StackFrame;

public class InterpreterNewRecord extends Interpreter{

	private static InterpreterNewRecord instance;	
	public InterpreterNewRecord(){		
	}
	
	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static InterpreterNewRecord getInstance(){
		if (instance == null){
			instance = new InterpreterNewRecord();
		}
		return instance;
	}
	
	public void interpret(Codes.NewRecord code, StackFrame stackframe) {
		int linenumber = stackframe.getLine();
		HashMap<String, Constant> values = new HashMap<String, Constant>();
		//HashSet does not preserve the ordering
		HashSet<String> keys = code.type().keys();
		String[] fields = keys.toArray(new String[0]);
		//Get the values from the operand registers.
		for(int i=0;i<code.operands().length;i++){
			Constant value = stackframe.getRegister(code.operand(i));
			//Get the field type
			int fieldindex = fields.length -i;
			values.put(fields[fieldindex-1], value);
		}
		
		//Construct the Record value
		Constant.Record result = Constant.V_RECORD(values);
		stackframe.setRegister(code.target(), result);
		printMessage(stackframe, code.toString(),"%"+code.target()+"("+result+")");
		stackframe.setLine(++linenumber);
	}
	
}
