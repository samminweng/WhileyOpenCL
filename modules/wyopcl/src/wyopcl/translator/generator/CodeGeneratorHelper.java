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
