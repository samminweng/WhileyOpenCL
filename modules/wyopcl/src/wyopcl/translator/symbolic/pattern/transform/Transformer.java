package wyopcl.translator.symbolic.pattern.transform;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import wyil.lang.Code;
import wyopcl.translator.Configuration;
import wyopcl.translator.symbolic.pattern.BuildListPattern;
import wyopcl.translator.symbolic.pattern.Pattern;
import wyopcl.translator.symbolic.pattern.WhileLoopPattern;
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
