package wyopcl.interpreter;

import java.util.List;

import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Constant;

public class InterpreterSubList extends Interpreter{
	private static InterpreterSubList instance;	
	public InterpreterSubList(){		
	}

	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static InterpreterSubList getInstance(){
		if (instance == null){
			instance = new InterpreterSubList();
		}
		return instance;
	}
	
	public void interpret(Codes.SubList code, StackFrame stackframe) {
		int linenumber = stackframe.getLine();
		
		//Get the list from the operand register (index=0).
		Constant.List list = (Constant.List)stackframe.getRegister(code.operands[0]);
		//Get two index operands (index=1 or index=2).
		Constant.Integer fromIndex = (Constant.Integer)stackframe.getRegister(code.operands[1]);
		Constant.Integer toIndex = (Constant.Integer)stackframe.getRegister(code.operands[2]);
		//Computes the sublist from index1 to index2.
		List<Constant> sublist = list.values.subList(fromIndex.value.intValue(), toIndex.value.intValue());
		//Write the result to the target register.
		Constant result = Constant.V_LIST(sublist);
		stackframe.setRegister(code.target, result);
		
		printMessage(stackframe, code.toString(),
				"%"+code.target + "("+result+")");
		
		stackframe.setLine(++linenumber);
	}
	
}
