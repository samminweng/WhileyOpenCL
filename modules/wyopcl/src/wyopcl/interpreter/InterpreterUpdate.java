package wyopcl.interpreter;

import static wycc.lang.SyntaxError.internalFailure;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;

import wyil.lang.Codes;
import wyil.lang.Constant;
import wyil.lang.Type;
import wyopcl.interpreter.Interpreter.StackFrame;

public class InterpreterUpdate extends Interpreter{
	private static InterpreterUpdate instance;	
	public InterpreterUpdate(){		
	}

	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static InterpreterUpdate getInstance(){
		if (instance == null){
			instance = new InterpreterUpdate();
		}
		return instance;
	}
	
	public void interpret(Codes.Update code, StackFrame stackframe) {
		int linenumber = stackframe.getLine();
		//Popup the compound type (lists, dictionaries, strings, records and references
		Type afterType = code.afterType;
		Constant result;
		if(afterType instanceof Type.List){
			//Pops the list.
			Constant.List list = (Constant.List)stackframe.getRegister(code.target);
			//Read the rhs from the register.
			Constant rhs = stackframe.getRegister(code.result());
			//Copy the arrayList
			ArrayList<Constant> values = list.values;
			//Get the indices
			int index;
			for (int key : code.keys()) {
				index = ((Constant.Integer)stackframe.getRegister(key)).value.intValue();
				//int i = index.value.intValue();
				if(values.size()<index){
					values.add(rhs);
				}else{
					values.set(index, rhs);
				}
			}

			//Update the result to the list.
			result = list;
			stackframe.setRegister(code.target, result);
			printMessage(stackframe, code.toString(),
					"%"+code.target + "("+result+")");
			
		}else if(afterType instanceof Type.Record){
			Constant.Record record = (Constant.Record)stackframe.getRegister(code.target);
			Constant rhs = stackframe.getRegister(code.result());
			HashMap<String, Constant> values = record.values;
			String key = code.fields.get(0);
			values.put(key, rhs);
			
			result= Constant.V_RECORD(values);
			//Update the result to the list.
			stackframe.setRegister(code.target, result);
		}else{
			internalFailure("Not implemented!", "IntepreterUpdate.java", null);
		}
		
		stackframe.setLine(++linenumber);
	}
	
}
