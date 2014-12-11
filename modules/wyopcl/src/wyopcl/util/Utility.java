package wyopcl.util;

import static wycc.lang.SyntaxError.internalFailure;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.TreeSet;

import wyil.lang.Constant;
import wyil.lang.Type;
import wyjc.runtime.WyList;
import wyjc.runtime.WyRat;
import wyopcl.interpreter.Closure;
import wyopcl.interpreter.DecimalFraction;

public final class Utility {

	private Utility(){
		//Utility class has the private constructor.
	}
	
	private static String constantToString(Constant.Map map, Class<?> paramType) {
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
		return r.replaceAll("\"", "");
	}
	/**
	 * Returns a string of a sorted Constant.Set, using tree set.
	 * @param set the Constant Set 
	 * @param paramType the given type
	 * @return
	 */
	private static String constantToString(Constant.Set set, Class<?> paramType) {
		// Sort the elements in a set, using the tree set.
		TreeSet<Constant> sorted = new TreeSet<Constant>(set.values);
		String r = "{";
		boolean firstTime = true;
		for (Constant constant: sorted) {
			if (!firstTime) {
				r += ", ";
			}
			firstTime = false;
			if(constant instanceof Constant.Char){
				r += "'"+convertConstantToJavaObject(constant, paramType)+"'";
			}else{
				r += convertConstantToJavaObject(constant, paramType);
			}
			
		}
		r += "}";
		return r.replaceAll("\"", "");
	}

	private static String constantToString(Constant.List list, Class<?> paramType) {
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
		return r.replaceAll("\"", "");
	}

	private static String constantToString(Constant.Record record, Class<?> paramType) {
		String r = "{";
		boolean firstTime = true;
		ArrayList<String> keys = new ArrayList<String>(record.values.keySet());
		Collections.sort(keys);
		for (String key : keys) {
			if (!firstTime) {
				r += ",";
			}
			firstTime = false;
			Constant next = record.values.get(key);
			if (next instanceof Constant.Record || next instanceof Constant.List) {
				// Convert the key record into a string
				r += key + ":" + convertConstantToJavaObject(next, paramType);
			} else {
				r += key + ":" + next;
			}

		}
		r += "}";
		return r;
		//return r.replaceAll("\"", "");
	}

	private static String constantToString(Constant.Tuple tuple, Class<?> paramType) {
		String r = "(";
		boolean firstTime = true;
		for (Constant constant : tuple.values) {
			if (!firstTime) {
				r += ",";
			}
			firstTime = false;
			r += convertConstantToJavaObject(constant, paramType);
		}
		r += ")";

		return r.replaceAll("\"", "");
	}

	/**
	 * Convert the Constant object to the Java Object of given type.
	 * 
	 * @param constant the Constant 
	 * @param paramType the given Java type
	 * @return the Java object
	 */
	@SuppressWarnings("unchecked")
	public static Object convertConstantToJavaObject(Constant constant, Class<?> paramType) {

		if (constant == null || constant instanceof Constant.Null) {
			return null;
		}
		
		if (constant instanceof Constant.Bool) {
			return ((Constant.Bool) constant).value;
		} 
		
		if (constant instanceof Constant.Char) {
			return ((Constant.Char) constant).value;
		}
		
		if (constant instanceof Constant.Strung) {
			//Add the double quotas to the return string.
			return ((Constant.Strung) constant).value;
		}
		
		if (constant instanceof Constant.Byte) {
			if (paramType.equals(BigInteger.class)) {
				return ((Constant.Byte) constant).value;
			} else if (paramType.equals(WyList.class)) {
				// Cast byte to char...too complicated....
				WyList wyList = new WyList();
				wyList.add(((Constant.Byte) constant).value);
				return wyList;
			} else {
				return ((Constant.Byte) constant).value;
			}
		}
		
		
		if (constant instanceof Constant.Decimal) {
			//Check if the returned type is WyRat
			if(paramType.equals(WyRat.class)){	
				Constant.Decimal decimal = (Constant.Decimal)constant;
				return new WyRat(decimal.value);
			}			
			return (Constant.Decimal) constant;			
		}
		
		if (constant instanceof DecimalFraction){
			//return the string of a DecimalFraction.
			return ((DecimalFraction)constant).toString();
		}
		
		if (constant instanceof Constant.Integer) {
			//Check if the returned type is WyRat
			if(paramType.equals(WyRat.class)){	
				Constant.Integer integer = (Constant.Integer)constant;
				return new WyRat(integer.value);
			}			
			return ((Constant.Integer) constant).value;
		}
		
		if (constant instanceof Constant.List) {
			if (paramType.equals(WyList.class)) {
				Constant.List list = (Constant.List) constant;
				WyList wylist = new WyList();
				for(Constant value: list.values){
					wylist.add(((Constant.Byte)value).value);
				}
				return wylist;
			}else{
				return constantToString((Constant.List) constant, paramType);
			}
		}
		
		if (constant instanceof Constant.Map) {
			return constantToString((Constant.Map) constant, paramType);
		}
		
		if (constant instanceof Constant.Record) {
			return constantToString((Constant.Record) constant, paramType);
		}
		
		if (constant instanceof Constant.Set) {
			return constantToString((Constant.Set) constant, paramType);
		}		
		
		if (constant instanceof Constant.Tuple) {
			return constantToString((Constant.Tuple) constant, paramType);
		} 
		
		
		internalFailure("Not implemented!", "Converter.java", null);
		return null;
		

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
	 * @param constant
	 * @return
	 */
	public static Constant copyConstant(Constant constant) {
		if(constant == null || constant instanceof Constant.Null){
			return Constant.V_NULL;
		}
		
		if (constant instanceof Constant.Integer) {
			return Constant.V_INTEGER(((Constant.Integer) constant).value);
		} else if (constant instanceof Constant.List) {			
			ArrayList<Constant> values = ((Constant.List) constant).values;			
			return Constant.V_LIST(new ArrayList<Constant>(values));
		} else if (constant instanceof Constant.Record) {
			return Constant.V_RECORD(((Constant.Record) constant).values);
		} else if (constant instanceof Constant.Strung) {
			return Constant.V_STRING(((Constant.Strung) constant).value);
		} else if (constant instanceof Constant.Set) {
			return Constant.V_SET(((Constant.Set) constant).values);
		} else if (constant instanceof Constant.Type) {
			return Constant.V_TYPE(((Constant.Type) constant).type);
		} else if (constant instanceof Constant.Bool) {
			return Constant.V_BOOL(((Constant.Bool) constant).value);
		} else if (constant instanceof Constant.Map) {
			return Constant.V_MAP(((Constant.Map) constant).values);
		} else if (constant instanceof Constant.Byte) {
			return Constant.V_BYTE(((Constant.Byte) constant).value);
		} else if (constant instanceof Constant.Char) {
			return Constant.V_CHAR(((Constant.Char) constant).value);
		} else if (constant instanceof Constant.Decimal) {
			return Constant.V_DECIMAL(((Constant.Decimal) constant).value);
		} else if (constant instanceof Constant.Tuple) {
			return Constant.V_TUPLE(((Constant.Tuple) constant).values);
		} else if (constant instanceof Closure){
			Closure closure = (Closure)constant;
			return Closure.V_Closure(closure.lambda, closure.params, closure.type);
		} else {
			internalFailure("Not implemented!", "Utility.java", null);
			return null;
		}

	}

}
