package wyopcl.interpreter;

import static wycc.lang.SyntaxError.internalFailure;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
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
		if(from == null){
			return null;
		}else {
			if (from instanceof Constant.Strung) {
				to = ((Constant.Strung) from).value.replaceAll("\"", "");
			} else if (from instanceof Constant.Integer) {
				to = ((Constant.Integer) from).value;
			} else if (from instanceof Constant.List) {
				Constant.List list = (Constant.List) from;
				String r = "[";
				boolean firstTime=true;
				for(Constant v : list.values) {
					if(!firstTime) {
						r += ", ";
					}
					firstTime=false;
					r += v;
				}
				r+= "]";
				to = r;				
			} else if (from instanceof Constant.Record) {
				Constant.Record record = (Constant.Record) from;
				String r = "{";
				boolean firstTime=true;
				ArrayList<String> keys = new ArrayList<String>(record.values.keySet());
				Collections.sort(keys);
				for(String key : keys) {
					if(!firstTime) {
						r += ",";
					}
					firstTime=false;
					r += key + ":" + record.values.get(key);
				}
				r += "}";
				to = r;
			} else if (from instanceof Constant.Char) {
				to = ((Constant.Char) from).value;
			} else if (from instanceof Constant.Byte) {
				if (paramType == WyList.class) {
					// Cast byte to char...too complicated....
					to = new WyList().add((byte) ((Constant.Byte) from).value);
				} else {
					to = ((Constant.Byte) from).value;
				}
			} else if (from instanceof Constant.Bool) {
				to = ((Constant.Bool) from).value;
			} else if (from instanceof Constant.Decimal) {				
				to = from;
			} else if (from instanceof Constant.Map){
				Constant.Map map = (Constant.Map)from;
				String r = "{";
				if(map.values.isEmpty()) {
					r = r + "=>";
				} else {
					boolean firstTime=true;
					ArrayList<String> keystr = new ArrayList<String>();
					HashMap<String,Constant> keymap = new HashMap<String,Constant>();
					for(Constant key : map.values.keySet()) {
						keystr.add(key.toString());
						keymap.put(key.toString(), key);
					}
					Collections.sort(keystr);
					for(String key : keystr) {
						if(!firstTime) {
							r += ", ";
						}
						firstTime=false;
						Constant k = keymap.get(key); 
						r += k + "=>" + convertConstantToJavaObject(map.values.get(k), paramType);
					}
				}
				r += "}";
				to = r;
			} else if (from instanceof Constant.Set){
				//to = ((Constant.Set)from).values;
				Constant.Set set = (Constant.Set)from;
				String r = "{";
				boolean firstTime=true;
				for(Constant v : set.values) {
					if(!firstTime) {
						r += ",";
					}
					firstTime=false;
					r += v;
				}
				return r + "}";
				
			} else if (from instanceof Constant.Null){
				to = null;
			} else {
				internalFailure("Not implemented!", "Converter.java", null);
			}
		}
		return to;
	}

	/***
	 * Convert the Java object to Constant object.
	 * 
	 * @param from
	 * @param toType
	 * @return
	 */
	public static Constant convertJavaObjectToConstant(Object from, Class<?> fromType, wyil.lang.Type toType) {
		Constant to = null;
		if (toType instanceof Type.Strung) {
			if (from instanceof BigDecimal) {
				to = Constant.V_STRING(((BigDecimal) from).toPlainString());
			} else {
				to = Constant.V_STRING(from.toString());
			}
		} else if (toType instanceof Type.Int) {
			to = Constant.V_INTEGER((BigInteger) from);
		} else if (toType instanceof Type.Byte) {
			if (fromType == WyList.class) {
				WyList wylist = (WyList) from;
				to = Constant.V_BYTE(new Byte((byte) wylist.get(0)));
			} else {
				to = Constant.V_BYTE(new Byte((byte) from));
			}

		} else {
			internalFailure("Not implemented!", "Converter.java", null);
		}

		return to;
	}

	/*
	 * private static Constant castElementToElement(Constant fromElem, Type
	 * fromElemType, Type toElemType) { Constant toElem = null; if (fromElemType
	 * == toElemType) { toElem = fromElem; } else { if (fromElemType instanceof
	 * Type.Real && toElemType instanceof Type.Int) { Constant.Decimal value =
	 * (Constant.Decimal) fromElem; toElem = Constant.V_INTEGER(new
	 * BigInteger(value.toString())); } else if (fromElemType instanceof
	 * Type.Int && toElemType instanceof Type.Real) { Constant.Integer value =
	 * (Constant.Integer) fromElem; toElem = Constant.V_DECIMAL(new
	 * BigDecimal(value.toString())); } }
	 * 
	 * return toElem; }
	 */
	/***
	 * Cast Constant object to Constant object.
	 * 
	 * @param from
	 * @param toType
	 * @return
	 */
	/*
	 * public static Constant castConstanttoConstant(Constant from,
	 * wyil.lang.Type fromType, wyil.lang.Type toType) { Constant to = null;
	 * Type fromElemType; Type toElemType; if (toType instanceof Type.Any) { //
	 * No needs to convert the type of the operand. to = (Constant) from; } else
	 * if (toType instanceof Type.Char){ Constant.Integer i =
	 * (Constant.Integer)from; //Cast Int to Char char c = (char)('0'+
	 * i.value.intValue()); to = Constant.V_CHAR(c); } else if (toType
	 * instanceof Type.Int) { if (fromType instanceof Type.List) { Constant.List
	 * value = (Constant.List) from; to = value.values.get(0); }else if
	 * (fromType instanceof Type.Char){ Constant.Char value =
	 * (Constant.Char)from; //Cast Char to int int i = (int)(value.value); to =
	 * Constant.V_INTEGER(BigInteger.valueOf(i));
	 * 
	 * }else { internalFailure("Not implemented!", "Converter.java", null); }
	 *//************************ Type.List *************************/
	/*
	 * } else if (toType instanceof Type.List) { toElemType = ((Type.List)
	 * toType).element(); if(fromType instanceof Type.List){ fromElemType =
	 * ((Type.List) fromType).element(); // Cast List<Constant.Integer> to
	 * List<Constant.Decimal> if (toElemType instanceof Type.Real &&
	 * fromElemType instanceof Type.Int) { List<Constant> list = new
	 * ArrayList<Constant>(); List<Constant> values = ((Constant.List)
	 * from).values; for (Constant value : values) { Constant Elem =
	 * castElementToElement(value, fromElemType, toElemType); list.add(Elem); }
	 * to = Constant.V_LIST(list); } else { to = (Constant.List) from; } }else
	 * if(fromType instanceof Type.Strung){ //Cast Constant.Strung to
	 * Constant.List if(toElemType instanceof Type.Int){ //Cast char to int
	 * char[] chars = ((Constant.Strung)from).value.toCharArray();
	 * List<Constant> values = new ArrayList<Constant>(); for(char c : chars){
	 * BigInteger value = BigInteger.valueOf(Character.getNumericValue(c));
	 * values.add(Constant.V_INTEGER(value)); } to = Constant.V_LIST(values);
	 * }else{ internalFailure("Not implemented!", "Converter.java", null); }
	 * 
	 * 
	 * 
	 * }else{ internalFailure("Not implemented!", "Converter.java", null); }
	 *//************************ Type.Record *************************/
	/*
	 * } else if (toType instanceof Type.Record) { Collection<Type>
	 * fromTypeValues = ((Type.Record) fromType).fields() .values(); Type[]
	 * fromElemTypes = fromTypeValues .toArray(new Type[fromTypeValues.size()]);
	 * Collection<Type> toElemTypeValues = ((Type.Record) toType).fields()
	 * .values(); Type[] toElemTypes = toElemTypeValues .toArray(new
	 * Type[toElemTypeValues.size()]); Constant.Record record =
	 * (Constant.Record) from;
	 * 
	 * Map<String, Constant> map = new HashMap<String, Constant>();
	 * Iterator<Entry<String, Constant>> iterator = record.values
	 * .entrySet().iterator(); int index = 0; while (iterator.hasNext()) {
	 * Entry<String, Constant> entry = iterator.next(); fromElemType =
	 * fromElemTypes[index]; toElemType = toElemTypes[index]; Constant value =
	 * entry.getValue(); map.put(entry.getKey(), castElementToElement(value,
	 * fromElemType, toElemType)); index++; }
	 * 
	 * to = Constant.V_RECORD(map);
	 * 
	 * } else if (toType instanceof Type.Real) { if (fromType instanceof
	 * Type.Int) { BigInteger value = ((Constant.Integer) from).value; to =
	 * Constant.V_DECIMAL(new BigDecimal(value.toString())); } else { to =
	 * (Constant.Decimal) from; }
	 * 
	 * } else if (toType instanceof Type.Union) { // No conversion is done. to =
	 * from; } else { internalFailure("Not implemented!", "Converter.java",
	 * null); }
	 * 
	 * return to; }
	 */

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
		} else if (value instanceof Constant.Char) {
			result = Constant.V_CHAR(((Constant.Char) value).value);
		} else if (value instanceof Constant.Decimal){
			result = Constant.V_DECIMAL(((Constant.Decimal)value).value);
		} else {
			internalFailure("Not implemented!", "Converter.java", null);
		}

		return result;

	}

}
