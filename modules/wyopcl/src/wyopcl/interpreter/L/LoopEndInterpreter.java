package wyopcl.interpreter.L;
import wyil.lang.Code;
import wyil.lang.Codes;
import wyopcl.interpreter.Interpreter;
import wyopcl.interpreter.Interpreter.StackFrame;


public class LoopEndInterpreter extends Interpreter {
	private static LoopEndInterpreter instance;	
	public LoopEndInterpreter(){		
	}
	
	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static LoopEndInterpreter getInstance(){
		if (instance == null){
			instance = new LoopEndInterpreter();
		}
		return instance;
	}
	
	public void interpret(Codes.LoopEnd code, StackFrame stackframe) {
		int linenumber = stackframe.getLine();	
		printMessage(stackframe, code.toString(), "("+code.label+")");
		Code.Block block = stackframe.getBlock();
		linenumber = symboltable.get(block).getBlockPosByLabel(code.label);
		stackframe.setLine(linenumber);			
	}
	
	
}
