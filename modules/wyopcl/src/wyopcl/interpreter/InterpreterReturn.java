package wyopcl.interpreter;

import wyil.lang.Codes;
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


	public void interpret(Codes.Return code, StackFrame stackframe) {

		int linenumber = stackframe.getLine();
		int return_reg = stackframe.getReturn_reg();
		blockstack.pop();	
		//Check if the results are returned.
		if (code.type != Type.T_VOID) {
			//Read the values from the operand register.
			Constant return_value = stackframe.getRegister(code.operand);			
			//Get the previous block							
			stackframe = blockstack.peek();				
			linenumber = stackframe.getLine();
			//Return the result by updating the register.
			stackframe.setRegister(return_reg, return_value);
			//msg += "\n\n====Return to \""+stackframe.getName()+"\" with "+
			//		"%"+stackframe.getReturn_reg() + "("+return_value+")";
			printMessage(stackframe, code.toString(),
					"%"+return_reg + "("+return_value+")\n");
			
			stackframe.setLine(++linenumber);

		}/*else{
			msg += "("+code.type+")";
		}*/


		//System.out.println("#"+linenumber+" ["+code+"]\n>"+msg+"\n");

	}

}
