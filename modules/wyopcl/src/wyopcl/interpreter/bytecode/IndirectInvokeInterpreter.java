package wyopcl.interpreter.bytecode;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import wyil.lang.Code.Block;
import wyil.lang.Codes;
import wyil.lang.Constant;
import wyopcl.interpreter.Closure;
import wyopcl.interpreter.Interpreter;
import wyopcl.interpreter.StackFrame;
import wyopcl.util.Utility;
/**
 * Interprets <code>Codes.IndirectInvoke</code> bytecode.
 * @author Min-Hsien Weng
 * @see wyil.lang.Codes.IndirectInvoke
 *
 */
public class IndirectInvokeInterpreter extends Interpreter {

	private static IndirectInvokeInterpreter instance;

	private IndirectInvokeInterpreter() {}

	/* Implement the Singleton pattern to ensure this class has one instance. */
	public static IndirectInvokeInterpreter getInstance() {
		if (instance == null) {
			instance = new IndirectInvokeInterpreter();
		}
		return instance;
	}
	/**
	 * Invokes the function
	 * @param code
	 * @param stackframe
	 */
	private void execFunction(Codes.IndirectInvoke code, StackFrame stackframe) {
		int linenumber = stackframe.getLine();
		Constant.Lambda lambda = (Constant.Lambda) stackframe.getRegister(code.reference());
		List<Constant> values = new ArrayList<Constant>();
		// Get the parameter values.
		String str ="";
		for (int i = 0; i < code.parameters().length; i++) {
			// Check the parameter type
			Constant constant = stackframe.getRegister(code.parameter(i));
			str += "%" + code.parameter(i) + "(" +constant +") ";
			values.add(constant);
		}
		// Invoke the function
		String name = lambda.name.name();
		java.lang.reflect.Method method = null;
		if (name.equalsIgnoreCase("println") || name.equalsIgnoreCase("print")) {
			try {
				Class<?> systemClass = java.lang.Class.forName("java.lang.System");
				java.lang.reflect.Field outField = systemClass.getDeclaredField("out");
				Class<?> printClass = outField.getType();
				Class<?>[] parameterTypes = new Class[code.type().params().size()];
				// Iterate the parameter types
				for (int i = 0; i < code.type().params().size(); i++) {
					parameterTypes[i] = Utility.ConvertToClass(code.type().params().get(i));
				}
				method = printClass.getMethod(name, parameterTypes);
				ArrayList<Object> arguments = new ArrayList<Object>();
				int index = 0;
				
				for (Class<?> paramType : method.getParameterTypes()) {
					arguments.add(Utility.convertConstantToJavaObject(values.get(index), paramType));
				}
				method.invoke(outField.get(null), arguments.toArray());
				printMessage(stackframe, code.toString(), str);

			} catch (ClassNotFoundException | NoSuchFieldException | SecurityException | IllegalArgumentException
					| IllegalAccessException | InvocationTargetException | NoSuchMethodException e) {
				e.printStackTrace();
			}			
			stackframe.setLine(++linenumber);
		} else {
			Block blk = Interpreter.getFuncBlockByName(lambda.name.toString(), code.type());
			//Block blk = blocktable.get(lambda.name.toString()).get(code.type());
			// Create a new StackFrame
			StackFrame newStackFrame = new StackFrame(stackframe.getDepth() + 1, blk, 0, lambda.name.toString(),
					code.target());
			// Pass the input parameters.
			int index = 0;			
			for (int parameter : code.parameters()) {
				// Get the parameter from the current stack frame
				Constant constant = stackframe.getRegister(parameter);
				newStackFrame.setRegister(index, constant);				
				index++;
			}

			// Start invoking a new block.
			blockstack.push(newStackFrame);
			printMessage(stackframe, code.toString(), str);
		}

		
	}

	private void pushAnonymousFunctionBlockToStack(Codes.IndirectInvoke code, StackFrame currentStackframe) {
		// Get the depth
		int depth = currentStackframe.getDepth();
		Closure closure = (Closure) currentStackframe.getRegister(code.reference());
		String annonymous_name = closure.lambda.name.module() +":" + closure.lambda.name.name();
		Block blk = Interpreter.getFuncBlockByName(annonymous_name);
		//Block blk = (Block) blocktable.get(closure.lambda.name.toString()).values().toArray()[0];
		// Create a new StackFrame
		StackFrame newStackFrame = new StackFrame(depth + 1, blk, 0, closure.lambda.name.toString(), code.target());
		// Pass the input parameters.
		int index = 0;
		int currOperand = 0;
		for (Constant value : closure.params.values) {
			if (value == null) {
				// unknown parameter, so get it from the current stack frame
				Constant constant = currentStackframe.getRegister(code.parameter(currOperand));
				newStackFrame.setRegister(index, constant);
				currOperand++;
			} else {
				// known parameter, so copy it into the new stack frame
				newStackFrame.setRegister(index, value);
			}
			index++;
		}	
		
		// Start invoking a new block.
		blockstack.push(newStackFrame);
		printMessage(currentStackframe, code.toString(),
				"%" + code.target() + "(" + currentStackframe.getRegister(code.target()) + ")\n");

	}

	public void interpret(Codes.IndirectInvoke code, StackFrame stackframe) {
		Constant func = stackframe.getRegister(code.reference());
		if (func instanceof Closure) {
			pushAnonymousFunctionBlockToStack(code, stackframe);
		} else {
			execFunction(code, stackframe);

		}
	}

}
