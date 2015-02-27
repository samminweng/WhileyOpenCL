package wyopcl.translator.symbolic.expression;

import wyil.lang.Code;

public class Expr implements Cloneable{
	protected String target;
	protected final String prefix ="%";
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
		try {
			return super.clone();
		} catch (CloneNotSupportedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
