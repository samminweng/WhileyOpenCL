package wyopcl.translator.symbolic.pattern.expression;

import java.math.BigInteger;
import java.util.HashMap;

import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Constant;
import wyil.lang.Type;
import wyopcl.Configuration;

/**
 * Create a factory to generate the expression based on the input type.
 * 
 * @author Min-Hsien Weng
 *
 */
public class ExprFactory {
	private final Configuration config;
	private final String prefix = "%";
	private HashMap<String, Expr> expressiontable;// Store the register along
													// with the corresponding
													// expression.

	public ExprFactory(Configuration config) {
		this.config = config;
		this.expressiontable = new HashMap<String, Expr>();
	}

	/**
	 * Create an expression with the constant
	 * 
	 * @param constant
	 * @return the expression.
	 */
	private Expr createExpr(BigInteger constant) {
		LinearExpr expr = new LinearExpr(null);
		((LinearExpr) expr).addConstant(constant);
		return expr;
	}

	/**
	 * Create an expression with the input parameter types.
	 * 
	 * @param type
	 *            the input parameter type.
	 * @return the expression.
	 */
	private Expr createExpr(Type paramType) {
		String var = prefix + getAvailableReg();
		LinearExpr expr = new LinearExpr(var);
		((LinearExpr) expr).addVar(BigInteger.ONE, var);

		return expr;
	}

	/**
	 * Initial the linear expression with the bytecode.
	 * 
	 * @param code
	 * @return
	 */
	private Expr createExpr(Code code) {
		Expr expr = null;
		if (code instanceof Codes.Assign) {
			expr = new LinearExpr(prefix + ((Codes.Assign) code).target());
			Codes.Assign assign = (Codes.Assign) code;
			// 1*v1
			((LinearExpr) expr).addVar(BigInteger.ONE, prefix + assign.operand(0));
		} else if (code instanceof Codes.Const) {
			Codes.Const constant = (Codes.Const) code;
			if (constant.constant instanceof Constant.Integer) {
				expr = new LinearExpr(prefix + ((Codes.Const) code).target());
				// c0
				((LinearExpr) expr).addConstant(((Constant.Integer) constant.constant).value);
			} else if (constant.constant instanceof Constant.List) {
				expr = new Expr(prefix + ((Codes.Const) code).target(), code);
			}
		} else if (code instanceof Codes.BinaryOperator) {
			Codes.BinaryOperator binOp = (Codes.BinaryOperator) code;
			switch (binOp.kind) {
			case ADD:
				expr = new LinearExpr(prefix + ((Codes.BinaryOperator) code).target());
				// v1+v2
				((LinearExpr) expr).addVar(BigInteger.ONE, prefix + binOp.operand(0));
				((LinearExpr) expr).addVar(BigInteger.ONE, prefix + binOp.operand(1));
				break;
			case SUB:
				expr = new LinearExpr(prefix + ((Codes.BinaryOperator) code).target());
				// v1-v2
				((LinearExpr) expr).addVar(BigInteger.ONE, prefix + binOp.operand(0));
				((LinearExpr) expr).addVar(BigInteger.ONE.negate(), prefix + binOp.operand(1));// -1*v2
				break;
			/*case RANGE:
				// target = [op_0 ... op_1]
				expr = new RangeExpr(prefix + binOp.target(), (LinearExpr) getExpr(prefix + binOp.operand(0)), (LinearExpr) getExpr(prefix
						+ binOp.operand(1)));
				break;*/
			default:
				throw new RuntimeException(binOp.kind + "Not implemented");
			}
		} else if (code instanceof Codes.LengthOf) {
			expr = new LinearExpr(prefix + ((Codes.LengthOf) code).target());
			Codes.LengthOf lengthOf = (Codes.LengthOf) code;
			((LinearExpr) expr).addVar(BigInteger.ONE, "|" + prefix + lengthOf.operand(0) + "|");
		} else if (code instanceof Codes.IndexOf) {
			Codes.IndexOf indexof = (Codes.IndexOf) code;
			expr = new Expr(prefix + indexof.target(), code);
		} else if (code instanceof Codes.NewList) {
			Codes.NewList newlist = (Codes.NewList) code;
			// Create the empty list, i.e. ()
			expr = new LinearExpr(prefix + newlist.target());
			// Add the
			((LinearExpr) expr).addVar(BigInteger.ONE, "()");
		}
		return expr;
	}

	/**
	 * Check if the code is a constant assignment and put the symbol and value
	 * into the symbol table.
	 *
	 * @param code
	 */
	private void addExprToTable(Expr expr) {
		if (expr != null && expr.getTarget() != null) {
			// Check if the target exists in the expression table.
			if (!expressiontable.containsKey(expr.getTarget())) {
				/*if (config.isVerbose()) {
					System.out.println(expr.getTarget() + " = " + expr);
				}*/
				// Add to the expression table.
				expressiontable.put(expr.getTarget(), expr);
			}
		}
	}

	/**
	 * Get the expression from expression table. If the return expression is a
	 * linear expression, then it is rewritten to the normal form which is no
	 * longer rewritten by other expressions quals by quals.
	 * 
	 * @param target
	 * @return value(Expr). If not found, return null.
	 */
	public Expr getExpr(String target) {
		if (expressiontable.containsKey(target)) {
			return expressiontable.get(target);
		}
		return null;
	}

