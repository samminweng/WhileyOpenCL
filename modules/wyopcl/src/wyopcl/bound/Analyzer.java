package wyopcl.bound;

import java.util.HashMap;

import wybs.lang.Build;
import wybs.lang.Build.Project;
import wycc.util.Logger;
import wyil.lang.WyilFile;
import wyil.lang.Code.Block;
import wyil.lang.Type.FunctionOrMethod;
import wyopcl.WyopclBuilder;
/***
 * A abstract class to store the values of verbose, WyilFile module, file name and arguments.
 * All the analyzers are extended from this abstract class, so that they can access the above
 * information.
 *    
 * @author Min-Hsien Weng
 *
 */
public abstract class Analyzer {
	//The hashmap stores the constraints with in the label value in each method or function.
	protected static HashMap<String, ConstraintList> constraintListMap = new HashMap<String, ConstraintList>();
	//Current constraint list
	protected static ConstraintList constraintlist;
	
	protected static Build.Project project;
	protected static String filename;
	protected static boolean verbose = false;
	protected static WyilFile module;
	protected static String[] args;
	
	/**
	 * For logging information.
	 */
	protected Logger logger = Logger.NULL;
	
	public Project project() {
		return this.project;
	}
	
	public void setLogger(Logger logger) {
		this.logger = logger;		
	}
	
	public void setVerbose(boolean verbose) {
		this.verbose = verbose;		
	}

	public void setArgs(String[] arguments) {
		this.args = arguments;		
	}
}
