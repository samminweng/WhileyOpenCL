package wyopcl.interpreter;

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
		Constant.List sourceOperand = (Constant.List) stackframe.getRegister(code.sourceOperand);
		ArrayList<Constant> values = sourceOperand.values;

		int index = 0;
		Constant indexOperand = stackframe.getRegister(code.indexOperand);
		if(indexOperand != null){			
			//Find the index of the indexOperand value.
			Iterator<Constant> iterator = values.iterator();
			while(iterator.hasNext()){
				Constant elem = iterator.next();
				index++;
				if(elem.equals(indexOperand)){
					break;
				}
			}
		}		
			
		//Check if the index is out-of-boundary. If so, then return.
		if(index == values.size()){
			//No elements in the list.
			stackframe.setRegister(code.indexOperand, null);
			String label = code.target+"LoopEnd";
			Block block = stackframe.getBlock();
			linenumber = symboltable.get(block).getBlockPosByLabel(label);
			stackframe.setLine(linenumber);
			return;
		}else{
			//Put the element into the register of the index operand.
			Constant result = values.get(index);
			stackframe.setRegister(code.indexOperand, result);
			//Modified operands.
			printMessage(stackframe, code.toString(),
						 "%"+ code.indexOperand + "("+result+")");
			stackframe.setLine(++linenumber);
		}	

	}

}
