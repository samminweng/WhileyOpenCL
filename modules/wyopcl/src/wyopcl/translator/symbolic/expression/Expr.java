package wyopcl.translator.symbolic.expression;

public abstract class Expr implements Cloneable{
	protected String target;
	protected final String prefix ="%";
	
	public Expr(String target){
		this.target = target;
	}
	
	
	/**
	 * Get the target operand.
	 * @return
	 */
	public String getTarget(){
		return target;
	}

}
