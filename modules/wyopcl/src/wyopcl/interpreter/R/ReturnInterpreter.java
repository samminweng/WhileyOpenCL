package wyopcl.interpreter.R;

import wyil.lang.Codes;
import wyil.lang.Constant;
import wyil.lang.Type;
import wyopcl.interpreter.Interpreter;
import wyopcl.interpreter.Interpreter.StackFrame;

public class ReturnInterpreter extends Interpreter {
	private static ReturnInterpreter instance;	
	public ReturnInterpreter(){		
	}

	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static ReturnInterpreter getInstance(){
		if (instance == null){
			instance = new ReturnInterpreter();
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
			printMessage(stackframe, code.toString(),
					"%"+return_reg + "("+return_value+")");
			
			stackframe.setLine(++linenumber);
		}else{
			//Do nothing.
		}

	}

}
