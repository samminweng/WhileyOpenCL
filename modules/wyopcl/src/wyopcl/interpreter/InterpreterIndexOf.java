package wyopcl.interpreter;

import static wycc.lang.SyntaxError.internalFailure;
import wyil.lang.Code;
import wyil.lang.Constant;
import wyil.lang.Type;

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
	
	public void interpret(Code.IndexOf code, StackFrame stackframe) {		
		int linenumber = stackframe.getLine();
		String msg = ">";
		//Read the list from the leftOperand register.
		Constant.List list = (Constant.List) stackframe.getRegister(code.leftOperand);
		//Read the key value from the rightOperand register.
		Constant.Integer key = (Constant.Integer)stackframe.getRegister(code.rightOperand);
		//Return the value associated with the key.
		Constant value = list.values.get(key.value.intValue());
		stackframe.setRegister(code.target, value);
		
		msg += " %"+code.leftOperand +"("+list+") "+
		       " %"+code.rightOperand +"(" + key +") "+
		       " %"+code.target + "("+value+")";	
		
		System.out.println("#"+linenumber+" ["+code+"]\n"+msg+"\n");
		stackframe.setLine(++linenumber);
	}

}
