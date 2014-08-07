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
	
	
	private int gotoTargetBranch(StackFrame stackframe, String label){		
		Block block = stackframe.getBlock();
		int linenumber = symboltable.get(block).getBlockPosByLabel(label);
		return linenumber;
	}
	

	public void interpret(Codes.IfIs code, StackFrame stackframe) {		
		int linenumber = stackframe.getLine();
		
		//Read the value from the operand register.
		Constant value = stackframe.getRegister(code.operand);
		
		if (code.rightOperand instanceof Type.Negation){
			//Type.Negation test = (Type.Negation)code.rightOperand;
			//Check the value is subtype of the test type.
			if(value instanceof Constant.Record){
				//On the true branch, its type is intersected with type test.
			}else{
				linenumber = gotoTargetBranch(stackframe, code.target);
			}
		}else if(code.rightOperand instanceof Type.Null){
			if(value instanceof Constant.Null){
				//On the true branch, go to the label.				
				linenumber = gotoTargetBranch(stackframe, code.target);	
			}			
		}else if (code.rightOperand instanceof Type.Char){
			//If value is a Constant.Char, then go to the true branch.
			if(value instanceof Constant.Char){	
				linenumber = gotoTargetBranch(stackframe, code.target);
			}			
			
		}else{
			internalFailure("Not implemented!", "InterpreterIfIs.java", null);
		}
	
		
		printMessage(stackframe, code.toString(),"");
		stackframe.setLine(++linenumber);
	}

}
