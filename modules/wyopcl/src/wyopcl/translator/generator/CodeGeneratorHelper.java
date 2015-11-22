package wyopcl.translator.generator;

import java.io.PrintWriter;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import wyil.lang.Attribute;
import wyil.lang.Type;
import wyil.lang.WyilFile;
import wyil.lang.WyilFile.Constant;

/**
 * Lists the code generation methods
 * 
 * @author Min-Hsien Weng
 *
 */
public final class CodeGeneratorHelper {
	private CodeGeneratorHelper() {

	}

	/**
	 * Get the user defined type by checking if the user type has the same fields as the given record type.
	 * 
	 * @param type
	 *            the record type.
	 * @return the user type. Return null if no type is matched.
	 */
	public static wyil.lang.WyilFile.Type getUserDefinedType(Type.Record type, List<wyil.lang.WyilFile.Type> userTypes) {
		for (wyil.lang.WyilFile.Type user_type : userTypes) {
			if (user_type.type() instanceof Type.Record) {
				Type.Record record = (Type.Record) user_type.type();
				// check if record and type have the same fields.
				boolean isTheSame = true;
				for (Entry<String, Type> field : type.fields().entrySet()) {
					Type recordFieldType = record.field(field.getKey());
					if (recordFieldType != null) {
						isTheSame &= true;
					} else {
						isTheSame &= false;
					}
				}

				if (isTheSame) {
					return user_type;
				}
			}
		}
		return null;
	}
	
	
	/**
	 * Check if the type is instance of Integer by inferring the type from
	 * <code>wyil.Lang.Type</code> objects, including the effective collection
	 * types.
	 * 
	 * @param type
	 * @return true if the type is or contains an integer type.
	 */
	public static boolean isIntType(Type type) {
		if (type instanceof Type.Int) {
			return true;
		}

		if (type instanceof Type.Array) {
			return isIntType(((Type.Array) type).element());
		}

		if (type instanceof Type.Tuple) {
			// Check the type of value field.
			Type element = ((Type.Tuple) type).element(1);
			return isIntType(element);
		}

		return false;
	}
	
}
