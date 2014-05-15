package wyopcl.interpreter;

import java.util.ArrayList;
import java.util.HashMap;

import wyil.lang.Code;
import wyil.lang.Constant;
import wyil.lang.Type;

public class InterpreterReturn extends Interpreter {
	private static InterpreterReturn instance;	
	public InterpreterReturn(){		
	}
	
	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static InterpreterReturn getInstance(){
		if (instance == null){
			instance = new InterpreterReturn();
		}
		return instance;
	}
	
	
	public void interpret(Code.Return code, StackFrame stackframe) {
		
		int linenumber = stackframe.getLine();
		Code.Return return_code = (Code.Return) code;
		blockstack.pop();
		String msg = "";
		int reg = code.operand;
		if (code.type == Type.T_VOID) {
			msg += code.type;
		} else {
			Constant return_value = stackframe.getRegister(reg);
			int return_reg = stackframe.getReturn_reg();
			msg += "%" + reg +"("+return_value+")"+ " Type:(" + code.type+")";
			msg += "\n====Finish \""+stackframe.getName()+"\"====";
			
			//Get the previous block
			if(!blockstack.isEmpty()){				
				stackframe = blockstack.peek();
				if(return_reg != -1){
					linenumber = stackframe.getLine();
					//Update the value
					stackframe.setRegister(return_reg, return_value);
					msg += "\n====Return to \""+stackframe.getName()+"\"====";
					stackframe.setLine(++linenumber);
				}
			}
			
		}
		System.out.println("#"+linenumber+" ["+code+"]\n>"+msg+"\n");
		
	}

}
