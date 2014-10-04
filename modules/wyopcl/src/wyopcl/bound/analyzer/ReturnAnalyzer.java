package wyopcl.bound.analyzer;

import wyil.lang.Codes;
import wyil.lang.Type;
import wyopcl.bound.Analyzer;
import wyopcl.bound.Bounds;
import wyopcl.bound.ConstraintList;
import wyopcl.bound.constraint.Equals;
/**
 * Parse the 'return' bytecode and add the constraint 
 * @author Min-Hsien Weng
 *
 */
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
		Type returnType = code.type;
		if (returnType == Type.T_VOID){
			//Do nothing
			return ;
		}
		//Get the return operand
		String ret = "%"+code.operand;
		//Check if the return type is integer.
		if(returnType instanceof Type.Int){
			//Add the 'Equals' constraint to the return (ret) variable.
			Analyzer.constraintlist.addConstraint(new Equals("return", ret));
		}
			
		
	}
}
