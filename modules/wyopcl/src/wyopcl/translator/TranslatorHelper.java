package wyopcl.translator;

import java.util.ArrayList;
import java.util.List;

import wyil.lang.Code;
import wyil.lang.Type;
import wyil.lang.WyilFile.FunctionOrMethod;
import wyopcl.translator.symbolic.PatternMatcher;
import wyopcl.translator.symbolic.PatternTransformer;
import wyopcl.translator.symbolic.pattern.Pattern;

/**
 * 
 * Stores the common methods used in all modules of the translator
 * 
 * @author Min-Hsien Weng
 *
 */
public final class TranslatorHelper {
	/**
	 * Get the list of code for a function.
	 * 
	 * @param functionOrMethod
	 *            the function or method declaration.
	 * @return the list of code.
	 */
	public static List<Code> getCodeBlock(FunctionOrMethod functionOrMethod, Configuration config) {
		List<Code> code_blk = new ArrayList<Code>();
		// Iterate the code block to add each code to the code block.
		for (Code code : functionOrMethod.body()) {
			if (config.isVerbose()) {
				// For debugging
				System.out.println(code);
			}
			// Get each bytecode and add it to the code_blk.
			code_blk.add(code);
		}
		return code_blk;
	}

	/**
	 * Given a code block, tries to find the matching pattern and transform the code into more predictable code.
	 * 
	 * @param config
	 *            the configuration 
	 * @param functionOrMethod
	 *            the function code block.
	 * @return the transformed functional code block. If the pattern is not transformable, then
	 *         return the original one.
	 */
	public static FunctionOrMethod patternMatchingandTransformation(Configuration config, FunctionOrMethod functionOrMethod) {
		// Begin the function	
		PatternMatcher matcher = new PatternMatcher(config);
		Pattern pattern = matcher.analyzePattern(functionOrMethod);
		if(!pattern.isNil){
			PatternTransformer transformer = new PatternTransformer();
			// Find the matching pattern and transform the code into more
			// predictable code.
			FunctionOrMethod transformed_func = transformer.transformPatternUsingVisitor(pattern);
			if (transformed_func != null) {
				Pattern transformed_pattern = matcher.analyzePattern(transformed_func);
				if (!transformed_pattern.isNil) {
					// Nullify the matcher and transformer
					transformer = null;
					matcher = null;
					return transformed_func;
				}
			}
			// Nullify the matcher and transformer
			transformer = null;
		}
		matcher = null;
		//If no pattern is found or the transformation failed, then return the original functional code block.
		return functionOrMethod;
		
	}

}
