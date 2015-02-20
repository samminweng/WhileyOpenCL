package wyopcl.translator.symbolic.expression;

import java.math.BigInteger;
import java.util.HashMap;

import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Constant;

/**
 * Create a factory to generate the expression based on the input type.
 * @author Min-Hsien Weng
 *
 */
public class ExprFactory {
	private final String prefix ="%";
	private HashMap<String, Expr> expressiontable;//Store the register along with the corresponding expression.
	
	public ExprFactory(){
		this.expressiontable = new HashMap<String, Expr>();
	}
	
	/**
	 * Initial the linear expression with the bytecode.
	 * @param code
	 * @return
	 */
	private Expr initializeExprWithByteCode(Code code){
		Expr expr = null;
		if(code instanceof Codes.Assign){
			expr = new LinearExpr(prefix+((Codes.Assign)code).target());	
			Codes.Assign assign = (Codes.Assign)code;
			//1*v1
			((LinearExpr) expr).addVar(BigInteger.ONE, prefix+assign.operand(0));
		}else if(code instanceof Codes.Const){
			expr = new LinearExpr(prefix+((Codes.Const)code).target());
			Constant constant = ((Codes.Const)code).constant;
			if(constant instanceof Constant.Integer){
				//c0
				((LinearExpr) expr).addConstant(((Constant.Integer) constant).value);	
			}
		}else if(code instanceof Codes.BinaryOperator){
			
			Codes.BinaryOperator binOp = (Codes.BinaryOperator)code;
			switch(binOp.kind){
			case ADD:
				expr = new LinearExpr(prefix+((Codes.BinaryOperator)code).target());
				//v1+v2
				((LinearExpr) expr).addVar(BigInteger.ONE, prefix+binOp.operand(0));
				((LinearExpr) expr).addVar(BigInteger.ONE, prefix+binOp.operand(1));
				break;
			case SUB:
				expr = new LinearExpr(prefix+((Codes.BinaryOperator)code).target());
				//v1-v2
				((LinearExpr) expr).addVar(BigInteger.ONE, prefix+binOp.operand(0));
				((LinearExpr) expr).addVar(BigInteger.ONE.negate(), prefix+binOp.operand(1));//-1*v2
				break;
			case RANGE:
				//target = [op_0 ... op_1]
				expr = new RangeExpr(prefix+binOp.target(), 
									 (LinearExpr)getExpr(prefix+binOp.operand(0)),
									 (LinearExpr)getExpr(prefix+binOp.operand(1)));
				break;
			default:
				throw new RuntimeException(binOp.kind+"Not implemented");				
			}			
		}else if(code instanceof Codes.LengthOf){
			expr = new LinearExpr(prefix+((Codes.LengthOf)code).toString());
			Codes.LengthOf lengthOf = (Codes.LengthOf)code;
			((LinearExpr) expr).addVar(BigInteger.ONE, "|"+prefix+lengthOf.operand(0)+"|");
		}		
		return expr;
	}
	
	
	/**
	 * Check if the code is a constant assignment and put the symbol and value into the symbol table. 
	 *
	 * @param code
	 */
	private void addExprToTable(Expr expr){
		if(expr != null && expr.getTarget()!=null){
			//Check if the target exists in the expression table.
			if(!expressiontable.containsKey(expr.getTarget())){
				System.out.println(expr.getTarget() + " = "+ expr);
				//Add to the expression table.
				expressiontable.put(expr.getTarget(), expr);
			}			
		}
	}
	
	/**
	 * Get the value from expression table.
	 * @param op
	 * @return value(Expr). If not found, return null.
	 */
	public Expr getExpr(String op) {
		if(expressiontable.containsKey(op)){
			return expressiontable.get(op);						
		}		
		return null;
	}
	
	
	/**
	 * Given a input expression, recursively replace the element with the expression retrieved from the expression table.
	 * @param var the name of variable
	 * @param linearExpr the input expression 
	 * @return the updated expression.
	 */
	private LinearExpr replaceLinearExpr(String var, LinearExpr linearExpr) {
		LinearExpr var_linearExpr = (LinearExpr) getExpr(var);
		if(var_linearExpr == null) return linearExpr;

		linearExpr = linearExpr.merge(var, var_linearExpr);
		String[] vars = linearExpr.getVars();
		for(String new_var: vars){
			if(new_var != null && !new_var.equals(var)){
				//check if the new var is not the existing var
				linearExpr = replaceLinearExpr(new_var, linearExpr);				
			}			
		}		
		return linearExpr;
	}
	/**
	 * Replace each variable in a linear expression with the expressions from the table.
	 * @param linearExpr the original expression.
	 * @return the simplified expression.
	 */
	public LinearExpr replaceLinearExpr(LinearExpr linearExpr){
		String[] vars = linearExpr.getVars();
		for(String var: vars){
			linearExpr= this.replaceLinearExpr(var, linearExpr);  
		}
		return linearExpr;
	}
	
	
	/**
	 * Create a expression and put it to the table
	 * @param object
	 * @return
	 */
	public Expr putExpr(Object object){
		Expr expr = null;

		//Return the assignment, e.g. %0 = %0
		if(object instanceof String){
			String var = object.toString();
			expr = new LinearExpr(var);
			((LinearExpr) expr).addVar(BigInteger.ONE, var);
			addExprToTable(expr);
		}
		
		//Return the constant expression, e.g. 1 = 1 
		if(object instanceof BigInteger){
			expr = new LinearExpr(null);
			((LinearExpr) expr).addConstant((BigInteger)object);
		}
		
		if(object instanceof Code){
			expr = initializeExprWithByteCode((Code)object);
			addExprToTable(expr);
		}	
		
		return expr;
	}
	

}
