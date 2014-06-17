package wyopcl.interpreter;

import static wycc.lang.SyntaxError.internalFailure;

import java.math.BigInteger;

import wyil.lang.Constant;
import wyil.lang.Type;

public class Converter {

	public static Object ConvertObject(Constant from, Class<?> paramType){
		Object to = null;
		if(from instanceof Constant.Strung){
			to = ((Constant.Strung)from).value;
		}else if(from instanceof Constant.Integer){
			to = ((Constant.Integer)from).value;
		}else if (from instanceof Constant.List){
			to = (Constant.List)from;
		}else{
			internalFailure("Not implemented!", "Converter.java", null);
		}

		return paramType.cast(to);
	}


	public static Constant ConvertObject(Object from, wyil.lang.Type assignedType){
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


	public static Constant ConvertObject(Constant from, wyil.lang.Type resultType){
		Constant to = null;

		if (resultType instanceof Type.Any) {
			//No needs to convert the type of the operand.
			to = from;
		} else if (resultType instanceof Type.List){
			to = (Constant.List) from;
		} else{
			internalFailure("Not implemented!", "Converter.java", null);
		}

		return to;
	}


}
