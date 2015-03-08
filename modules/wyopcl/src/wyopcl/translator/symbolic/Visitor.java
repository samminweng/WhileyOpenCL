package wyopcl.translator.symbolic;

import java.util.List;

import wyil.lang.Code;
import wyopcl.translator.symbolic.pattern.BuildListPattern;
import wyopcl.translator.symbolic.pattern.ForAllPattern;
import wyopcl.translator.symbolic.pattern.WhileLoopPattern;


/**
 * For each type of concrete implementation of visitable inferace, there is an 'visit' method
 * @author Min-Hsien Weng
 *
 */
public interface Visitor {	
	public List<Code> visit(BuildListPattern p);
	public List<Code> visit(WhileLoopPattern p);
}
