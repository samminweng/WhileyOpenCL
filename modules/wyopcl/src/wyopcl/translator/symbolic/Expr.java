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
public class Expr implements Cloneable{
	private String target;
	private List<String> ref_vars;
	private List<BigInteger> coefficients;
	private final String prefix ="%"; 

	private void initialize(Code code){
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
			switch(binOp.kind){
			case ADD:
				coefficients.add(BigInteger.ZERO);
				coefficients.add(BigInteger.ONE);
				ref_vars.add(prefix+binOp.operand(1));
				break;
			case SUB:	
				coefficients.add(BigInteger.ZERO);
				coefficients.add(BigInteger.valueOf(-1));
				ref_vars.add(prefix+binOp.operand(1));
				break;
			default:
				throw new RuntimeException(binOp.kind+"Not implemented");				
			}			
			target = prefix+binOp.target();
		}else if(code instanceof Codes.If){
			Codes.If if_code = (Codes.If)code;
			coefficients.add(BigInteger.ZERO);
			coefficients.add(BigInteger.ONE);
			ref_vars.add(prefix+if_code.rightOperand);		
		}
	}	
	/**
	 * Multiple constructor to create an expression with an WyIL code.  
	 * @param code the WyIL code
	 */
	public Expr(Code code){
		this();
		initialize(code);
	}
	/**
	 * Multiple constructor to create an expression with a constant.
	 * @param constant the constant
	 */
	public Expr(BigInteger constant){
		this();
		coefficients.add(constant);		
	}	
	
	/**
	 * Basic constructor
	 */
	public Expr(){
		this.ref_vars = new ArrayList<String>();
		this.coefficients = new ArrayList<BigInteger>();
	}

	public String getTarget(){
		return target;
	}	

	public int getVarIndex(String var){
		if(this.ref_vars.contains(var)){
			for(int index=0; index<ref_vars.size();index++){
				String ref_var = ref_vars.get(index);
				if(ref_var.equals(var)){
					return index;
				}
			}		
		}		
		return -1;
	}

	/**
	 * Add another expression into this one. 
	 * @param expr
	 * @return
	 */
	public Expr add(Expr expr){
		//Perform the subtract operation on the constant and the ref_vars which exist in both this and expr.
		for(int index=0; index<this.coefficients.size();index++){
			BigInteger co = this.coefficients.get(index); 
			if(index== 0){
				//Subtract the constant parts of this and expr.  
				BigInteger expr_co = expr.coefficients.get(index); 
				BigInteger result = co.add(expr_co);
				//update the coefficient
				this.coefficients.set(index, result);
			}else{
				//Get variable
				String var = this.ref_vars.get(index-1);
				int expr_index = expr.getVarIndex(var);
				//Check if the var exists in the expr.
				if(expr_index!=-1){
					//Get the coefficient from expr
					BigInteger expr_co = expr.coefficients.get(expr_index);
					//Subtract the coefficient part
					BigInteger result = co.add(expr_co);
					//update the coefficient
					this.coefficients.set(index, result);					
				}			
			}			
		}		
		//The remaining ref_vars from expr
		for(int index=0; index<expr.ref_vars.size();index++){
			BigInteger expr_co = expr.coefficients.get(index+1);
			String expr_var = expr.ref_vars.get(index);
			if(this.getVarIndex(expr_var)==-1){
				this.coefficients.add(expr_co);
				this.ref_vars.add(expr_var);
			}			
		}
		return this;
	}

	/**
	 * Subtract the expression from this one.
	 * @param expr
	 * @return
	 */
	public Expr subtract(Expr expr){		
		//Perform the subtract operation on the constant and the ref_vars which exist in both this and expr.
		for(int index=0; index<this.coefficients.size();index++){
			BigInteger co = this.coefficients.get(index); 
			if(index== 0){
				//Subtract the constant parts of this and expr.  
				BigInteger expr_co = expr.coefficients.get(index); 
				BigInteger result = co.subtract(expr_co);
				//update the coefficient
				this.coefficients.set(index, result);
			}else{
				//Get variable
				String var = this.ref_vars.get(index-1);
				int expr_index = expr.getVarIndex(var);
				//Check if the var exists in the expr.
				if(expr_index!=-1){
					//Get the coefficient from expr
					BigInteger expr_co = expr.coefficients.get(expr_index);
					//Subtract the coefficient part
					BigInteger result = co.subtract(expr_co);
					//update the coefficient
					this.coefficients.set(index, result);					
				}			
			}			
		}		
		//The remaining ref_vars from expr
		for(int index=0; index<expr.ref_vars.size();index++){
			BigInteger expr_co = expr.coefficients.get(index+1);
			String expr_var = expr.ref_vars.get(index);
			if(this.getVarIndex(expr_var)==-1){
				this.coefficients.add(expr_co.negate());
				this.ref_vars.add(expr_var);
			}			
		}
		return this;
	}


	@Override
	public String toString() {
		String expr = "";
		boolean isFirst = true;
		for(int index=0;index<coefficients.size();index++){
			BigInteger co = coefficients.get(index);
			if(isFirst){
				//if(co.compareTo(BigInteger.ZERO)!=0){
				expr += co;
				//}				
				isFirst = false;
			}else{
				if(co.signum()==-1){
					expr += " - ";
				}else{
					expr += " + ";
				}

				BigInteger abs = co.abs();
				if(abs.compareTo(BigInteger.ONE)!=0){
					expr += abs+ " * ";
				}
				expr += ref_vars.get(index-1);
			}			
		}		
		return expr;
	}
	@Override
	public Object clone() {
		try {
			return super.clone();
		} catch (CloneNotSupportedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
