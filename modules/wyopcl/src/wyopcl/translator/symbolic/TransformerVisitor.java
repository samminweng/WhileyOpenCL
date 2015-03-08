package wyopcl.translator.symbolic;

import java.util.List;

import wyil.lang.Code;
import wyopcl.translator.symbolic.pattern.BuildListPattern;
import wyopcl.translator.symbolic.pattern.WhileLoopPattern;
/**
 * This implementation deals with what to do when we visit a Visitable Pattern.
 * @see http://java.dzone.com/articles/design-patterns-visitor
 * @author Min-Hsien Weng
 *
 */
public class TransformerVisitor implements Visitor{
	private WhileLoopPatternTransformer whileloopTransformer;
	private BuildListPatternTransformer buildlistTransformer;
	public TransformerVisitor(){
		this.whileloopTransformer = new WhileLoopPatternTransformer();
		this.buildlistTransformer = new BuildListPatternTransformer();
	}	
	
	@Override
	public List<Code> visit(BuildListPattern p) {
		return buildlistTransformer.transform(p);		
	}

	@Override
	public List<Code> visit(WhileLoopPattern p) {
		return whileloopTransformer.transform(p);
	}
	
	
}
