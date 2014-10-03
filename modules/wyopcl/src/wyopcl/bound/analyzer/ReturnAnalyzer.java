package wyopcl.bound.analyzer;

import wyil.lang.Codes;
import wyopcl.bound.Analyzer;
import wyopcl.bound.Bounds;
import wyopcl.bound.ConstraintList;

public class ReturnAnalyzer extends Analyzer {
	private static ReturnAnalyzer instance;	
	public ReturnAnalyzer(){
	}
	
	/*Implement the 'Singleton' pattern to ensure this class has one instance.*/
	public static ReturnAnalyzer getInstance(){	
		if (instance == null){
			instance = new ReturnAnalyzer();
		}	
		return instance;
	}
	
	public void analyze(Codes.Return code){
		
	}
}
