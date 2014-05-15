package wyopcl.interpreter;

import static wycc.lang.SyntaxError.internalFailure;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import wyil.lang.Code;
import wyil.lang.CodeBlock;
import wyil.lang.Constant;
import wyil.lang.Constant.Strung;
import wyil.lang.Type;
import wyil.lang.Type.EffectiveCollection;
import wyjc.runtime.WyCollection;


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

	public void interpret(Code.ForAll code, StackFrame stackframe) {		
		int linenumber = stackframe.getLine();
		String msg;
		//Type element = code.type.element(); 
		//Get the index 
		//
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
			System.out.println("No elements in the list.");
			//Empty the indexoperand
			stackframe.setRegister(code.indexOperand, null);
			String label = code.target+"LoopEnd";
			CodeBlock block = stackframe.getBlock();
			linenumber = symboltable.get(block).getBlockPosByLabel(label);
			stackframe.setLine(linenumber);
			return;
		}else{
			//Put the element into the register of the index operand.
			stackframe.setRegister(code.indexOperand, values.get(index));
			//Modified operands.
			msg = "%" + code.indexOperand + "(" + values.get(index)
					+ ") %" + code.sourceOperand + "(" + sourceOperand + ")";
		}

		
		int[] modifiedOperands = code.modifiedOperands;
		for (int modifiedOperand : modifiedOperands){
			Constant modified = stackframe.getRegister(modifiedOperand);
			msg += " %"+modifiedOperand+"("+ modified+")";
		}	
		System.out.println("#"+linenumber+" ["+code+"]\n>"+msg+"\n");
		
		stackframe.setLine(++linenumber);

	}

}
