package wyopcl.interpreter;

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
import wyil.lang.Constant.Record;
import wyil.lang.Type;
import wyil.lang.Type.Function;
import wyil.lang.Type.FunctionOrMethod;
import wyil.lang.Type.Method;

public class InterpreterIndirectInvoke extends Interpreter {

	private static InterpreterIndirectInvoke instance;	
	public InterpreterIndirectInvoke(){		
	}

	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static InterpreterIndirectInvoke getInstance(){
		if (instance == null){
			instance = new InterpreterIndirectInvoke();
		}
		return instance;
	}


	public void interpret(Codes.IndirectInvoke code, StackFrame stackframe) {
		int linenumber = stackframe.getLine();
		Constant.Lambda reference = (Constant.Lambda)stackframe.getRegister(code.reference());
		FunctionOrMethod func = code.type;
		List<Constant> values = new ArrayList<Constant>();


		//Get the parameter values.			
		for(int i=0;i<code.parameters().length;i++){
			//Check the parameter type
			Constant constant = stackframe.getRegister(code.parameter(i));
			values.add(constant);
		}

		


		//Invoke the function		
		String name = reference.name.name();
		java.lang.reflect.Method method = null;
		if(name.equalsIgnoreCase("println") || name.equalsIgnoreCase("print")){
			try {
				Class<?> systemClass = java.lang.Class.forName("java.lang.System");
				java.lang.reflect.Field outField = systemClass.getDeclaredField("out");
				Class<?> printClass = outField.getType();
				Class<?>[] parameterTypes = new Class[code.type.params().size()];
				//Iterate the parameter types
				for(int i=0;i<code.type.params().size();i++){
					parameterTypes[i]= Converter.ConvertToClass(code.type.params().get(i));
				}
				method = printClass.getMethod(name, parameterTypes);
				ArrayList<Object> arguments = new ArrayList<Object> ();
				int index = 0;
				for(Class<?> paramType: method.getParameterTypes()){
					arguments.add(Converter.convertToObject(values.get(index), paramType));
				}
				method.invoke(outField.get(null), arguments.toArray());
				
			} catch (ClassNotFoundException | NoSuchFieldException | SecurityException | IllegalArgumentException | IllegalAccessException | InvocationTargetException | NoSuchMethodException e) {
				e.printStackTrace();
			}
		}else{
			internalFailure("Not implemented!", "InterpreterIndirectInvoke.java", null);
		}

		printMessage(stackframe, code.toString(), "("+method+")");
		stackframe.setLine(++linenumber);
	}

}
