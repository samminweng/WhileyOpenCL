package wyopcl.bound;
/**
 * Provides a container to store the configuration of an analyzer.
 * @author Min-Hsien Weng
 *
 */
public final class AnalyzerConfigure {	
	/* Determine the widen strategy. */
	public enum WidenStrategy{
		//Widen the bounds upto +/- infinity
		NAIVE,
		//Widen the bounds against a list of threshold values
		GRADUAL
	}
	
	private WidenStrategy widen_strategy = WidenStrategy.NAIVE;

	public WidenStrategy getWiden_strategy() {
		return widen_strategy;
	}
	
	public void setWiden_strategy(WidenStrategy widen_strategy) {
		this.widen_strategy = widen_strategy;
	}
	
	/**
	 * Determine whether the bound analyzer analyzes the bounds
	 * of function
	 */
	public enum InvokeFunction{
		DirectInvoke,
		FunctionOnly
	}
	/**Directly invoke the functions by default.*/
	private InvokeFunction invoked = InvokeFunction.DirectInvoke;

	public InvokeFunction getInvoked() {
		return invoked;
	}

	public void setInvoked(InvokeFunction invoked) {
		this.invoked = invoked;
	}
	
	

	

	
}
