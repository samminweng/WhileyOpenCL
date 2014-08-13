package wyopcl.interpreter.F;

import static wycc.lang.SyntaxError.internalFailure;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Set;

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
	
	private void gotoLoopEnd(Codes.ForAll code, StackFrame stackframe){
		int linenumber = symboltable.get(stackframe.getBlock()).getBlockPosByLabel(code.target+"LoopEnd");
		stackframe.setLine(linenumber);
	}
	
	
	
	private void iterateOverListSet(Constant[] array, Codes.ForAll code, StackFrame stackframe){
		int linenumber = stackframe.getLine();
		Constant result = null;
		Constant indexOperand = stackframe.getRegister(code.indexOperand);
		
		if(array.length != 0){
			int index = 0;
			if(indexOperand == null){
				result = array[index];
			}else{
				
				for(Constant constant: array){
					if(indexOperand.equals(constant)){
						break;
					}
					index++;
				}				
				//Check if the index is out-of-boundary. If so, then return.
				if((index+1) >= array.length){
					//No elements in the list.
					stackframe.setRegister(code.indexOperand, null);
					gotoLoopEnd(code, stackframe);					
					return;
				}else{
					//Put the element into the register of the index operand.
					result = array[index+1];
				}
			}
			
			stackframe.setRegister(code.indexOperand, result);
			printMessage(stackframe, code.toString(), "%"+ code.indexOperand + "("+result+")");
			stackframe.setLine(++linenumber);
		}else{
			gotoLoopEnd(code, stackframe);			
		}
		
	}
	
	
	private Constant.Tuple createTuple(Entry<Constant, Constant> entry){
		Constant.Tuple tuple = null;
				
		Collection<Constant> list = new ArrayList();
		list.add(entry.getKey());
		list.add(entry.getValue());
		//Create a tuple
		tuple = Constant.V_TUPLE(list);
		
		return tuple;
	}
	
	
	private void iterateOverMap(Constant.Map map, Codes.ForAll code, StackFrame stackframe){
		int linenumber = stackframe.getLine();
		Constant result = null;
		Constant indexOperand = stackframe.getRegister(code.indexOperand);
		
		HashMap<Constant, Constant> values = map.values;
		if(values.size() == 0){
			gotoLoopEnd(code, stackframe);
		}else{
			Iterator<Entry<Constant, Constant>> iterator = values.entrySet().iterator();
			if(indexOperand == null){				
				//Create a tuple
				result = createTuple(iterator.next());
			}else{
				Constant.Tuple tuple = (Constant.Tuple)indexOperand;
				while(iterator.hasNext()){
					//Check if the tuple matches one of the entries
					Entry<Constant, Constant> entry = iterator.next();
					if(entry.getKey()==tuple.values.get(0) && entry.getValue() == tuple.values.get(1)){
						break;
					}
				}
				
				if(iterator.hasNext()){					
					result = createTuple(iterator.next());
				}else{
					gotoLoopEnd(code, stackframe);
					return;
				}
			}
			
			stackframe.setRegister(code.indexOperand, result);
			printMessage(stackframe, code.toString(), "%"+ code.indexOperand + "("+result+")");
			stackframe.setLine(++linenumber);
			
		}
	}
	

	public void interpret(Codes.ForAll code, StackFrame stackframe) {		
		
		//Get the index
		Constant source = stackframe.getRegister(code.sourceOperand);		
		if(source instanceof Constant.List){			
			Constant.List list = (Constant.List)source;
			Constant[] array = new Constant[list.values.size()];
			array = list.values.toArray(array);
			iterateOverListSet(array, code, stackframe);
		}else if (source instanceof Constant.Map){			
			iterateOverMap((Constant.Map)source, code, stackframe);
		}else if (source instanceof Constant.Set){
			Constant.Set set = (Constant.Set)source;
			Constant[] array = new Constant[set.values.size()];
			array = set.values.toArray(array);
			iterateOverListSet(array, code, stackframe);
		}else if(source instanceof Constant.Strung){
			Constant.Strung strung = (Constant.Strung)source;
			internalFailure("Not implemented!", "InterpreterForAll.java", null);
		}else{
			internalFailure("Not implemented!", "InterpreterForAll.java", null);
		}
		
		
	}

}
