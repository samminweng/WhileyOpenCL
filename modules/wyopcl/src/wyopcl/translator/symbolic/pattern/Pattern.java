package wyopcl.translator.symbolic.pattern;

import java.util.HashMap;
import java.util.List;

import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Codes.Comparator;
import wyopcl.translator.symbolic.Expr;

/**
 * The abstract class for all pattern classes. This class is implemented with
 * <a href="http://www.tutorialspoint.com/design_pattern/null_object_pattern.htm">null object pattern</a>
 * @author Min-Hsien Weng
 *
 */
public abstract class Pattern {
	protected final String prefix = "%";
	protected String type;//The pattern type
	protected boolean isNil;
	protected Expr numberOfIterations;// the number of loop iterations in affine form. 
	protected final HashMap<String, Expr> expressiontable;
	protected final List<Code> blk;
	public Pattern(List<Code> blk, HashMap<String, Expr> expressiontable){
		this.blk = blk;
		this.expressiontable = expressiontable;
	}

	public boolean isNil() {
		return this.isNil;
	}
	public abstract Expr getNumberOfIterations();

	/**
	 * Find the loop variable
	 * @return the variable (string). If not found, return null.
	 */
	protected String loop_var() {
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
	 * Get the value from expression table.
	 * @param op
	 * @return value(Expr). If not found, return null.
	 */
	protected Expr getExpr(String op) {
		if(expressiontable.containsKey(op)){
			return expressiontable.get(op);						
		}		
		return null;
	}

	

}
