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
	private final String prefix="%";
	private HashMap<String, Expr> expressiontable;//Store constant integers along with symbols.
	private List<Class<? extends Pattern>> avail_patterns;//Store the available patterns.
	public PatternMatcher(Configuration config){
		this.config = config;
		this.expressiontable = new HashMap<String, Expr>();
		this.avail_patterns = new ArrayList<Class<? extends Pattern>>();
		this.avail_patterns.add(P1.class);
		this.avail_patterns.add(P2.class);
	}	

	/**
	 * Check if the code is a constant assignment and put the symbol and value into the symbol table. 
	 *
	 * @param code
	 */
	private void putExpr(Expr expr){
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
	 * Iterate each code of the input function and build up the loop blk.
	 * @param functionOrMethod
	 */
	public void buildLoopBlockAndMatchPattern(FunctionOrMethodDeclaration functionOrMethod){
		List<Code> loop_blk = null;
		String loop_label = null;
		int line = 0;
		String func_name = functionOrMethod.name();
		//Clear the symbol table.
		expressiontable.clear();
		//Add the input parameters to the expression table.
		int param_size = functionOrMethod.type().params().size();
		for(int index=0;index<param_size;index++){
			putExpr(new Expr(prefix+index));
		}
		
		String label_AssertOrAssume = null;
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
				
				if(code instanceof Codes.AssertOrAssume){
					Codes.AssertOrAssume assertOrAssume = (Codes.AssertOrAssume)code;
					label_AssertOrAssume = assertOrAssume.target;
				}				
				
				//Check if the bytecode is inside an assertion or assumption
				//Omit the bytecode in a assertion or assumption.
				if(label_AssertOrAssume == null){					
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
					}
					//Create the expression and put it into the table.
					putExpr(new Expr(code));

					//End the loop block
					if(code instanceof Codes.Label){
						Codes.Label label = (Codes.Label)code;
						if(loop_blk!=null && loop_label.equals(label.label)){						
							Pattern pattern = analyze(loop_blk);
							String result = "";
							result += "{";
							//Print out all the bytecode in the loop block
							for(Code loop_code: loop_blk){
								if(code instanceof Codes.Loop || code instanceof Codes.LoopEnd){
									result += "\n\t"+loop_code;
								}else{
									result += "\n\t\t"+loop_code;
								}							
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
				
				//Nullify the label of an assertion or assumption. 
				if(label_AssertOrAssume!= null){
					if(code instanceof Codes.Label){
						Codes.Label label = (Codes.Label)code;
						if(label_AssertOrAssume.equals(label.label)){
							label_AssertOrAssume = null;
						}					
					}				
				}			
			}			
			//End of the function
			System.out.println("\n----------------End of "+func_name+" function----------------\n");
		}		

	}	


	/**
	 * Takes the list of loop bytecode as input, take the block of loop bytecode, iterate over all available patterns
	 * and check if the given loop is matched with any one of them by using the pattern checker.
	 * @param loop_block the block of a given loop
	 * @return pattern. If not found, return null.
	 */
	private Pattern analyze(List<Code> loop_block){
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
				// TODO Auto-generated catch block
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
