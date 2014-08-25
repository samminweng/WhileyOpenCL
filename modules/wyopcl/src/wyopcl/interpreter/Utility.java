package wyopcl.interpreter;

import static wycc.lang.SyntaxError.internalFailure;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.math.MathContext;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.TreeSet;

import whiley.lang.Char;
import whiley.lang.Real;
import wyil.lang.Constant;
import wyil.lang.Type;
import wyjc.runtime.WyList;

public class Utility {

	/**
	 * Convert the Constant object to Java Object.
	 * 
	 * @param from
	 * @param paramType
	 * @return
	 */
	public static Object convertConstantToJavaObject(Constant from, Class<?> paramType) {
		if (from == null) {
			return null;
		}

		if (from instanceof Constant.Strung) {
			return ((Constant.Strung) from).value.replaceAll("\"", "");
		} else if (from instanceof Constant.Integer) {
			return ((Constant.Integer) from).value;
		} else if (from instanceof Constant.List) {
			Constant.List list = (Constant.List) from;
			String r = "[";
			boolean firstTime = true;
			for (Constant elem : list.values) {
				if (!firstTime) {
					r += ", ";
				}
				firstTime = false;
				// Check if the elem is a list
				if (elem instanceof Constant.List || elem instanceof Constant.Record) {
					r += convertConstantToJavaObject(elem, paramType);
				} else {
					r += elem;
				}
			}
			r += "]";
			return r;
		} else if (from instanceof Constant.Record) {
			Constant.Record record = (Constant.Record) from;
			String r = "{";
			boolean firstTime = true;
			ArrayList<String> keys = new ArrayList<String>(record.values.keySet());
			Collections.sort(keys);
			for (String key : keys) {
				if (!firstTime) {
					r += ",";
				}
				firstTime = false;
				Constant constant = record.values.get(key);
				if (constant instanceof Constant.Record || constant instanceof Constant.List) {
					// Convert the key record into a string
					r += key + ":" + convertConstantToJavaObject(constant, paramType);
				} else {
					r += key + ":" + constant;
				}

			}
			r += "}";
			return r;
		} else if (from instanceof Constant.Char) {
			return ((Constant.Char) from).toString();
		} else if (from instanceof Constant.Byte) {
			if (paramType.equals(BigInteger.class)) {
				return ((Constant.Byte) from).value;
			} else if (paramType.equals(WyList.class)) {
				// Cast byte to char...too complicated....
				WyList wyList = new WyList();
				wyList.add(((Constant.Byte) from).value);
				return wyList;
			} else {
				return ((Constant.Byte) from).value;
			}
		} else if (from instanceof Constant.Bool) {
			return ((Constant.Bool) from).value;
		} else if (from instanceof Constant.Decimal) {
			Constant.Decimal decimal = (Constant.Decimal) from;
			if (decimal.value.signum() == -1) {
				// Converts the negative decimal to a decimal fraction;
				DecimalFraction fraction = new DecimalFraction(decimal.value);
				return fraction.toString();
			} else {
				return decimal;
			}
		} else if (from instanceof Constant.Map) {
			Constant.Map map = (Constant.Map) from;
			String r = "{";
			if (map.values.isEmpty()) {
				r = r + "=>";
			} else {
				boolean firstTime = true;
				ArrayList<String> keystr = new ArrayList<String>();
				HashMap<String, Constant> keymap = new HashMap<String, Constant>();
				for (Constant key : map.values.keySet()) {
					keystr.add(key.toString());
					keymap.put(key.toString(), key);
				}
				Collections.sort(keystr);
				for (String key : keystr) {
					if (!firstTime) {
						r += ", ";
					}
					firstTime = false;
					Constant k = keymap.get(key);
					r += k + "=>" + convertConstantToJavaObject(map.values.get(k), paramType);
				}
			}
			r += "}";
			return r;
		} else if (from instanceof Constant.Set) {
			Constant.Set set = (Constant.Set) from;
			// Sort the elements in a set, using the tree set.
			TreeSet<Constant> sorted = new TreeSet<Constant>(set.values);
			String r = "{";
			boolean firstTime = true;
			Iterator<Constant> iterator = sorted.iterator();
			while (iterator.hasNext()) {
				Constant constant = iterator.next();
				if (!firstTime) {
					r += ", ";
				}
				firstTime = false;
				r += convertConstantToJavaObject(constant, paramType);
			}
			return r + "}";
		} else if (from instanceof Constant.Null) {
			return null;
		} else {
			internalFailure("Not implemented!", "Converter.java", null);
			return null;
		}

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
		} else if (value instanceof Constant.Char) {
			result = Constant.V_CHAR(((Constant.Char) value).value);
		} else if (value instanceof Constant.Decimal) {
			result = Constant.V_DECIMAL(((Constant.Decimal) value).value);
		} else {
			internalFailure("Not implemented!", "Converter.java", null);
		}

		return result;

	}

}
