package wyopcl.interpreter.bytecode;

import static wycc.lang.SyntaxError.internalFailure;

import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import wycc.lang.NameID;
import wyil.lang.Code.Block;
import wyil.lang.Codes;
import wyil.lang.Constant;
import wyil.lang.Type;
import wyil.lang.Type.FunctionOrMethod;
import wyjc.runtime.WyList;
import wyjc.runtime.WyObject;
import wyjc.runtime.WyRat;
import wyjc.runtime.WyRecord;
import wyopcl.interpreter.Interpreter;
import wyopcl.interpreter.StackFrame;
import wyopcl.util.Utility;
import whiley.io.File$native;;
/**
 * Interprets <code>Codes.Invoke</code> bytecode.
 * @author Min-Hsien Weng
 * @see wyil.lang.Codes.Invoke
 *
 */
public class InvokeInterpreter extends Interpreter {

	private static InvokeInterpreter instance;	
	private InvokeInterpreter(){}

	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static InvokeInterpreter getInstance(){
		if (instance == null){
			instance = new InvokeInterpreter();
		}
		return instance;
	}

	/***
	 * Convert the Java object to the object of given Constant type.
	 * @param obj an Java object
	 * @param toType the given Constant type
	 * @return the Constant object of the specified type. 
	 */
	private Constant convertJavaObjectToConstant(NameID nameID, Object obj, wyil.lang.Type toType) {
		if (toType instanceof Type.Strung) {
			if (obj instanceof BigDecimal) {
				return Constant.V_STRING(((BigDecimal) obj).toPlainString());
			}
			//trim the beginning and ending quotes.
			String str = obj.toString().replaceAll("^\"|\"$", "");
			return Constant.V_STRING(str);
		} 

		if (toType instanceof Type.Int) {
			//if(fromType.equals(WyRat.class)){
			if(obj instanceof WyRat){
				WyRat wyRat = (WyRat)obj;
				return Constant.V_INTEGER(wyRat.numerator());
			}			
			return Constant.V_INTEGER((BigInteger) obj);
		} 

		if (toType instanceof Type.Bool){
			return Constant.V_BOOL((boolean)obj);
		}

		if (toType instanceof Type.Byte) {
			//if (fromType == WyList.class) {
			if(obj instanceof WyList){
				WyList wylist = (WyList) obj;
				return Constant.V_BYTE(new Byte((byte) wylist.get(0)));
			}			
			return Constant.V_BYTE(new Byte((byte) obj));
		}

		if (toType instanceof Type.List){
			Collection<Constant> values = new ArrayList<Constant>();
			WyList wylist = (WyList)obj;
			for(Object wyObj : wylist){
				Type elemType = ((Type.List)toType).element();
				values.add(convertJavaObjectToConstant(nameID, wyObj, elemType));
			}
			return Constant.V_LIST(values);
		}
		
		if(toType instanceof Type.Record){
			Type.Record recordType = (Type.Record)toType;
			WyRecord wyrecord = (WyRecord)obj;			
			Map<String, Constant> values = new HashMap<String, Constant>();
			for(String field: wyrecord.keySet()){
				Type fieldType = recordType.field(field);
				Object value = wyrecord.get(field);
				values.put(field, convertJavaObjectToConstant(nameID, value, fieldType));
			}			
			return Constant.V_RECORD(values);
		}
		
		//Convert a Java obj to a constant method.
		//But Constant class does not have the constructor for method.
		//This method is not yet complete and essential for executing 001_avg benchmark program.
		if(toType instanceof Type.Method){
			Type.Method methodType = (Type.Method)toType;			
			return Constant.V_LAMBDA(nameID, methodType);			
		}		
		
		internalFailure("Not implemented!", "InvokeInterpreter.java", null);
		return null;

	}


	/**
	 * Directly invoke the function/method from library
	 * @param code
	 * @param stackframe
	 */
	private void execFunction(Codes.Invoke code, StackFrame stackframe){
		int linenumber = stackframe.getLine();
		//Directly invoke the function/method.		
		Constant result = null;
		String module_name = code.name.module().toString().replace('/', '.');
		String method_name = code.name.name();
		
		
				
		try {			
			//Load the Class
			ClassLoader classLoader = this.getClass().getClassLoader();
			Class<?> whileyclass = Class.forName(module_name, true, classLoader);			
			
			for(Method method: whileyclass.getMethods()){
				//Find the method by checking the method name.
				if(method.getName().startsWith(method_name)){
					//Get the parameter types.
					Object[] params = new Object[code.type().params().size()];
					//Compare the parameter type
					int index = 0;
					for(Class<?> paramType : method.getParameterTypes()){
						//The 'paramType' is Java data type.				    		
						//Thus, we need a conversion from Constant to Java
						Constant operand = stackframe.getRegister(code.operand(index));
						params[index] = Utility.convertConstantToJavaObject(operand, paramType);
						index++;
					}
					//params.add(operand);
					Object obj = method.invoke(null, params);
					//The returned_obj is a Java data type, so we need to convert
					// returned_obj into Constant.					
					result = convertJavaObjectToConstant(code.name, obj, code.assignedType());
					stackframe.setRegister(code.target(), result);
					printMessage(stackframe, code.toString(),"%"+code.target()+"("+result+")");
					stackframe.setLine(++linenumber);
					return;
				}
			}			
		} catch (Exception e) {				
			//Pop up the current block
			if(blockstack.size() > 1){
				blockstack.pop();
			}
			//Return to the caller
			StackFrame caller = blockstack.peek();
			linenumber = symboltable.getCatchPos(caller.getBlock());
			caller.setLine(linenumber);
			return;
		}
	}




	public void interpret(Codes.Invoke code, StackFrame stackframe) {
		
		//Find the right block
		Block blk = Interpreter.getFuncBlockByName(code.name.toString(), code.type());
		
		if (blk != null){
			//Get the depth
			int depth = stackframe.getDepth();
			//Create a new StackFrame
			StackFrame newStackFrame = new StackFrame(depth+1, blk, 0,	code.name.name(), code.target());
		
			//Pass the input parameters.
			int index = 0;		
			String str="";
			for(int operand: code.operands()){
				Constant constant = stackframe.getRegister(operand);
				newStackFrame.setRegister(index, constant);
				str += "%"+operand+"("+constant+")";
				index++;
			}
		
			//Push the function block to the stack		
			blockstack.push(newStackFrame);
			printMessage(stackframe, code.toString(),str);
		}else{
			execFunction(code, stackframe);
		}		
	}

}
