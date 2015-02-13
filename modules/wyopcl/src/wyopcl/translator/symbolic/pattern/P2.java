package wyopcl.translator.symbolic.pattern;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import wyil.lang.Code;
import wyil.lang.Codes;
import wyopcl.translator.symbolic.Expr;
/**
 * Implemented the while-loop patterns, as follows:
 * <ul>
 * <li>while_loop && loop_var(V)  && incr(V,+1) && init(V,Init) && while_cond(V, "<", UpperExpr) => loop_iters(V, UpperExpr - Init)
 * <li>while_loop && loop_var(V)  && incr(V,+1) && init(V,Init) && while_cond(V, "<=", UpperExpr) => loop_iters(V, UpperExpr - Init +1 )
 * </ul>
 * @author Min-Hsien Weng
 *
 */
public class P2 extends Pattern{
	private BigInteger incr;


	public P2(List<Code> blk, HashMap<String, Expr> expressiontable) {
		super(blk, expressiontable);
		this.type = "P2";
		this.loopbody_pre = new ArrayList<Code>();
		this.loopbody_incr = new ArrayList<Code>();
		this.loopbody_post = new ArrayList<Code>();
		this.loopexit = new ArrayList<Code>();

		this.line = incr(blk, this.V, loopbody_pre, loopbody_incr, loopbody_post, loopexit, this.line);
		if(V != null && this.initExpr != null && this.loop_boundExpr != null && this.incr != null){
			this.isNil = false;
		}else{
			this.isNil = true;
		}			
	}


	@Override
	public String toString() {
		return type + ":while_loop && loop_var("+V+") && incr("+V+", "+incr+")"
				+ " && init("+V+", "+initExpr+") &&  while_cond("+V+", "+comparatorOp+", "+loop_boundExpr+")"
				+ "\n=>loop_iters("+V+", " + getNumberOfIterations()+")";
	}

	@Override
	public Expr getNumberOfIterations() {
		if(numberOfIterations==null){
			Expr result = (Expr)loop_boundExpr.clone();
			if(comparatorOp.equals("<")){
				numberOfIterations = result.subtract(initExpr);
			}else{
				numberOfIterations = result.subtract(initExpr).add(new Expr(BigInteger.ONE));
			}			
		}		
		return numberOfIterations;
	}


	private BigInteger getIncrement(Codes.Assign assign, String loop_var){
		//Check if the assignment bytecode is to over-write the value of loop variable.
		if(loop_var.equals(prefix+assign.target())){
			//Get the temporary variable, e.g. %16
			Expr expr = getExpr(prefix+assign.operand(0));
			//Check if the loop variable is used in the expression for the tmp variable.
			String[] vars = expr.getVars();
			if(expr.getVarIndex(V) == 0 && vars.length == 2){
				String incr_op = vars[1];
				//Find the coefficient of the incremental variable in the expr 
				BigInteger coefficient = expr.getCoefficient(incr_op);
				//Check if the op kind is a addition
				if(coefficient.signum()>0){
					Expr increment = getExpr(incr_op);
					return increment.getConstant();
				}
			}
		}
		return null;
	}

	/**
	 * Get the incremental value for the given loop variable. The conditions are
	 * <ul>
	 * 	<li>reassign the value of loop variable
	 *  <li>increment the value by the constant ONE
	 * </ul>
	 * For example, the loop variable is assigned to a temporary variable (%3 = %14)  
	 * which performs the subtraction on the loop variable (%14 = %3 + %13 and %13 = 1) 
	 * 
	 * @return increment value (Expr). If not matched, return null;
	 */
	private int incr(List<Code> code_blk, String loop_var,
			List<Code> loopbody_pre,
			List<Code> loopbody_incr,
			List<Code> loopbody_post,
			List<Code> loopexit, int line){
		//Check if the loop variable is inferred.
		if(loop_var == null) return line;

		//Get loop label
		Codes.Loop loop = (Codes.Loop)loop_header.get(0);
		String loop_label = loop.target;

		//Search for the decrement.
		//The flag that specifies the pattern part.
		List<Code> blk = loopbody_pre;
		int index;
		for(index=line; index<code_blk.size();index++){
			Code code = code_blk.get(index);
			if(!checkAssertOrAssume(code)){
				if(code instanceof Codes.Assign){
					//Check if the assignment bytecode is to over-write the value of loop variable.
					Codes.Assign assign = (Codes.Assign)code;				
					this.incr = getIncrement((Codes.Assign)code, loop_var);
					if(this.incr != null){
						loopbody_incr.add(assign);
						blk = loopbody_post;
					}				
				}else if(code instanceof Codes.LoopEnd){
					//Search for the loop end
					Codes.LoopEnd loopend = (Codes.LoopEnd)code;
					if(loopend.label.equals(loop_label)){
						//change the blk to loop exit.
						loopbody_post.add(code);
						blk = loopexit;
					}				
				}else{
					blk.add(code);
				}
			}
		}
		return line;

	}


}
