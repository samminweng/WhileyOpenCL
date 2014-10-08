package wyopcl.bound;

import java.util.HashMap;
import java.util.Iterator;

import wyil.lang.Codes;
import wyil.lang.Codes.UnaryOperatorKind;
import wyil.lang.Constant;
import wyil.lang.Type;
import wyopcl.bound.constraint.Assign;
import wyopcl.bound.constraint.Const;
import wyopcl.bound.constraint.Constraint;
import wyopcl.bound.constraint.Equals;
import wyopcl.bound.constraint.GreaterThan;
import wyopcl.bound.constraint.GreaterThanEquals;
import wyopcl.bound.constraint.LessThan;
import wyopcl.bound.constraint.LessThanEquals;
import wyopcl.bound.constraint.Negate;
import wyopcl.bound.constraint.Union;
/***
 * A class to store all the constraints produced in the wyil file and infer the bounds consistent
 * with all the constraints. Due to the singleton design pattern, the class variables 'constraintListMap'
 * and 'label' has one instance.
 *    
 * @author Min-Hsien Weng
 *
 */
public class Analyzer {
	//The hashmap stores the constraints with in the label value in each method or function.
	private HashMap<String, ConstraintList> constraintListMap;
	private String label = "";

	private static Analyzer instance;	
	public Analyzer(){
		 constraintListMap = new HashMap<String, ConstraintList>();
	}

	/*Implement the 'Singleton' pattern to ensure this class has one instance.*/
	public static Analyzer getInstance(){	
		if (instance == null){
			instance = new Analyzer();
		}	
		return instance;
	}

	
	/**
	 * 
	 */
	public void inferBoundsOverAllConstraintlists(boolean verbose){
		//Iterates through all the constraint lists and infer each list's fixed point.
		Iterator<java.util.Map.Entry<String, ConstraintList>> iterator = constraintListMap.entrySet().iterator();
		Bounds unionBounds = new Bounds();
		while(iterator.hasNext()){
			java.util.Map.Entry<String, ConstraintList> entry = iterator.next();
			//Infer the bounds consistent with all constraints.
			ConstraintList list = entry.getValue();
			String label = entry.getKey();
			Bounds bnd = new Bounds();
			list.inferFixedPoint(bnd);
			if(verbose){
				System.out.println("\n"+label+":"+
						"\n"+bnd.toString()
						+"\nisBoundConsistency="+bnd.checkBoundConsistency());
			}				
			unionBounds.union(bnd);
		}
		
		
		System.out.println("\nUnion Bounds:"+
				"\n"+unionBounds.toString()
				+"\nisBoundConsistency="+unionBounds.checkBoundConsistency());
		
		//Clear the map
		constraintListMap.clear();
	}
	
	
	/**
	 * Return the current constraint list.
	 * @return the constraint list.
	 */
	private ConstraintList getCurrentConstraintList(){
		if(!constraintListMap.containsKey(label)){
			//Clone the current constraint list to make a new one.
			ConstraintList list = new ConstraintList();
			constraintListMap.put(label, list);
		}		
		return constraintListMap.get(label);
	}

	/**
	 * Adds the constraint to the current constraint list.
	 * @param c
	 */
	public void addConstraint(Constraint c){				
		ConstraintList list = getCurrentConstraintList();
		list.addConstraint(c);
	}

	/**
	 * Branches the current constraint list and adds the 
	 * constraint to the cloned list.
	 * @param new_label the name of new branch.
	 * @param c constraint
	 */
	public void branchandAddConstraint(String new_label, Constraint c){
		ConstraintList current_list = getCurrentConstraintList();
		ConstraintList new_list;
		//Cloned the current constraint list. 
		new_list = (ConstraintList) current_list.clone();
		new_list.addConstraint(c);
		constraintListMap.put(new_label, new_list);

	}	

	public void setLabel(String label) {
		this.label = label;
	}


