package wyopcl.bound.analyzer;

import wyil.lang.Codes;
import wyopcl.bound.Bounds;
import wyopcl.bound.ConstraintList;
/**
 * Parses the 'If' bytecode to add the constraints to the list.
 * @author Min-Hsien Weng
 *
 */
public class IfAnalyzer {
	private static IfAnalyzer instance;	
	public IfAnalyzer(){
	}
	
	/*Implement the Singleton pattern to ensure this class has one instance.*/
	public static IfAnalyzer getInstance(){	
		if (instance == null){
			instance = new IfAnalyzer();
		}	
		return instance;
	}
	
	public void analyze(Codes.If code, Bounds bnd, ConstraintList list){
		
		
	}
	
}
