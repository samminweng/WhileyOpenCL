package wyopcl.interpreter.I;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

import wyil.lang.Code.Block;
import wyil.lang.Codes;
import wyil.lang.Constant;
import wyopcl.interpreter.Converter;
import wyopcl.interpreter.Interpreter;
import wyopcl.interpreter.Interpreter.StackFrame;

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

	private void pushBlockToStackFrame(List<Block> blks, Codes.Invoke code, StackFrame oldstackframe){	
		//Find the right block
		Block blk = null;
		if(blks.size()==1){
			blk = blks.get(0);
		}else{
			for(int index=0;index<blks.size();index++){
				blk = blks.get(index);
				//Get the parameter type of invoked method
				code.type().params();
			}
		}
		
		
		//Get the depth
		int depth = oldstackframe.getDepth();
		//Create a new StackFrame
		StackFrame newStackFrame = new StackFrame(depth+1, blk, 0,	code.name.name(), code.target());
		
		//Pass the input parameters.
		int index = 0;			
		for(int operand: code.operands()){
			Constant constant = oldstackframe.getRegister(operand);
			newStackFrame.setRegister(index, constant);
			index++;
		}

		//Start invoking a new block.		
		blockstack.push(newStackFrame);
	}
	


	public void interpret(Codes.Invoke code, StackFrame stackframe) {
		int linenumber = stackframe.getLine();
	
		//Get the Block for the corresponding function/method. 
		List<Block> blks = blocktable.get(code.name.toString());
		if(blks != null){			
			//Push the body block to the stack.
			pushBlockToStackFrame(blks, code, stackframe);
			printMessage(stackframe, code.toString(),"\n");

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
							params.add(Converter.convertConstantToJavaObject(operand, paramType));
						}
						//params.add(operand);
						Object returned_obj = method.invoke(null, params.toArray());
						Class<?> returnType = method.getReturnType();
						//The returned_obj is a Java data type, so we need to convert
						// returned_obj into Constant.
						
						result = Converter.convertJavaObjectToConstant(returned_obj, returnType, code.assignedType());
						stackframe.setRegister(code.target(), result);
						break;
					}

				}

			} catch (ClassNotFoundException | IllegalAccessException | IllegalArgumentException | InvocationTargetException | SecurityException e) {
				//Go to throw clause
				wyil.lang.Type throwsClause = code.type().throwsClause();
				printMessage(stackframe, code.toString(),"%"+code.target()+"("+throwsClause+")");
				linenumber = symboltable.get(stackframe.getBlock()).getCatchPos();
				stackframe.setLine(linenumber);
				return;
			}

			printMessage(stackframe, code.toString(),"%"+code.target()+"("+result+")");
			stackframe.setLine(++linenumber);
		}




	}

}
