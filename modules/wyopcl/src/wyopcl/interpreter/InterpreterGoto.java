package wyopcl.interpreter;

import wyil.lang.Code;
import wyil.lang.CodeBlock;

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
	
	public void interpret(Code.Goto code, StackFrame stackframe){		
		int linenumber = stackframe.getLine();
		String msg = "";
		String label = code.target;		
		msg += "%"+code.target + "("+label+")";
		System.out.println("#"+linenumber+" ["+code+"]\n>"+msg+"\n");
		
		CodeBlock block = stackframe.getBlock();
		linenumber = symboltable.get(block).getBlockPosByLabel(label);
		stackframe.setLine(linenumber);
		
	}
	
	
}
