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

	public void interpret(Codes.ForAll code, StackFrame stackframe) {		
		int linenumber = stackframe.getLine();
		//Get the index
		Constant list = stackframe.getRegister(code.sourceOperand);
		
		ArrayList<Constant> values = new ArrayList<Constant>();
		if(list instanceof Constant.List){
			values.addAll(((Constant.List)list).values);
		}else{
			internalFailure("Not implemented!", "InterpreterForAll.java", null);
		}
		
		Constant indexOperand = stackframe.getRegister(code.indexOperand);
		int index = 0;
		Constant result;
		if(indexOperand != null){
			index = values.indexOf(indexOperand);
			//Check if the index is out-of-boundary. If so, then return.
			if(index+1 == values.size()){
				//No elements in the list.
				stackframe.setRegister(code.indexOperand, null);
				String label = code.target+"LoopEnd";
				Block block = stackframe.getBlock();
				linenumber = symboltable.get(block).getBlockPosByLabel(label);
				stackframe.setLine(linenumber);
				return;
			}
			//Put the element into the register of the index operand.
			result = values.get(index+1);
		}else{
			result = values.get(0);
		}
		
		stackframe.setRegister(code.indexOperand, result);
		printMessage(stackframe, code.toString(),
				"%"+ code.indexOperand + "("+result+")");
		stackframe.setLine(++linenumber);


	}

}
