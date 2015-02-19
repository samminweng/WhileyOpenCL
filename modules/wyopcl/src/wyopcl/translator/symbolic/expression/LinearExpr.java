package wyopcl.translator.symbolic.expression;

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
 * c1v1+..+cNvN+c0 where c0,c1...,cN are constants and v1,v2,...,vN are variables.
 * @author Min-Hsien Weng
 *
 */
public class LinearExpr extends Expr{	
	private List<String> ref_vars;
	private List<BigInteger> coefficients; // The list of coefficients
	private BigInteger constant;//(the constant value)
	/**
	 * Basic constructor
	 */
	public LinearExpr(String target){
		super(target);
		//c0 = 0
		this.constant = BigInteger.ZERO;
		this.ref_vars = new ArrayList<String>();
		this.coefficients = new ArrayList<BigInteger>();
	}
	
	
	
	/**
	 * Add the constant only
	 * @param co the constant
	 */
	public void addConstant(BigInteger co){
		this.constant = constant.add(co);		
	}


	/**
	 * Add the variable and coefficient to the lists.
	 * @param var the name of variable. If null, it means the constant.
	 * @param co the coefficient.
	 */
	public void addVar(BigInteger co, String var){
		//Add the variable together with coefficient.
		int index = getVarIndex(var);
		//New variable
		if(index==-1){
			index = this.ref_vars.size();
			//Append the var and co to the end of the list.
			this.ref_vars.add(var);
			this.coefficients.add(co);
		}else{
			//Existing variable
			BigInteger existing_co = this.coefficients.get(index);
			//Update the coefficient at the index of var.
			this.coefficients.set(index, existing_co.add(co));
		}

	}

	/**
	 * Get the constant.
	 * @return the constant
	 */
	public BigInteger getConstant(){
		return this.constant;
	}

	/**
	 * Get the index of the referenced list for a given variable.
	 * @param var the given variable.
	 * @return the index. If not found, return -1.
	 */
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
	 * Get the array of referenced variables in the expression
	 * @return the variable array  
	 */
	public String[] getVars(){
		//return this.ref_vars;
		return this.ref_vars.toArray(new String[this.ref_vars.size()]);
	}

	/**
	 * Get the coefficient of the given variable.
	 * @param var the name of variable
	 * @return the coefficient (BigInteger). If not found, return null.
	 */
	public BigInteger getCoefficient(String var){
		BigInteger co = null;
		int index = getVarIndex(var);
		if(index!=-1){
			co = this.coefficients.get(index);
		}		
		return co;
	}

	/**
	 * Multiply the coefficients by a constant value
	 * @param scale the scale
	 * @return
	 */
	public LinearExpr multiply(BigInteger scale){
		//Perform the multiplication operation on the coefficient which exist in this expression.
		for(int index=0; index<this.coefficients.size();index++){
			BigInteger co = this.coefficients.get(index);
			BigInteger result = co.multiply(scale);
			this.coefficients.set(index, result);
		}
		//Multiply the constant
		this.constant = this.constant.multiply(scale);

		return this;
	}

	/**
	 * Replace the variable with a given expression. For example, %3 = %6 and  %6 = %0 - %5 
	 * so %3 = %0 - %5
	 * @param var
	 * @param linearExpr
	 * @return
	 */
	public LinearExpr merge(String var, LinearExpr linearExpr){
		int index = getVarIndex(var);
		if(index!= -1){			
			//Get the coefficient
			BigInteger coefficient = getCoefficient(var);
			//Remove the var and its coefficient
			this.ref_vars.remove(var);
			this.coefficients.remove(coefficient);
			if(coefficient.signum()>0){
				//Addition				
				this.add(linearExpr.multiply(coefficient.abs()));
			}else{
				//Subtraction
				this.subtract(linearExpr.multiply(coefficient.abs()));
			}
			
		}
		return this;		
	}

	/**
	 * Add another expression into this one. 
	 * @param linearExpr
	 * @return
	 */
	public LinearExpr add(LinearExpr linearExpr){
		//Perform the addition operation on the constant and the ref_vars which exist in both this and expr.
		for(int index=0; index<this.ref_vars.size();index++){
			//Get variable
			String var = this.ref_vars.get(index);
			int expr_index = linearExpr.getVarIndex(var);
			//Check if the var exists in the expr.
			if(expr_index!=-1){
				BigInteger expr_co = linearExpr.coefficients.get(expr_index);
				addVar(expr_co, var);
			}
		}		
		//The remaining ref_vars from expr
		for(int index=0; index<linearExpr.ref_vars.size();index++){
			String var = linearExpr.ref_vars.get(index);
			if(this.getVarIndex(var)==-1){
				BigInteger expr_co = linearExpr.coefficients.get(index);
				addVar(expr_co, var);
			}			
		}		
		//Subtract the constant parts of this and expr
		//Get the const from expr
		BigInteger expr_co = linearExpr.getConstant(); 
		//update the coefficient
		addConstant(expr_co);
		return this;
	}

	/**
	 * Subtract the expression from this one.
	 * @param linearExpr
	 * @return
	 */
	public LinearExpr subtract(LinearExpr linearExpr){		
		//Subtraction can be considered as addition of the minuend and the opposite of the subtrahend 
		//For example, this - expr = this + (-1*expr)		
		this.add(linearExpr.multiply(BigInteger.ONE.negate()));		
		return this;
	}


	@Override
	public String toString() {
		String expr = ""+constant;
		//Iterate over all variables.
		for(int index=0;index<coefficients.size();index++){
			BigInteger co = coefficients.get(index);
			if(co.signum()==-1){
				expr += " - ";
			}else{
				expr += " + ";
			}
			BigInteger abs = co.abs();
			if(abs.compareTo(BigInteger.ONE)!=0){
				expr += abs + " * ";
			}				
			expr += ref_vars.get(index);								
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