	public void analyze(Codes.Assign code){
		//Check if the assigned value is an integer
		if(code.assignedType() instanceof Type.Int){
			//Add the constraint 'target = operand'
			addConstraint(new Assign("%"+code.target(), "%"+code.operand(0)));
		}

	}

	/**
	 * Parses 'Const' bytecode to add the 'Const' constraint to the list. 
	 * @param code
	 */
	public void analyze(Codes.Const code){
		Constant constant = code.constant;
		String name = "%"+code.target();
		//Check the value is an Constant.Integer
		if(constant instanceof Constant.Integer){
			//Add the 'Const' constraint.
			addConstraint(new Const(name, ((Constant.Integer)constant).value));
		}
	}

	/**
	 * Parses the 'If' bytecode to add the constraints to the list.
	 * @param code
	 * @throws CloneNotSupportedException
	 */
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
	
	/**
	 *Parses the invoke bytecode and adds the constraints to the list.
	 * The possible constraints include: none....
	 * @param code
	 */
	public void analyze(Codes.Invoke code){
		/*//String func_name = code.name.name();
		
		//Get the fun block from module.
		//FunctionOrMethodDeclaration functionOrMethod = Analyzer.module.functionOrMethod(func_name, code.type());
		int index = 0;
		for(Type paramType: code.type().params()){
			//Get the input parameters of integer type
			if(paramType instanceof Type.Int){
				//String param = "%"+code.operand(index);
				//Missing the variable name of function input parameters, so we used the function name temporarily.
				//Add the equal constraint for input parameter.
				//this.getConstraintList().addConstraint(new Equals(param, func_name));
			}
			index++;			
		}
		
		Type returnType = code.type().ret();
		if(returnType instanceof Type.Int){
			//String return_reg = "%"+code.target();
			//this.getConstraintList().addConstraint(new Equals(return_reg, func_name));
		}*/
			
			
	}
	
	/**
	 * Parse the 'label' bytecode, get the constraint list by the label and set it to the current
	 * constraint list. If the constraint list does not exist, then create a constraint list and
	 * put it to the map with the key of label and value of the newly created list. 
	 * @param code
	 */
	public void analyze(Codes.Label code){
		//check if map contains the constrainlist.
		String label = code.label;
		//Switch the current constraint list by setting the label with new value.
		setLabel(label);
		
	}
	
	
	/**
	 * Add the 'equal' constraints of the target and operand register.
	 * @param code
	 */
	public void analyze(Codes.NewList code){
		
		if(code.type().element() instanceof Type.Int){
			for(int operand: code.operands()){
				addConstraint(new Union("%"+code.target(), "%"+operand));				
			}
		}
		
	}
	
	/**
	 * Parse the 'return' bytecode and add the constraint 
	 * @param code
	 */
	public void analyze(Codes.Return code){
		Type returnType = code.type;
		if (returnType == Type.T_VOID){
			//Do nothing
			return ;
		}
		//Get the return operand
		String ret = "%"+code.operand;
		//Check if the return type is integer.
		if(returnType instanceof Type.Int){
			//Add the 'Equals' constraint to the return (ret) variable.
			addConstraint(new Equals("return", ret));
		}		
	}
	
	/**
	 * Parse 'Unary Operator' bytecode and add the constraints in accordance with operator kind.
	 * For example, add the 'Negate' constraint for the negated operator.
	 * 
	 * @param code
	 */
	public void analyze(Codes.UnaryOperator code){
		UnaryOperatorKind kind = code.kind;
		String x = "%"+code.operand(0);
		String y = "%"+code.target();
		//
		switch(kind){
			case NEG:
				addConstraint(new Negate(x, y));
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
	
	public void analyze(Codes.ForAll code){
		//Check if each element is an integer
		if(code.type.element() instanceof Type.Int){
			//Propagate the range of source register to the index reg 
			addConstraint(new Assign("%"+code.indexOperand, "%"+code.sourceOperand));
		}
		
		
	}
	
}
