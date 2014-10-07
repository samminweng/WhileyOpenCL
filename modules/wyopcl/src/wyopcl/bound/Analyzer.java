package wyopcl.bound;

import java.util.HashMap;
import java.util.Iterator;

import wybs.lang.Build;
import wybs.lang.Build.Project;
import wycc.util.Logger;
import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.WyilFile;
import wyopcl.bound.constraint.Constraint;
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
	private static HashMap<String, ConstraintList> constraintListMap = new HashMap<String, ConstraintList>();
	private static String label = "";
	
	private static Build.Project project;
	private static String filename;
	private static boolean verbose = false;
	private static WyilFile module;
	private static String[] args;
	
	/**
	 * For logging information.
	 */
	protected Logger logger = Logger.NULL;
	
	public Project project() {
		return Analyzer.project;
	}
	
	/**
	 * Print out the bytecode.
	 * @param code
	 */
	public void printBytecode(Code code){
		if(code instanceof Codes.Label){
			System.out.println(code);
		}else{
			System.out.println("\t"+code);
		}
		
	}
	
	
	public HashMap<String, ConstraintList> getConstranitListMap(){
		return constraintListMap;
	}
	
	public void clearConstraintListMap(){
		constraintListMap.clear();
	}
	
	/**
	 * Return the current constraint list.
	 * @return the constraint list.
	 */
	private ConstraintList getCurrentConstraintList(){
		if(!constraintListMap.containsKey(label)){
			//Clone the current constraint list to make a new one.
			ConstraintList list = new ConstraintList();
			constraintListMap.put(label, list);
		}		
		return constraintListMap.get(label);
	}
	
	/**
	 * Adds the constraint to the current constraint list.
	 * @param c
	 */
	public void addConstraint(Constraint c){				
		ConstraintList list = getCurrentConstraintList();
		list.addConstraint(c);
	}
	
	/**
	 * Branches the current constraint list and adds the 
	 * constraint to the cloned list.
	 * @param new_label the name of new branch.
	 * @param c constraint
	 */
	public void branchandAddConstraint(String new_label, Constraint c){
		ConstraintList current_list = getCurrentConstraintList();
		ConstraintList new_list;
		//Cloned the current constraint list. 
		new_list = (ConstraintList) current_list.clone();
		new_list.addConstraint(c);
		constraintListMap.put(new_label, new_list);
		
	}
	

	public static void setLabel(String label) {
		Analyzer.label = label;
	}
	
	public static String getFilename() {
		return filename;
	}

	public static void setFilename(String filename) {
		Analyzer.filename = filename;
	}

	public static WyilFile getModule() {
		return module;
	}

	public static void setModule(WyilFile module) {
		Analyzer.module = module;
	}

	public static String[] getArgs() {
		return args;
	}

	public static void setArgs(String[] args) {
		Analyzer.args = args;
	}
	
	public void setLogger(Logger logger) {
		this.logger = logger;		
	}
	
	public static void setVerbose(boolean verbose) {
		Analyzer.verbose = verbose;		
	}

	public static boolean isVerbose(){
		return Analyzer.verbose;
	}
	public static void setProject(Build.Project project) {
		Analyzer.project = project;
	}
}
