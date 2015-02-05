package wyopcl.translator.symbolic.pattern;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;

import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Codes.BinaryOperatorKind;
import wyil.lang.Codes.Comparator;
import wyopcl.translator.symbolic.Expr;
/**
 * while_loop && loop_var(V) && decr(V, 1) && init(V, Init) &&  while_cond(V, "> ", LowerExpr) => loop_iters(V, Init - LowerExpr)
 * @author Min-Hsien Weng
 *
 */
public class P1 extends Pattern{
	private final String V;
	private final Expr initExpr;
	private final BigInteger decr;
	private final Expr lowerExpr;
	private final HashMap<String, Expr> expressiontable;
	private final List<Code> blk;

	public P1(List<Code> blk, HashMap<String, Expr> expressiontable) {
		this.expressiontable = expressiontable;
		this.blk = blk;
		this.type = "P1";		
		this.V = loop_var();
		this.initExpr = init(this.V);
		this.decr = decr(this.V);
		this.lowerExpr = while_cond(this.V, ">");
		if(this.V!=null&&this.initExpr!=null&&
		  this.decr!=null&&this.decr.compareTo(BigInteger.ONE)==0&&
		  this.lowerExpr!=null){
			this.isNil = true;
		}else{
			this.isNil = false;
		}	
	}

	/**
	 * Check if the code is a constant assignment and put the symbol and value into the symbol table. 
	 *
	 * @param code
	 */
	private void putExpr(Expr expr){
		System.out.println(expr.getTarget() + " = "+ expr);
		expressiontable.put(expr.getTarget(), expr);	
	}

	/**
	 * Get the symbol value from symbol table.
	 * @param op
	 * @return value(Expr). If not found, return null.
	 */
	private Expr getExpr(String op){
		if(expressiontable.containsKey(op)){
			return expressiontable.get(op);						
		}		
		return null;
	}


	@Override
	public String toString() {
		return type + ":while_loop && loop_var("+V+") && decr("+V+", "+decr+")"
				+ " && init("+V+", "+initExpr+") &&  while_cond("+V+", > , "+lowerExpr+")"
				+ "\n=>loop_iters("+V+", " + getNumberOfIterations()+")";
	}

	@Override
	public boolean isNil() {
		return this.isNil;
	}
	
	@Override
	public Expr getNumberOfIterations() {
		if(numberOfIterations==null){
			Expr result = (Expr)initExpr.clone();
			numberOfIterations = result.subtract(lowerExpr);
		}		
		return numberOfIterations;
	}


	/**
	 * Find the loop variable
	 * @return the variable (string). If not found, return null.
	 */
	private String loop_var() {
		//Get the loop bytecode		
		if(blk.get(0) instanceof Codes.Loop){
			//Get all the modified operands
			Codes.Loop loop = (Codes.Loop)blk.get(0);
			for(int op:  loop.modifiedOperands){
				String var = prefix+op;
				for(Code code: blk){
					//Check if the operand is a loop variable in the loop condition
					if(code instanceof Codes.If){
						Codes.If if_code = (Codes.If)code;
						//Check if the var is used in the if-else bytecode 
						if(var.equals(prefix+if_code.leftOperand)){
							return var;
						}
					}
				}
			}
		}
		return null;
	}

	/**
	 * Given a input expression, recursively replace the element with the expression retrieved from the expression table.
	 * @param var the name of variable
	 * @param expr the input expression 
	 * @return the updated expression.
	 */
	private Expr replaceExpr(String var, Expr expr){
		Expr var_expr = getExpr(var);
		if(var_expr == null) return expr;
		
		expr = expr.merge(var, var_expr);
		String[] vars = expr.getVars();
		for(String new_var: vars){
			expr = replaceExpr(new_var, expr);
		}		
		return expr;
	}
	
	

	/**
	 * Get the initial value of loop variable from expression table.
	 * @param V the loop variable
	 * @return initial value (Expr). If not found, return null.
	 */
	private Expr init(String V){
		Expr init = getExpr(V);
		String[] vars = init.getVars();
		for(String var: vars){
			init= replaceExpr(var, init);  
		}		
		return init;
	}

	/**
	 * Get the decremental value for the given loop variable.
	 * @return decrement value (Expr). If not matched, return null;
	 */
	private BigInteger decr(String V){
		if(V!= null){
			for(Code code: blk){							
				if(code instanceof Codes.BinaryOperator || code instanceof Codes.Const){	
					//Create an expression
					putExpr(new Expr(code));					
				}else if(code instanceof Codes.Assign){
					//Check if the assignment bytecode is to over-write the value of loop variable.
					Codes.Assign assign = (Codes.Assign)code;
					String target = prefix+assign.target();
					//Get the temporary variable
					Expr expr = getExpr(prefix+assign.operand(0));
					if(expr!=null && target.equals(V)){
						//Find the coefficient of the decremental variable in the expr 
						for(String var: expr.getVars()){
							BigInteger coefficient = expr.getCoefficient(var);
							//Check if the op kind is subtract
							if(!var.equals(V)&&coefficient.signum()<0){
								Expr decrement = getExpr(V);
								return decrement.getConstant();
							}
						}
					}
				}
			}
		}
		return null;
	}

	private Expr while_cond(String V, String compareOp){
		if(V != null){
			for(Code code: blk){
				if(code instanceof Codes.If){
					Codes.If if_code = (Codes.If)code;
					//Check if the loop var occurs in the condition
					if(V.equals(prefix+if_code.leftOperand)){
						//switch(compareOp){
						//case ">":
						if(if_code.op.equals(Comparator.LTEQ)){
							//Get the expression 
							return getExpr(prefix+if_code.rightOperand);
						}
						//	break;
						/*//case ">=":
							if(if_code.op.equals(Comparator.LT)){
								return new Expr(code);	
							}
							break;
						case "<":
							if(if_code.op.equals(Comparator.GTEQ)){
								return new Expr(code);	
							}							
							break;
						case "<=":
							if(if_code.op.equals(Comparator.GT)){
								return new Expr(code);	
							}
							break;
						default:
							throw new RuntimeException("Unknown comparator operator "+compareOp);
						}*/
					}				
				}		
			}
		}

		return null;
	}

}
