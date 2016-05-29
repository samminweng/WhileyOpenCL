package wyopcl.translator;

import java.util.ArrayList;
import java.util.List;

import wyil.lang.Type;
import wyil.lang.WyilFile.FunctionOrMethod;
import wyopcl.Configuration;


/**
 * 
 * Stores the common methods used in all modules of the translator
 * 
 * @author Min-Hsien Weng
 *
 */
public final class TranslatorHelper {
	

	
	
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

		return false;
	}
	
	
}