	/**
	 * Get the unassigned registers by searching the maximal value of register.
	 * 
	 * @return the register.
	 */
	public int getAvailableReg() {
		// Start from -1
		int max_reg = -1;
		for (String key : expressiontable.keySet()) {
			int reg = Integer.parseInt(key.replace("%", ""));
			if (reg > max_reg) {
				max_reg = reg;
			}
		}
		return ++max_reg;
	}

	/**
	 * Given a input expression, recursively replace the element with the
	 * expression retrieved from the expression table.
	 * 
	 * @param var
	 *            the name of variable
	 * @param linearExpr
	 *            the input expression
	 * @return the updated expression.
	 */
	private LinearExpr replaceLinearExpr(String var, LinearExpr linearExpr) {
		LinearExpr var_linearExpr = (LinearExpr) getExpr(var);
		if (var_linearExpr == null)
			return linearExpr;
		linearExpr = linearExpr.merge(var, var_linearExpr);
		String[] vars = linearExpr.getVars();
		for (String new_var : vars) {
			if (new_var != null && !new_var.equals(var)) {
				// check if the new var is not the existing var
				linearExpr = (LinearExpr) replaceLinearExpr(new_var, linearExpr);
			}
		}
		return linearExpr;

	}

	/**
	 * Replace each variable in a linear expression with the expressions from
	 * the table.
	 * 
	 * @param Expr
	 *            the original expression.
	 * @return the simplified expression.
	 */
	public Expr rewriteExpr(Expr init) {
		// Rewrite the linear expression
		if (init != null && init instanceof LinearExpr) {
			LinearExpr linearExpr = (LinearExpr) init;
			String[] vars = linearExpr.getVars();
			for (String var : vars) {
				linearExpr = this.replaceLinearExpr(var, linearExpr);
			}
			return linearExpr;
		}
		return init;
	}

	/**
	 * Create a expression and put it to the table
	 * 
	 * @param object
	 * @return
	 */
	public Expr putExpr(Object object) {
		Expr expr = null;

		// Return the constant expression, e.g. 1 = 1
		if (object instanceof BigInteger) {
			expr = createExpr((BigInteger) object);
		}

		// Return the assignment, e.g. %0 = %0
		if (object instanceof Type) {
			expr = createExpr((Type) object);
		}

		if (object instanceof Code) {
			expr = createExpr((Code) object);
		}

		addExprToTable(expr);
		return expr;
	}

	/**
	 * Extract the decrement value from the 'assignment' bytecode of loop
	 * variable. Get the decremental value for the given loop variable. The
	 * conditions are
	 * <ul>
	 * <li>reassigned the value of loop variable
	 * <li>decrement the value by the constant ONE
	 * </ul>
	 * For example, the loop variable is assigned to a temporary variable (%3 =
	 * %16) which performs the subtraction on the loop variable (%16 = %3 - %15
	 * and %15 = 1)
	 * 
	 * @param assign
	 *            the 'assignment' bytecode
	 * @param loop_var
	 *            the loop variable
	 * @return the decrement (BigInteger). If not found, return null.
	 */
	public BigInteger extractDecrement(Codes.Assign assign, String loop_var) {

		// Get the temporary variable, e.g. %16
		LinearExpr linearExpr = (LinearExpr) getExpr(prefix + assign.operand(0));
		// Check if the loop variable is used in the expression for the tmp
		// variable.
		String[] vars = linearExpr.getVars();
		if (linearExpr.getVarIndex(loop_var) == 0 && vars.length == 2) {
			String decr_op = vars[1];
			// Find the coefficient of the decremental variable in the expr
			BigInteger coefficient = linearExpr.getCoefficient(decr_op);
			// Check if the op kind is a subtraction
			if (coefficient.signum() < 0) {
				LinearExpr decrement = (LinearExpr) getExpr(decr_op);
				return decrement.getConstant();
			}
		}
		return null;
	}

	/**
	 * Extract the increment value from the re-assignment bytecode of the loop
	 * variable.
	 *
	 * Get the incremental value for the given loop variable. The conditions are
	 * <ul>
	 * <li>reassign the value of loop variable
	 * <li>increment the value by the constant ONE
	 * </ul>
	 * For example, the loop variable is assigned to a temporary variable (%3 =
	 * %14) which performs the subtraction on the loop variable (%14 = %3 + %13
	 * and %13 = 1)
	 * 
	 * @param assign
	 * @param loop_var
	 * @return increment value (BigInteger). If not matched, return null;
	 */
	public BigInteger extractIncrement(Codes.Assign assign, String loop_var) {
		// Get the temporary variable, e.g. %16
		LinearExpr linearExpr = (LinearExpr) getExpr(prefix + assign.operand(0));
		// Check if the loop variable is used in the expression for the tmp
		// variable.
		String[] vars = linearExpr.getVars();
		if (linearExpr.getVarIndex(loop_var) == 0 && vars.length == 2) {
			String incr_op = vars[1];
			// Find the coefficient of the incremental variable in the expr
			BigInteger coefficient = linearExpr.getCoefficient(incr_op);
			// Check if the op kind is a addition
			if (coefficient.signum() > 0) {
				LinearExpr increment = (LinearExpr) getExpr(incr_op);
				return increment.getConstant();
			}
		}
		return null;
	}

}
