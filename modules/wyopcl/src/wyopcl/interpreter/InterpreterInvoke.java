package wyopcl.interpreter;

import static wycc.lang.SyntaxError.internalFailure;
import whiley.lang.*;

import java.lang.System;

import wyil.lang.Codes;
import wyil.lang.Code.Block;
import wyil.lang.Constant;
import wyil.lang.Type.FunctionOrMethod;

import java.lang.String;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Arrays;

public class InterpreterInvoke extends Interpreter {

	private static InterpreterInvoke instance;	
	public InterpreterInvoke(){		
	}

	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static InterpreterInvoke getInstance(){
		if (instance == null){
			instance = new InterpreterInvoke();
		}
		return instance;
	}

	private void pushBlockToStackFrame(Block blk, Codes.Invoke code, StackFrame stackframe){
		//Get the depth
		int depth = stackframe.getDepth();
		//Create a new StackFrame
		StackFrame stackFrame = new StackFrame(depth+1, blk, 0,	code.name.name(), code.target);
		
		//Pass the input parameters.
		int index = 0;			
		for(int operand: code.operands){
			Constant constant = stackframe.getRegister(operand);
			stackFrame.setRegister(index, constant);
			index++;
		}

		//Start invoking a new block.		
		blockstack.push(stackFrame);
	}
	


	public void interpret(Codes.Invoke code, StackFrame stackframe) {
		int linenumber = stackframe.getLine();
		 wyil.lang.Type throwsClause = code.type.throwsClause();
		//Get the Block for the corresponding function/method. 
		Block blk = blocktable.get(code.name.name());
		if(blk != null){
			
			//Push the body block to the stack. 
			pushBlockToStackFrame(blk, code, stackframe);
			
			Block pre = blocktable.get(code.name.name()+"pre");
			if(pre != null){
				pushBlockToStackFrame(pre, code, stackframe);
			}
			
			printMessage(stackframe, code.toString(),"\n");

		}else{
			//Directly invoke the function/method.
			Constant operand = stackframe.getRegister(code.operands[0]);
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
						for( Class<?> paramType : method.getParameterTypes()){
							//The 'paramType' is Java data type.				    		
							//Thus, we need a conversion from Constant to Java 
							params.add(Converter.convertToObject(operand, paramType));
						}
						Object returned_obj = method.invoke(null, params.toArray());
						//The returned_obj is a Java data type, so we need to convert
						// returned_obj into Constant.
						result = Converter.convertToConstant(returned_obj, code.assignedType());
						stackframe.setRegister(code.target, result);
						break;
					}

				}

			} catch (ClassNotFoundException | IllegalAccessException | IllegalArgumentException | InvocationTargetException | SecurityException e) {
				//Go to throw clause
				printMessage(stackframe, code.toString(),"%"+code.target+"("+throwsClause+")");
				linenumber = symboltable.get(stackframe.getBlock()).getThrowPos(linenumber);
				stackframe.setLine(linenumber);
				return;
			}

			printMessage(stackframe, code.toString(),"%"+code.target+"("+result+")");
			stackframe.setLine(++linenumber);
		}




	}

}
