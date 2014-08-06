package wyopcl.interpreter;

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

import whiley.lang.Char;
import whiley.lang.Real;
import wyil.lang.Constant;
import wyil.lang.Type;
import wyjc.runtime.WyList;

public class Converter {

	/**
	 * Convert the Constant object to Java Object.
	 * 
	 * @param from
	 * @param paramType
	 * @return
	 */
	public static Object convertConstantToJavaObject(Constant from, Class<?> paramType) {
		Object to = null;
		if (from instanceof Constant.Strung) {
			to = ((Constant.Strung) from).value.replaceAll("\"", "");
		} else if (from instanceof Constant.Integer) {
			to = ((Constant.Integer) from).value;
		} else if (from instanceof Constant.List) {
			to = (Constant.List) from;
		} else if (from instanceof Constant.Record) {
			to = (Constant.Record) from;
		} else if (from instanceof Constant.Char) {
			to = ((Constant.Char) from).value;
		} else if (from instanceof Constant.Byte) {
			if(paramType == WyList.class){
				//Cast byte to char...too complicated....
				WyList wylist = new WyList();
				Byte b = (byte)((Constant.Byte) from).value;
				wylist.add(b);
				to = wylist;
			}else{
				to = ((Constant.Byte) from).value;
			}
			
		
		} else if (from instanceof Constant.Bool) {
			to = ((Constant.Bool) from).value;
		} else if (from instanceof Constant.Decimal) {
			// to = ((Constant.Decimal)from).value;
			to = new BigDecimal(((Constant.Decimal) from).value.toString());
		} else {
			internalFailure("Not implemented!", "Converter.java", null);
		}

		// return to;
		return to;
	}

	/***
	 * Convert the Java object to Constant object.
	 * 
	 * @param from
	 * @param toType
	 * @return
	 */
	public static Constant convertJavaObjectToConstant(Object from, Class<?> fromType,
			wyil.lang.Type toType) {
		Constant to = null;
		if (toType instanceof Type.Strung) {
			if (from instanceof BigDecimal) {
				to = Constant.V_STRING(((BigDecimal) from).toPlainString());
			} else {
				to = Constant.V_STRING(from.toString());
			}
		} else if (toType instanceof Type.Int) {
			to = Constant.V_INTEGER((BigInteger) from);
		} else if (toType instanceof Type.Byte){
			if(fromType == WyList.class){
				WyList wylist = (WyList)from;
				to = Constant.V_BYTE(new Byte((byte)wylist.get(0)));
			}else{
				to = Constant.V_BYTE(new Byte((byte)from));
			}
			
			
			
		} else {
			internalFailure("Not implemented!", "Converter.java", null);
		}


		return to;
	}

	private static Constant castElementToElement(Constant fromElem,
			Type fromElemType, Type toElemType) {
		Constant toElem = null;
		if (fromElemType == toElemType) {
			toElem = fromElem;
		} else {
			if (fromElemType instanceof Type.Real
					&& toElemType instanceof Type.Int) {
				Constant.Decimal value = (Constant.Decimal) fromElem;
				toElem = Constant.V_INTEGER(new BigInteger(value.toString()));
			} else if (fromElemType instanceof Type.Int
					&& toElemType instanceof Type.Real) {
				Constant.Integer value = (Constant.Integer) fromElem;
				toElem = Constant.V_DECIMAL(new BigDecimal(value.toString()));
			}
		}

		return toElem;
	}

