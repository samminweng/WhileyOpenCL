package wyopcl.bound;

import static wycc.lang.SyntaxError.internalFailure;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import wycc.lang.SyntaxError;
import wyil.lang.Codes;
import wyil.lang.Code.Block;
import wyil.lang.Codes.UnaryOperatorKind;
import wyil.lang.Code;
import wyil.lang.Constant;
import wyil.lang.Type;
import wyil.lang.Type.FunctionOrMethod;
import wyil.lang.WyilFile;
import wyil.lang.WyilFile.FunctionOrMethodDeclaration;
import wyopcl.bound.constraint.Assign;
import wyopcl.bound.constraint.Const;
import wyopcl.bound.constraint.Constraint;
import wyopcl.bound.constraint.Equals;
import wyopcl.bound.constraint.GreaterThan;
import wyopcl.bound.constraint.GreaterThanEquals;
import wyopcl.bound.constraint.LessThan;
import wyopcl.bound.constraint.LessThanEquals;
import wyopcl.bound.constraint.Negate;
import wyopcl.bound.constraint.Range;
import wyopcl.bound.constraint.Union;
import wyopcl.interpreter.DecimalFraction;
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
	private Bounds unionOfBounds;
	private String assert_label;//stores the label name of the assertion
	private String label;
	private final int depth;	

	public Analyzer(int depth){
		 this.constraintListMap = new HashMap<String, ConstraintList>();
		 this.unionOfBounds = new Bounds();
		 this.depth = depth;
		 this.assert_label = "";
		 this.label = "code";
	}

	public void setLabel(String label) {
		this.label = label;
	}
	
	
	/**
	 * Prints out each bytecode with line number and indentation.
	 * @param name
	 * @param line
	 */
	public int printWyILCode(Code code, String name, int line){
		//Print out the bytecode with the format (e.g. 'main.9 [const %12 = 2345 : int]')
		if(code instanceof Codes.Label){
			System.out.println(name+"."+line+"."+depth+" ["+code+"]");
		}else{
			System.out.println(name+"."+line+"."+depth+" [\t"+code+"]");
		}	
		
		return ++line;
	}	
	
	
	
	
	/**
	 *infer bounds consistent with all constraints.
	 * 
	 */
	public Bounds inferBoundsOverAllConstraintlists(boolean verbose){
		//Iterates through all the constraint lists and infer each list's fixed point.
		Iterator<java.util.Map.Entry<String, ConstraintList>> iterator = constraintListMap.entrySet().iterator();
		
		while(iterator.hasNext()){
			java.util.Map.Entry<String, ConstraintList> entry = iterator.next();
			//Infer the bounds consistent with all constraints.
			ConstraintList list = entry.getValue();
			Bounds bnd = new Bounds();
			list.inferFixedPoint(bnd);
			/*if(verbose){
				System.out.println("\n"+label+":"+
						"\n"+bnd.toString()
						+"\nisBoundConsistency="+bnd.checkBoundConsistency());
			}*/				
			unionOfBounds.union(bnd);
			bnd = null;
		}				

		//Clear the map
		constraintListMap.clear();
		return unionOfBounds;
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
	public void addConstraintToCurrentList(Constraint c){
		if(assert_label.equals("")){
			ConstraintList list = getCurrentConstraintList();
			list.addConstraint(c);
		}		
	}

	public void addConstraintToAllList(Constraint c){
		if(assert_label.equals("")){
			Iterator<ConstraintList> iterator = constraintListMap.values().iterator();
			while(iterator.hasNext()){
				ConstraintList constraintlist = iterator.next();
				//Add the 'Equals' constraint to the return (ret) variable.
				constraintlist.addConstraint(c);
			}			
		}		
	}
	
	
	/**
	 * Branches the current constraint list and adds the 
	 * constraint to the cloned list.
	 * @param new_label the name of new branch.
	 * @param c constraint
	 */
	public void branchConstraintList(String new_label, Constraint c){
		if(!assert_label.equals("")){
			return;
		}
		
		ConstraintList current_list = getCurrentConstraintList();
		ConstraintList new_list;
		//Cloned the current constraint list. 
		new_list = (ConstraintList) current_list.clone();
		new_list.addConstraint(c);
		constraintListMap.put(new_label, new_list);

	}
	
	/**
	 * Checks the type of the wyil code and dispatches the code to the analyzer for
	 * being executed by the <code>analyze(code)</code> 
	 * @param entry
	 */
	public void dispatch(Block.Entry entry){		
		Code code = entry.code; 
		try{
			if (code instanceof Codes.AssertOrAssume) {			
				analyze((Codes.AssertOrAssume)code);
			} else if (code instanceof Codes.Assign) {			
				analyze((Codes.Assign)code);
			} else if (code instanceof Codes.BinaryOperator) {			
				analyze((Codes.BinaryOperator)code);
			} else if (code instanceof Codes.StringOperator) {
				//StringOperatorInterpreter.getInstance().interpret((Codes.StringOperator)code, stackframe);
			} else if (code instanceof Codes.Convert) {			
				//ConvertInterpreter.getInstance().interpret((Codes.Convert)code, stackframe);
			} else if (code instanceof Codes.Const) {			
				analyze((Codes.Const)code);
			} else if (code instanceof Codes.Debug) {
				//DebugInterpreter.getInstance().interpret((Codes.Debug)code, stackframe);
			} else if (code instanceof Codes.Dereference) {
				//DereferenceInterpreter.getInstance().interpret((Codes.Dereference)code, stackframe);
			} else if (code instanceof Codes.Fail) {
				//FailInterpreter.getInstance().interpret((Codes.Fail)code, stackframe);
			} else if (code instanceof Codes.FieldLoad) {		
				//FieldLoadInterpreter.getInstance().interpret((Codes.FieldLoad)code, stackframe);			
			} else if (code instanceof Codes.ForAll) {				
				analyze((Codes.ForAll)code);
			} else if (code instanceof Codes.Goto) {	
				//GotoInterpreter.getInstance().interpret((Codes.Goto)code, stackframe);
			} else if (code instanceof Codes.If) {
				analyze((Codes.If)code);			
			} else if (code instanceof Codes.IfIs) {
				//IfIsInterpreter.getInstance().interpret((Codes.IfIs)code, stackframe);
			} else if (code instanceof Codes.IndexOf) {			
				analyze((Codes.IndexOf)code);
			} else if (code instanceof Codes.IndirectInvoke) {			
				//IndirectInvokeInterpreter.getInstance().interpret((Codes.IndirectInvoke)code, stackframe);
			} else if (code instanceof Codes.Invoke) {			
				analyze((Codes.Invoke)code);
			} else if (code instanceof Codes.Invert) {
				//InvertInterpreter.getInstance().interpret((Codes.Invert)code, stackframe);
			} else if (code instanceof Codes.ListOperator) {
				analyze((Codes.ListOperator)code);
			} else if (code instanceof Codes.Loop) {			
				analyze((Codes.Loop)code);			
			} else if (code instanceof Codes.LoopEnd) {
				//LoopEndInterpreter.getInstance().interpret((Codes.LoopEnd)code, stackframe);									
			} else if (code instanceof Codes.Label) {
				analyze((Codes.Label)code);
			} else if (code instanceof Codes.Lambda) {
				//LambdaInterpreter.getInstance().interpret((Codes.Lambda)code, stackframe);
			} else if (code instanceof Codes.LengthOf) {			
				analyze((Codes.LengthOf)code);
			}  else if (code instanceof Codes.Move) {
				internalFailure("Not implemented!", "", entry);
			} else if (code instanceof Codes.NewMap) {
				//NewMapInterpreter.getInstance().interpret((Codes.NewMap)code, stackframe);
			} else if (code instanceof Codes.NewList) {			
				analyze((Codes.NewList)code);
			} else if (code instanceof Codes.NewRecord) {
				//NewRecordInterpreter.getInstance().interpret((Codes.NewRecord)code, stackframe);
			} else if (code instanceof Codes.NewSet) {
				//NewSetInterpreter.getInstance().interpret((Codes.NewSet)code, stackframe);
			} else if (code instanceof Codes.NewTuple) {
				//NewTupleInterpreter.getInstance().interpret((Codes.NewTuple)code, stackframe);
			} else if (code instanceof Codes.Return) {			
				analyze((Codes.Return)code);
			} else if (code instanceof Codes.NewObject) {
				//NewObjectInterpreter.getInstance().interpret((Codes.NewObject)code, stackframe);
			} else if (code instanceof Codes.Nop) {
				//NopInterpreter.getInstance().interpret((Codes.Nop)code, stackframe);
			} else if (code instanceof Codes.SetOperator){
				//SetOperatorInterpreter.getInstance().interpret((Codes.SetOperator)code, stackframe);
			} else if (code instanceof Codes.SubList) {
				analyze((Codes.SubList)code);
			} else if (code instanceof Codes.SubString) {
				//SubStringInterpreter.getInstance().interpret((Codes.SubString)code, stackframe);
			} else if (code instanceof Codes.Switch) {
				//SwitchInterpreter.getInstance().interpret((Codes.Switch)code, stackframe);
			} else if (code instanceof Codes.Throw) {
				//ThrowInterpreter.getInstance().interpret((Codes.Throw)code, stackframe);
			} else if (code instanceof Codes.TryCatch) {
				//TryCatchInterpreter.getInstance().interpret((Codes.TryCatch)code, stackframe);
			} else if (code instanceof Codes.TupleLoad) {
				//TupleLoadInterpreter.getInstance().interpret((Codes.TupleLoad)code, stackframe);
			} else if (code instanceof Codes.UnaryOperator){
				analyze((Codes.UnaryOperator)code);
			} else if (code instanceof Codes.Update) {
				//UpdateInterpreter.getInstance().interpret((Codes.Update)code, stackframe);
			} else {
				internalFailure("unknown wyil code encountered (" + code + ")", "", entry);
			}
		} catch (SyntaxError ex) {
			throw ex;	
		} catch (Exception ex) {		
			internalFailure(ex.getMessage(), "", entry, ex);
		}

	}
	

	public void analyze(Codes.AssertOrAssume code){
		//Set the assert_label so that no constraints are added to list.
		this.assert_label = code.target;
		
	}
	
	
	public void analyze(Codes.Assign code){
		//Check if the assigned value is an integer
		if(code.type() instanceof Type.Int ||
				(code.type()instanceof Type.List && ((Type.List)code.type()).element() instanceof Type.Int)){
			//Add the constraint 'target = operand'
			addConstraintToCurrentList(new Assign("%"+code.target(), "%"+code.operand(0)));
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
			addConstraintToCurrentList(new Const(name, ((Constant.Integer)constant).value));
		}
	}
	/**
	 * Implements the propagation rule for <code>Codes.IndexOf</code> bytecode
	 * to assign the bounds from the source operator register to the target operator.
	 * @param code
	 */
	public void analyze(Codes.IndexOf code){		
		if(code.type() instanceof Type.List){
			Type elemType = ((Type.List)code.type()).element();
			if(elemType instanceof Type.Int){
				addConstraintToCurrentList(new Assign("%"+code.target(), "%"+code.operand(0)));
			}	
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
				branchConstraintList(code.target, new Equals(left+"_"+code.target, right));
				addConstraintToCurrentList(new GreaterThanEquals(left, right));
				break;
			case NEQ:				

				break;
			case LT:			
				branchConstraintList(code.target, new LessThan(left+"_"+code.target, right));
				addConstraintToCurrentList(new GreaterThanEquals(left, right));
				break;
			case LTEQ:
				//Add the 'left <= right' constraint to the branched list.
				branchConstraintList(code.target, new LessThanEquals(left+"_"+code.target, right));
				//Add the constraint 'left>right' to current list
				addConstraintToCurrentList(new GreaterThan(left, right));
				break;
			case GT:					
				branchConstraintList(code.target, new GreaterThan(left+"_"+code.target, right));
				addConstraintToCurrentList(new LessThanEquals(left, right));
				break;
			case GTEQ:
				//Branch and add the left >= right constraint to 
				branchConstraintList(code.target, new GreaterThanEquals(left+"_"+code.target, right));
				//Add the constraint 'left< right' to current constraint list.
				addConstraintToCurrentList(new LessThan(left, right));		
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
		
		Type returnType = code.type().ret();
		if(returnType instanceof Type.Int){
			//String return_reg = "%"+code.target();
			//this.getConstraintList().addConstraint(new Equals(return_reg, func_name));
		}*/
		
		//Get the fun declaration from module.
		//FunctionOrMethodDeclaration functionOrMethod = module.functionOrMethod(code.name.name(), code.type());		
		
		
		/*int index = 0;
		for(Type paramType: code.type().params()){
			//Get the input parameters of integer type
			if(paramType instanceof Type.Int){
				String param = "%"+code.operand(index);
				//Missing the variable name of function input parameters, so we used the function name temporarily.
				//Add the equal constraint for input parameter.
				addConstraint(new Union(functionOrMethod.name(), param));
			}
			index++;			
		}*/
		
		
		
		//Check if the function has been analyzed. If so, the union of bounds shall be used to
		//add the equality 
		/*if(unionOfBoundsMap.containsKey(functionOrMethod)){
			Bounds bounds = unionOfBoundsMap.get(functionOrMethod);
			//Check if the return type is integer
			if(code.type().ret() instanceof Type.Int){
				//Add the range constraint for the return register.
				addConstraint(new Range("%"+code.target(), bounds.getLower("return"), bounds.getUpper("return")));
			}	
						
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
		if(label.equals(this.assert_label)){
			this.assert_label = "";
		}else{
			if(constraintListMap.containsKey(label)){
				//Switch the current constraint list by setting the label with new value.
				setLabel(label);
			}		
		}
		
	}
	
	
	
	
	/**
	 * Add the 'equal' constraints of the target and operand register.
	 * @param code
	 */
	public void analyze(Codes.NewList code){
		
		if(code.type().element() instanceof Type.Int){
			for(int operand: code.operands()){
				addConstraintToCurrentList(new Union("%"+code.target(), "%"+operand));				
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
		if(returnType instanceof Type.Int ||
				(returnType instanceof Type.List && ((Type.List)returnType).element() instanceof Type.Int)){
			//Add the 'Equals' constraint to the return (ret) variable.
			addConstraintToAllList((new Equals("return", ret)));		
		}		
	}
	
	public void analyze(Codes.ListOperator code){
		switch(code.kind){
		case APPEND:
			for(int operand : code.operands()){
				addConstraintToCurrentList(new Equals("%"+code.target(), "%"+operand));
			}
			break;
		case LEFT_APPEND:
			
			break;
		case RIGHT_APPEND:
			
			break;
		default:
			internalFailure("Not implemented!", "Analyzer.java", null);
			break;
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
				addConstraintToCurrentList(new Negate(x, y));
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
	
	/**
	 * Parses the 'ForAll' bytecode and adds the assign constraint, e.g. <br>
	 * <code>forall %5 in %0 () : [int]</code>
	 * adds the constraint '%5 = %0', which propagtes the bounds from %0 to %5.
	 * @param code the 'forall' bytecode
	 */
	public void analyze(Codes.ForAll code){
		//Check if each element is an integer
		if(code.type.element() instanceof Type.Int){
			//Propagate the range of source register to the index reg 
			addConstraintToCurrentList(new Assign("%"+code.indexOperand, "%"+code.sourceOperand));
		}		
		
	}
	
	/**
	 * The bounds of a list/map shall be propagated from the operand to the target.  
	 * @param code
	 */
	public void analyze(Codes.LengthOf code){		
		addConstraintToCurrentList(new Equals("%"+code.target(), "%"+code.operand(0)));		
	}
	
	
	public void analyze(Codes.Loop code){		
		for(int operand : code.modifiedOperands){
		//	addConstraint(new Equals("%"+code.target, "%"+operand));
		}
	}
	
	
	public void analyze(Codes.SubList code){
		if(code.type().element() instanceof Type.Int){
			for(int operand: code.operands()){
				addConstraintToCurrentList(new Equals("%"+code.target(), "%"+operand));
			}			
		}
	}
	/**
	 * Implemented the propagation rule for <code>Codes.BinaryOperator</code> code
	 * to add the 'equal' constraints of operands and target registers. 
	 * @param code
	 */
	public void analyze(Codes.BinaryOperator code){
		if(code.type() instanceof Type.Int){
			switch (code.kind) {
			case ADD:
				break;
			case SUB:			
				for(int operand: code.operands()){
					addConstraintToCurrentList(new Equals("%"+code.target(), "%"+operand));
				}
				break;
			case MUL:		
				break;
			case DIV:			
				break;			
			case REM:
				break;			
			case RANGE:
				break;
			case BITWISEAND:
				break;			
			case BITWISEOR:
				break;	
			case BITWISEXOR:
				break;		
			case LEFTSHIFT:
				break;			
			case RIGHTSHIFT:
				break;			
			default:
				internalFailure("unknown binary expression encountered", "Analyzer.java", null);		
			}
		}
		
	}
	
}
