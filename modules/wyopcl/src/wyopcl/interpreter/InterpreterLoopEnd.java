package wyopcl.interpreter;
import wyil.lang.Code;
import wyil.lang.CodeBlock;

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
	
	public void interpret(Code.LoopEnd code, StackFrame stackframe) {
		int linenumber = stackframe.getLine();
		String label = code.label;	
		System.out.println("#"+linenumber+" ["+code+"]\n>"
				 + label +"\n");
		CodeBlock block = stackframe.getBlock();
		linenumber = symboltable.get(block).getBlockPosByLabel(label);
		stackframe.setLine(linenumber);
	}
	
	
}
