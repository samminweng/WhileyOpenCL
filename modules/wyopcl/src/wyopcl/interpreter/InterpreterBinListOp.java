package wyopcl.interpreter;

import static wycc.lang.SyntaxError.internalFailure;
import wyil.lang.Code;
import wyil.lang.Constant;
import wyopcl.interpreter.Interpreter.StackFrame;

public class InterpreterBinListOp extends Interpreter{
	private static InterpreterBinListOp instance;	
	public InterpreterBinListOp(){
	}

	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static InterpreterBinListOp getInstance(){
		if (instance == null){
			instance = new InterpreterBinListOp();
		}
		return instance;
	}


	public void interpret(Code.BinListOp code, StackFrame stackframe) {
		int linenumber = stackframe.getLine();
		String msg ="";
		//Read the list from two operands.
		Constant.List left = (Constant.List) stackframe.getRegister(code.leftOperand);
		Constant.List right = (Constant.List) stackframe.getRegister(code.rightOperand);
		msg += "%"+code.leftOperand+"("+left+") "+
			   "%"+code.rightOperand+"("+right+") ";
		//Perform the list operation (e.g. append two lists)
		if (code.kind == Code.BinListKind.APPEND){
			left.values.addAll(right.values);			
			Constant.List result = Constant.V_LIST(left.values);
			//Set the result to the target register.
			stackframe.setRegister(code.target, result);
			msg += "%"+code.target+"("+result+")";
		}else{
			internalFailure("Not implemented!", "InterpreterBinListOp.java", null);
		}		
		
		System.out.println("#"+linenumber+" ["+code+"]\n>"+msg+"\n");
		stackframe.setLine(++linenumber);
	}
	
}
