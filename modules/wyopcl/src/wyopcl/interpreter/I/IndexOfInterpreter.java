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
	
	public void interpret(Codes.IndexOf code, StackFrame stackframe) {		
		int linenumber = stackframe.getLine();
		String msg = ">";
		//Read the key value from the rightOperand register.
		
		//Read the list from the leftOperand register.
		Constant constant = stackframe.getRegister(code.operand(0));
		Constant.Integer searchValue = (Constant.Integer)stackframe.getRegister(code.operand(1));
		Constant value = null;
		if(constant instanceof Constant.List){
			//Cast the left to Constant.List type.
			//Get the value associated with the key.
			Constant.List list = (Constant.List) constant;
			value = list.values.get(searchValue.value.intValue());
		}else if(constant instanceof Constant.Record){
			//Cast the left object to Constant.Record type.
			Constant.Record record = (Constant.Record) constant;
			value = record.values.get(searchValue.value.intValue());
		}else if(constant instanceof Constant.Strung){
			//Get the char at 'keyvalue' index and returns the Constant.Char object.
			Constant.Strung string = (Constant.Strung)constant;
			value = Constant.V_CHAR(string.value.charAt(searchValue.value.intValue()));
		}else if (constant instanceof Constant.Map){
			Constant.Map map = (Constant.Map) constant;
			value = map.values.get(searchValue);
		}else{
			internalFailure("Not implemented!", "InterpreterIndexOf.java", null);
		}
		stackframe.setRegister(code.target(), value);			
		printMessage(stackframe, code.toString(), "%"+ code.target() + "("+value+")");
		stackframe.setLine(++linenumber);
	}

}
