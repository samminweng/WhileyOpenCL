package wyopcl.translator.symbolic.pattern.expression;

import wyil.lang.Code;
import wyil.lang.Codes;

public class Expr implements Cloneable{
	protected String target;
	protected final String prefix ="_";
	protected Code code;
	
	public Expr(String target){
		this.target = target;
	}
	
	public Expr(String target, Code code){
		this(target);
		this.code = code;
	}
	
	
	/**
	 * Get the target operand.
	 * @return
	 */
	public String getTarget(){
		return target;
	}

	@Override
	public Object clone() {
		// TODO Auto-generated method stub
		try {
			return super.clone();
		} catch (CloneNotSupportedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public String toString() {
		if(code != null){
			if(code instanceof Codes.Const){
				return ((Codes.Const)code).constant+"";
			}
			return this.code.toString();
		}
		return null;
	}

	

}
