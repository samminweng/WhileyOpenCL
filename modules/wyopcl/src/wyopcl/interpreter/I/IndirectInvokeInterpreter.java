package wyopcl.interpreter.I;

import static wycc.lang.SyntaxError.internalFailure;
import jasm.lang.ClassFile.Field;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.TypeVariable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map.Entry;

import wyil.lang.Codes;
import wyil.lang.Constant;
import wyil.lang.Code.Block;
import wyil.lang.Constant.Record;
import wyil.lang.Type;
import wyil.lang.Type.Function;
import wyil.lang.Type.FunctionOrMethod;
import wyil.lang.Type.Method;
import wyopcl.interpreter.Utility;
import wyopcl.interpreter.Interpreter;
import wyopcl.interpreter.Interpreter.StackFrame;

public class IndirectInvokeInterpreter extends Interpreter {

	private static IndirectInvokeInterpreter instance;	
	public IndirectInvokeInterpreter(){		
	}

	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static IndirectInvokeInterpreter getInstance(){
		if (instance == null){
			instance = new IndirectInvokeInterpreter();
		}
		return instance;
	}

	private void callAnonymousFunction(Codes.IndirectInvoke code, StackFrame oldstackframe){
		Constant.Lambda lambda = (Constant.Lambda)oldstackframe.getRegister(code.reference()); 
		//Find the right block
		Block blk = null;
		List<Block> blks = blocktable.get(lambda.name.toString());
		if (blks == null)
			internalFailure("Not implemented!", "InterpreterIndirectInvoke.java", null);
		
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
		StackFrame newStackFrame = new StackFrame(depth+1, blk, 0,	lambda.name.name(), code.target());
		//Pass the input parameters.
		int index = 0;			
		for(int parameter: code.parameters()){
			Constant constant = oldstackframe.getRegister(parameter);
			newStackFrame.setRegister(index, constant);
			index++;
		}

		//Start invoking a new block.		
		blockstack.push(newStackFrame);
		printMessage(oldstackframe, code.toString(),"%"+code.target()+"("+oldstackframe.getRegister(code.target())+")\n");
		
	}
	
	

	public void interpret(Codes.IndirectInvoke code, StackFrame stackframe) {
		int linenumber = stackframe.getLine();
		Constant.Lambda lambda = (Constant.Lambda)stackframe.getRegister(code.reference());
		//FunctionOrMethod func = code.type;
		List<Constant> values = new ArrayList<Constant>();

		//Get the parameter values.			
		for(int i=0;i<code.parameters().length;i++){
			//Check the parameter type
			Constant constant = stackframe.getRegister(code.parameter(i));
			values.add(constant);
		}
		
		//Invoke the function		
		String name = lambda.name.name();
		java.lang.reflect.Method method = null;
		if(name.equalsIgnoreCase("println") || name.equalsIgnoreCase("print")){
			try {
				Class<?> systemClass = java.lang.Class.forName("java.lang.System");
				java.lang.reflect.Field outField = systemClass.getDeclaredField("out");
				Class<?> printClass = outField.getType();
				Class<?>[] parameterTypes = new Class[code.type().params().size()];
				//Iterate the parameter types
				for(int i=0;i<code.type().params().size();i++){
					parameterTypes[i]= Utility.ConvertToClass(code.type().params().get(i));
				}
				method = printClass.getMethod(name, parameterTypes);
				ArrayList<Object> arguments = new ArrayList<Object> ();
				int index = 0;
				for(Class<?> paramType: method.getParameterTypes()){
					arguments.add(Utility.convertConstantToJavaObject(values.get(index), paramType));
				}
				method.invoke(outField.get(null), arguments.toArray());
				printMessage(stackframe, code.toString(), "("+method+")");
				
			} catch (ClassNotFoundException | NoSuchFieldException | SecurityException | IllegalArgumentException | IllegalAccessException | InvocationTargetException | NoSuchMethodException e) {
				e.printStackTrace();
			}
		}else{
			//internalFailure("Not implemented!", "IndirectInvokeInterpreter.java", null);
			//Invoke the anonymous function (lambda)
			callAnonymousFunction(code, stackframe);
		}
		
		stackframe.setLine(++linenumber);
	}

}
