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
	private List<BigInteger> coefficients; // The list of coefficients (the constant value is added as the last).
	private final String prefix ="%"; 

	/**
	 * Basic constructor
	 */
	public Expr(){
		//this.ref_vars = new ArrayList<String>();
		//this.coefficients = new ArrayList<BigInteger>();
	}

	private void initialize(Code code){
		if(code instanceof Codes.Assign){
			Codes.Assign assign = (Codes.Assign)code;
			//1*v1
			addVarOrConstant(BigInteger.ONE, prefix+assign.operand(0));
			//c0
			addVarOrConstant(BigInteger.ZERO, null);
			target = prefix+assign.target();
		}else if(code instanceof Codes.Const){
			Constant constant = ((Codes.Const)code).constant;
			if(constant instanceof Constant.Integer){
				//c0
				addVarOrConstant(((Constant.Integer) constant).value, null);	
			}
			target = prefix+((Codes.Const)code).target();
		}else if(code instanceof Codes.BinaryOperator){
			Codes.BinaryOperator binOp = (Codes.BinaryOperator)code;
			switch(binOp.kind){
			case ADD:
				//v1+v2+c0
				addVarOrConstant(BigInteger.ONE, prefix+binOp.operand(0));
				addVarOrConstant(BigInteger.ONE, prefix+binOp.operand(1));
				addVarOrConstant(BigInteger.ZERO, null);
				break;
			case SUB:	
				//v1-v2+c0
				addVarOrConstant(BigInteger.ONE, prefix+binOp.operand(0));
				addVarOrConstant(BigInteger.ONE.negate(), prefix+binOp.operand(1));//-1*v2
				addVarOrConstant(BigInteger.ZERO, null);
				break;
			default:
				throw new RuntimeException(binOp.kind+"Not implemented");				
			}			
			target = prefix+binOp.target();
		}else if(code instanceof Codes.If){
			Codes.If if_code = (Codes.If)code;
			addVarOrConstant(BigInteger.ONE, prefix+if_code.rightOperand);
			addVarOrConstant(BigInteger.ZERO, null);
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
		addVarOrConstant(constant, null);		
	}



	public String getTarget(){
		return target;
	}	

	/**
	 * Add the variable and coefficient to the lists.
	 * @param var the name of variable. If null, it means the constant.
	 * @param co the coefficient.
	 */
	public void addVarOrConstant(BigInteger co, String var){
		//Lazy initialization
		if(this.ref_vars == null){
			this.ref_vars = new ArrayList<String>();		
		}		
		if(this.coefficients == null){
			this.coefficients = new ArrayList<BigInteger>();
		}		
		
		//Add the variable together with coefficient.
		if(var != null){
			int index = getVarIndex(var);
			//New variable
			if(index==-1){
				index = this.ref_vars.size();
				//Append the var and co to the end of the list.
				this.ref_vars.add(index, var);
				this.coefficients.add(index, co);
			}else{
				BigInteger existing_co = this.coefficients.get(index);
				//Update the coefficient at the index of var.
				this.coefficients.set(index, existing_co.add(co));
			}
		}else{
			//Add the constant only.
			int index = getConstIndex();
			if(index == 0 || this.coefficients.size() == this.ref_vars.size()){
				this.coefficients.add(co);
			}else{
				BigInteger existing_co = this.coefficients.get(index);
				this.coefficients.set(index, existing_co.add(co));
			}			
		}		
	}

	/**
	 * Get the array index of the constant.
	 * @return the array index. If no constant exists, return 0.
	 */
	public int getConstIndex(){
		if(this.coefficients.isEmpty()){
			return 0;
		}				
		return this.coefficients.size()-1;
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
	 * @return
	 */
	public Expr multiply(BigInteger number){
		//Perform the multiplication operation on the coefficient which exist in this expression.
		for(int index=0; index<this.coefficients.size();index++){
			BigInteger co = this.coefficients.get(index);
			BigInteger result = co.multiply(number);
			this.coefficients.set(index, result);
		}
		return this;
	}

	/**
	 * Replace the variable with a given expression
	 * @param var
	 * @param expr
	 * @return
	 */
	public Expr merge(String var, Expr expr){
		int index = getVarIndex(var);
		if(index!= -1){			
			//Get the coefficient
			BigInteger coefficient = getCoefficient(var);
			expr = expr.multiply(coefficient.abs());
			if(coefficient.signum()>0){
				//Addition				
				this.add(expr);
			}else{
				//Subtraction
				this.subtract(expr);
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
				addVarOrConstant(expr_co, var);
			}
		}		
		//The remaining ref_vars from expr
		for(int index=0; index<expr.ref_vars.size();index++){
			String var = expr.ref_vars.get(index);
			if(this.getVarIndex(var)==-1){
				BigInteger expr_co = expr.coefficients.get(index);
				addVarOrConstant(expr_co, var);
			}			
		}		
		//Subtract the constant parts of this and expr
		//Get the const from expr 
		int expr_index = expr.getConstIndex();
		BigInteger expr_co = expr.coefficients.get(expr_index); 
		//update the coefficient
		addVarOrConstant(expr_co, null);	

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
		String expr = "";
		boolean isFirst = true;
		//Iterate over all variables.
		for(int index=0;index<coefficients.size();index++){
			BigInteger co = coefficients.get(index);
			if(isFirst){			
				isFirst = false;
			}else{
				if(co.signum()==-1){
					expr += " - ";
				}else{
					expr += " + ";
				}				
			}
			BigInteger abs = co.abs();
			if(index<ref_vars.size()){
				if(abs.compareTo(BigInteger.ONE)!=0){
					expr += abs + " * ";
				}				
				expr += ref_vars.get(index);
			}else{
				//constant value
				expr += abs;
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
