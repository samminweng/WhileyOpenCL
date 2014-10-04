package wyopcl.bound.analyzer;

import wyil.lang.Codes;
import wyopcl.bound.Analyzer;
import wyopcl.bound.ConstraintList;
/**
 * Parse the 'label' bytecode, get the constraint list by the label and set it to the current
 * constraint list. If the constraint list does not exist, then create a constraint list and
 * put it to the map with the key of label and value of the newly created list. 
 * @author Min-Hsien Weng
 *
 */
public class LabelAnalyzer extends Analyzer {
	private static LabelAnalyzer instance;	
	public LabelAnalyzer(){
	}
	
	/*Implement the 'Singleton' pattern to ensure this class has one instance.*/
	public static LabelAnalyzer getInstance(){	
		if (instance == null){
			instance = new LabelAnalyzer();
		}	
		return instance;
	}
	
	public void analyze(Codes.Label code){
		//check if map contains the constrainlist.
		String label = code.label;
		if(!Analyzer.constraintListMap.containsKey(label)){
			ConstraintList newlist = new ConstraintList();
			Analyzer.constraintListMap.put(label, newlist);
		}
		
		//Switch the current constraint list
		Analyzer.constraintlist = Analyzer.constraintListMap.get(code.label);	
		
	}
}
