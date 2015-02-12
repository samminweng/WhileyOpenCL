package wyopcl.translator.symbolic;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
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
import wyil.lang.Type;
import wyil.lang.WyilFile.Case;
import wyil.lang.WyilFile.FunctionOrMethodDeclaration;
import wyopcl.translator.Configuration;
import wyopcl.translator.symbolic.pattern.NullPattern;
import wyopcl.translator.symbolic.pattern.P1;
import wyopcl.translator.symbolic.pattern.P2;
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
	private final String prefix="%";	
	private List<Class<? extends Pattern>> avail_patterns;//Store the available patterns.
	private String label_AssertOrAssume;//The flag to store the label for an assertion or assumption.	

	public PatternMatcher(Configuration config){
		this.config = config;
		this.avail_patterns = new ArrayList<Class<? extends Pattern>>();
		this.avail_patterns.add(P1.class);
		this.avail_patterns.add(P2.class);
		this.label_AssertOrAssume = null;
	}	

	/**
	 * Check if the code is a constant assignment and put the symbol and value into the symbol table. 
	 *
	 * @param code
	 */
	private void putExpr(Expr expr, HashMap<String, Expr> expressiontable){
		if(expr.getTarget()!=null){
			//Check if the target exists in the expression table.
			if(!expressiontable.containsKey(expr.getTarget())){
				System.out.println(expr.getTarget() + " = "+ expr);
				//Add to the expression table.
				expressiontable.put(expr.getTarget(), expr);
			}			
		}else{
			//Nullify the expr object.
			expr = null;
		}
	}


	/**
	 * Check if the code is inside an assertion or assumption.
	 * @param code the code.
	 * @return true if the code belongs to the assertion or assumption. Otherwise, return false.
	 */
	private boolean checkAssertOrAssume(Code code){
		if(label_AssertOrAssume == null){
			if(code instanceof Codes.AssertOrAssume){
				Codes.AssertOrAssume assertOrAssume = (Codes.AssertOrAssume)code;
				label_AssertOrAssume = assertOrAssume.target;
				return true;
			}		
		}else{			
			if(code instanceof Codes.Label){
				Codes.Label label = (Codes.Label)code;
				if(label_AssertOrAssume.equals(label.label)){
					//Nullify the label of an assertion or assumption. 
					label_AssertOrAssume = null;
					return true;
				}					
			}
		}
		//In other cases, if the label is not null, then the code is inside the assertion or assumption.
		return (label_AssertOrAssume == null)? true: false;
	}


	/**
	 * Iterate each code of the input function and build up the loop blk.
	 * @param functionOrMethod
	 */
	public void buildCodeBlockAndMatchPattern(FunctionOrMethodDeclaration functionOrMethod){
		int line = 0;
		String func_name = functionOrMethod.name();
		//Store 
		List<Code> code_blk = new ArrayList<Code>();
		//Store the register along with the corresponding expression.
		HashMap<String, Expr> expressiontable = new HashMap<String, Expr>();
		//Add the input parameters to the expression table.
		int param_size = functionOrMethod.type().params().size();
		for(int index=0;index<param_size;index++){
			putExpr(new Expr(prefix+index), expressiontable);
		}
		//Iterate each byte-code of a function block.			
		for(Case mcase : functionOrMethod.cases()){
			//End of the function
			System.out.println("\n----------------Start of "+func_name+" function----------------");	
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
				//Check if the bytecode is inside an assertion or assumption
				//Omit the bytecode in a assertion or assumption.
				if(checkAssertOrAssume(code)){					
					//Create the expression and put it into the table.
					putExpr(new Expr(code), expressiontable);
					//Add the code into the code block.
					code_blk.add(code);
				}		
			}			
			Pattern pattern = analyzePattern(code_blk, expressiontable);
			String result = "";
			result += "{";
			//Print out all the bytecode in the loop block
			for(Code code: code_blk){
				if(code instanceof Codes.Loop || code instanceof Codes.LoopEnd){
					result += "\n\t"+code;
				}else{
					result += "\n\t\t"+code;
				}							
			}
			result += "\n}";
			result +="\n"+pattern;
			System.out.println(result);
			code_blk = null;
			expressiontable = null;
			//End of the function
			System.out.println("\n----------------End of "+func_name+" function----------------\n");
		}		

	}	


	/**
	 * Takes the list of loop bytecode as input, take the block of loop bytecode, iterate over all available patterns
	 * and check if the given loop is matched with any one of them by using the pattern checker.
	 * @param block the code block
	 * @param expressiontable the table of expressions
	 * @return pattern. If not found, return null.
	 */
	private Pattern analyzePattern(List<Code> loop_block, HashMap<String, Expr> expressiontable){
		Pattern pattern = null;		
		//Iterate over all the available patterns.
		for(Class<? extends Pattern> avail_pattern: avail_patterns){
			try {
				//Get the constructor				
				Constructor<? extends Pattern> constructor = avail_pattern.getConstructor(List.class, HashMap.class);
				if(constructor!=null){
					pattern = constructor.newInstance(loop_block, expressiontable);
					//Check if the loop block is matched with the pattern. If so, then return the pattern. 
					if(!pattern.isNil()){
						return pattern;
					}					
				}								
			} catch (InstantiationException | IllegalAccessException | IllegalArgumentException
					| InvocationTargetException | NoSuchMethodException | SecurityException e) {				
				e.printStackTrace();
			}
			pattern = null;
		}
		//If no patterns are matched, then return NullPattern.
		if(pattern == null){
			pattern = new NullPattern(loop_block, expressiontable);
		}		

		return pattern;
	}


}
