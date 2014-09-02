package wyopcl.interpreter.C;

import static wycc.lang.SyntaxError.internalFailure;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import wyil.lang.Codes;
import wyil.lang.Constant;
import wyil.lang.Type;
import wyopcl.interpreter.DecimalFraction;
import wyopcl.interpreter.StackFrame;
import wyopcl.interpreter.Interpreter;

public class ConvertInterpreter extends Interpreter {
	private static ConvertInterpreter instance;

	public ConvertInterpreter() {
	}

	/* Implement the Singleton pattern to ensure this class has one instance. */
	public static ConvertInterpreter getInstance() {
		if (instance == null) {
			instance = new ConvertInterpreter();
		}
		return instance;
	}


	private Constant.List toConstantList(Constant constant, Type fromType, Type.List toType) {
		// No needs of casting for UnionOfList type.
		if (fromType instanceof Type.UnionOfLists) {
			return (Constant.List) constant;
		}

		Type toElemType = ((Type.List) toType).element();
		Type fromElemType;
		if (fromType instanceof Type.List) {
			fromElemType = ((Type.List) fromType).element();
			if (fromElemType instanceof Type.Void) {
				return Constant.V_LIST(new ArrayList<Constant>());// Return an empty list.
			}
			if (toElemType.equals(fromElemType) || toElemType instanceof Type.Union
					|| (fromElemType instanceof Type.List && toElemType instanceof Type.List)) {
				return (Constant.List) constant;// No casting
			}

			List<Constant> values = new ArrayList<Constant>();
			Iterator<Constant> iterator = ((Constant.List) constant).values.iterator();
			while (iterator.hasNext()) {
				Constant value = iterator.next();
				values.add(castConstanttoConstant(value, fromElemType, toElemType));
			}
			return Constant.V_LIST(values);

		} else if (fromType instanceof Type.Strung && toElemType instanceof Type.Int) {
			// Cast Constant.Strung to Constant.List
			List<Constant> values = new ArrayList<Constant>();
			char[] charArray = ((Constant.Strung) constant).value.toCharArray();
			for (char c : charArray) {
				values.add(Constant.V_INTEGER(BigInteger.valueOf((int) c)));// Cast char to int
			}
			return Constant.V_LIST(values);
		} else {
			internalFailure("Not implemented!", "ConvertInterpreter.java", null);
			return null;
		}

	}

	private Constant.Record toConstantRecord(Constant constant, Type fromType, Type.Record toType) {
		Constant.Record record = (Constant.Record)constant;
		Type fromElemType, toElemType = null;
		Collection<Type> fromTypeValues = ((Type.Record)fromType).fields().values();
		Type[] fromElemTypes = fromTypeValues.toArray(new Type[fromTypeValues.size()]);
		Collection<Type> toElemTypeValues = toType.fields().values();
		Type[] toElemTypes = toElemTypeValues.toArray(new Type[toElemTypeValues.size()]);

		Map<String, Constant> map = new HashMap<String, Constant>();
		Iterator<Entry<String, Constant>> iterator = record.values.entrySet().iterator();
		int index = 0;
		while (iterator.hasNext()) {
			Entry<String, Constant> entry = iterator.next();
			fromElemType = fromElemTypes[index];
			if (index < toElemTypes.length) {
				toElemType = toElemTypes[index];	
			}
			Constant value = entry.getValue();
			map.put(entry.getKey(), castConstanttoConstant(value, fromElemType, toElemType));
			index++;
		}

		return Constant.V_RECORD(map);

	}

	private Constant.Char toConstantChar(Constant constant, Type fromType, Type.Char toType){
		if(fromType instanceof Type.Int){
			return Constant.V_CHAR((char) (((Constant.Integer) constant).value.intValue()));
		}else{
			internalFailure("Not implemented!", "ConvertInterpreter.java", null);
			return null;
		}
		
	}
	
	/**
	 * Convert a Constant object to a Constant.Map
	 * 
	 * @param from
	 * @param fromType
	 * @param toType
	 * @return
	 */
	private Constant.Map toConstantMap(Constant from, Type fromType, Type.Map toType) {
		if (fromType != toType) {
			if (from instanceof Constant.Map) {
				return (Constant.Map) from;
			} else {
				internalFailure("Not implemented!", "ConvertInterpreter.java", null);
				return null;
			}
		} else {
			// Directly cast it into a Map.
			return (Constant.Map) from;
		}
	}

