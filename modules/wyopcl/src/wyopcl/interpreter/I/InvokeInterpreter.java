package wyopcl.interpreter.I;

import static wycc.lang.SyntaxError.internalFailure;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

import wyil.lang.Code.Block;
import wyil.lang.Codes;
import wyil.lang.Constant;
import wyil.lang.Type;
import wyjc.runtime.WyList;
import wyopcl.interpreter.Utility;
import wyopcl.interpreter.Interpreter;
import wyopcl.interpreter.StackFrame;

public class InvokeInterpreter extends Interpreter {

	private static InvokeInterpreter instance;	
	public InvokeInterpreter(){		
	}

	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static InvokeInterpreter getInstance(){
		if (instance == null){
			instance = new InvokeInterpreter();
		}
		return instance;
	}
	
	/***
	 * Convert the Java object to Constant object.
	 * 
	 * @param javaobj
	 * @param toType
	 * @return
	 */
	private Constant convertJavaObjectToConstant(Object javaobj, Class<?> fromType, wyil.lang.Type toType) {
		if (toType instanceof Type.Strung) {
			if (javaobj instanceof BigDecimal) {
				return Constant.V_STRING(((BigDecimal) javaobj).toPlainString());
			} else {
				return Constant.V_STRING(javaobj.toString());
			}
		} else if (toType instanceof Type.Int) {
			return Constant.V_INTEGER((BigInteger) javaobj);
		} else if (toType instanceof Type.Byte) {
			if (fromType == WyList.class) {
				WyList wylist = (WyList) javaobj;
				return Constant.V_BYTE(new Byte((byte) wylist.get(0)));
			} else {
				return Constant.V_BYTE(new Byte((byte) javaobj));
			}
		} else if (toType instanceof Type.List){
			Type elemType = ((Type.List)toType).element();
			if(javaobj instanceof WyList && elemType instanceof Type.Byte){
				Collection<Constant> values = new ArrayList<Constant>();
				WyList wylist = (WyList)javaobj;
				Iterator<?> iterator = wylist.iterator();
				while(iterator.hasNext()){
					Object next = iterator.next();
					values.add(Constant.V_BYTE((byte)next));
				}
				return Constant.V_LIST(values);
			}else{
				internalFailure("Not implemented!", "InvokeInterpreter.java", null);
				return null;
			}
			
		} else {
			internalFailure("Not implemented!", "InvokeInterpreter.java", null);
			return null;
		}
	}


	private void pushFunctionBlockToStack(List<Block> blks, Codes.Invoke code, StackFrame currentStackframe){	
		//Find the right block
		Block blk = null;
		if(blks.size()==1){
			blk = blks.get(0);			
		}else{
			internalFailure("Not implemented!", "InvokeInterpreter.java", null);
		}		
		
		//Get the depth
		int depth = currentStackframe.getDepth();
		//Create a new StackFrame
		StackFrame newStackFrame = new StackFrame(depth+1, blk, 0,	code.name.name(), code.target());
		
		//Pass the input parameters.
		int index = 0;			
		for(int operand: code.operands()){
			Constant constant = currentStackframe.getRegister(operand);
			newStackFrame.setRegister(index, constant);
			index++;
		}

		//Push the function block to the stack		
		blockstack.push(newStackFrame);
		printMessage(currentStackframe, code.toString(),"%"+code.target()+"("+currentStackframe.getRegister(code.target())+")\n");
		
	}
	
	
	private void execFunction(Codes.Invoke code, StackFrame stackframe){
		int linenumber = stackframe.getLine();
		//Directly invoke the function/method.
		Constant operand = stackframe.getRegister(code.operand(0));
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
					ArrayList<Object> params = new ArrayList<Object>();
					//Compare the parameter type
					for(Class<?> paramType : method.getParameterTypes()){
						//The 'paramType' is Java data type.				    		
						//Thus, we need a conversion from Constant to Java							
						params.add(Utility.convertConstantToJavaObject(operand, paramType));
					}
					//params.add(operand);
					Object returned_obj = method.invoke(null, params.toArray());
					Class<?> returnType = method.getReturnType();
					//The returned_obj is a Java data type, so we need to convert
					// returned_obj into Constant.					
					result = convertJavaObjectToConstant(returned_obj, returnType, code.assignedType());
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
			linenumber = symboltable.get(caller.getBlock()).getCatchPos();
			caller.setLine(linenumber);
			return;
		}
	}
	
	


	public void interpret(Codes.Invoke code, StackFrame stackframe) {	
		//Get the Block for the corresponding function/method. 
		List<Block> blks = blocktable.get(code.name.toString());
		if(blks != null){			
			//Push the function block to the stack.
			pushFunctionBlockToStack(blks, code, stackframe);
		}else{
			//Directly invoke the function/method.
			execFunction(code, stackframe);
		}
	}

}
