package wyopcl.interpreter;

import static wycc.lang.SyntaxError.internalFailure;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import wyil.lang.Code;
import wyil.lang.Constant;
import wyil.lang.Constant.Type;
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
	
	/*
	 * Read the field and its field type from Code.FieldLoad object, construct a Constant.Record
	 * object and put it into the registers.
	 */
	public void interpret(Code.FieldLoad code, StackFrame stackframe) {
		int linenumber = stackframe.getLine();
		String msg = "";
		int operand = code.operand;
		Constant.Record record = (Constant.Record)stackframe.getRegister(code.operand);
		if(record == null){
			//Convert the wyil.lang.type to Constant.Type
			Map<String, Constant> values = new HashMap<String, Constant>();
			Iterator<Entry<String, wyil.lang.Type>> iterator = code.type.fields().entrySet().iterator();
			while(iterator.hasNext()){
				Entry<String, wyil.lang.Type> next = iterator.next();
				String field = next.getKey();
				wyil.lang.Type type = next.getValue();
				//msg += " Field: "+ field+" FieldType:" + fieldtype;
				values.put(field, Constant.V_TYPE(type));
			}
			record = Constant.V_RECORD(values);
			//Push the field values in the registers.
			stackframe.setRegister(code.operand, record);
		}else{
			//internalFailure("Not implemented!", null, null);
		}
		
		//Write the given field type to the target register.
		int target = code.target;
		//The given field type.
		Map<String,Constant> givenField = new HashMap<String, Constant>();
		givenField.put(code.field, Constant.V_TYPE(code.fieldType()));
		Constant.Record givenFieldType = Constant.V_RECORD(givenField);
		stackframe.setRegister(target, givenFieldType);		
		msg += "%" + target +"(" +givenFieldType+") %" + operand + "(" + record +")";
		
		System.out.println("#"+linenumber+" ["+code+"]\n>"+msg+"\n");
		
		stackframe.setLine(++linenumber);
		
	}

}
