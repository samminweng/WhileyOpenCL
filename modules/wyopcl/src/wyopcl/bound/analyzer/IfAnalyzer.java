package wyopcl.bound.analyzer;

import java.util.Iterator;

import wyil.lang.Codes;
import wyil.lang.Constant;
import wyil.lang.Type;
import wyopcl.bound.Analyzer;
import wyopcl.bound.Bounds;
import wyopcl.bound.ConstraintList;
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
			
			//The 'if'
			ConstraintList if_list = (ConstraintList)this.constraintlist.clone();
			
			switch(code.op){
			case EQ:			
				
				break;
			case NEQ:				
				
				break;
			case LT:			
				
				break;
			case LTEQ:			
				this.constraintListMap.put(code.target, if_list);
				break;
			case GT:					
				
				break;
			case GTEQ:			
				this.constraintListMap.put(code.target, if_list);
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
