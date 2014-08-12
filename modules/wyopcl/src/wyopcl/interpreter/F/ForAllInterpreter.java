package wyopcl.interpreter.F;

import static wycc.lang.SyntaxError.internalFailure;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Iterator;

import wyil.lang.Code.Block;
import wyil.lang.Codes;
import wyil.lang.Constant;
import wyil.lang.Type;
import wyopcl.interpreter.Interpreter;
import wyopcl.interpreter.Interpreter.StackFrame;


public class ForAllInterpreter extends Interpreter {

	private static ForAllInterpreter instance;	
	public ForAllInterpreter(){
	}

	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static ForAllInterpreter getInstance(){
		if (instance == null){
			instance = new ForAllInterpreter();
		}
		return instance;
	}
	
	private void iterateOverList(Constant.List list, Codes.ForAll code, StackFrame stackframe){
		int linenumber = stackframe.getLine();
		Constant result = null;
		Constant indexOperand = stackframe.getRegister(code.indexOperand);
		
		//Check if the values is empty. If so, then directly go to loop end.		
		if(!list.values.isEmpty()){
			int index = 0;
			if(indexOperand == null){
				result = list.values.get(0);
			}else{
				index = list.values.indexOf(indexOperand);
				//Check if the index is out-of-boundary. If so, then return.
				if(index+1 == list.values.size()){
					//No elements in the list.
					stackframe.setRegister(code.indexOperand, null);
					linenumber = symboltable.get(stackframe.getBlock()).getBlockPosByLabel(code.target+"LoopEnd");
					stackframe.setLine(linenumber);
					return;
				}else{
					//Put the element into the register of the index operand.
					result = list.values.get(index+1);
				}
			}
			
			stackframe.setRegister(code.indexOperand, result);
			printMessage(stackframe, code.toString(), "%"+ code.indexOperand + "("+result+")");
			stackframe.setLine(++linenumber);
		}else{
			linenumber = symboltable.get(stackframe.getBlock()).getBlockPosByLabel(code.target+"LoopEnd");
			stackframe.setLine(linenumber);
		}
	
	}
	
	
	

	public void interpret(Codes.ForAll code, StackFrame stackframe) {		
		
		//Get the index
		Constant source = stackframe.getRegister(code.sourceOperand);		
		if(source instanceof Constant.List){
			iterateOverList((Constant.List)source, code, stackframe);
		}else if (source instanceof Constant.Map){
			internalFailure("Not implemented!", "InterpreterForAll.java", null);
		}else{
			internalFailure("Not implemented!", "InterpreterForAll.java", null);
		}
		
		
		

	}

}
