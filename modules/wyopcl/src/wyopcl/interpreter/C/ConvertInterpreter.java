package wyopcl.interpreter.C;

import static wycc.lang.SyntaxError.internalFailure;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import wyil.lang.Codes;
import wyil.lang.Constant;
import wyil.lang.Type;
import wyopcl.interpreter.Converter;
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

	private Constant castElementToElement(Constant fromElem, Type fromElemType, Type toElemType) {
		Constant toElem = null;
		if (fromElemType == toElemType) {
			toElem = fromElem;
		} else {
			if (fromElemType instanceof Type.Real && toElemType instanceof Type.Int) {
				Constant.Decimal value = (Constant.Decimal) fromElem;
				toElem = Constant.V_INTEGER(new BigInteger(value.toString()));
			} else if (fromElemType instanceof Type.Int && toElemType instanceof Type.Real) {
				Constant.Integer value = (Constant.Integer) fromElem;
				toElem = Constant.V_DECIMAL(new BigDecimal(value.toString()));
			}
		}

		return toElem;
	}

	private Constant.List toConstantList(Constant from, Type fromType, Type toType) {
		Constant.List to = null;
		Type fromElemType, toElemType;
		toElemType = ((Type.List) toType).element();
		if (fromType instanceof Type.List) {
			fromElemType = ((Type.List) fromType).element();
			// Cast List<Constant.Integer> to List<Constant.Decimal>
			if (toElemType instanceof Type.Real && fromElemType instanceof Type.Int) {
				List<Constant> list = new ArrayList<Constant>();
				for (Constant value : ((Constant.List) from).values) {
					list.add(castElementToElement(value, fromElemType, toElemType));
				}
				to = Constant.V_LIST(list);
			} else {
				to = (Constant.List) from;
			}
		} else if (fromType instanceof Type.Strung) {
			// Cast Constant.Strung to Constant.List
			if (toElemType instanceof Type.Int) {
				// Cast char to int
				char[] chars = ((Constant.Strung) from).value.toCharArray();
				List<Constant> values = new ArrayList<Constant>();
				for (char c : chars) {
					values.add(Constant.V_INTEGER(BigInteger.valueOf((int) c)));
				}
				to = Constant.V_LIST(values);
			} else {
				internalFailure("Not implemented!", "ConvertInterpreter.java", null);
			}
		} else {
			internalFailure("Not implemented!", "ConvertInterpreter.java", null);
		}

		return to;
	}

	private Constant.Record toConstantRecord(Constant from, Type fromType, Type toType) {
		Constant.Record to = null;
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
			map.put(entry.getKey(), castElementToElement(value, fromElemType, toElemType));
			index++;
		}

		to = Constant.V_RECORD(map);

		return to;

	}

	private Constant.Map toConstantMap(Constant from, Type fromType, Type toType){
		Constant.Map to = null;
		Type fromElemType, toElemType, toElemKeyType, toElemValueType;
		
		if(fromType instanceof Type.List){
			Constant.List list = (Constant.List)from;
			fromElemType = list.values.get(0).type();
			toElemType = ((Type.Map)toType).element();
			toElemKeyType = ((Type.Map)toType).key();
			toElemValueType = ((Type.Map)toType).value();
			if(fromElemType instanceof Type.Real && toElemType instanceof Type.Tuple){
				Map<Constant, Constant> map = new HashMap<Constant, Constant>();				
				int index = 0;
				for(Constant value :list.values){
					map.put(Constant.V_INTEGER(BigInteger.valueOf(index)), (Constant.Decimal)value);
					index++;
				}
				
				to = Constant.V_MAP(map);
				
			}else{
				internalFailure("Not implemented!", "ConvertInterpreter.java", null);
			}
			
			
		}else{
			internalFailure("Not implemented!", "ConvertInterpreter.java", null);
		}
		
		
		
		return to;
		
		
	}
	
	
	
	/***
	 * Cast Constant object to Constant object.
	 * 
	 * @param from
	 * @param toType
	 * @return
	 */
	public Constant castConstanttoConstant(Constant from, wyil.lang.Type fromType, wyil.lang.Type toType) {
		Constant to = null;
		if (toType instanceof Type.Any) {
			// No needs to convert the type of the operand.
			to = (Constant) from;
		} else if (toType instanceof Type.Char) {
			// Cast ascii to Char
			to = Constant.V_CHAR((char) (((Constant.Integer) from).value.intValue()));
		} else if (toType instanceof Type.Int) {
			if (fromType instanceof Type.List) {
				to = ((Constant.List) from).values.get(0);
			} else if (fromType instanceof Type.Char) {
				// Cast Char to int
				to = Constant.V_INTEGER(BigInteger.valueOf((int) (((Constant.Char) from).value)));
			} else {
				internalFailure("Not implemented!", "ConvertInterpreter.java", null);
			}
			/************************ Type.List *************************/
		} else if (toType instanceof Type.List) {
			to = toConstantList(from, fromType, toType);
			;
			/************************ Type.Record *************************/
		} else if (toType instanceof Type.Record) {
			to = toConstantRecord(from, fromType, toType);

		} else if (toType instanceof Type.Real) {
			if (fromType instanceof Type.Int) {
				to = Constant.V_DECIMAL(new BigDecimal(((Constant.Integer) from).value.toString()));
			} else {
				to = (Constant.Decimal) from;
			}

		} else if (toType instanceof Type.Union) {
			// No conversion is done.
			to = from;
		} else if (toType instanceof Type.Map) {
			to = toConstantMap(from, fromType, toType);
		} else {
			internalFailure("Not implemented!", "ConvertInterpreter.java", null);
		}

		return to;
	}

	public void interpret(Codes.Convert code, StackFrame stackframe) {
		int linenumber = stackframe.getLine();
		// Read a value from the operand register.
		Constant value = stackframe.getRegister(code.operand(0));
		// Convert it to the given type.
		Type assignedType = code.assignedType();
		Type resultType = code.result;
		Constant result = castConstanttoConstant(value, assignedType, resultType);
		stackframe.setRegister(code.target(), result);
		printMessage(stackframe, code.toString(), "%" + code.target() + "(" + result + ")");
		stackframe.setLine(++linenumber);
	}

}
