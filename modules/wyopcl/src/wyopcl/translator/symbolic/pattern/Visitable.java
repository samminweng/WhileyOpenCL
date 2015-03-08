package wyopcl.translator.symbolic.pattern;

import java.util.List;

import wyil.lang.Code;
import wyopcl.translator.symbolic.Visitor;

/**
 * This is a general visitable interface
 * @see http://java.dzone.com/articles/design-patterns-visitor
 * @author Min-Hsien Weng
 *
 */
public interface Visitable {
	public List<Code> accept(Visitor visitor);
}
