package wyopcl.interpreter.I;

import static wycc.lang.SyntaxError.internalFailure;
import wyil.lang.Codes;
import wyil.lang.Constant;
import wyopcl.interpreter.Interpreter;
import wyopcl.interpreter.Interpreter.StackFrame;

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
			Constant.Map map = (Constant.Map) constant;
			value = map.values.get(key);
		}else{
			internalFailure("Not implemented!", "InterpreterIndexOf.java", null);
		}
		stackframe.setRegister(code.target(), value);			
		printMessage(stackframe, code.toString(), "%"+ code.target() + "("+value+")");
		stackframe.setLine(++linenumber);
	}

}