	private Constant.Set toConstantSet(Constant constant, Type fromType, Type.Set toType) {
		Type fromElemType = null;
		HashSet<Constant> values = new HashSet<Constant>();
		Iterator<Constant> iterator = null;

		if (fromType instanceof Type.Set) {
			iterator = ((Constant.Set) constant).values.iterator();
			fromElemType = ((Type.Set) fromType).element();
		} else if (fromType instanceof Type.List) {
			iterator = ((Constant.List) constant).values.iterator();
			fromElemType = ((Type.List) fromType).element();
		} else {
			internalFailure("Not implemented!", "ConvertInterpreter.java", null);
		}

		Type toElemType = ((Type.Set) toType).element();
		while (iterator.hasNext()) {
			Constant next = iterator.next();
			// Cast the elements in the from set.
			values.add(castConstanttoConstant(next, fromElemType, toElemType));
		}

		return Constant.V_SET(values);
	}

	private Constant.Integer toConstantInt(Constant constant, Type fromType, Type.Int toType) {
		if(fromType.equals(toType)){
			return (Constant.Integer)constant;
		}
		if (fromType instanceof Type.Real){
			Constant.Decimal decimal = (Constant.Decimal)constant;
			//Cast a decimal to an integer
			return Constant.V_INTEGER(decimal.value.toBigInteger());
		}else if (fromType instanceof Type.List) {
			Constant.List list = (Constant.List) constant;
			return (Constant.Integer) list.values.get(0);
		} else if (fromType instanceof Type.Char) {
			// Cast Char to int
			return Constant.V_INTEGER(BigInteger.valueOf((int) (((Constant.Char) constant).value)));
		} else if (fromType instanceof Type.Union) {
			if (constant instanceof Constant.Char) {
				Constant.Char fromchar = (Constant.Char) constant;
				return Constant.V_INTEGER(BigInteger.valueOf((int) fromchar.value));
			} else {
				return (Constant.Integer) constant;
			}
		} else {
			internalFailure("Not implemented!", "ConvertInterpreter.java", null);
			return null;
		}
	}

	private Constant.Decimal toConstantDecimal(Constant constant, Type fromType, Type.Real toType) {
		if (fromType instanceof Type.Int) {
			return Constant.V_DECIMAL(new BigDecimal(((Constant.Integer) constant).value.toString()));
		} else if (fromType instanceof Type.Real) {
			return Constant.V_DECIMAL(((Constant.Decimal) constant).value);
		} else if (fromType instanceof Type.Union) {
			if (constant instanceof Constant.Integer) {
				return Constant.V_DECIMAL(BigDecimal.valueOf(((Constant.Integer) constant).value.longValue()));
			} else if (constant instanceof Constant.Char) {
				char value = ((Constant.Char) constant).value;
				return Constant.V_DECIMAL(BigDecimal.valueOf((int) value));
			} else {
				return (Constant.Decimal) constant;
			}
		} else {
			internalFailure("Not implemented!", "ConvertInterpreter.java", null);
			return null;
		}
	}

	private Constant toConstantNegation(Constant constant, Type fromType, Type.Negation toType) {
		if (fromType instanceof Type.Int) {
			Constant.Integer integer = (Constant.Integer) constant;
			return Constant.V_INTEGER(new BigInteger(integer.value.toString()));
		} else if (fromType instanceof Type.Real) {
			internalFailure("Not implemented!", "ConvertInterpreter.java", null);
			return null;
		} else if (fromType instanceof Type.Strung) {
			Constant.Strung strung = (Constant.Strung) constant;
			return strung;
		} else {
			internalFailure("Not implemented!", "ConvertInterpreter.java", null);
			return null;
		}
	}

