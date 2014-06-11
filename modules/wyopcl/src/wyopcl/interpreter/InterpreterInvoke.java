package wyopcl.interpreter;

import static wycc.lang.SyntaxError.internalFailure;
import wycc.lang.NameID;
import wyil.lang.Codes;
import wyil.lang.Code.Block;
import wyil.lang.Constant;
import wyil.lang.Type.FunctionOrMethod;

public class InterpreterInvoke extends Interpreter {
	
	private static InterpreterInvoke instance;	
	public InterpreterInvoke(){		
	}
	
	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static InterpreterInvoke getInstance(){
		if (instance == null){
			instance = new InterpreterInvoke();
		}
		return instance;
	}
	
	public void interpret(Codes.Invoke code, StackFrame stackframe) {
		int linenumber = stackframe.getLine();
				
		//Get the Block for the corresponding function/method. 
		Block blk = blocktable.get(code.name.name());
		if(blk != null){
			//Get the depth
			int depth = stackframe.getDepth();
			//Create a new StackFrame
			StackFrame stackFrame = new StackFrame(depth+1, blk, 0,
					code.name.name(), code.target);
		
			//Pass the input parameters.
			int index = 0;			
			for(int operand: code.operands){
				Constant constant = stackframe.getRegister(operand);
				stackFrame.setRegister(index, constant);
				index++;
			}
				
			//Start invoking a new block.		
			blockstack.push(stackFrame);
			printMessage(stackframe, code.toString(),"\n");
		
		}else{
			//Directly invoke the function/method.
			Constant operand = stackframe.getRegister(code.operands[0]);
			Constant result = null;
			if(code.name.module().toString().equalsIgnoreCase("Whiley/lang/Any")){
				switch(code.name.name()){
				case "toString":
					try {
						String value = whiley.lang.Any.toString$Z9bFaB1F71E(operand);
						result = Constant.V_STRING(value);
						stackframe.setRegister(code.target, result);
					} catch (SecurityException e) {
						e.printStackTrace();
					}
					break;
				default:
					internalFailure("Not implemented!", "InterpreterInvoke.java", null);
				}
				
			}else{
				internalFailure("Not implemented!", "InterpreterInvoke.java", null);
			}
			printMessage(stackframe, code.toString(),"%"+code.target+"("+result+")\n");
			stackframe.setLine(++linenumber);
		}
		
		
		
		
	}

}
