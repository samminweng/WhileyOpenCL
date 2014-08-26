package wyopcl.interpreter.I;

import static wycc.lang.SyntaxError.internalFailure;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
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

	private void pushBlockToStackFrame(List<Block> blks, Codes.Invoke code, StackFrame currentStackframe){	
		//Find the right block
		Block blk = null;
		if(blks.size()==1){
			blk = blks.get(0);
			/*//Check if the method is anonymous function. If so, then create a Lambda bytecode and put
			// it to the target register.
			if (blk.get(0).code instanceof Codes.Lambda){
				int linenumber = oldstackframe.getLine();
				Constant.Lambda result = Constant.V_LAMBDA(code.name, code.type());
				oldstackframe.setRegister(code.target(), result);
				printMessage(oldstackframe, code.toString(),"%"+code.target()+"("+result+")");
				oldstackframe.setLine(++linenumber);
				return;
			}*/			
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

		//Start invoking a new block.		
		blockstack.push(newStackFrame);
		printMessage(currentStackframe, code.toString(),"%"+code.target()+"("+currentStackframe.getRegister(code.target())+")\n");
		
	}
	
	
	/***
	 * Convert the Java object to Constant object.
	 * 
	 * @param from
	 * @param toType
	 * @return
	 */
	private Constant convertJavaObjectToConstant(Object from, Class<?> fromType, wyil.lang.Type toType) {
		Constant to = null;
		if (toType instanceof Type.Strung) {
			if (from instanceof BigDecimal) {
				to = Constant.V_STRING(((BigDecimal) from).toPlainString());
			} else {
				to = Constant.V_STRING(from.toString());
			}
		} else if (toType instanceof Type.Int) {
			to = Constant.V_INTEGER((BigInteger) from);
		} else if (toType instanceof Type.Byte) {
			if (fromType == WyList.class) {
				WyList wylist = (WyList) from;
				to = Constant.V_BYTE(new Byte((byte) wylist.get(0)));
			} else {
				to = Constant.V_BYTE(new Byte((byte) from));
			}
		} else {
			internalFailure("Not implemented!", "InvokeInterpreter.java", null);
		}

		return to;
	}

	


	public void interpret(Codes.Invoke code, StackFrame stackframe) {
		int linenumber = stackframe.getLine();
	
		//Get the Block for the corresponding function/method. 
		List<Block> blks = blocktable.get(code.name.toString());
		if(blks != null){			
			//Push the body block to the stack.
			pushBlockToStackFrame(blks, code, stackframe);
		}else{
			//Directly invoke the function/method.
			//Constant operand = stackframe.getRegister(code.operands[0]);
			Constant operand = stackframe.getRegister(code.operand(0));
			Constant result = null;
			String module_name = code.name.module().toString().replace('/', '.');
			String method_name = code.name.name();
			//Load the Class
			try {
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
						break;
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

			printMessage(stackframe, code.toString(),"%"+code.target()+"("+result+")");
			stackframe.setLine(++linenumber);
		}




	}

}
