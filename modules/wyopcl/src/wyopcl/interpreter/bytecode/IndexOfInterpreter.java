package wyopcl.interpreter.bytecode;

import static wycc.lang.SyntaxError.internalFailure;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;

import wyil.lang.Codes;
import wyil.lang.Constant;
import wyopcl.interpreter.Interpreter;
import wyopcl.interpreter.StackFrame;

public class IndexOfInterpreter extends Interpreter {
	private static IndexOfInterpreter instance;	
	public IndexOfInterpreter(){		
	}

	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static IndexOfInterpreter getInstance(){
		if (instance == null){
			instance = new IndexOfInterpreter();
		}
		return instance;
	}

	private Constant getValuefromList(Constant.List list, Constant key){
		Constant value = null;
		//Get the value associated with the key.
		if(key instanceof Constant.Integer){
			value = list.values.get(((Constant.Integer)key).value.intValue());
		}else if (key instanceof Constant.Char){
			value = list.values.get(((Constant.Char)key).value);
		}else{
			internalFailure("Not implemented!", "InterpreterIndexOf.java", null);
		}

		return value;
	}

	private Constant getValuefromRecord(Constant.Record record, Constant key){
		Constant value = null;
		//Get the value associated with the key.
		if(key instanceof Constant.Integer){
			value = record.values.get(((Constant.Integer)key).value.intValue());
		}else if (key instanceof Constant.Char){
			value = record.values.get(((Constant.Char)key).value);
		}else{
			internalFailure("Not implemented!", "InterpreterIndexOf.java", null);
		}

		return value;
	}

	private Constant getValuefromStrung(Constant.Strung strung, Constant key){
		Constant value = null;
		//Get the value associated with the key.
		if(key instanceof Constant.Integer){
			//Get the char at 'keyvalue' index and returns the Constant.Char object.
			char c = strung.value.charAt(((Constant.Integer)key).value.intValue());
			value = Constant.V_CHAR(c);
		}else if (key instanceof Constant.Char){
			//value = strung.value.get(((Constant.Char)searchValue).value);
		}else{
			internalFailure("Not implemented!", "InterpreterIndexOf.java", null);
		}

		return value;
	}


	private Constant getValuefromMap(Constant.Map map, Constant key){		
		//Get the value associated with the key.
		if(map.values.containsKey(key)){
			return map.values.get(key);
		}

		//Comparing two Constatn.Decimal requires using compareTo method.
		Iterator<Entry<Constant, Constant>> iterator = map.values.entrySet().iterator();
		while(iterator.hasNext()){
			Entry<Constant, Constant> entry = iterator.next();
			Constant entryKey = entry.getKey();
			if(entryKey.compareTo(key)==0){
				return entry.getValue();
			}			
		}


		internalFailure("Not implemented!", "InterpreterIndexOf.java", null);
		return null;
	}




	public void interpret(Codes.IndexOf code, StackFrame stackframe) {		
		int linenumber = stackframe.getLine();
		//Read the list from the leftOperand register.
		Constant constant = stackframe.getRegister(code.operand(0));
		Constant key = stackframe.getRegister(code.operand(1));
		Constant value = null;
		if(constant instanceof Constant.List){
			value = getValuefromList((Constant.List)constant, key);
		}else if(constant instanceof Constant.Record){
			value = getValuefromRecord((Constant.Record)constant, key);
		}else if(constant instanceof Constant.Strung){
			value = getValuefromStrung((Constant.Strung)constant, key);
		}else if (constant instanceof Constant.Map){
			value = getValuefromMap((Constant.Map) constant, key);
		}else{
			internalFailure("Not implemented!", "InterpreterIndexOf.java", null);
		}
		stackframe.setRegister(code.target(), value);			
		printMessage(stackframe, code.toString(), "%"+ code.target() + "("+value+")");
		stackframe.setLine(++linenumber);
	}

}
