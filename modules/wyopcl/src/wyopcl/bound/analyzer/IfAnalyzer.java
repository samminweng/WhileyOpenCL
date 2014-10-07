package wyopcl.bound.analyzer;

import wyil.lang.Codes;
import wyil.lang.Type;
import wyopcl.bound.Analyzer;
import wyopcl.bound.ConstraintList;
import wyopcl.bound.constraint.GreaterThan;
import wyopcl.bound.constraint.GreaterThanEquals;
import wyopcl.bound.constraint.LessThan;
import wyopcl.bound.constraint.LessThanEquals;
/**
 * Parses the 'If' bytecode to add the constraints to the list.
 * @author Min-Hsien Weng
 *
 */
public class IfAnalyzer extends Analyzer {
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
	
	public void analyze(Codes.If code) throws CloneNotSupportedException{
		
		if(code.type instanceof Type.Int){
			String left = "%"+code.leftOperand;
			String right = "%"+code.rightOperand;
			switch(code.op){
			case EQ:			
				
				break;
			case NEQ:				
				
				break;
			case LT:			
				
				break;
			case LTEQ:
				//Add the 'left <= right' constraint to the branched list.
				branchandAddConstraint(code.target, new LessThanEquals(left+"_"+code.target, right));
				//Add the constraint 'left>right' to current list
				addConstraint(new GreaterThan(left, right));
				break;
			case GT:					
				
				break;
			case GTEQ:
				//Branch and add the left >= right constraint to 
				branchandAddConstraint(code.target, new GreaterThanEquals(left+"_"+code.target, right));
				//Add the constraint 'left< right' to current constraint list.
				addConstraint(new LessThan(left, right));		
				break;
			case IN:			
				System.err.println("Not implemented!");		
				break;
			case SUBSET:
				System.err.println("Not implemented!");
				break;
			case SUBSETEQ:
				System.err.println("Not implemented!");
				break;
			default:			
				System.err.println("Not implemented!");
		
			}
			
		}
		
	}
	
}
