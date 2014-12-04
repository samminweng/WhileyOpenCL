package wyopcl.interpreter.bytecode;

import static wycc.lang.SyntaxError.internalFailure;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;

import wyil.lang.Codes;
import wyil.lang.Constant;
import wyopcl.interpreter.Interpreter;
import wyopcl.interpreter.StackFrame;

/**
 * Interprets <code>Codes.ForAll</code> bytecode.
 * @author Min-Hsien Weng
 * @see wyil.lang.Codes.ForAll
 *
 */
public class ForAllInterpreter extends Interpreter {

	private static ForAllInterpreter instance;	
	private ForAllInterpreter(){}

	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static ForAllInterpreter getInstance(){
		if (instance == null){
			instance = new ForAllInterpreter();
		}
		return instance;
	}
	
	private void gotoLoopEnd(Codes.ForAll code, StackFrame stackframe){
		stackframe.setRegister(code.indexOperand, null);
		int linenumber = symboltable.getBlockPosByLabel(stackframe.getBlock(), code.target+"LoopEnd");
		stackframe.setLine(linenumber);
	}
	
	
	private void goIntoLoop(Codes.ForAll code, StackFrame stackframe, int index, Constant result){
		int linenumber = stackframe.getLine();
		stackframe.setLoop_index(code.target, index);
		stackframe.setRegister(code.indexOperand, result);
		printMessage(stackframe, code.toString(), "%"+ code.indexOperand + "("+result+")");
		stackframe.setLine(++linenumber);
	}
	
	
	private void iterateOverListSet(Codes.ForAll code, StackFrame stackframe, Constant[] array){
		Constant indexOperand = stackframe.getRegister(code.indexOperand);
		if(array.length > 0){
			//Get the current index
			int index = stackframe.getLoop_index(code.target);
			if(indexOperand == null || index == -1){
				goIntoLoop(code, stackframe, 0, array[0]);
				return;
			}
			index++;
			//Check if the index is out-of-boundary. If not, then go into the loop.
			if(index < array.length){
				goIntoLoop(code, stackframe, index, array[index]);
				return;
			}			
		}
		gotoLoopEnd(code, stackframe);
	}
	
	private Constant.Tuple createTuple(Entry<Constant, Constant> entry){
		Constant.Tuple tuple = null;
				
		Collection<Constant> list = new ArrayList<Constant>();
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
			iterateOverListSet(code, stackframe, array);
		}else if (source instanceof Constant.Map){			
			iterateOverMap((Constant.Map)source, code, stackframe);
		}else if (source instanceof Constant.Set){
			Constant.Set set = (Constant.Set)source;
			Constant[] array = new Constant[set.values.size()];
			array = set.values.toArray(array);
			iterateOverListSet(code, stackframe, array);
		}else if(source instanceof Constant.Strung){
			Constant.Strung strung = (Constant.Strung)source;
			Constant.Char[] chars = new Constant.Char[strung.value.length()];
			for(int index=0;index<strung.value.length();index++){
				chars[index] = Constant.V_CHAR(strung.value.charAt(index));
			}
			iterateOverListSet(code, stackframe, chars);
		}else if (source instanceof Constant.Null){
			//Go to loop end
			gotoLoopEnd(code, stackframe);
			return;
		}else{
			internalFailure("Not implemented!", "InterpreterForAll.java", null);
		}
		
		
	}

}
