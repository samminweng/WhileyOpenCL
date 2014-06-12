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
			//System.out.println("No elements in the list.");
			//Empty the indexoperand
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
			//msg = "%" + code.indexOperand + "(" + values.get(index)
			//		+ ") %" + code.sourceOperand + "(" + sourceOperand + ")";
			printMessage(stackframe, code.toString(),
						 "%"+ code.target + "("+result+")\n");
			stackframe.setLine(++linenumber);
		}

		
		//int[] modifiedOperands = code.modifiedOperands;
		//for (int modifiedOperand : modifiedOperands){
		//	Constant modified = stackframe.getRegister(modifiedOperand);
			//msg += " %"+modifiedOperand+"("+ modified+")";
		//}	
		//System.out.println("#"+linenumber+" ["+code+"]\n>"+msg+"\n");
		
		

	}

}
