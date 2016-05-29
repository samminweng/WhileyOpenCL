package wyopcl.translator.symbolic.pattern.transform;

import java.util.List;

import wyil.lang.Code;
import wyil.lang.WyilFile.FunctionOrMethod;

/**
 * Provides a general transformable interface to allow the pattern transformer to perform the operation. If the pattern type is not implemented with
 * this interface, then it is not able to be converted into other pattern type. 
 * 
 * This interface separates the pattern from the logic defined in transformer. 
 * @see http://java.dzone.com/articles/design-patterns-visitor
 * @author Min-Hsien Weng
 *
 */
public interface Transformable {
	public FunctionOrMethod accept(Transformer transformer);
}
