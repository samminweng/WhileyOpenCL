package wyopcl.interpreter.bytecode;

import static wycc.lang.SyntaxError.internalFailure;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;

import wyil.lang.Code.Block;
import wyil.lang.Codes;
import wyil.lang.Constant;
import wyil.lang.Type;
import wyopcl.interpreter.Interpreter;
import wyopcl.interpreter.StackFrame;

public class IfIsInterpreter extends Interpreter {
	private static IfIsInterpreter instance;

	public IfIsInterpreter() {
	}

	/* Implement the Singleton pattern to ensure this class has one instance. */
	public static IfIsInterpreter getInstance() {
		if (instance == null) {
			instance = new IfIsInterpreter();
		}
		return instance;
	}

	private boolean checkType(Constant constant, Type.Record type) {
		try{
			Constant.Record record = (Constant.Record)constant;
			HashMap<String, Type> fields = ((Type.Record) type).fields();		

			// Check the number of field values with the number of field types.
			if (record.values.size() != fields.size()) {
				return false;
			}

			// Iterate over the record
			Iterator<Entry<String, Constant>> iterator = record.values.entrySet().iterator();
			while (iterator.hasNext()) {
				Entry<String, Constant> entry = iterator.next();
				String field = entry.getKey();
				Constant fieldvalue = entry.getValue();
				// Check if the type contains the field. If so, get and compare the
				// field type with the record field.
				if (fields.containsKey(field)) {
					Type fieldType = fields.get(field);
					if (!checkType(fieldvalue, fieldType)) {
						return false;
					}
				} else {
					// Return false for lacking of the field type;
					return false;
				}
			}

			return true;
		}catch(ClassCastException ex){
			//Catch the type casting exception, meaning that the constant is not a instance of Constant.List subtype.
			return false;
		}catch(Exception ex){
			internalFailure("Error!!", "InterpreterIfIs.java", null);
			return false;
		}
		

	}

	private boolean checkType(Constant constant, Type.List type) {
		try{
			Constant.List list = (Constant.List)constant;			
			Type elementType = type.element();
			Iterator<Constant> iterator = list.values.iterator();
			while (iterator.hasNext()) {
				Constant element = iterator.next();
				if(!checkType(element, elementType)){
					return false;
				}
			}
			return true;
		}catch(ClassCastException ex){
			//Catch the type casting exception, meaning that the constant is not a instance of Constant.List subtype.
			return false;
		}catch(Exception ex){
			internalFailure("Error!!", "InterpreterIfIs.java", null);			
		}
		return false;
	}

	private boolean checkType(Constant constant, Type.Set type) {
		try{
			Constant.Set set = (Constant.Set)constant;
			Type elementType = type.element();
			// Check if the element in the list is the specific subtype of element
			// type.
			Iterator<Constant> iterator = set.values.iterator();
			while (iterator.hasNext()) {
				Constant next = iterator.next();
				if(!checkType(next, elementType)){
					return false;
				}
			}
			return true;
		}catch(ClassCastException ex){
			//Catch the type casting exception, meaning that the constant is not a instance of Constant.Set subtype.
			return false;
		}catch(Exception ex){
			//Catch other excpetions.
			internalFailure("Error!!", "InterpreterIfIs.java", null);
			return false;
		}
		
	}

	private boolean checkType(Constant constant, Type.Tuple type) {
		try{
			Constant.Tuple tuple = (Constant.Tuple)constant;
			Iterator<Constant> iterator = tuple.values.iterator();
			int index = 0;
			while (iterator.hasNext()) {
				Constant next = iterator.next();
				Type elementType = type.element(index++);
				if (!checkType(next, elementType)) {
					return false;
				}
			}
			return true;
		}catch(ClassCastException ex){
			//Catch the type casting exception, meaning that the constant is not a instance of Constant.Tuple subtype.
			return false;
		}catch(Exception ex){
			//Catch other excpetions.
			internalFailure("Error!!", "InterpreterIfIs.java", null);
			return false;
		}
		
	}

