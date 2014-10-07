package wyopcl.bound.analyzer;

import wyil.lang.Codes;
import wyil.lang.Codes.UnaryOperatorKind;
import wyopcl.bound.Analyzer;
import wyopcl.bound.constraint.Negate;
/**
 * Parse 'Unary Operator' bytecode and add the constraints in accordance with operator kind.
 * For example, add the 'Negate' constraint for the negated operator.
 * 
 * @author Min-Hsien Weng
 *
 */
public class UnaryOperatorAnalyzer extends Analyzer {
	private static UnaryOperatorAnalyzer instance;	
	public UnaryOperatorAnalyzer(){
	}
	
	/*Implement the 'Singleton' pattern to ensure this class has one instance.*/
	public static UnaryOperatorAnalyzer getInstance(){	
		if (instance == null){
			instance = new UnaryOperatorAnalyzer();
		}	
		return instance;
	}
	
	public void analyze(Codes.UnaryOperator code){
		UnaryOperatorKind kind = code.kind;
		String x = "%"+code.operand(0);
		String y = "%"+code.target();
		//
		switch(kind){
			case NEG:
				this.getConstraintList().addConstraint(new Negate(x, y));
				break;
			case NUMERATOR:
				System.err.println("Not implemented!");
				break;
			case DENOMINATOR:
				System.err.println("Not implemented!");
				break;
			default:
				System.err.println("Not implemented!");
				break;
				
		}
		
	}
}
