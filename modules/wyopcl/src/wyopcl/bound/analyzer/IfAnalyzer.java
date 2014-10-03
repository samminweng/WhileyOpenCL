package wyopcl.bound.analyzer;

import java.util.Iterator;

import wyil.lang.Codes;
import wyil.lang.Constant;
import wyopcl.bound.Bounds;
import wyopcl.bound.ConstraintList;
/**
 * Parses the 'If' bytecode to add the constraints to the list.
 * @author Min-Hsien Weng
 *
 */
public class IfAnalyzer {
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
	
	public void analyze(Codes.If code, Bounds bnd, ConstraintList list){
		switch(code.op){
		case EQ:			
			
			break;
		case NEQ:				
			
			break;
		case LT:			
			
			break;
		case LTEQ:			
			
			break;
		case GT:					
			
			break;
		case GTEQ:			
			
			break;
		case IN:			
					
			break;
		case SUBSET:
			
			break;
		case SUBSETEQ:
			
			break;
		default:			
			
		
		
		}
		
	}
	
}
