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
		Constant source = stackframe.getRegister(code.sourceOperand);
		ArrayList<Constant> values = new ArrayList<Constant>();
		if(source instanceof Constant.List){
			Constant.List list = (Constant.List) source;
			values.addAll(list.values);
		}else{
			internalFailure("Not implemented!", "InterpreterForAll.java", null);
		}
		
	
		//Check if the index is out-of-boundary. If so, then return.
		if(values.isEmpty()){
			//No elements in the list.
			stackframe.setRegister(code.indexOperand, null);
			String label = code.target+"LoopEnd";
			Block block = stackframe.getBlock();
			linenumber = symboltable.get(block).getBlockPosByLabel(label);
			stackframe.setLine(linenumber);
			return;
		}
		//Put the element into the register of the index operand.		
		Constant result = values.remove(0);
		
		stackframe.setRegister(code.indexOperand, result);
		
		
		stackframe.setRegister(code.sourceOperand, Constant.V_LIST(values));
		
		printMessage(stackframe, code.toString(),
				"%"+ code.indexOperand + "("+result+")");
		stackframe.setLine(++linenumber);


	}

}
