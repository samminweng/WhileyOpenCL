package wyopcl.translator.bound;

import java.util.Map.Entry;

import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Type;
import wyil.lang.WyilFile.FunctionOrMethodDeclaration;

/**
 * Utility class for bound analyzer.
 * @author Min-Hsien Weng
 *
 */
public final class Utils {
	private final static String prefix = "%";
	private Utils(){
		
	}
	
	/**
	 * Extract the function name.
	 * @param functionOrMethod
	 * @return
	 */
	protected static String castDeclarationtoString(FunctionOrMethodDeclaration functionOrMethod){
		String declaration ="";
		declaration += functionOrMethod.type().ret() + " "+functionOrMethod.name()+"(";
		if(!functionOrMethod.name().equals("main")){			
			boolean isFirst = true;
			int index=0;
			for(Type paramType : functionOrMethod.type().params()){
				//input parameter
				if(isFirst){
					declaration += paramType+" "+prefix+index;
				}else{
					declaration += ", "+paramType+ " "+prefix+index;
				}
				isFirst = false;
				index++;
			}		
		}else{
			boolean isFirst = true;
			Type.Record paramType = (Type.Record) functionOrMethod.type().params().get(0);
			for(Entry<String, Type> entry :paramType.fields().entrySet()){
				if(isFirst){
					declaration += entry.getValue() + " "+entry.getKey();
				}else{
					declaration += ", " +entry.getValue() + " "+entry.getKey();
				}
				isFirst = false;
			}			
		}
		declaration +=")";
		return declaration;
	}
	
	/**
	 * Check if the type is instance of Integer by inferring the type from 
	 * <code>wyil.Lang.Type</code> objects, including the effective collection types.
	 * @param type 
	 * @return true if the type is or contains an integer type. 
	 */
	protected static boolean isIntType(Type type){
		if(type instanceof Type.Int){
			return true;
		}

		if(type instanceof Type.Map){
			Type.Map map = (Type.Map)type;
			//Check the type of values in the map.
			return isIntType(map.key()) || isIntType(map.value());			
		}

		if(type instanceof Type.List){
			return isIntType(((Type.List)type).element());
		}

		if (type instanceof Type.Tuple){
			//Check the type of value field. 
			Type element = ((Type.Tuple)type).element(1);
			return isIntType(element);	
		}

		return false;
	}
	
	
	
	
	
}
