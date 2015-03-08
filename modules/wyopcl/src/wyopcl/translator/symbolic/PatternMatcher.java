package wyopcl.translator.symbolic;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import wyil.lang.Code;
import wyil.lang.Code.Block;
import wyil.lang.Codes;
import wyil.lang.Type;
import wyil.lang.WyilFile.Case;
import wyil.lang.WyilFile.FunctionOrMethodDeclaration;
import wyopcl.translator.Configuration;
import wyopcl.translator.symbolic.pattern.BuildListFirstPattern;
import wyopcl.translator.symbolic.pattern.Pattern;
import wyopcl.translator.symbolic.pattern.BuildListPattern;
import wyopcl.translator.symbolic.pattern.ForAllPattern;
import wyopcl.translator.symbolic.pattern.NullPattern;
import wyopcl.translator.symbolic.pattern.Visitable;
import wyopcl.translator.symbolic.pattern.WhileLoopDecrPattern;
import wyopcl.translator.symbolic.pattern.WhileLoopIncrPattern;

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
	private List<Class<? extends Pattern>> avail_Patterns;//Store the available patterns.
	
	public PatternMatcher(Configuration config){
		this.config = config;
		this.avail_Patterns = new ArrayList<Class<? extends Pattern>>();
		this.avail_Patterns.add(BuildListFirstPattern.class);
		this.avail_Patterns.add(BuildListPattern.class);
		this.avail_Patterns.add(WhileLoopDecrPattern.class);
		this.avail_Patterns.add(WhileLoopIncrPattern.class);
		this.avail_Patterns.add(ForAllPattern.class);	
	}	

	/**
	 * Takes the list of loop bytecode as input, take the block of loop bytecode, iterate over all available patterns
	 * and check if the given loop is matched with any one of them by using the pattern checker.
	 * @param param_size the size of input parameters.
	 * @param block the code block
	 * @return pattern. If not found, return null.
	 */
	public Pattern analyzePattern(List<Type> params, List<Code> block){
		Pattern pattern = null;		
		//Iterate over all the available patterns.
		for(Class<? extends Pattern> avail_Pattern: avail_Patterns){
			try {
				//Get the constructor				
				Constructor<? extends Pattern> constructor = avail_Pattern.getConstructor(Configuration.class, List.class, List.class);
				if(constructor!=null){
					pattern = constructor.newInstance(config, params, block);
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
			pattern = new NullPattern(config);
		}
		return pattern;
	}

	/**
	 * Transform a pattern of one type to another by using the visitor design pattern. 
	 * If the pattern is visitable, then we can perform the pattern transformation on it. Otherwise, do nothing.
	 * @param p
	 * @return
	 */
	public List<Code> transformPatternUsingVisitor(Pattern p){
		TransformerVisitor visitor = new TransformerVisitor();
		List<Code> code_blk = null;
		if(p instanceof Visitable){
			code_blk = ((Visitable) p).accept(visitor);
		}		
		return code_blk;
	}
	
}
