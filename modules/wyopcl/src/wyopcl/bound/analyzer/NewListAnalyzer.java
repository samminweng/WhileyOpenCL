package wyopcl.bound.analyzer;

import wyil.lang.Codes;
import wyil.lang.Type;
import wyopcl.bound.Analyzer;
import wyopcl.bound.constraint.Equals;
import wyopcl.bound.constraint.Union;

public class NewListAnalyzer extends Analyzer {
	private static NewListAnalyzer instance;	
	public NewListAnalyzer(){
	}
	
	/*Implement the 'Singleton' pattern to ensure this class has one instance.*/
	public static NewListAnalyzer getInstance(){	
		if (instance == null){
			instance = new NewListAnalyzer();
		}	
		return instance;
	}
	/**
	 * Add the 'equal' constraints of the target and operand register.
	 * @param code
	 */
	public void analyze(Codes.NewList code){
		
		if(code.type().element() instanceof Type.Int){
			for(int operand: code.operands()){
				this.getConstraintList().addConstraint(new Union("%"+code.target(), "%"+operand));				
			}
		}
		
	}
	
	
}
