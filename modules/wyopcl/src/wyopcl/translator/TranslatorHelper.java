package wyopcl.translator;

import java.util.ArrayList;
import java.util.List;

import wyil.lang.Code;
import wyil.lang.Type;
import wyil.lang.WyilFile.FunctionOrMethod;
import wyopcl.translator.symbolic.PatternMatcher;
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
			if(config.isVerbose()){
				//For debugging
				System.out.println(code);
			}			
			// Get each bytecode and add it to the code_blk.
			code_blk.add(code);
		}
		return code_blk;
	}

/*	*//**
	 * Given a code block, tries to find the matching pattern and do the pattern
	 * transformation (if available).
	 * 
	 * @param params
	 *            the list of input parameter types
	 * @param code_blk
	 *            the list of code for a function
	 * @return the transformed code. If the pattern is not transformable, then
	 *         return the original code block.
	 *//*
	public static List<Code> patternMatchingandTransformation(Configuration config, List<Type> params,
			List<Code> code_blk) {
		// Initialize the pattern matcher.
		if (config.isPatternMatching()) {
			PatternMatcher matcher = new PatternMatcher(config);
			Pattern pattern = matcher.analyzePattern(params, code_blk);
			System.out.println("The original pattern:\n" + pattern);
			PatternTransformer transformer = new PatternTransformer();
			List<Code> code_blk_after = transformer.transformPatternUsingVisitor(pattern);
			if (code_blk_after != null) {
				Pattern transformed_pattern = matcher.analyzePattern(params, code_blk_after);
				if (!transformed_pattern.isNil) {
					System.out.println("From " + pattern.getPatternName() + " to " + transformed_pattern.getPatternName()
							+ ", the transformed pattern:\n" + transformed_pattern);
					return code_blk_after;
				}
			}
			// Nullify the matcher and transformer
			matcher = null;
			transformer = null;
		}
		return code_blk;
	}*/

}
