package wyopcl.interpreter;
import wyil.lang.Code;
import wyil.lang.Codes;


public class InterpreterLoopEnd extends Interpreter {
	private static InterpreterLoopEnd instance;	
	public InterpreterLoopEnd(){		
	}
	
	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static InterpreterLoopEnd getInstance(){
		if (instance == null){
			instance = new InterpreterLoopEnd();
		}
		return instance;
	}
	
	public void interpret(Codes.LoopEnd code, StackFrame stackframe) {
		int linenumber = stackframe.getLine();
		printMessage(stackframe, code.toString(),
				  "("+code.label+")\n");
		//System.out.println("#"+linenumber+" ["+code+"]\n>"
		//		 + label +"\n");
		Code.Block block = stackframe.getBlock();
		linenumber = symboltable.get(block).getBlockPosByLabel(code.label);
		stackframe.setLine(linenumber);
	}
	
	
}
