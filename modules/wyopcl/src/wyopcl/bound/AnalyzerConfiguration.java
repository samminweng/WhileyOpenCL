package wyopcl.bound;

import wybs.lang.Build;
import wycc.util.Logger;

/**
 * Provides a container to store the configuration of an analyzer.
 * @author Min-Hsien Weng
 *
 */
public final class AnalyzerConfiguration {
	private final Build.Project project;
	
	public Build.Project getProject() {
		return project;
	}

	public AnalyzerConfiguration(Build.Project project){
		this.project = project;
	}	
	
	/* Determine the widen strategy. */
	public enum WidenStrategy{
		//Widen the bounds upto +/- infinity
		NAIVE,
		//Widen the bounds against a list of threshold values
		MULTILEVEL
	}
	
	private WidenStrategy widen_strategy = WidenStrategy.NAIVE;
	
	/**Directly invoke the functions by default.*/
	private boolean isInvoked;
	private String filename;
	private boolean verbose = false;
	/**
	 * For logging information.
	 */
	protected Logger logger = Logger.NULL;
	
	public boolean isMultiWiden() {
		if(widen_strategy.equals(WidenStrategy.MULTILEVEL)){
			return true;
		}		
		return false;
	}
	
	public void setWiden_strategy(WidenStrategy widen_strategy) {
		this.widen_strategy = widen_strategy;
	}	
	
	public boolean isFunctionCall() {		
		return isInvoked;
	}

	public void setInvoked(boolean isInvoked) {
		this.isInvoked = isInvoked;
	}	
	
	public void setLogger(Logger logger) {
		this.logger = logger;		
	}

	public boolean isVerbose() {
		return verbose;
	}
	
	public void setVerbose(boolean verbose) {
		this.verbose = verbose;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}
	
}
