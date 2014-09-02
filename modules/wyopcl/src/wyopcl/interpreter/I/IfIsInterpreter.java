package wyopcl.interpreter.I;

import static wycc.lang.SyntaxError.internalFailure;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import wyautl_old.lang.Automaton;
import wyautl_old.lang.Automaton.State;
import wyil.lang.Codes;
import wyil.lang.Constant;
import wyil.lang.Type;
import wyil.lang.Code.Block;
import wyopcl.interpreter.Interpreter;
import wyopcl.interpreter.StackFrame;

public class IfIsInterpreter extends Interpreter{
	private static IfIsInterpreter instance;	
	public IfIsInterpreter(){		
	}
	
	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static IfIsInterpreter getInstance(){
		if (instance == null){
			instance = new IfIsInterpreter();
		}
		return instance;
	}
	
	
	private void gotoTargetBranch(Codes.IfIs code, StackFrame stackframe){
		String label = code.target;
		Block block = stackframe.getBlock();
		int linenumber = symboltable.get(block).getBlockPosByLabel(label);
		stackframe.setLine(++linenumber);
	}	
	
	private void gotoNext(Codes.IfIs code, StackFrame stackframe){
		int linenumber = stackframe.getLine();
		printMessage(stackframe, code.toString(),"");
		stackframe.setLine(++linenumber);
	}
	
	
	private boolean checkType(Constant.Record record, Type.Record type){
		//Check if the record contains the field names of recordType.
		Iterator<Entry<String, Type>> fields = type.fields().entrySet().iterator();
		while(fields.hasNext()){
			Entry<String, Type> field = fields.next();
			String fieldName = field.getKey();
			Type fieldType = field.getValue();
			if(!record.values.containsKey(fieldName)){
				return false;
			}else{
				//Check the type of field value.
				Constant constant = record.values.get(fieldName);
				if(fieldType instanceof Type.Int){
					if(!(constant instanceof Constant.Integer)){
						return false;
					}					
				}else if(fieldType instanceof Type.Strung){
					if(!(constant instanceof Constant.Strung)){
						return false;
					}
				}else{
					internalFailure("Not implemented!", "InterpreterIfIs.java", null);
				}
			}			
		}		
		return true;
	}
	
	
	
	
	
	/**
	 * Check whether the constant value from operand register is a specific subtype.
	 * @param code
	 * @param stackframe
	 */
	public void interpret(Codes.IfIs code, StackFrame stackframe) {		
		//Read the value from the operand register.
		Constant constant = stackframe.getRegister(code.operand);
		if (code.rightOperand instanceof Type.Negation){
			//Check the value is subtype of the test type.
			Type element = ((Type.Negation)code.rightOperand).element();
			if(constant instanceof Constant.Record && element instanceof Type.Record){
				//On the true branch, its type is matched with type test.
				if(checkType((Constant.Record)constant, (Type.Record)element)){
					gotoNext(code, stackframe);
				}else{
					gotoTargetBranch(code, stackframe);
				}
			}else{
				gotoTargetBranch(code, stackframe);
			}
		}else if(code.rightOperand instanceof Type.Null){
			if(constant instanceof Constant.Null){
				//On the true branch, go to the label.				
				gotoTargetBranch(code, stackframe);	
			}else{
				gotoNext(code, stackframe);
			}
		}else if (code.rightOperand instanceof Type.Char){
			//If value is a Constant.Char, then go to the true branch.
			if(constant instanceof Constant.Char){	
				gotoTargetBranch(code, stackframe);
			}else{
				gotoNext(code, stackframe);
			}
		}else if(code.rightOperand instanceof Type.Int){
			if(constant instanceof Constant.Integer){
				gotoTargetBranch(code, stackframe);
			}else {
				gotoNext(code, stackframe);
			}
		}else if (code.rightOperand instanceof Type.Record){
			//Check if the constant is of Constant.Record type.
			Type element = (Type.Record)code.rightOperand;
			if(constant instanceof Constant.Record  && checkType((Constant.Record)constant, (Type.Record)element)){
				gotoTargetBranch(code, stackframe);
			}else {
				gotoNext(code, stackframe);
			}
		} else{
			internalFailure("Not implemented!", "InterpreterIfIs.java", null);
		}
	
		
		
	}

}
