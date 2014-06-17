package wyopcl.interpreter;

import static wycc.lang.SyntaxError.internalFailure;
import wyil.lang.Codes;
import wyil.lang.Constant;

public class InterpreterIndexOf extends Interpreter {
	private static InterpreterIndexOf instance;	
	public InterpreterIndexOf(){		
	}
	
	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static InterpreterIndexOf getInstance(){
		if (instance == null){
			instance = new InterpreterIndexOf();
		}
		return instance;
	}
	
	public void interpret(Codes.IndexOf code, StackFrame stackframe) {		
		int linenumber = stackframe.getLine();
		String msg = ">";
		//Read the key value from the rightOperand register.
		Constant.Integer key = (Constant.Integer)stackframe.getRegister(code.rightOperand);
		//Read the list from the leftOperand register.
		Constant left = stackframe.getRegister(code.leftOperand);
		Constant value = null;
		int keyvalue = key.value.intValue();
		if(left instanceof Constant.List){
			//Cast the left to Constant.List type.
			//Get the value associated with the key.
			value = ((Constant.List) left).values.get(keyvalue);
		}else if(left instanceof Constant.Record){
			//Cast the left object to Constant.Record type.
			value = ((Constant.Record) left).values.get(keyvalue);
		}else if(left instanceof Constant.Strung){
			//Get the char at 'keyvalue' index and returns the Constant.Char object.
			value = Constant.V_CHAR(((Constant.Strung)left).value.charAt(keyvalue));
		}else{
			internalFailure("Not implemented!", "InterpreterIndexOf.java", null);
		}
		stackframe.setRegister(code.target, value);			
		printMessage(stackframe, code.toString(), "%"+ code.target + "("+value+")");
		stackframe.setLine(++linenumber);
	}

}
