package wyopcl.interpreter.U;

import static wycc.lang.SyntaxError.internalFailure;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Set;

import wycc.util.Pair;
import wyil.lang.Codes;
import wyil.lang.Constant;
import wyil.lang.Type;
import wyopcl.interpreter.Interpreter;
import wyopcl.interpreter.Interpreter.StackFrame;

public class UpdateInterpreter extends Interpreter{
	private static UpdateInterpreter instance;	
	public UpdateInterpreter(){		
	}

	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static UpdateInterpreter getInstance(){
		if (instance == null){
			instance = new UpdateInterpreter();
		}
		return instance;
	}
	
	
	private Constant.List updateList(Codes.Update code, StackFrame stackframe){
		//Pops the list.
		Constant.List list = (Constant.List)stackframe.getRegister(code.target());
		//Read the rhs from the register.
		Constant rhs = stackframe.getRegister(code.result());
		//Get and clone the arrayList
		ArrayList<Constant> values = new ArrayList<Constant>(list.values);
		int index;//Get the index
		for (int key : code.keys()) {
			index = ((Constant.Integer)stackframe.getRegister(key)).value.intValue();
			if(values.size()<index){
				values.add(rhs);
			}else{
				values.set(index, rhs);
			}
		}

		return Constant.V_LIST(values);
	}
	
	private Constant.Record updateRecord(Codes.Update code, StackFrame stackframe){
		Constant.Record record = (Constant.Record)stackframe.getRegister(code.target());
		Constant assignedValue = stackframe.getRegister(code.result());
		HashMap<String, Constant> values = new HashMap<String, Constant>(record.values);
		String field = code.fields.get(0);
		
		//Get the field value
		Constant constant = values.get(field);			
		if(constant instanceof Constant.List){
			Constant.List list = (Constant.List)constant;				
			int index = ((Constant.Integer)stackframe.getRegister(code.key(0))).value.intValue();
			list.values.set(index, assignedValue);				
		}else if(constant instanceof Constant.Integer){
			values.put(field, assignedValue);
		} else if (constant instanceof Constant.Bool){
			values.put(field, assignedValue);
		} else {
			internalFailure("Not implemented!", "IntepreterUpdate.java", null);
		}
		
		return Constant.V_RECORD(values);
	}
	
	private Constant.Strung updateStrung(Codes.Update code, StackFrame stackframe){
		Constant.Strung strung = (Constant.Strung)stackframe.getRegister(code.target());
		Constant.Char updatedValue = (Constant.Char)stackframe.getRegister(code.result());
		//Get the index
		Constant.Integer updateIndex = (Constant.Integer)stackframe.getRegister(code.operand(0));
		
		//Replace a char in the strung at the index. 
		StringBuilder newStrung= new StringBuilder(strung.value);
		newStrung.setCharAt(updateIndex.value.intValue(), updatedValue.value);
		return Constant.V_STRING(newStrung.toString());
	}
	
	private Constant.Map updateMap(Codes.Update code, StackFrame stackframe){
		Constant.Map map = (Constant.Map)stackframe.getRegister(code.target());
		Constant updatedValue = stackframe.getRegister(code.result());
		//Get the index
		Constant updateIndex0 = stackframe.getRegister(code.operand(0));
		
		HashMap<Constant, Constant> values = new HashMap<Constant, Constant>(map.values);
	
		//Get the existing value
		Constant existingValue = values.get(updateIndex0);
		if(existingValue == null){
			values.put(updateIndex0, updatedValue);
		}else{
			if (existingValue instanceof Constant.List){
				//Get the list
				Constant.List list = (Constant.List)existingValue;
				//Get the updated sub-index 
				Constant.Integer updateIndex1 = (Constant.Integer)stackframe.getRegister(code.operand(1));
				//Update the list
				list.values.set(updateIndex1.value.intValue(), updatedValue);
				//Update the map
				values.put(updateIndex0, list);
			}else if(existingValue instanceof Constant.Integer){
				values.put(updateIndex0, updatedValue);			
			}else{
				internalFailure("Not implemented!", "IntepreterUpdate.java", null);
			}
		}
		
		return Constant.V_MAP(values);
	}
	
	
	
	public void interpret(Codes.Update code, StackFrame stackframe) {
		int linenumber = stackframe.getLine();
		Constant result = null;
		//Popup the compound type (lists, dictionaries, strings, records and references
		Type afterType = code.afterType;		
		if(afterType instanceof Type.List){			
			result = updateList(code, stackframe);//Update the result to the list.			
		}else if(afterType instanceof Type.Record){
			result = updateRecord(code, stackframe);			
		}else if (afterType instanceof Type.Strung){
			result = updateStrung(code, stackframe);
		}else if (afterType instanceof Type.Map){
			result = updateMap(code, stackframe);
		}else{
			internalFailure("Not implemented!", "IntepreterUpdate.java", null);
		}
		
		stackframe.setRegister(code.target(), result);
		printMessage(stackframe, code.toString(), "%"+code.target() + "("+result+")");
		stackframe.setLine(++linenumber);
	}
	
}
