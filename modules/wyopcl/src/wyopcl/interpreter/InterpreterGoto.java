package wyopcl.interpreter;

import wyil.lang.Codes;
import wyil.lang.Code.Block;

public class InterpreterGoto extends Interpreter {
	private static InterpreterGoto instance;	
	public InterpreterGoto(){
	}
	
	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static InterpreterGoto getInstance(){
		if (instance == null){
			instance = new InterpreterGoto();
		}
		return instance;
	}
	
	public void interpret(Codes.Goto code, StackFrame stackframe){		
		int linenumber = stackframe.getLine();
		//msg += "%"+code.target + "("+label+")";
		//System.out.println("#"+linenumber+" ["+code+"]\n>"+msg+"\n");
		
		Block block = stackframe.getBlock();
		linenumber = symboltable.get(block).getBlockPosByLabel(code.target);
		stackframe.setLine(linenumber);
		
		printMessage(stackframe, code.toString(),
				  code.target + "("+linenumber+")\n");
		
	}
	
	
}
