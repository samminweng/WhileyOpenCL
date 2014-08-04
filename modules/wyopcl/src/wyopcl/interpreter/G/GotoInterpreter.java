package wyopcl.interpreter.G;

import wyil.lang.Codes;
import wyil.lang.Code.Block;
import wyopcl.interpreter.Interpreter;
import wyopcl.interpreter.Interpreter.StackFrame;

public class GotoInterpreter extends Interpreter {
	private static GotoInterpreter instance;	
	public GotoInterpreter(){
	}
	
	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static GotoInterpreter getInstance(){
		if (instance == null){
			instance = new GotoInterpreter();
		}
		return instance;
	}
	
	public void interpret(Codes.Goto code, StackFrame stackframe){		
		int linenumber = stackframe.getLine();	
		
		Block block = stackframe.getBlock();
		linenumber = symboltable.get(block).getBlockPosByLabel(code.target);
		stackframe.setLine(linenumber);
		
		printMessage(stackframe, code.toString(),
				  code.target + "("+linenumber+")");
		
	}
	
	
}
