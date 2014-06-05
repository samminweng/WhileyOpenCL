package wyopcl.interpreter;

import static wycc.lang.SyntaxError.internalFailure;

import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import wyil.lang.Code;
import wyil.lang.Constant;
import wyil.lang.Type;
import wyil.lang.Type.EffectiveRecord;

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
	
	
	public void interpret(Code.FieldLoad code, StackFrame stackframe) {
		int linenumber = stackframe.getLine();
		String msg = "";
		//Reads a record value from an operand register
		Constant.Record record = (Constant.Record)stackframe.getRegister(code.operand);
		msg += "%"+code.operand+"("+record+")";
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
		stackframe.setRegister(code.target, Constant.V_RECORD(values));
		msg += "%" + code.target + "("+values+")";
		
		System.out.println("#"+linenumber+" ["+code+"]\n>"+msg+"\n");
		stackframe.setLine(++linenumber);
		
	}

}
