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
			
			//The constraintlist for 'if' branch.
			ConstraintList if_list = (ConstraintList) this.getConstraintList().clone();
			
			switch(code.op){
			case EQ:			
				
				break;
			case NEQ:				
				
				break;
			case LT:			
				
				break;
			case LTEQ:
				//Add the constraint 'left>right' to current list
				this.getConstraintList().addConstraint(new GreaterThan(left, right));
				if_list.addConstraint(new LessThanEquals(left+"_"+code.target, right));
				putConstraintList(code.target, if_list);
				break;
			case GT:					
				
				break;
			case GTEQ:
				//Add the constraint 'left< right' to current constraint list.
				this.getConstraintList().addConstraint(new LessThan(left, right));				
				//'left >= right'
				if_list.addConstraint(new GreaterThanEquals(left+"_"+code.target, right));
				putConstraintList(code.target, if_list);			
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