	private boolean checkType(Constant constant, Type.Map type) {
		try{
			Constant.Map map = (Constant.Map)constant;
			Iterator<Entry<Constant, Constant>> iterator = map.values.entrySet().iterator();
			while (iterator.hasNext()) {
				Entry<Constant, Constant> entry = iterator.next();
				if (!checkType(entry.getKey(), type.key()) || !checkType(entry.getValue(), type.value())) {
					return false;
				}
			}
			return true;
		}catch(ClassCastException ex){
			//Catch the type casting exception, meaning that the constant is not a instance of Constant.Map subtype.
			return false;
		}catch(Exception ex){
			internalFailure("Error!!", "InterpreterIfIs.java", null);
			return false;
		}
		
		
	}

	private boolean checkType(Constant constant, Type.Union type) {
		Iterator<Type> iterator = type.bounds().iterator();
		while (iterator.hasNext()) {
			Type subtype = iterator.next();
			if (checkType(constant, subtype)) {
				return true;
			}
		}

		return false;
	}

	private boolean checkType(Constant constant, Type.Negation type) {
		// The result for negation type should be inverted (i.e. negated the
		// result of type checking)
		// Check the value is subtype of the test type.
		Type elementType = ((Type.Negation) type).element();		
		// On the true branch, its type is matched with type test.
		return !checkType(constant, elementType);
	}

	private boolean checkType(Constant constant, Type type) {
		try{
			
			if(type instanceof Type.Any){
				return true;// No checking.
			}
			
			if (type instanceof Type.Null) {
				Constant.Null n = (Constant.Null)constant;
				return true;
			} 
			
			if(type instanceof Type.Bool){
				Constant.Bool b = (Constant.Bool)constant;
				return true;
			}
			
			
			if (type instanceof Type.Char) {
				Constant.Char c = (Constant.Char)constant;
				return true;			
			} 
			
			if (type instanceof Type.Int) {
				Constant.Integer i = (Constant.Integer)constant; 
				return true;			
			} 
			
			if (type instanceof Type.Strung) {
				Constant.Strung s = (Constant.Strung)constant;
				return true;		
			}
			
			if (type instanceof Type.Real) {
				Constant.Decimal d = (Constant.Decimal)constant;
				return true;
			}
			
			if (type instanceof Type.Negation) {
				return checkType(constant, (Type.Negation)type);
			}
			
			if (type instanceof Type.Map) {
				return checkType(constant, (Type.Map) type);			
			}
			if (type instanceof Type.Record) {
				// Check if the constant is of Constant.Record type.
				return checkType(constant, (Type.Record)type);
			}
			
			if (type instanceof Type.List) {
				return checkType(constant, (Type.List) type);
			} 
			
			if (type instanceof Type.Set) {
				return checkType(constant, (Type.Set) type);
			} 		 
			
			if (type instanceof Type.Union) {
				return checkType(constant, (Type.Union) type);
			}
			
			if(type instanceof Type.Tuple){
				return checkType(constant, (Type.Tuple)type);
			}
			
			
		}catch(ClassCastException ex){
			//Catch the type casting exception, meaning that the constant is not a instance of Constant.Map subtype.
			return false;
		}catch(Exception ex){
			internalFailure("Error!!", "InterpreterIfIs.java", null);
			return false;
		}
		
		//If type is not any of the above types, then it is a new type.
		internalFailure("Not implemented!", "InterpreterIfIs.java", null);
		return false;
		
	}

	/**
	 * Check whether the constant value from operand register is a specific
	 * subtype.
	 * 
	 * @param code
	 * @param stackframe
	 */
	public void interpret(Codes.IfIs code, StackFrame stackframe) {
		// Read the value from the operand register.
		Constant constant = stackframe.getRegister(code.operand);
		Type type = code.rightOperand;
		if (checkType(constant, type)) {
			//Go to the line of target label. 
			String label = code.target;
			Block block = stackframe.getBlock();
			printMessage(stackframe, code.toString(), code.target + "");
			int linenumber = symboltable.get(block).getBlockPosByLabel(label);
			stackframe.setLine(++linenumber);
		} else {
			//Go to the next line.
			int linenumber = stackframe.getLine();
			printMessage(stackframe, code.toString(), "");
			stackframe.setLine(++linenumber);
		}
	}

}
