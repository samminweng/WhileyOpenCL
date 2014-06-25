package wyopcl.interpreter;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Iterator;

import wyil.lang.Code.Block;
import wyil.lang.Codes;
import wyil.lang.Constant;


public class InterpreterForAll extends Interpreter {

	private static InterpreterForAll instance;	
	public InterpreterForAll(){
	}

	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static InterpreterForAll getInstance(){
		if (instance == null){
			instance = new InterpreterForAll();
		}
		return instance;
	}

	public void interpret(Codes.ForAll code, StackFrame stackframe) {		
		int linenumber = stackframe.getLine();
		//Get the index 
		Constant.List list = (Constant.List) stackframe.getRegister(code.sourceOperand);
		ArrayList<Constant> values = new ArrayList();
		values.addAll(list.values);
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
