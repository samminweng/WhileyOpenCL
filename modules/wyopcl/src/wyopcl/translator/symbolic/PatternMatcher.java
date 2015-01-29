package wyopcl.translator.symbolic;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Codes.Comparator;
import wyil.lang.Constant;
import wyil.lang.Code.Block;
import wyil.lang.Codes.BinaryOperatorKind;
import wyil.lang.WyilFile.Case;
import wyil.lang.WyilFile.FunctionOrMethodDeclaration;
import wyopcl.translator.Configuration;
import wyopcl.translator.symbolic.pattern.NullPattern;
import wyopcl.translator.symbolic.pattern.P1;
import wyopcl.translator.symbolic.pattern.P2;
import wyopcl.translator.symbolic.pattern.P3;
import wyopcl.translator.symbolic.pattern.P4;
import wyopcl.translator.symbolic.pattern.Pattern;

/**
 * 
 * This class infers the pattern from a list of code and outputs the pattern object. 
 * This pattern matcher is implemented with <a href="http://www.tutorialspoint.com/design_pattern/factory_pattern.htm">factory pattern</a> 
 *  
 * @author Min-Hsien Weng
 *
 */
public class PatternMatcher {
	private final Configuration config;
	private final String prefix = "%";
	private HashMap<String, Expr> expressiontable;//Store constant integers along with symbols.

	public PatternMatcher(Configuration config){
		this.config = config;
		this.expressiontable = new HashMap<String, Expr>(); 
	}	

	/**
	 * Check if the code is a constant assignment and put the symbol and value into the symbol table. 
	 *
	 * @param code
	 */
	private void putExpression(Code code){
		if(code instanceof Codes.Assign || code instanceof Codes.Const){
			Expr expr = new Expr(code);
			expressiontable.put(expr.getTarget(), expr);			
		}
	}
	/**
	 * Get the symbol value from symbol table.
	 * @param op
	 * @return value(Expr). If not found, return null.
	 */
	private Expr getExpr(String op){
		if(expressiontable.containsKey(op)){
			return expressiontable.get(op);						
		}		
		return null;
	}

	/**
	 * Iterate each code of the input function and build up the loop blk.
	 * @param functionOrMethod
	 */
	public HashMap<String, List<Code>> buildLoopBlock(FunctionOrMethodDeclaration functionOrMethod){
		//Clear the symbol table.
		expressiontable.clear();
		HashMap<String, List<Code>> loop_blks = new HashMap<String, List<Code>>();
		List<Code> loop_blk = null;
		int line = 0;
		String func_name = functionOrMethod.name();
		//Iterate each byte-code of a function block.			
		for(Case mcase : functionOrMethod.cases()){
			//Parse each byte-code and add the constraints accordingly.
			for(Block.Entry entry :mcase.body()){
				Code code = entry.code;
				//Print out the bytecode if verbose is enabled.
				if(config.isVerbose()){
					if(code instanceof Codes.Label){
						System.out.println(func_name+"."+(++line)+" ["+code+"]");
					}else{
						System.out.println(func_name+"."+(++line)+" [\t"+code+"]");
					}
				}
				
				
				
				//Start a loop block
				if(code instanceof Codes.Loop){
					Codes.Loop loop = (Codes.Loop)code;
					String loop_label = loop.target;
					//Lazy initialization
					if(!loop_blks.containsKey(loop_label)){
						loop_blks.put(loop_label, new ArrayList<Code>());
					}
					loop_blk = loop_blks.get(loop_label);
				}
				
				//Decide whether to put the code into loop blk or expression table.
				if(loop_blk==null){
					putExpression(code);
				}else{
					loop_blk.add(code);	
				}
				
				//End the loop block
				if(code instanceof Codes.Label){
					Codes.Label label = (Codes.Label)code;
					String loop_label = label.label;
					if(loop_blks.containsKey(loop_label)){
						loop_blk = null;
					}					
				}
			}
		}		
		return loop_blks;
	}

