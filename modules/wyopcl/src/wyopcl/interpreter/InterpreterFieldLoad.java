package wyopcl.interpreter;

import static wycc.lang.SyntaxError.internalFailure;

import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import wyil.lang.Codes;
import wyil.lang.Constant;
import wyil.lang.Type;

public class InterpreterFieldLoad extends Interpreter {
	private static InterpreterFieldLoad instance;	
	public InterpreterFieldLoad(){
	}
	
	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static InterpreterFieldLoad getInstance(){
		if (instance == null){
			instance = new InterpreterFieldLoad();
		}
		return instance;
	}
	
	
	public void interpret(Codes.FieldLoad code, StackFrame stackframe) {
		int linenumber = stackframe.getLine();
		//String msg = "";
		//Reads a record value from an operand register
		Constant.Record record = (Constant.Record)stackframe.getRegister(code.operand);
		//msg += "%"+code.operand+"("+record+")";
		HashMap<String, Type> fields = code.type.fields();
		Map<String, Constant> values = new HashMap<String, Constant>();
		//Extract the value of a given field.		
		Set<Entry<String, Type>> entrySet = fields.entrySet();
		Iterator<Entry<String, Type>> iterator = entrySet.iterator();
		
		while(iterator.hasNext()){
			 Entry<String, Type> next = iterator.next();
			if(next.getKey().equals(code.field)){
				Type value = next.getValue();
				values.put(next.getKey(), Constant.V_TYPE(value));					
				break;
			}
		}	
	
		//Write the given value to the target register.
		Constant result = Constant.V_RECORD(values);
		stackframe.setRegister(code.target, result);
		//msg += "%" + code.target + "("+values+")";
		
		//System.out.println("#"+linenumber+" ["+code+"]\n>"+msg+"\n");
		printMessage(stackframe, code.toString(), "%"+ code.target + "("+result+")\n");
		stackframe.setLine(++linenumber);
		
	}

}
