package wyopcl.interpreter;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import wycc.lang.NameID;
import wyil.lang.Code;
import wyil.lang.CodeBlock;
import wyil.lang.Constant;
import wyil.lang.Type.FunctionOrMethod;

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
	
	
	//public void interpret(Code.Invoke code, HashMap<String, Constant> registers) {
	public void interpret(Code.Invoke code, StackFrame stackframe) {
		int linenumber = stackframe.getLine();
		Code.Invoke invoke = (Code.Invoke)code;
		NameID methodorFunc = code.name;		
		FunctionOrMethod type = code.type;
		//Get the symbol
		CodeBlock blk = blocktable.get(methodorFunc.name());
		//SymbolTable newsymbol = symboltable.get(blk);
		//Create a new StackFrame
		StackFrame stackFrame = new StackFrame(blk, 0, methodorFunc.name(), invoke.target);
		
		
		String msg = methodorFunc.name()+"("+type+")";
		//Pass the input parameters.
		int index = 0;
		for(int operand: code.operands){
			Constant constant = stackframe.getRegister(operand);			
			msg += " %"+operand+"("+constant.toString()+")";
			stackFrame.setRegister(index, constant);
			index++;
		}
		//Put the invoked function name into registers with the target key.
		//Constant method_name = Constant.V_STRING(name.name());
		//stackframe.setRegister(code.target, method_name);		
		msg += " %"+code.target+"("+null+")";	
	
		
		
		//Start invoking a new block.		
		blockstack.push(stackFrame);
		msg += "\n===Invoke \""+stackFrame.getName()+"\"===";
		
		System.out.println("#"+linenumber+" ["+code+"]\n>"
				+msg);
		
		
	}

}
