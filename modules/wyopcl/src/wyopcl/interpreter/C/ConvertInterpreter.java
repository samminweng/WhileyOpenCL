package wyopcl.interpreter.C;

import static wycc.lang.SyntaxError.internalFailure;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import wyil.lang.Codes;
import wyil.lang.Constant;
import wyil.lang.Type;
import wyopcl.interpreter.DecimalFraction;
import wyopcl.interpreter.StackFrame;
import wyopcl.interpreter.Utility;
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

	private Constant castElement(Constant element, Type fromElemType, Type toElemType) {
		if (fromElemType == toElemType || toElemType instanceof Type.Any) {
			return element;
		} else {
			if (toElemType instanceof Type.Union) {
				return element;
			} else {
				if (fromElemType instanceof Type.Real && toElemType instanceof Type.Int) {
					Constant.Decimal value = (Constant.Decimal) element;
					return Constant.V_INTEGER(new BigInteger(value.toString()));
				} else if (fromElemType instanceof Type.Int && toElemType instanceof Type.Real) {
					Constant.Integer value = (Constant.Integer) element;
					return Constant.V_DECIMAL(new BigDecimal(value.toString()));
				} else if (fromElemType instanceof Type.Union && toElemType instanceof Type.Real) {
					if (element instanceof Constant.Decimal) {
						return element;
					} else if (element instanceof Constant.Integer) {
						return Constant.V_DECIMAL(new BigDecimal(((Constant.Integer) element).toString()));
					} else {
						internalFailure("Not implemented!", "ConvertInterpreter.java", null);
						return null;
					}
				} else if (fromElemType instanceof Type.Char && toElemType instanceof Type.Int) {
					Constant.Char fromChar = (Constant.Char) element;
					return Constant.V_INTEGER(BigInteger.valueOf((int) fromChar.value));
				} else if(fromElemType instanceof Type.Union && toElemType instanceof Type.Int){
					if(element instanceof Constant.Char){
						char val = ((Constant.Char)element).value;
						return Constant.V_INTEGER(BigInteger.valueOf((int)val));
					}else{
						return (Constant.Integer)element;
					}
					
				} else {
					internalFailure("Not implemented!", "ConvertInterpreter.java", null);
					return null;
				}
			}
		}

	}

	private Constant.List toConstantList(Constant from, Type fromType, Type toType) {
		Type fromElemType, toElemType;
		List<Constant> values = new ArrayList<Constant>();
		toElemType = ((Type.List) toType).element();
		if (fromType instanceof Type.List) {
			fromElemType = ((Type.List) fromType).element();
			if (fromElemType instanceof Type.Void) {
				return Constant.V_LIST(values);// Return an empty list.
			} else if (toElemType.equals(fromElemType) || toElemType instanceof Type.Union) {
				return (Constant.List) from;// No casting
			} else {
				if (toElemType instanceof Type.Real && fromElemType instanceof Type.Int) {
					// Cast Constant.Integer to Constant.Decimal
					Iterator<Constant> iterator = ((Constant.List) from).values.iterator();
					while (iterator.hasNext()) {
						Constant value = iterator.next();
						values.add(castElement(value, fromElemType, toElemType));
					}
					return Constant.V_LIST(values);
				} else {
					internalFailure("Not implemented!", "ConvertInterpreter.java", null);
					return null;
				}
			}
		} else if (fromType instanceof Type.Strung) {
			// Cast Constant.Strung to Constant.List
			if (toElemType instanceof Type.Int) {
				// Cast char to int
				for (char c : ((Constant.Strung) from).value.toCharArray()) {
					values.add(Constant.V_INTEGER(BigInteger.valueOf((int) c)));
				}
				return Constant.V_LIST(values);
			} else {
				internalFailure("Not implemented!", "ConvertInterpreter.java", null);
				return null;
			}
		} else if (fromType instanceof Type.UnionOfLists) {
			return (Constant.List) from;
		} else {
			internalFailure("Not implemented!", "ConvertInterpreter.java", null);
			return null;
		}

	}

	private Constant.Record toConstantRecord(Constant from, Type fromType, Type toType) {
		Type fromElemType, toElemType;

		Collection<Type> fromTypeValues = ((Type.Record) fromType).fields().values();
		Type[] fromElemTypes = fromTypeValues.toArray(new Type[fromTypeValues.size()]);
		Collection<Type> toElemTypeValues = ((Type.Record) toType).fields().values();
		Type[] toElemTypes = toElemTypeValues.toArray(new Type[toElemTypeValues.size()]);
		Constant.Record record = (Constant.Record) from;

		Map<String, Constant> map = new HashMap<String, Constant>();
		Iterator<Entry<String, Constant>> iterator = record.values.entrySet().iterator();
		int index = 0;
		while (iterator.hasNext()) {
			Entry<String, Constant> entry = iterator.next();
			fromElemType = fromElemTypes[index];
			toElemType = toElemTypes[index];
			Constant value = entry.getValue();
			map.put(entry.getKey(), castElement(value, fromElemType, toElemType));
			index++;
		}

		return Constant.V_RECORD(map);

	}

	/**
	 * Convert a Constant object to a Constant.Map
	 * 
	 * @param from
	 * @param fromType
	 * @param toType
	 * @return
	 */
	private Constant.Map toConstantMap(Constant from, Type fromType, Type toType) {
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

	private Constant.Set toConstantSet(Constant constant, Type fromType, Type toType) {
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
			values.add(castElement(next, fromElemType, toElemType));
		}

		return Constant.V_SET(values);
	}

	private Constant.Integer toConstantInt(Constant constant, Type fromType, Type toType) {
		if (fromType instanceof Type.List) {
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

	private Constant.Decimal toConstantDecimal(Constant constant, Type fromType, Type toType) {
		if (fromType instanceof Type.Int) {
			return Constant.V_DECIMAL(new BigDecimal(((Constant.Integer) constant).value.toString()));
		} else if (fromType instanceof Type.Real) {
			return Constant.V_DECIMAL(((Constant.Decimal)constant).value);
		} else if (fromType instanceof Type.Union){
			if(constant instanceof Constant.Integer){
				return Constant.V_DECIMAL(BigDecimal.valueOf(((Constant.Integer)constant).value.longValue()));
			}else if(constant instanceof Constant.Char){
				char value = ((Constant.Char)constant).value;
				return Constant.V_DECIMAL(BigDecimal.valueOf((int)value));
			}else{
				return (Constant.Decimal) constant;
			}
		} else {
			internalFailure("Not implemented!", "ConvertInterpreter.java", null);
			return null;
		}
	}

	private Constant toConstantNegation(Constant constant, Type fromType, Type toType) {
		Type elemType = ((Type.Negation)toType).element();
		if (fromType instanceof Type.Int) {
			Constant.Integer integer = (Constant.Integer) constant;
			return Constant.V_INTEGER(new BigInteger(integer.value.toString()));
		} else if (fromType instanceof Type.Real) {
			internalFailure("Not implemented!", "ConvertInterpreter.java", null);
			return null;
		} else if (fromType instanceof Type.Strung){
			Constant.Strung strung = (Constant.Strung)constant;
			return strung;
		}else {	
			internalFailure("Not implemented!", "ConvertInterpreter.java", null);
			return null;
		}
	}

	private Constant.Tuple toConstantTuple(Constant constant, Type fromType, Type toType) {
		Constant.Tuple tuple = (Constant.Tuple) constant;
		ArrayList<Constant> values = new ArrayList<Constant>();
		int index = 0;
		for (Constant value : tuple.values) {
			if (fromType instanceof Type.Tuple) {
				values.add(castElement(value, ((Type.Tuple) fromType).element(index),
						((Type.Tuple) toType).element(index)));
			} else if (fromType instanceof Type.UnionOfTuples) {
				values.add(castElement(value, ((Type.UnionOfTuples) fromType).element(index),
						((Type.Tuple) toType).element(index)));
			} else {
				internalFailure("Not implemented!", "ConvertInterpreter.java", null);
				return null;
			}

		}
		return Constant.V_TUPLE(values);

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
		if (toType instanceof Type.Any) {
			if(constant instanceof DecimalFraction){
				//Cast to a string
				return Constant.V_STRING(constant.toString());
			}else if(constant instanceof Constant.Decimal){
				Constant.Decimal decimal = (Constant.Decimal) constant;
				if(decimal.value.signum() == -1){
					return Constant.V_STRING(DecimalFraction.V_DecimalFraction(decimal).toString());
				}else{
					return Constant.V_STRING(decimal.value.doubleValue()+"");
				}				
			}else{
				// No needs to convert the type of the operand.
				return constant;
			}			
		} else if (toType instanceof Type.Char) {
			// Cast ascii to Char
			return Constant.V_CHAR((char) (((Constant.Integer) constant).value.intValue()));
		} else if (toType instanceof Type.Int) {
			return toConstantInt(constant, fromType, toType);
		} else if (toType instanceof Type.List) {
			return toConstantList(constant, fromType, toType);
		} else if (toType instanceof Type.Record) {
			return toConstantRecord(constant, fromType, toType);
		} else if (toType instanceof Type.Real) {
			return toConstantDecimal(constant, fromType, toType);
		} else if (toType instanceof Type.Map) {
			return toConstantMap(constant, fromType, toType);
		} else if (toType instanceof Type.Set) {
			return toConstantSet(constant, fromType, toType);
		} else if (toType instanceof Type.Tuple) {
			return toConstantTuple(constant, fromType, toType);
		} else if (toType instanceof Type.Negation) {
			return toConstantNegation(constant, fromType, toType);
		} else if (toType instanceof Type.Union) {
			if (toType instanceof Type.UnionOfCollections || toType instanceof Type.UnionOfMaps
					|| toType instanceof Type.UnionOfIndexibles || toType instanceof Type.UnionOfLists
					|| toType instanceof Type.Union) {
				return constant;
			} else {
				internalFailure("Not implemented!", "ConvertInterpreter.java", null);
				return null;
			}
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
