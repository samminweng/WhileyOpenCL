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
	//The boolean flag is used to show whether the code is inside an assertion or assumption.	
	private static String assertOrAssume_label = null;
	private Utils(){

	}

	/**
	 * Check if the code is inside an assertion or assumption.
	 * @param code the code.
	 * @return true if the code belongs to the assertion or assumption. Otherwise, return false.
	 */
	protected static boolean checkAssertOrAssume(Code code){
		if(assertOrAssume_label == null){
			if(code instanceof Codes.AssertOrAssume){
				Codes.AssertOrAssume assertOrAssume = (Codes.AssertOrAssume)code;
				assertOrAssume_label = assertOrAssume.target;
				return true;
			}		
		}else{			
			if(code instanceof Codes.Label){
				Codes.Label label = (Codes.Label)code;
				if(assertOrAssume_label.equals(label.label)){
					//Nullify the label of an assertion or assumption. 
					assertOrAssume_label = null;
					return true;
				}					
			}
		}
		//In other cases, if the label is not null, then the code is inside the assertion or assumption.
		return (assertOrAssume_label != null)? true: false;
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
