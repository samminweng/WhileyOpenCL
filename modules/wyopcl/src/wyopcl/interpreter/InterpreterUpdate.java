package wyopcl.interpreter;

import static wycc.lang.SyntaxError.internalFailure;

import java.util.ArrayList;
import java.util.Collection;

import wyil.lang.Codes;
import wyil.lang.Constant;
import wyil.lang.Type;
import wyopcl.interpreter.Interpreter.StackFrame;

public class InterpreterUpdate extends Interpreter{
	private static InterpreterUpdate instance;	
	public InterpreterUpdate(){		
	}

	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static InterpreterUpdate getInstance(){
		if (instance == null){
			instance = new InterpreterUpdate();
		}
		return instance;
	}
	
	public void interpret(Codes.Update code, StackFrame stackframe) {
		int linenumber = stackframe.getLine();
		//Popup the compound type (lists, dictionaries, strings, records and references
		Type afterType = code.afterType;
		String msg = "\n>";
		if(afterType instanceof Type.List){
			//Pops the list.
			Constant.List list = (Constant.List)stackframe.getRegister(code.target);
			//Read the value from the register.
			Constant value = stackframe.getRegister(code.result());
			msg += "%"+code.result()+"("+value+")";
			//Get the indices
			Constant.Integer index;
			for (int indexoperand : code.operands) {
				index = (Constant.Integer)stackframe.getRegister(indexoperand);
				list.values.set(index.value.intValue(), value);
				msg += "%"+indexoperand+"("+index+") ";
			}
			
			//Update the result to the list.
			stackframe.setRegister(code.target, list);
			msg += "%"+code.target+"("+list+")";
			
		}else{
			internalFailure("Not implemented!", "IntepreterUpdate.java", null);
		}
		
		System.out.println("#"+linenumber+" ["+code+"]"+msg);
		
		stackframe.setLine(++linenumber);
	}
	
}
