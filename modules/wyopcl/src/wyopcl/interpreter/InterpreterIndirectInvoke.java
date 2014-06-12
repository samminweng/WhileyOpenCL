package wyopcl.interpreter;

import static wycc.lang.SyntaxError.internalFailure;
import jasm.lang.ClassFile.Field;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
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
		List<Object> values = new ArrayList<Object>();
		
		if(func instanceof Method){		
			//Get the parameter values.			
			for(int i=0;i<code.parameters().length;i++){
				Type paramType = func.params().get(i);
				//Check the parameter type
				if(paramType instanceof Type.Any){
					Constant constant = stackframe.getRegister(code.parameter(i));
					values.add(constant);
				} else	if(paramType instanceof Type.Int){
					Constant.Integer const_value = (Constant.Integer)stackframe.getRegister(code.parameter(i));
					values.add(const_value.value.intValue());
				}else{
					internalFailure("Not implemented!", "InterpreterIndirectInvoke.java", null);
				}
			}	
		}else{
			internalFailure("Not implemented!", "InterpreterIndirectInvoke.java", null);
		}

		//Invoke the function
		
		if(reference.name.name().equalsIgnoreCase("println")){
			try {
				Class<?> systemClass = java.lang.Class.forName("java.lang.System");
				java.lang.reflect.Field outField = systemClass.getDeclaredField("out");
				Class<?> printStreamClass = outField.getType();
				java.lang.reflect.Method printlnMethod = printStreamClass.getDeclaredMethod("println", String.class);
				Object object = outField.get(null);			
				printlnMethod.invoke(object, values.get(0).toString());
			} catch (ClassNotFoundException | NoSuchFieldException | SecurityException | NoSuchMethodException | IllegalArgumentException | IllegalAccessException | InvocationTargetException e) {
				e.printStackTrace();
			}
		}else{
			internalFailure("Not implemented!", "InterpreterIndirectInvoke.java", null);
		}
		
		
		
		printMessage(stackframe, code.toString(), reference+"");
		stackframe.setLine(++linenumber);
	}

}
