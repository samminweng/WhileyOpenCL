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
			to = ((Constant.Strung)from).value;
		}else if(from instanceof Constant.Integer){
			to = ((Constant.Integer)from).value;
		}else if (from instanceof Constant.List){
			to = (Constant.List)from;
		}else if (from instanceof Constant.Record){
			to = (Constant.Record)from;
		}else{
			internalFailure("Not implemented!", "Converter.java", null);
		}

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
	public static Constant convertToConstant(Constant from, wyil.lang.Type resultType){
		Constant to = null;

		if (resultType instanceof Type.Any) {
			//No needs to convert the type of the operand.
			to = from;
		} else if (resultType instanceof Type.List){
			to = (Constant.List) from;
		} else if (resultType instanceof Type.Record){
			to = (Constant.Record) from;
		}else if (resultType instanceof Type.Real){
			//to =  from.;
			internalFailure("Not implemented!", "Converter.java", null);
		} else{
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
	
	
	public static Constant.Type ConvertToConstantType(Type from){
		
//		if(from instanceof Constant.Record){
//			
//			Type type = Type.Union.;
//			return Constant.Type.V_TYPE(type);
//			
//		}
		
		
		
		return null;
	}
	
	
}
