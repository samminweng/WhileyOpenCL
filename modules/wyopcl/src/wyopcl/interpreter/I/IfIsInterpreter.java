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

public class IfIsInterpreter extends Interpreter {
	private static IfIsInterpreter instance;

	public IfIsInterpreter() {
	}

	/* Implement the Singleton pattern to ensure this class has one instance. */
	public static IfIsInterpreter getInstance() {
		if (instance == null) {
			instance = new IfIsInterpreter();
		}
		return instance;
	}

	private void gotoTargetBranch(Codes.IfIs code, StackFrame stackframe) {
		String label = code.target;
		Block block = stackframe.getBlock();
		int linenumber = symboltable.get(block).getBlockPosByLabel(label);
		stackframe.setLine(++linenumber);
	}

	private void gotoNext(Codes.IfIs code, StackFrame stackframe) {
		int linenumber = stackframe.getLine();
		printMessage(stackframe, code.toString(), "");
		stackframe.setLine(++linenumber);
	}

	private boolean checkType(Constant.Record record, Type type) {
		HashMap<String, Type> fields = null;
		if (type instanceof Type.Record) {
			fields = ((Type.Record) type).fields();
		} else if (type instanceof Type.UnionOfRecords) {
			fields = ((Type.UnionOfRecords) type).fields();
		} else {
			internalFailure("Not implemented!", "InterpreterIfIs.java", null);
			return false;
		}

		// Check if the record contains the field names of recordType.
		Iterator<Entry<String, Type>> iterator = fields.entrySet().iterator();
		while (iterator.hasNext()) {
			Entry<String, Type> field = iterator.next();
			String fieldName = field.getKey();
			Type fieldType = field.getValue();
			if (!record.values.containsKey(fieldName)) {
				return false;
			} else {
				// Check the type of field value.
				Constant constant = record.values.get(fieldName);
				if (fieldType instanceof Type.Int) {
					if (!(constant instanceof Constant.Integer)) {
						return false;
					}
				} else if (fieldType instanceof Type.Strung) {
					if (!(constant instanceof Constant.Strung)) {
						return false;
					}
				} else {
					internalFailure("Not implemented!", "InterpreterIfIs.java", null);
				}
			}
		}
		return true;

	}

	private boolean checkType(Constant.List list, Type.List type) {
		Type elementType = type.element();
		if (elementType instanceof Type.Any) {
			return true;// No checking.
		}
		// Check if the element in the list is the specific subtype of element
		// type.
		Iterator<Constant> iterator = list.values.iterator();
		while (iterator.hasNext()) {
			Constant constant = iterator.next();
			if (elementType instanceof Type.Int) {
				if (!(constant instanceof Constant.Integer)) {
					return false;
				}
			} else if (elementType instanceof Type.List) {
				return checkType((Constant.List) constant, (Type.List) elementType);
			} else {
				internalFailure("Not implemented!", "InterpreterIfIs.java", null);
				return false;
			}
		}
		return true;
	}

	private boolean checkType(Constant.Set list, Type.Set type) {
		Type elementType = type.element();
		// Check if the element in the list is the specific subtype of element
		// type.
		Iterator<Constant> iterator = list.values.iterator();
		while (iterator.hasNext()) {
			Constant constant = iterator.next();
			if (elementType instanceof Type.Int) {
				if (!(constant instanceof Constant.Integer)) {
					return false;
				}
			} else if (elementType instanceof Type.Tuple) {
				if (!checkType((Constant.Tuple) constant, (Type.Tuple) elementType)) {
					return false;
				}
			} else {
				internalFailure("Not implemented!", "InterpreterIfIs.java", null);
				return false;
			}
		}
		return true;
	}

	private boolean checkType(Constant.Tuple tuple, Type.Tuple type) {
		Iterator<Constant> iterator = tuple.values.iterator();
		int index = 0;
		while (iterator.hasNext()) {
			Constant constant = iterator.next();
			Type elementType = type.element(index++);
			if (!checkType(constant, elementType)) {
				return false;
			}
		}
		return true;
	}

	private boolean checkType(Constant constant, Type type) {
		if (type instanceof Type.Negation) {
			// The result for negation type should be inverted (i.e. negated the
			// result of type checking)
			// Check the value is subtype of the test type.
			Type element = ((Type.Negation) type).element();
			if (constant instanceof Constant.Record && element instanceof Type.Record) {
				// On the true branch, its type is matched with type test.
				if (checkType((Constant.Record) constant, (Type.Record) element)) {
					return false;
				} else {
					return true;
				}
			} else {
				return true;
			}
		} else if (type instanceof Type.Null) {
			if (constant instanceof Constant.Null) {
				// On the true branch, go to the label.
				return true;
			} else {
				return false;
			}
		} else if (type instanceof Type.Char) {
			// If value is a Constant.Char, then go to the true branch.
			if (constant instanceof Constant.Char) {
				return true;
			} else {
				return false;
			}
		} else if (type instanceof Type.Int) {
			if (constant instanceof Constant.Integer) {
				return true;
			} else {
				return false;
			}
		} else if (type instanceof Type.Real) {
			if (constant instanceof Constant.Decimal) {
				return true;
			} else {
				return false;
			}
		} else if (type instanceof Type.Record || type instanceof Type.UnionOfRecords) {
			// Check if the constant is of Constant.Record type.
			if (constant instanceof Constant.Record && checkType((Constant.Record) constant, type)) {
				return true;
			} else {
				return false;
			}
		} else if (type instanceof Type.List) {
			if (constant instanceof Constant.List && checkType((Constant.List) constant, (Type.List) type)) {
				return true;
			} else {
				return false;
			}
		} else if (type instanceof Type.Set) {
			if (constant instanceof Constant.Set && checkType((Constant.Set) constant, (Type.Set) type)) {
				return true;
			} else {
				return false;
			}
		} else if (type instanceof Type.Strung) {
			if (constant instanceof Constant.Strung) {
				return true;
			} else {
				return false;
			}
		} else {
			internalFailure("Not implemented!", "InterpreterIfIs.java", null);
			return false;
		}
	}

	/**
	 * Check whether the constant value from operand register is a specific
	 * subtype.
	 * 
	 * @param code
	 * @param stackframe
	 */
	public void interpret(Codes.IfIs code, StackFrame stackframe) {
		// Read the value from the operand register.
		Constant constant = stackframe.getRegister(code.operand);
		Type type = code.rightOperand;
		if (checkType(constant, type)) {
			gotoTargetBranch(code, stackframe);
		} else {
			gotoNext(code, stackframe);
		}
	}

}
