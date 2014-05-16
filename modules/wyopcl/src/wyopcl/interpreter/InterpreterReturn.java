package wyopcl.interpreter;

import static wycc.lang.SyntaxError.internalFailure;
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
		int reg = return_code.operand;
		if (return_code.type == Type.T_VOID) {
			msg += return_code.type;
		} else {
			
			if(return_code.type == Type.T_INT){
			Constant return_value = stackframe.getRegister(reg);
			int return_reg = stackframe.getReturn_reg();
			msg += "%" + reg +"("+return_value+")"+ " Type:(" + return_code.type+")";
			//msg += "\n====Finish \""+stackframe.getName()+"\"====";
			
			//Get the previous block
			if(!blockstack.isEmpty()){				
				stackframe = blockstack.peek();
				if(return_reg != -1){
					linenumber = stackframe.getLine();
					//Update the value
					stackframe.setRegister(return_reg, return_value);
					msg += "\n====Return to \""+stackframe.getName()+"\" with "+
					"%"+return_reg + "("+((Constant.Integer)return_value).value+")";
					stackframe.setLine(++linenumber);
				}
			}
			}else{
				internalFailure("Not implemented!", null, null);
			}
			
		}
		System.out.println("#"+linenumber+" ["+code+"]\n>"+msg+"\n");
		
	}

}
