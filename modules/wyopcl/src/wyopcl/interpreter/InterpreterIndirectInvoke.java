package wyopcl.interpreter;

import java.util.ArrayList;
import wyil.lang.Codes;
import wyil.lang.Constant;
import wyil.lang.Type;
import wyil.lang.Type.FunctionOrMethod;

public class InterpreterIndirectInvoke extends Interpreter {
	
	private static InterpreterIndirectInvoke instance;	
	public InterpreterIndirectInvoke(){		
	}
	
	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static InterpreterIndirectInvoke getInstance(){
		if (instance == null){
			instance = new InterpreterIndirectInvoke();
		}
		return instance;
	}
	
	
	public void interpret(Codes.IndirectInvoke code, StackFrame stackframe) {
		int linenumber = stackframe.getLine();
				
		Constant.Record fieldType = (Constant.Record)stackframe.getRegister(code.reference());
		FunctionOrMethod func = code.type;		
		ArrayList<Type> paramTypes = func.params();
	
		String msg="";
		msg += "%"+code.reference()+"("+fieldType+") ";
		
		for (int i = 0; i< code.operands.length; i++) {
			//Type paramType = paramTypes.get(i);
			msg += "%"+code.operands[i];
			Constant paramValue = stackframe.getRegister(code.operands[i]);
			msg += "("+paramValue+")";
		}
		
		//System.out.println("#"+linenumber+" ["+code+"]\n>"+msg+"\n");
		printMessage(stackframe, code.toString(), "");
		stackframe.setLine(++linenumber);
	}

}
