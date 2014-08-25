package wyopcl.interpreter.N;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.TreeMap;

import wyil.lang.Codes;
import wyil.lang.Constant;
import wyil.lang.Type;
import wyil.lang.Type.Record;
import wyopcl.interpreter.Interpreter;
import wyopcl.interpreter.StackFrame;

public class NewRecordInterpreter extends Interpreter{

	private static NewRecordInterpreter instance;	
	public NewRecordInterpreter(){		
	}
	
	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static NewRecordInterpreter getInstance(){
		if (instance == null){
			instance = new NewRecordInterpreter();
		}
		return instance;
	}
	
	public void interpret(Codes.NewRecord code, StackFrame stackframe) {
		int linenumber = stackframe.getLine();
		//Use the LinkedHashMap to create the records.
		Map<String, Constant> values = new TreeMap<String, Constant>();
		//Get the field names and types.		
		Map<String, Type> fields = new TreeMap<String, Type>(code.type().fields());
		Iterator<String> iterator = fields.keySet().iterator();
		int index = 0;
		//Assign the field value in accordance with the sequence of field names.
		while(iterator.hasNext()){
			String key = iterator.next();			
			Constant value = stackframe.getRegister(code.operand(index));
			values.put(key, value);
			index++;
		}		
		
		//Construct the Record value
		Constant.Record result = Constant.V_RECORD(values);
		stackframe.setRegister(code.target(), result);
		printMessage(stackframe, code.toString(),"%"+code.target()+"("+result+")");
		stackframe.setLine(++linenumber);
	}
	
}
