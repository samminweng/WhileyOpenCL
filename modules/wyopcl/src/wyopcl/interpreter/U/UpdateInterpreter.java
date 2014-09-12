package wyopcl.interpreter.U;

import static wycc.lang.SyntaxError.internalFailure;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import wyil.lang.Codes;
import wyil.lang.Constant;
import wyil.lang.Constant.List;
import wyil.lang.Constant.Record;
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

	private Constant.List update(Constant.List list, Constant givenValue, int updateIndex) {
		// Deeply copy and clone the values in the original Constant.List.		
		ArrayList<Constant> values = new ArrayList<Constant>(list.values.size());
		Iterator<Constant> iterator = list.values.iterator();
		while(iterator.hasNext()){
			Constant constant = iterator.next();
			values.add(Utility.copyConstant(constant));
		}

		if (values.size() < updateIndex) {
			values.add(givenValue);
		} else {			
			values.set(updateIndex, givenValue);
		}

		return Constant.V_LIST(values);

	}

	private Constant.Record update(Constant.Record record, Constant givenValue, String field){
		HashMap<String, Constant> values = new HashMap<String, Constant>(record.values);
		values.put(field, givenValue);		
		return Constant.V_RECORD(values);
	}

	private Constant.Map update(Constant.Map map, Constant key, Constant Value){
		HashMap<Constant, Constant> values = new HashMap<Constant, Constant>(map.values);
		values.put(key, Value);
		return Constant.V_MAP(values);
	}

	private Constant.List updateList(Codes.Update code, StackFrame stackframe) {
		// Pops the list.
		Constant.List list = (Constant.List) stackframe.getRegister(code.target());
		// Read the rhs from the register.
		Constant givenValue = stackframe.getRegister(code.result());
		// Get the index
		int[] keys = code.keys();

		int index = ((Constant.Integer) stackframe.getRegister(keys[0])).value.intValue();
		Constant element = list.values.get(index);
		//Check if the element is a compound subtype.
		if (element instanceof Constant.List) {
			//Check if the subindex is provided.
			if(keys.length >=2){
				int subindex = ((Constant.Integer) stackframe.getRegister(keys[1])).value.intValue();
				givenValue = update((Constant.List)element, givenValue, subindex);
			}						
		}

		if(element instanceof Constant.Record){			
			String field = code.fields.get(0);
			givenValue = update((Constant.Record)element, givenValue, field);			
		} 

		//Update the element in the list with the given value.
		return update(list, givenValue, index);
	}		

	private Constant.Record updateRecord(Codes.Update code, StackFrame stackframe) {
		Constant.Record record = (Constant.Record) stackframe.getRegister(code.target());
		Constant givenValue = stackframe.getRegister(code.result());
		HashMap<String, Constant> values = new HashMap<String, Constant>(record.values);
		String[] fields = code.fields.toArray(new String[code.fields.size()]);
		String field = fields[0];

		// Get the field value
		Constant fieldValue = values.get(field);
		if (fieldValue instanceof Constant.List) {
			int index = ((Constant.Integer) stackframe.getRegister(code.key(0))).value.intValue();
			givenValue = update((Constant.List) fieldValue, givenValue, index);	
		}

		if (fieldValue instanceof Constant.Record && fields.length == 2){
			//Check if there is another field that requires to update the given value.
				//Do the update for the nested record. 
			givenValue = update((Constant.Record)fieldValue, givenValue, fields[1]);			
		} 
		return update(record, givenValue, field);
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



	private Constant.Map updateMap(Codes.Update code, StackFrame stackframe) {
		Constant.Map map = (Constant.Map) stackframe.getRegister(code.target());
		Constant givenValue = stackframe.getRegister(code.result());
		// Get the key
		int[] operands = code.operands();
		Constant key = stackframe.getRegister(operands[0]);
		// Get the existing value
		Constant value = map.values.get(key);
		
		if (value != null && value instanceof Constant.List) {
			//Update the element
			int index = ((Constant.Integer) stackframe.getRegister(operands[1])).value.intValue();
			givenValue = update((Constant.List)value, givenValue, index);
		}  
		// Update the map
		return update(map, key, givenValue);
	}

	private Constant updateReference(Codes.Update code, StackFrame stackframe) {
		Constant reference = stackframe.getRegister(code.target());
		Constant updatedValue = null;
		if (reference instanceof Constant.Record) {
			return updateRecord(code, stackframe);
		}		

		internalFailure("Not implemented!", "UpdateInterpreter.java", null);
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
