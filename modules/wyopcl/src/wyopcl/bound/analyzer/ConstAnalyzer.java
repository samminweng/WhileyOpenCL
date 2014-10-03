package wyopcl.bound.analyzer;

import wyil.lang.Codes;
import wyil.lang.Constant;
import wyopcl.bound.Analyzer;
import wyopcl.bound.Bounds;
import wyopcl.bound.ConstraintList;
import wyopcl.bound.constraint.Const;
/**
 * Parses 'Const' bytecode to add the 'Const' constraint to the list. 
 * @author Min-Hsien Weng
 *
 */
public class ConstAnalyzer extends Analyzer {
	private static ConstAnalyzer instance;	
	public ConstAnalyzer(){
	}
	
	/*Implement the 'Singleton' pattern to ensure this class has one instance.*/
	public static ConstAnalyzer getInstance(){	
		if (instance == null){
			instance = new ConstAnalyzer();
		}	
		return instance;
	}
	
	public void analyze(Codes.Const code){
		Constant constant = code.constant;
		String name = "%"+code.target();
		//Check the value is an Constant.Integer
		if(constant instanceof Constant.Integer){
			//Add the 'Const' constraint.
			this.constraintlist.addConstraint(new Const(name, ((Constant.Integer)constant).value));
		}
		
		System.out.println(code);
		
	}
}
