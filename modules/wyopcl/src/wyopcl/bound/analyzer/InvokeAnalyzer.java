package wyopcl.bound.analyzer;

import wyopcl.bound.Analyzer;
/**
 * Parses the invoke bytecode and adds the constraints to the list. 
 * @author Min-Hsien Weng
 *
 */
public class InvokeAnalyzer extends Analyzer {
	private static InvokeAnalyzer instance;	
	public InvokeAnalyzer(){
	}
	
	/*Implement the 'Singleton' pattern to ensure this class has one instance.*/
	public static InvokeAnalyzer getInstance(){	
		if (instance == null){
			instance = new InvokeAnalyzer();
		}	
		return instance;
	}
	
	
	
}
