package wyopcl.translator.symbolic;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map.Entry;
import java.util.TreeMap;

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
		if(code instanceof Codes.Assign || code instanceof Codes.Const
		  || code instanceof Codes.BinaryOperator){
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
	public void buildLoopBlockAndMatchPattern(FunctionOrMethodDeclaration functionOrMethod){
		List<Code> loop_blk = null;
		String loop_label = null;
		int line = 0;
		String func_name = functionOrMethod.name();
		//Iterate each byte-code of a function block.			
		for(Case mcase : functionOrMethod.cases()){
			//End of the function
			System.out.println("\n----------------Start of "+func_name+" function----------------");
			//Clear the symbol table.
			expressiontable.clear();
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
					loop_label = loop.target;
					//Lazy initialization
					if(loop_blk == null){
						loop_blk = new ArrayList<Code>();
					}
				}				
				//Decide whether to put the code into loop blk or expression table.
				if(loop_blk==null){
					putExpression(code);
				}else{
					if(code instanceof Codes.Const){
						putExpression(code);
					}
					loop_blk.add(code);	
				}				
				//End the loop block
				if(code instanceof Codes.Label){
					Codes.Label label = (Codes.Label)code;
					if(loop_blk!=null && loop_label.equals(label.label)){						
						Pattern pattern = analyze(loop_blk);
						String result = "";
						result += "{";
						//Loop block						
						for(Code loop_code: loop_blk){
							result += "\n\t"+loop_code;
						}
						result += "\n}";
						//Expression table
						//Sort the expression table by key
						TreeMap<String, Expr> sortedMap = new TreeMap<String, Expr>(expressiontable);
						for(Entry<String, Expr> expr:sortedMap.entrySet()){
							result += "\n"+expr.getKey() + " = " +expr.getValue();
						}
						sortedMap = null;
						result +="\n"+pattern;
						System.out.println(result);
						loop_blk = null;
						//reset the loop blk
						loop_label = null;
					}										
				}
			}			
			//End of the function
			System.out.println("\n----------------End of "+func_name+" function----------------\n");
		}		

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
							//Create an expression to store the decremental value.
							Expr expr = new Expr(BigInteger.ZERO);
							expr.addVar(prefix+binOp.operand(index+1), BigInteger.ONE.negate());
							return expr;							
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
							//Create an expression to store the decremental value.
							Expr expr = new Expr(BigInteger.ZERO);
							expr.addVar(prefix+binOp.operand(index+1), BigInteger.ONE);
							return expr;							
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
				//Check if the loop var occurs in the condition
				if(V.equals(prefix+if_code.leftOperand)){
					switch(compareOp){
					case ">":
						if(if_code.op.equals(Comparator.LTEQ)){
							return new Expr(code);	
						}
						break;
					case ">=":
						if(if_code.op.equals(Comparator.LT)){
							return new Expr(code);	
						}
						break;
					case "<":
						if(if_code.op.equals(Comparator.GTEQ)){
							return new Expr(code);	
						}							
						break;
					case "<=":
						if(if_code.op.equals(Comparator.GT)){
							return new Expr(code);	
						}
						break;
					default:
						throw new RuntimeException("Unknown comparator operator "+compareOp);
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
	private Pattern analyze(List<Code> loop_block){
		Pattern pattern;
		String V = loop_Var(loop_block);
		//Get initial value from symbol table.
		Expr init = init(V);
		//Check if loop var is incremented or decremented by a constant.
		Expr decr = decr(V, loop_block);
		Expr incr = incr(V, loop_block);
		pattern = new P1(V, init, decr, incr, while_cond(V, ">", loop_block));
		if(pattern.isNil()){
			pattern = new P2(V, init, decr, incr, while_cond(V, ">=", loop_block)); 
			if(pattern.isNil()){
				pattern = new P3(V, init, decr, incr, while_cond(V, "<", loop_block)); 
				if(pattern.isNil()){
					pattern = new P4(V, init, decr, incr, while_cond(V, "<=", loop_block));
					if(pattern.isNil()){
						pattern = new NullPattern();
					}
				}
			}
		}	

		return pattern;
	}


}