	/***
	 * Cast Constant object to Constant object.
	 * 
	 * @param from
	 * @param toType
	 * @return
	 */
	public static Constant castConstanttoConstant(Constant from,
			wyil.lang.Type fromType, wyil.lang.Type toType) {
		Constant to = null;
		Type fromElemType;
		Type toElemType;
		if (toType instanceof Type.Any) {
			// No needs to convert the type of the operand.
			to = (Constant) from;
		} else if (toType instanceof Type.Char){
			Constant.Integer i = (Constant.Integer)from;
			//Cast Int to Char
			char c = (char)('0'+ (i.value.intValue()-32));
			to = Constant.V_CHAR(c);
		} else if (toType instanceof Type.Int) {
			if (fromType instanceof Type.List) {
				Constant.List value = (Constant.List) from;
				to = value.values.get(0);
			} else {
				internalFailure("Not implemented!", "Converter.java", null);
			}
			/************************Type.List*************************/
		} else if (toType instanceof Type.List) {
			fromElemType = ((Type.List) fromType).element();
			toElemType = ((Type.List) toType).element();
			// Cast List<Constant.Integer> to List<Constant.Decimal>
			if (toElemType instanceof Type.Real
					&& fromElemType instanceof Type.Int) {
				List<Constant> list = new ArrayList<Constant>();
				List<Constant> values = ((Constant.List) from).values;
				for (Constant value : values) {
					Constant Elem = castElementToElement(value, fromElemType,
							toElemType);
					list.add(Elem);
				}
				to = Constant.V_LIST(list);
			} else {
				to = (Constant.List) from;
			}
			/************************Type.Record*************************/
		} else if (toType instanceof Type.Record) {
			Collection<Type> fromTypeValues = ((Type.Record) fromType).fields()
					.values();
			Type[] fromElemTypes = fromTypeValues
					.toArray(new Type[fromTypeValues.size()]);
			Collection<Type> toElemTypeValues = ((Type.Record) toType).fields()
					.values();
			Type[] toElemTypes = toElemTypeValues
					.toArray(new Type[toElemTypeValues.size()]);
			Constant.Record record = (Constant.Record) from;

			Map<String, Constant> map = new HashMap<String, Constant>();
			Iterator<Entry<String, Constant>> iterator = record.values
					.entrySet().iterator();
			int index = 0;
			while (iterator.hasNext()) {
				Entry<String, Constant> entry = iterator.next();
				fromElemType = fromElemTypes[index];
				toElemType = toElemTypes[index];
				Constant value = entry.getValue();
				map.put(entry.getKey(),
						castElementToElement(value, fromElemType, toElemType));
				index++;
			}

			to = Constant.V_RECORD(map);

		} else if (toType instanceof Type.Real) {
			if (fromType instanceof Type.Int) {
				BigInteger value = ((Constant.Integer) from).value;
				to = Constant.V_DECIMAL(new BigDecimal(value.toString()));
			} else {
				to = (Constant.Decimal) from;
			}

		} else if (toType instanceof Type.Union) {
			// No conversion is done.
			to = from;
		} else {
			internalFailure("Not implemented!", "Converter.java", null);
		}

		return to;
	}

	public static Class<?> ConvertToClass(Type paramType) {
		if (paramType instanceof Type.Any) {
			return Object.class;
		} else if (paramType instanceof Type.Strung) {
			return String.class;
		} else if (paramType instanceof Type.Int) {
			return Integer.class;
		} else {
			internalFailure("Not implemented!", "Converter.java", null);
		}
		return null;

	}

	/**
	 * Copy and return the Constant object
	 * 
	 * @param value
	 * @return
	 */
	public static Constant copyConstant(Constant value) {
		Constant result = null;

		if (value instanceof Constant.Integer) {
			result = Constant.V_INTEGER(((Constant.Integer) value).value);
		} else if (value instanceof Constant.List) {
			result = Constant.V_LIST(((Constant.List) value).values);
		} else if (value instanceof Constant.Record) {
			result = Constant.V_RECORD(((Constant.Record) value).values);
		} else if (value instanceof Constant.Strung) {
			result = Constant.V_STRING(((Constant.Strung) value).value);
		} else if (value instanceof Constant.Set) {
			result = Constant.V_SET(((Constant.Set) value).values);
		} else if (value instanceof Constant.Type) {
			result = Constant.V_TYPE(((Constant.Type) value).type);
		} else if (value instanceof Constant.Bool) {
			result = Constant.V_BOOL(((Constant.Bool) value).value);
		} else if (value instanceof Constant.Map) {
			result = Constant.V_MAP(((Constant.Map) value).values);
		} else if (value instanceof Constant.Byte) {
			result = Constant.V_BYTE(((Constant.Byte) value).value);
		} else {
			internalFailure("Not implemented!", "Converter.java", null);
		}

		return result;

	}

}
