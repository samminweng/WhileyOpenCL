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
				for(Constant elem : list.values) {
					if(!firstTime) {
						r += ", ";
					}
					firstTime=false;
					//Check if the elem is a list
					if(elem instanceof Constant.List || elem instanceof Constant.Record){
						r += convertConstantToJavaObject(elem, paramType);
					}else {
						r += elem;
					}
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
					Constant constant = record.values.get(key);
					if(constant instanceof Constant.Record || constant instanceof Constant.List){
						//Convert the key record into a string
						r+= convertConstantToJavaObject(constant, paramType);
					}else{
						r += key + ":" + constant;
					}
					
				}
				r += "}";
				to = r;
			} else if (from instanceof Constant.Char) {
				to = ((Constant.Char) from).value;
			} else if (from instanceof Constant.Byte) {
				if (paramType.equals(BigInteger.class)) {					
					to = ((Constant.Byte)from).value;
				} else if (paramType.equals(WyList.class)){
					// Cast byte to char...too complicated....
					WyList wyList = new WyList();
					wyList.add(((Constant.Byte) from).value);
					to = wyList;
				}else {
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
