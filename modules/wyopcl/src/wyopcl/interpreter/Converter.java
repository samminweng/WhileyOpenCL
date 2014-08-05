package wyopcl.interpreter;

import static wycc.lang.SyntaxError.internalFailure;

import java.lang.reflect.TypeVariable;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Collection;

import wyil.lang.Constant;
import wyil.lang.Type;

public class Converter {
	
	/**
	 * Convert the Constant object to Java Object.
	 * @param from
	 * @param paramType
	 * @return
	 */
	public static Object convertToObject(Constant from, Class<?> paramType){
		Object to = null;
		if(from instanceof Constant.Strung){
			to = ((Constant.Strung)from).value.replaceAll("\"", "");
		}else if(from instanceof Constant.Integer){
			to = ((Constant.Integer)from).value;
		}else if (from instanceof Constant.List){
			to = (Constant.List)from;
		}else if (from instanceof Constant.Record){
			to = (Constant.Record)from;
		}else if (from instanceof Constant.Char){
			to = ((Constant.Char)from).value;
		}else if(from instanceof Constant.Byte){
			to = ((Constant.Byte)from).value;
		}else{
			internalFailure("Not implemented!", "Converter.java", null);
		}

		//return to;
		return paramType.cast(to);
	}	
	
	/***
	 * Convert the Java object to Constant object.
	 * @param from
	 * @param assignedType
	 * @return
	 */
	public static Constant convertToConstant(Object from, wyil.lang.Type assignedType){
		Constant to = null;

		if(assignedType instanceof Type.Strung){
			to = Constant.V_STRING(from.toString());
		}else if (assignedType instanceof Type.Int){
			to = Constant.V_INTEGER((BigInteger)from);
		}else{
			internalFailure("Not implemented!", "Converter.java", null);
		}

		return to;
	}

	/***
	 * Convert Constant object to Constant object.
	 * @param from
	 * @param resultType
	 * @return
	 */
	public static Constant convertToConstant(Constant from, wyil.lang.Type assignedType, wyil.lang.Type resultType){
		Constant to = null;

		if (resultType instanceof Type.Any) {
			//No needs to convert the type of the operand.
			to = (Constant) from;
		}else if (resultType instanceof Type.Int){
			if(assignedType instanceof Type.List){
				Constant.List value = (Constant.List)from;
				to = value.values.get(0);
			}else{
				internalFailure("Not implemented!", "Converter.java", null);
			}
			
		} else if (resultType instanceof Type.List){
			to = (Constant.List) from;
		} else if (resultType instanceof Type.Record){
			to = (Constant.Record) from;
		}else if (resultType instanceof Type.Real){
			//to =  from.;
			internalFailure("Not implemented!", "Converter.java", null);
		}else if (resultType instanceof Type.Union){
			//No conversion is done. 
			to = from;
		}else{
			internalFailure("Not implemented!", "Converter.java", null);
		}

		return to;
	}

	public static Class<?> ConvertToClass(Type paramType){
		if(paramType instanceof Type.Any){
			return Object.class;
		}else if(paramType instanceof Type.Strung){
			return String.class;
		}else if(paramType instanceof Type.Int){
			return Integer.class;
		} else{
			internalFailure("Not implemented!", "Converter.java", null);
		}
		return null;
		
	}
	
	/**
	 * Copy and return the Constant object 
	 * @param value
	 * @return
	 */
	public static Constant copyConstant(Constant value){
		Constant result = null;
		
		if (value instanceof Constant.Integer){
			result = Constant.V_INTEGER(((Constant.Integer) value).value);
		}else if(value instanceof Constant.List){
			result = Constant.V_LIST(((Constant.List)value).values);
		}else if (value instanceof Constant.Record){
			result = Constant.V_RECORD(((Constant.Record)value).values);
		}else if (value instanceof Constant.Strung){
			result = Constant.V_STRING(((Constant.Strung)value).value);
		}else if (value instanceof Constant.Set){
			result = Constant.V_SET(((Constant.Set)value).values);
		}else if (value instanceof Constant.Type){
			result = Constant.V_TYPE(((Constant.Type)value).type);
		}else if (value instanceof Constant.Bool){
			result = Constant.V_BOOL(((Constant.Bool)value).value);
		}else if (value instanceof Constant.Map){
			result = Constant.V_MAP(((Constant.Map)value).values);
		}else if (value instanceof Constant.Byte){
			result = Constant.V_BYTE(((Constant.Byte)value).value);
		}else {
			internalFailure("Not implemented!", "Converter.java", null);
		}		
		
		return result;
		
		
		
	}
	
}
