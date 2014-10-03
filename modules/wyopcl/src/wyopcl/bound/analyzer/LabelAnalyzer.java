package wyopcl.bound.analyzer;

import wyil.lang.Codes;
import wyopcl.bound.Analyzer;
import wyopcl.bound.Bounds;
import wyopcl.bound.ConstraintList;

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
	
	public void analyze(Codes.Label code, ConstraintList list){
		System.out.println(code);
	}
}
