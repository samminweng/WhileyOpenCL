package wyopcl.interpreter.I;

import static wycc.lang.SyntaxError.internalFailure;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;

import wyautl_old.lang.Automaton;
import wyautl_old.lang.Automaton.State;
import wyil.lang.Codes;
import wyil.lang.Constant;
import wyil.lang.Type;
import wyil.lang.Code.Block;
import wyopcl.interpreter.Interpreter;
import wyopcl.interpreter.Interpreter.StackFrame;

public class IfIsInterpreter extends Interpreter{
	private static IfIsInterpreter instance;	
	public IfIsInterpreter(){		
	}
	
	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static IfIsInterpreter getInstance(){
		if (instance == null){
			instance = new IfIsInterpreter();
		}
		return instance;
	}
	
	
	private void gotoTargetBranch(Codes.IfIs code, StackFrame stackframe){
		String label = code.target;
		Block block = stackframe.getBlock();
		int linenumber = symboltable.get(block).getBlockPosByLabel(label);
		stackframe.setLine(++linenumber);
	}
	
	
	private void gotoNext(Codes.IfIs code, StackFrame stackframe){
		int linenumber = stackframe.getLine();
		printMessage(stackframe, code.toString(),"");
		stackframe.setLine(++linenumber);
	}
	

	public void interpret(Codes.IfIs code, StackFrame stackframe) {		
		//Read the value from the operand register.
		Constant value = stackframe.getRegister(code.operand);
		if (code.rightOperand instanceof Type.Negation){
			//Check the value is subtype of the test type.
			if(value instanceof Constant.Record){
				//On the true branch, its type is intersected with type test.
				internalFailure("Not implemented!", "InterpreterIfIs.java", null);
			}else{
				gotoTargetBranch(code, stackframe);
			}
		}else if(code.rightOperand instanceof Type.Null){
			if(value instanceof Constant.Null){
				//On the true branch, go to the label.				
				gotoTargetBranch(code, stackframe);	
			}else{
				gotoNext(code, stackframe);
			}
		}else if (code.rightOperand instanceof Type.Char){
			//If value is a Constant.Char, then go to the true branch.
			if(value instanceof Constant.Char){	
				gotoTargetBranch(code, stackframe);
			}else{
				gotoNext(code, stackframe);
			}
		}else if(code.rightOperand instanceof Type.Int){
			if(value instanceof Constant.Integer){
				gotoTargetBranch(code, stackframe);
			}else {
				gotoNext(code, stackframe);
			}
		}else{
			internalFailure("Not implemented!", "InterpreterIfIs.java", null);
		}
	
		
		
	}

}
