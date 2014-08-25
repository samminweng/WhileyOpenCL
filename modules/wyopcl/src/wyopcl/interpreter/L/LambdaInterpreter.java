package wyopcl.interpreter.L;

import static wycc.lang.SyntaxError.internalFailure;

import java.util.List;

import wyil.lang.Codes;
import wyil.lang.Constant;
import wyil.lang.Code.Block;
import wyopcl.interpreter.Interpreter;
import wyopcl.interpreter.StackFrame;

public class LambdaInterpreter extends Interpreter {
	private static LambdaInterpreter instance;

	public LambdaInterpreter() {
	}

	/* Implement the Singleton pattern to ensure this class has one instance. */
	public static LambdaInterpreter getInstance() {
		if (instance == null) {
			instance = new LambdaInterpreter();
		}
		return instance;
	}

	public void interpret(Codes.Lambda code, StackFrame stackframe) {
		//Get the block with anonymous name.  
		List<Block> blks = blocktable.get(code.name.toString());
		Block blk = blks.get(0);
		
		// Get the depth
		int depth = stackframe.getDepth();
		// Create a new StackFrame
		StackFrame newStackFrame = new StackFrame(depth + 1, blk, 0, code.name.name(), code.target());
		
		// Pass the input parameters which have been existed in the register
		// table.
		for (int i = 0; i < stackframe.getRegisterLength(); i++) {
			Constant constant = stackframe.getRegister(i);
			newStackFrame.setRegister(i, constant);
		}
		// Start invoking a new block.
		blockstack.push(newStackFrame);
		printMessage(stackframe, code.toString(),
				"%" + code.target() + "(" + stackframe.getRegister(code.target()) + ")\n");		
	}

}
