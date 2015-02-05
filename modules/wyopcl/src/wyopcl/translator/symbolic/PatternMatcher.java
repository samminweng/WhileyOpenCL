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
	private void putExpr(Code code){
		Expr expr = new Expr(code);
		if(expr.getTarget()!=null){
			System.out.println(expr.getTarget() + " = "+ expr);
			//Add to the expression table.
			expressiontable.put(expr.getTarget(), expr);
		}else{
			//Nullify the expr object.
			expr = null;
		}
		
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
				if(loop_blk!=null){
					loop_blk.add(code);	
				}else{
					//Create the expression and put it into the table.
					putExpr(code);
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
	 * Get the incremental value for the given loop variable.
	 * @param V the loop variable
	 * @param blk the loop block
	 * @return decrement value (BigInteger). If not matched, return null;
	 *//*
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
							expr.addVarOrConstant(BigInteger.ONE, prefix+binOp.operand(index+1));
							return expr;							
						}				
					}
				}				
			}						
		}		
		return null;
	}*/

	
	/**
	 * Takes the list of loop bytecode as input, take the block of loop bytecode, iterate over all available patterns
	 * and check if the given loop is matched with any one of them by using the pattern checker.
	 * @param loop_block the block of a given loop
	 * @return pattern. If not found, return null.
	 */
	private Pattern analyze(List<Code> loop_block){
		Pattern pattern;
		/*String V = loop_Var(loop_block);
		//Get initial value from symbol table.
		Expr init = init(V);
		//Check if loop var is incremented or decremented by a constant.
		Expr decr = decr(V, loop_block);
		Expr incr = incr(V, loop_block);*/
		pattern = new P1(loop_block, expressiontable);
		/*if(pattern.isNil()){
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
		}*/	

		return pattern;
	}


}
