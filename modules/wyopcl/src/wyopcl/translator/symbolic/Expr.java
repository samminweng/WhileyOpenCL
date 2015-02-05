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
 * c1v1+..+cNvN+c0 where c0,c1...,cN are constants and v1,v2,...,vN are variables.
 * @author Min-Hsien Weng
 *
 */
public class Expr implements Cloneable{
	private String target;
	private List<String> ref_vars;
	private List<BigInteger> coefficients; // The list of coefficients .
	private final String prefix ="%"; 
	private BigInteger constant;//(the constant value is added as the last)
	/**
	 * Basic constructor
	 */
	public Expr(){
		//c0 = 0
		this.constant = BigInteger.ZERO;
		this.ref_vars = new ArrayList<String>();
		this.coefficients = new ArrayList<BigInteger>();
	}

	private void initialize(Code code){
		if(code instanceof Codes.Assign){
			target = prefix+((Codes.Assign)code).target();
			Codes.Assign assign = (Codes.Assign)code;
			//1*v1
			addVar(BigInteger.ONE, prefix+assign.operand(0));
		}else if(code instanceof Codes.Const){
			target = prefix+((Codes.Const)code).target();
			Constant constant = ((Codes.Const)code).constant;
			if(constant instanceof Constant.Integer){
				//c0
				addConstant(((Constant.Integer) constant).value);	
			}
		}else if(code instanceof Codes.BinaryOperator){
			target = prefix+((Codes.BinaryOperator)code).target();
			Codes.BinaryOperator binOp = (Codes.BinaryOperator)code;
			switch(binOp.kind){
			case ADD:
				//v1+v2
				addVar(BigInteger.ONE, prefix+binOp.operand(0));
				addVar(BigInteger.ONE, prefix+binOp.operand(1));
				break;
			case SUB:	
				//v1-v2
				addVar(BigInteger.ONE, prefix+binOp.operand(0));
				addVar(BigInteger.ONE.negate(), prefix+binOp.operand(1));//-1*v2
				break;
			default:
				throw new RuntimeException(binOp.kind+"Not implemented");				
			}			
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
		addConstant(constant);		
	}


	/**
	 * Get the target operand.
	 * @return
	 */
	public String getTarget(){
		return target;
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
	 * Get the array index of the constant.
	 * @return the array index. If no constant exists, return 0.
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
	public Expr multiply(BigInteger scale){
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
	 * @param expr
	 * @return
	 */
	public Expr merge(String var, Expr expr){
		int index = getVarIndex(var);
		if(index!= -1){			
			//Get the coefficient
			BigInteger coefficient = getCoefficient(var);
			if(coefficient.signum()>0){
				//Addition				
				this.add(expr.multiply(coefficient.abs()));
			}else{
				//Subtraction
				this.subtract(expr.multiply(coefficient.abs()));
			}
			//Remove the var and its coefficient
			this.ref_vars.remove(index);
			this.coefficients.remove(index);
		}
		return this;		
	}

	/**
	 * Add another expression into this one. 
	 * @param expr
	 * @return
	 */
	public Expr add(Expr expr){
		//Perform the addition operation on the constant and the ref_vars which exist in both this and expr.
		for(int index=0; index<this.ref_vars.size();index++){
			//Get variable
			String var = this.ref_vars.get(index);
			int expr_index = expr.getVarIndex(var);
			//Check if the var exists in the expr.
			if(expr_index!=-1){
				BigInteger expr_co = expr.coefficients.get(expr_index);
				addVar(expr_co, var);
			}
		}		
		//The remaining ref_vars from expr
		for(int index=0; index<expr.ref_vars.size();index++){
			String var = expr.ref_vars.get(index);
			if(this.getVarIndex(var)==-1){
				BigInteger expr_co = expr.coefficients.get(index);
				addVar(expr_co, var);
			}			
		}		
		//Subtract the constant parts of this and expr
		//Get the const from expr
		BigInteger expr_co = expr.getConstant(); 
		//update the coefficient
		addConstant(expr_co);
		return this;
	}

	/**
	 * Subtract the expression from this one.
	 * @param expr
	 * @return
	 */
	public Expr subtract(Expr expr){		
		//Subtraction can be considered as addition of the minuend and the opposite of the subtrahend 
		//For example, this - expr = this + (-1*expr)		
		this.add(expr.multiply(BigInteger.ONE.negate()));		
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
