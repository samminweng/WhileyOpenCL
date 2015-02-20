package wyopcl.translator.symbolic.expression;

import wyil.lang.Codes;

public class RangeExpr extends Expr {
	private LinearExpr lower;
	private LinearExpr upper;
	
	public RangeExpr(String target, LinearExpr lower, LinearExpr upper) {
		super(target);
		this.lower = lower;
		this.upper = upper;
	}
	
	public LinearExpr getLower(){
		return this.lower;
	}

	public LinearExpr getUpper(){
		return this.upper;
	}
	
	@Override
	public String toString() {
		return "(" + lower + ", " + upper + ")";
	}
}
