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
	
	public void analyze(){
		//Iterates through all the constraint lists and infer each list's fixed point.
		Iterator<java.util.Map.Entry<String, ConstraintList>> iterator = constraintListMap.entrySet().iterator();
		Bounds unionBounds = new Bounds();
		while(iterator.hasNext()){
			java.util.Map.Entry<String, ConstraintList> entry = iterator.next();
			//Infer the bounds consistent with all constraints.
			ConstraintList list = entry.getValue();
			String label = entry.getKey();
			Bounds bnd = new Bounds();
			list.inferFixedPoint(bnd);
			if(Analyzer.verbose){
				System.out.println("\n"+label+":"+
						"\n"+bnd.toString()
						+"\nisBoundConsistency="+bnd.checkBoundConsistency());
			}				
			unionBounds.union(bnd);
		}
		
		
		System.out.println("\nUnion Bounds:"+
				"\n"+unionBounds.toString()
				+"\nisBoundConsistency="+unionBounds.checkBoundConsistency());
		
		//Clear the map
		constraintListMap.clear();
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
	
	public void setVerbose(boolean verbose) {
		Analyzer.verbose = verbose;		
	}

	public static void setProject(Build.Project project) {
		Analyzer.project = project;
	}
}
