package wyopcl.translator.symbolic;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Code.Block;
import wyil.lang.WyilFile.Case;
import wyil.lang.WyilFile.FunctionOrMethodDeclaration;
import wyopcl.translator.Configuration;

/**
 * 
 * 
 * 
 * 
 * 
 * This pattern matcher is implemented with <a href="http://www.tutorialspoint.com/design_pattern/factory_pattern.htm">factory pattern</a> 
 *  
 * @author Min-Hsien Weng
 *
 */
public class PatternMatcher {
	private final Configuration config;
	private HashMap<String, List<Code>> loop_blks;
	
	public PatternMatcher(Configuration config){
		this.config = config;
		this.loop_blks = new HashMap<String, List<Code>>();
	}	
	
	/**
	 * Iterate each code of the input function and build up the loop blk.
	 * @param functionOrMethod
	 */
	public void buildLoopBlock(FunctionOrMethodDeclaration functionOrMethod){
		List<Code> loop_blk = null;
		//Iterate each byte-code of a function block.			
		for(Case mcase : functionOrMethod.cases()){
			//Parse each byte-code and add the constraints accordingly.
			for(Block.Entry entry :mcase.body()){
				Code code = entry.code;
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
				
				if(loop_blk != null){
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
		
		
	}
	
	
	
	
	
	
	private String loop_Var(List<Codes> loop_block){
		String loop_var = null;
		for(Codes code: loop_block){
			
		}		
		return loop_var;
	}
	
	
	
	/**
	 * Takes the list of loop bytecode as input, take the block of loop bytecode, iterate over all available patterns
	 * and check if the given loop is matched with any one of them by using the pattern checker.
	 * @param loop_block
	 */
	public void getPattern(List<Codes> loop_block){		
		String loop_variable = loop_Var(loop_block);
	}
	
	
}