	/**
	 * Get the loop variable
	 * @param blk
	 * @return
	 */
	private String loop_Var(List<Code> blk){
		for(Code code: blk){
			if(code instanceof Codes.Loop){
				Codes.Loop loop = (Codes.Loop)code;
				int[] ops = loop.modifiedOperands;
				if(ops.length >=1){
					return	prefix+ops[0];
				}				
			}
		}		
		return null;
	}

	/**
	 * Get the decremental value for the given loop variable.
	 * @param V
	 * @param blk
	 * @return decrement value (Expr). If not matched, return null;
	 */
	private Expr decr(String V, List<Code> blk){
		for(Code code: blk){							
			if(code instanceof Codes.BinaryOperator){
				Codes.BinaryOperator binOp = (Codes.BinaryOperator)code;
				BinaryOperatorKind kind = binOp.kind;
				//Check if the op kind is subtract
				if(kind.equals(BinaryOperatorKind.SUB)){
					int size = binOp.operands().length; 
					//Check if the loop variable is used in the code
					for(int index=0; index<size;index++){
						String op = prefix+binOp.operand(index);
						if(V.equals(op)&&(index+1)<size){
							//Get the next oprand
							return getExpr(prefix+binOp.operand(++index));							
						}				
					}
				}				
			}						
		}		
		return null;
	}

	/**
	 * Get the incremental value for the given loop variable.
	 * @param V the loop variable
	 * @param blk the loop block
	 * @return decrement value (BigInteger). If not matched, return null;
	 */
	private Expr incr(String V, List<Code> blk){
		//Used to map the symbol with values (BigInteger).		
		for(Code code: blk){							
			if(code instanceof Codes.BinaryOperator){
				Codes.BinaryOperator binOp = (Codes.BinaryOperator)code;
				BinaryOperatorKind kind = binOp.kind;
				//Check if the op kind is subtract
				if(kind.equals(BinaryOperatorKind.ADD)){
					int size = binOp.operands().length; 
					//Check if the loop variable is used in the code
					for(int index=0; index<size;index++){
						String op = prefix+binOp.operand(index);
						if(V.equals(op)&&(index+1)<size){
							//Get the next oprand
							return new Expr(code);							
						}				
					}
				}				
			}						
		}		
		return null;
	}

	private Expr init(String V){
		return getExpr(V);		
	}


	private Expr while_cond(String V, String compareOp, List<Code> blk){
		for(Code code: blk){
			if(code instanceof Codes.If){
				Codes.If if_code = (Codes.If)code;
				if(V.equals(prefix+if_code.leftOperand)){
					if(compareOp.equals(if_code.op.toString())){
						String bound_op = prefix+if_code.rightOperand;
						return getExpr(bound_op);
					}					
				}				
			}		
		}		
		return null;
	}

	/**
	 * Takes the list of loop bytecode as input, take the block of loop bytecode, iterate over all available patterns
	 * and check if the given loop is matched with any one of them by using the pattern checker.
	 * @param loop_block the block of a given loop
	 * @return pattern. If not found, return null.
	 */
	public Pattern analyze(List<Code> loop_block){
		Pattern pattern;
		String V = loop_Var(loop_block);
		//Get initial value from symbol table.
		Expr init = init(V);
		//Check if loop var is incremented or decremented by a constant.
		Expr decr = decr(V, loop_block);
		Expr incr = incr(V, loop_block);
		pattern = new P1(V, init, decr, incr, "gt", while_cond(V, "gt", loop_block));
		if(pattern.isNil()){
			pattern = new P2(V, init, decr, incr, "ge", while_cond(V, "ge", loop_block)); 
			if(pattern.isNil()){
				pattern = new P3(V, init, decr, incr, "lt", while_cond(V, "lt", loop_block)); 
				if(pattern.isNil()){
					pattern = new P4(V, init, decr, incr, "le", while_cond(V, "le", loop_block));
					if(pattern.isNil()){
						pattern = new NullPattern();
					}
				}
			}
		}

		return pattern;
	}


}
