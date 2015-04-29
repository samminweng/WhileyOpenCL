package wyopcl.translator.symbolic;

import java.util.ArrayList;
import java.util.List;

import wyil.lang.Code;
import wyopcl.translator.symbolic.pattern.Pattern;
import wyopcl.translator.symbolic.pattern.transform.BuildListPatternTransformer;
import wyopcl.translator.symbolic.pattern.transform.Transformable;
import wyopcl.translator.symbolic.pattern.transform.Transformer;
/**
 * 
 * Given a pattern, searches for the suitable transformer to do program transformation and outputs the transformed code.
 * @author Min-Hsien Weng
 *
 */
public class PatternTransformer {
	private List<Transformer> avail_transformers;
	public PatternTransformer(){
		this.avail_transformers = new ArrayList<Transformer>();
		//Added the available transformer.
		//this.avail_transformers.add(new WhileLoopIncrPatternTransformer());
		this.avail_transformers.add(new BuildListPatternTransformer());
	}
	
	/**
	 * If the pattern is transformable, then we can perform the pattern transformation on it. Otherwise, do nothing.
	 * @param p
	 * @return
	 */
	public List<Code> transformPatternUsingVisitor(Pattern p) {
		//Check if the pattern is transformable. If so, then find the corresponding transformer to do program transformation. 
		if(p instanceof Transformable){
			//Iterate all the classes
			for(Transformer avail_transformer : avail_transformers){				
				List<Code> code_blk = ((Transformable) p).accept(avail_transformer);
				if(code_blk != null){
					return code_blk;
				}
			}
		}		
		return null;		
	}
	
}
