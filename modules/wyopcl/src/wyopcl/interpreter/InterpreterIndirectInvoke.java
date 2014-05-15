package wyopcl.interpreter;

import java.util.ArrayList;
import java.util.HashMap;

import wyil.lang.Code;
import wyil.lang.Constant;
import wyil.lang.Type;
import wyil.lang.Type.FunctionOrMethod;

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
	
	
	public void interpret(Code.IndirectInvoke code, StackFrame stackframe) {
		int linenumber = stackframe.getLine();
		int target = code.target;
		//int operand = code.operand;
		Constant.Record fieldType = (Constant.Record)stackframe.getRegister(code.operand);
		//int[] operands = code.operands;
		FunctionOrMethod func = code.type;
		
		ArrayList<Type> paramTypes = func.params();
	
		String msg="";
		msg += "%"+code.operand+"("+fieldType+") ";
		
		for (int i = 0; i< code.operands.length; i++) {
			Type paramType = paramTypes.get(i);
			msg += "%"+code.operands[i];
			Constant paramValue = stackframe.getRegister(code.operands[i]);
			if(paramType instanceof Type.Any){
				if(paramValue instanceof Constant.Integer){
					msg += "("+((Constant.Integer)paramValue).value+")";
				} else if(paramValue instanceof Constant.Strung){
					msg += "("+((Constant.Strung)paramValue).value+")";					
				} else{	
					throw new RuntimeException("Not implemented!");
				}				
			}else{
				throw new RuntimeException("Not implemented!");
			}
		}
		
		
		/*if (target != Code.NULL_REG) {
			System.out.println("indirectinvoke " + target + " = " + operand + " "
					+ str + "\tResult: " + func);
		} else {
			System.out.println( "indirectinvoke %" + operand + " "+ str	+ "\tResult: " + func);
		}*/
		
		System.out.println("#"+linenumber+" ["+code+"]\n>"+msg+"\n");
		
		stackframe.setLine(++linenumber);
	}

}
