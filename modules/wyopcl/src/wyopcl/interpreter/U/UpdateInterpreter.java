package wyopcl.interpreter.U;

import static wycc.lang.SyntaxError.internalFailure;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import wyil.lang.Codes;
import wyil.lang.Constant;
import wyil.lang.Type;
import wyopcl.interpreter.Interpreter;
import wyopcl.interpreter.StackFrame;
import wyopcl.util.Utility;

public class UpdateInterpreter extends Interpreter {
	private static UpdateInterpreter instance;

	public UpdateInterpreter() {
	}

	/* Implement the Singleton pattern to ensure this class has one instance. */
	public static UpdateInterpreter getInstance() {
		if (instance == null) {
			instance = new UpdateInterpreter();
		}
		return instance;
	}
	
	private Constant.List update(Constant.List list, Constant givenValue, int index) {
		// Deeply copy and clone the values in the original Constant.List.		
		ArrayList<Constant> values = new ArrayList<Constant>(list.values.size());
		Iterator<Constant> iterator = list.values.iterator();
		while(iterator.hasNext()){
			Constant constant = iterator.next();
			values.add(Utility.copyConstant(constant));
		}
		
		if (values.size() < index) {
			values.add(givenValue);
		} else {			
			values.set(index, givenValue);
		}
		
		return Constant.V_LIST(values);
		
	}
	
	private Constant.List updateList(Codes.Update code, StackFrame stackframe) {
		// Pops the list.
		Constant.List list = (Constant.List) stackframe.getRegister(code.target());
		// Read the rhs from the register.
		Constant givenValue = stackframe.getRegister(code.result());			
		// Get the index
		int index = ((Constant.Integer) stackframe.getRegister(code.key(0))).value.intValue();
		Constant element = list.values.get(index);
		//Check if the element is a compound subtype.
		if (element instanceof Constant.List) {
			//Check if the subindex is provided.
			if(code.keys().length >=2 ){
				int subindex = ((Constant.Integer) stackframe.getRegister(code.key(1))).value.intValue();
				Constant.List updatedValue = update((Constant.List)element, givenValue, subindex);
				return update(list, updatedValue, index);
			}else{
				//Update the element in the list with the given value.
				return update(list, givenValue, index);
			}			
		} else if(element instanceof Constant.Record){
			String field = code.fields.get(0);
			Constant.Record updatedRecord = update((Constant.Record)element, givenValue, field);
			return update(list, updatedRecord, index);
		} else {
			return update(list, givenValue, index);
		}
		
	}
	
	private Constant.Record update(Constant.Record record, Constant givenValue, String field){
		HashMap<String, Constant> values = new HashMap<String, Constant>(record.values);
		values.put(field, givenValue);
		
		return Constant.V_RECORD(values);
	}

	private Constant.Record updateRecord(Codes.Update code, StackFrame stackframe) {
		Constant.Record record = (Constant.Record) stackframe.getRegister(code.target());
		Constant givenValue = stackframe.getRegister(code.result());
		HashMap<String, Constant> values = new HashMap<String, Constant>(record.values);
		ArrayList fields = code.fields;
		String field = code.fields.get(0);

		// Get the field value
		Constant fieldValue = values.get(field);
		if (fieldValue instanceof Constant.List) {
			int index = ((Constant.Integer) stackframe.getRegister(code.key(0))).value.intValue();
			return update(record, update((Constant.List) fieldValue, givenValue, index), field);
			//list.values.set(index, assignedValue);
		} else if (fieldValue instanceof Constant.Integer || fieldValue instanceof Constant.Bool) {
			return update(record, givenValue, field);
		} else if (fieldValue instanceof Constant.Record){
			//Check if there is another field that requires to update the given value.
			if(code.fields.size() == 2){
				//Do the update for the nested record. 
				return update(record, update((Constant.Record)fieldValue, givenValue, code.fields.get(1)), field);
			}			
			return update(record, givenValue, field);
		} else if (fieldValue instanceof Constant.Null){
			return update(record, givenValue, field);			
		} else {
			internalFailure("Not implemented!", "UpdateInterpreter.java", null);
			return null;
		}

	
	}

	private Constant.Strung updateStrung(Codes.Update code, StackFrame stackframe) {
		Constant.Strung strung = (Constant.Strung) stackframe.getRegister(code.target());
		Constant.Char updatedValue = (Constant.Char) stackframe.getRegister(code.result());
		// Get the index
		Constant.Integer updateIndex = (Constant.Integer) stackframe.getRegister(code.operand(0));

		// Replace a char in the strung at the index.
		StringBuilder newStrung = new StringBuilder(strung.value);
		newStrung.setCharAt(updateIndex.value.intValue(), updatedValue.value);
		return Constant.V_STRING(newStrung.toString());
	}
	
	private Constant.Map update(Constant.Map map, Constant key, Constant Value){
		HashMap<Constant, Constant> values = new HashMap<Constant, Constant>(map.values);
		values.put(key, Value);
		return Constant.V_MAP(values);
	}	

	private Constant.Map updateMap(Codes.Update code, StackFrame stackframe) {
		Constant.Map map = (Constant.Map) stackframe.getRegister(code.target());
		Constant givenValue = stackframe.getRegister(code.result());
		// Get the key
		Constant key = stackframe.getRegister(code.operand(0));
		// Get the existing value
		Constant existingValue = map.values.get(key);
		if (existingValue == null) {
			return update(map, key, givenValue);
		} else {
			if (existingValue instanceof Constant.List) {
				//Update the element
				int index1 = ((Constant.Integer) stackframe.getRegister(code.operand(1))).value.intValue();
				Constant.List updatedList = update((Constant.List)existingValue, givenValue, index1);
				// Update the map
				return update(map, key, updatedList);
			} else if (existingValue instanceof Constant.Integer) {
				return update(map, key, givenValue);
			} else {
				internalFailure("Not implemented!", "UpdateInterpreter.java", null);
				return null;
			}
		}		
	}

	private Constant updateReference(Codes.Update code, StackFrame stackframe) {
		Constant reference = stackframe.getRegister(code.target());
		Constant updatedValue = null;
		if (reference instanceof Constant.Record) {
			updatedValue = updateRecord(code, stackframe);
		} else {
			internalFailure("Not implemented!", "UpdateInterpreter.java", null);
		}

		return updatedValue;
	}

	public void interpret(Codes.Update code, StackFrame stackframe) {
		int linenumber = stackframe.getLine();
		Constant result = null;
		// Popup the compound type (lists, dictionaries, strings, records and
		// references
		Type afterType = code.afterType;
		if (afterType instanceof Type.List) {
			result = updateList(code, stackframe);// Update the result to the list.
		} else if (afterType instanceof Type.Record) {
			result = updateRecord(code, stackframe);
		} else if (afterType instanceof Type.Strung) {
			result = updateStrung(code, stackframe);
		} else if (afterType instanceof Type.Map) {
			result = updateMap(code, stackframe);
		} else if (afterType instanceof Type.Reference) {
			result = updateReference(code, stackframe);
		} else {
			internalFailure("Not implemented!", "UpdateInterpreter.java", null);
		}

		stackframe.setRegister(code.target(), result);
		printMessage(stackframe, code.toString(), "%" + code.target() + "(" + result + ")");
		stackframe.setLine(++linenumber);
	}

}
