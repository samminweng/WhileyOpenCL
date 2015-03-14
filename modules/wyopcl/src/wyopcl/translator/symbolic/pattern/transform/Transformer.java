package wyopcl.translator.symbolic.pattern.transform;

import java.util.List;

import wyil.lang.Code;
import wyopcl.translator.symbolic.pattern.Pattern;
/**
 * Implements what to do when visiting a Transformable Pattern. The transformer takes a pattern as input, makes some change to the 
 * list of byte-code and output the transformed code that is matched with other pattern type.
 * 
 * @see http://java.dzone.com/articles/design-patterns-visitor
 * @author Min-Hsien Weng
 *
 */
public abstract class Transformer{
	public abstract List<Code> transform(Pattern pattern);
}
