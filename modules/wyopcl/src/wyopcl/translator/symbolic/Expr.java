package wyopcl.translator.symbolic;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Constant;
import wyil.lang.Codes.BinaryOperatorKind;

/**
 * The affine expression is used to store the initial values, conditions and number of loop iterations.
 * The form of an affine expression is as below:
 * c0+c1v1+..+cNvN, where c0,c1...,cN are constants and v1,v2,...,vN are variables.
 * @author Min-Hsien Weng
 *
 */
public class Expr {
	private final Code code;
	private String target;
	private List<String> ref_vars;
	private List<BigInteger> coefficients;
	private final String prefix ="%"; 
	
	
	private void toExpr(){
		if(code instanceof Codes.Assign){
			Codes.Assign assign = (Codes.Assign)code;
			ref_vars.add(prefix+assign.operand(0));
			coefficients.add(BigInteger.ZERO);
			coefficients.add(BigInteger.ONE);
			target = prefix+assign.target();
		}else if(code instanceof Codes.Const){
			Constant constant = ((Codes.Const)code).constant;
			if(constant instanceof Constant.Integer){
				coefficients.add(((Constant.Integer) constant).value);	
			}
			target = prefix+((Codes.Const)code).target();
		}else if(code instanceof Codes.BinaryOperator){
			Codes.BinaryOperator binOp = (Codes.BinaryOperator)code;
			if(binOp.kind.equals(BinaryOperatorKind.ADD)){
				
				
				
			}else{
				
			}
			target = prefix+binOp.target();
		}
	}	
	
	public Expr(Code code){
		this.code = code;
		this.ref_vars = new ArrayList<String>();
		this.coefficients = new ArrayList<BigInteger>();
		toExpr();
	}
	
	public String getTarget(){
		return target;
	}	
	
	public String getExpr(){
		String expr ="";
		for(int index=0;index<coefficients.size();index++){
			BigInteger co = coefficients.get(index);
			if(index==0){
				expr += "="+co;
			}else{
				expr += "+"+co+ref_vars.get(index-1);
			}			
		}		
		return expr; 
	}

	@Override
	public String toString() {
		return code.toString();
	}
	
}
