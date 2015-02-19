package wyopcl.translator.symbolic;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import wyil.lang.Code;
import wyil.lang.Code.Block;
import wyil.lang.Codes;
import wyil.lang.WyilFile.Case;
import wyil.lang.WyilFile.FunctionOrMethodDeclaration;
import wyopcl.translator.Configuration;
import wyopcl.translator.symbolic.pattern.ForAllPattern;
import wyopcl.translator.symbolic.pattern.NullPattern;
import wyopcl.translator.symbolic.pattern.WhileLoopDecrPattern;
import wyopcl.translator.symbolic.pattern.WhileLoopIncrPattern;
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
	//private final String prefix = "%";
	private final Configuration config;	
	private List<Class<? extends Pattern>> avail_patterns;//Store the available patterns.

	public PatternMatcher(Configuration config){
		this.config = config;
		this.avail_patterns = new ArrayList<Class<? extends Pattern>>();
		this.avail_patterns.add(WhileLoopDecrPattern.class);
		this.avail_patterns.add(WhileLoopIncrPattern.class);
		//this.avail_patterns.add(ForAllPattern.class);
	}

	/**
	 * Iterate each code of the input function and build up the loop blk.
	 * @param functionOrMethod
	 */
	public void buildCodeBlockAndMatchPattern(FunctionOrMethodDeclaration functionOrMethod){
		int line = 0;
		String func_name = functionOrMethod.name();			
		int param_size = functionOrMethod.type().params().size();
		//Iterate each byte-code of a function block.			
		for(Case mcase : functionOrMethod.cases()){
			//Store the list of code for a function.
			List<Code> code_blk = new ArrayList<Code>();	
			//Begin the function
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
				code_blk.add(code);					
			}			
			Pattern pattern = analyzePattern(param_size, code_blk);
			System.out.println("The original pattern:\n"+pattern);
			//Pattern pattern_1 = transform(pattern);
			//System.out.println("From "+pattern.getType()+" to "+pattern_1.getType()+", the transformed pattern:\n"+pattern_1);
			//Pattern pattern_2 = transform(pattern_1);
			//System.out.println("From "+pattern_1.getType()+" to "+pattern_2.getType()+", the transformed pattern:\n"+pattern_2);
			code_blk = null;
			//End of the function
			System.out.println("\n----------------End of "+func_name+" function----------------\n");
		}		

	}

	/**
	 * Takes the list of loop bytecode as input, take the block of loop bytecode, iterate over all available patterns
	 * and check if the given loop is matched with any one of them by using the pattern checker.
	 * @param param_size the size of input parameters.
	 * @param block the code block
	 * @return pattern. If not found, return null.
	 */
	public Pattern analyzePattern(int param_size, List<Code> block){
		Pattern pattern = null;		
		//Iterate over all the available patterns.
		for(Class<? extends Pattern> avail_pattern: avail_patterns){
			try {
				//Get the constructor				
				Constructor<? extends Pattern> constructor = avail_pattern.getConstructor(int.class, List.class);
				if(constructor!=null){
					pattern = constructor.newInstance(param_size, block);
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
			pattern = new NullPattern(param_size, block);
		}
		return pattern;
	}


}
