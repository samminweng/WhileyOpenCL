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
		String msg = "";
		
		//Get the CodeBlock for the corresponding function/method. 
		Block blk = blocktable.get(code.name.name());
		if(blk != null){
			//Create a new StackFrame
			StackFrame stackFrame = new StackFrame(blk, 0,
					code.name.name(), code.target);
		
			//Pass the input parameters.
			int index = 0;
			msg += " %"+code.target+"("+null+")";
			for(int operand: code.operands){
				Constant constant = stackframe.getRegister(operand);			
				msg += " %"+operand+"("+constant.toString()+")";
				stackFrame.setRegister(index, constant);
				index++;
			}
				
			//Start invoking a new block.		
			blockstack.push(stackFrame);
			msg += "\n\n===Invoke \""+stackFrame.getName()+"\" with [ ";
			
			for(int reg= 0; reg<stackFrame.getRegisterLength();reg++){
				msg += "%"+reg + "("+stackFrame.getRegister(reg)+") ";
			}		
			msg += "]\n";
			System.out.println("\n#"+linenumber+" ["+code+"]\n>"+msg);
		
		}else{
			//Directly invoke the function/method.
			code.name.module();
			stackframe.setLine(++linenumber);
			internalFailure("Not implemented!", "InterpreterInvoke.java", null);
		}
		
		
		
		
	}

}