	private Constant.Tuple toConstantTuple(Constant constant, Type fromType, Type.Tuple toType) {
		Constant.Tuple tuple = (Constant.Tuple) constant;
		ArrayList<Constant> values = new ArrayList<Constant>();
		int index = 0;
		for (Constant value : tuple.values) {
			if (fromType instanceof Type.Tuple) {
				values.add(castConstanttoConstant(value, ((Type.Tuple) fromType).element(index),
						((Type.Tuple) toType).element(index)));
			} else if (fromType instanceof Type.UnionOfTuples) {
				values.add(castConstanttoConstant(value, ((Type.UnionOfTuples) fromType).element(index),
						((Type.Tuple) toType).element(index)));
			} else {
				internalFailure("Not implemented!", "ConvertInterpreter.java", null);
				return null;
			}

		}
		return Constant.V_TUPLE(values);

	}

	private Constant toConstantAny(Constant constant, Type fromType, Type.Any toType){
		if (constant instanceof DecimalFraction) {
			// Cast to a string
			return Constant.V_STRING(((Constant.Strung)constant).toString());
		}else if (constant instanceof Constant){
			return constant;
		}else {
			internalFailure("Not implemented!", "ConvertInterpreter.java", null);
			return null;
		}
	}
	
	private Constant toConstantStrung(Constant constant, Type fromType, Type.Strung toType){
		if (constant instanceof Constant.Strung) {
			// Cast to a string
			return Constant.V_STRING(constant.toString());
		}  else {
			// No needs to convert the type of the operand.
			return constant;
		}
	}
	
	
	private Constant toConstantUnion(Constant constant, Type fromType, Type.Union toType){
		//The bounds of the union type has been sorted by key, so the order of type has been changed. 
		/*HashSet<Type> bounds = toType.bounds();
		Iterator<Type> iterator = bounds.iterator();
		while(iterator.hasNext()){
			Type type = iterator.next();			
			return castConstanttoConstant(constant, fromType, type);
		}*/		
		return constant;
	}
	
	
	
	/***
	 * Cast a Constant object to the Constant object of a specific type.
	 * 
	 * @param constant
	 * @param fromType
	 * @param toType
	 * @return
	 */
	public Constant castConstanttoConstant(Constant constant, wyil.lang.Type fromType, wyil.lang.Type toType) {
		if(fromType.equals(toType)){
			return constant;//Not casting.
		}
		
		if (toType instanceof Type.Any) {
			return toConstantAny(constant, fromType, (Type.Any)toType);
		} else if (toType instanceof Type.Char) {
			// Cast ascii to Char
			return toConstantChar(constant, fromType, (Type.Char)toType);
		} else if (toType instanceof Type.Int) {
			return toConstantInt(constant, fromType, (Type.Int)toType);
		} else if (toType instanceof Type.List) {
			return toConstantList(constant, fromType, (Type.List) toType);
		} else if (toType instanceof Type.Record) {
			return toConstantRecord(constant, fromType, (Type.Record) toType);
		} else if (toType instanceof Type.Real) {
			return toConstantDecimal(constant, fromType, (Type.Real) toType);
		} else if (toType instanceof Type.Map) {
			return toConstantMap(constant, fromType, (Type.Map) toType);
		} else if (toType instanceof Type.Set) {
			return toConstantSet(constant, fromType, (Type.Set)toType);
		} else if (toType instanceof Type.Tuple) {
			return toConstantTuple(constant, fromType, (Type.Tuple)toType);
		} else if (toType instanceof Type.Negation) {
			return toConstantNegation(constant, fromType, (Type.Negation)toType);
		} else if (toType instanceof Type.Union) {
			return toConstantUnion(constant, fromType, (Type.Union)toType);
		} else if (toType instanceof Type.UnionOfCollections || toType instanceof Type.UnionOfMaps
				|| toType instanceof Type.UnionOfIndexibles || toType instanceof Type.UnionOfLists
				) {
			return constant;
		}else if (toType instanceof Type.Strung){
			return toConstantStrung(constant, fromType, (Type.Strung)toType);
		} else {
			internalFailure("Not implemented!", "ConvertInterpreter.java", null);
			return null;
		}
	}

	public void interpret(Codes.Convert code, StackFrame stackframe) {
		int linenumber = stackframe.getLine();
		// Read a value from the operand register.
		Constant value = stackframe.getRegister(code.operand(0));
		// Convert it to the given type.
		Constant result = castConstanttoConstant(value, code.assignedType(), code.result);
		stackframe.setRegister(code.target(), result);
		printMessage(stackframe, code.toString(), "%" + code.target() + "(" + result + ")");
		stackframe.setLine(++linenumber);
	}

}
