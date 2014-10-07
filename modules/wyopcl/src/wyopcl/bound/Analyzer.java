package wyopcl.bound;

import java.util.HashMap;
import java.util.Iterator;

import wybs.lang.Build;
import wybs.lang.Build.Project;
import wycc.util.Logger;
import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.WyilFile;
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
	
	public ConstraintList getConstraintList(){
		if(!constraintListMap.containsKey(label)){
			ConstraintList constraintlist = new ConstraintList();
			constraintListMap.put(label, constraintlist);
		}		
		return constraintListMap.get(label);
	}

	public void putConstraintList(String label, ConstraintList list){
		constraintListMap.put(label, list);
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
