package wyopcl.translator;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Properties;
import java.util.Set;

import wybs.lang.Build.Project;
import wybs.lang.Builder;
import wycc.util.Pair;
import wyfs.lang.Path;
import wyfs.lang.Path.Entry;
import wyfs.lang.Path.Root;
import wyil.attributes.VariableDeclarations;
import wyil.lang.Attribute;
import wyil.lang.Code;
import wyil.lang.Type;
import wyil.lang.WyilFile;
import wyil.lang.WyilFile.FunctionOrMethod;
import wyil.util.AttributedCodeBlock;
import wyopcl.Configuration;
import wyopcl.translator.copy.CopyEliminationAnalyzer;
import wyopcl.translator.deallocate.DeallocationAnalyzer;
import wyopcl.translator.generator.CodeGenerator;
import wyopcl.translator.generator.CodeGeneratorHelper;
import wyopcl.translator.symbolic.PatternMatcher;
import wyopcl.translator.symbolic.PatternTransformer;
import wyopcl.translator.symbolic.pattern.Pattern;

/**
 * Main entry point of translator
 * 
 * @author Min-Hsien Weng
 *
 */
public class Translator implements Builder {
	private Configuration config;

	public Translator(Configuration config) {
		this.config = config;
	}

	@Override
	public Set<Entry<?>> build(Collection<Pair<Entry<?>, Root>> delta) throws IOException {
		Runtime runtime = Runtime.getRuntime();
		long start = System.currentTimeMillis();
		long memory = runtime.freeMemory();
		String message = "";
		WyilFile module = null;

		HashSet<Path.Entry<?>> generatedFiles = new HashSet<Path.Entry<?>>();
		for (Pair<Path.Entry<?>, Path.Root> p : delta) {
			// Path.Root dst = p.second();
			@SuppressWarnings("unchecked")
			Path.Entry<WyilFile> sf = (Path.Entry<WyilFile>) p.first();
			module = sf.read();			
		}

		// Put the in-memory WyIL file to config for later retrieval.
		this.config.setOption("module", module);

		// Check if deallocation analysis is enabled or not
		Optional<DeallocationAnalyzer> deallocAnalyzer = Optional.empty();
		if(config.isEnabled("dealloc")){
			// Create an instance of DealloctionAnalyzer
			DeallocationAnalyzer analyzer = new DeallocationAnalyzer(config);
			analyzer.apply(module);
			// Create a deallocatedAnalyzer that may hold a null analyzer.
			deallocAnalyzer = Optional.of(analyzer);
			message = "Deallocation analysis completed.\nFile: " + config.getFilename();
		}
		
		// Check if the copy elimination analysis is enabled.
		Optional<CopyEliminationAnalyzer> copyAnalyzer = Optional.empty();
		if (config.isEnabled("copy")) {
			CopyEliminationAnalyzer analyzer = new CopyEliminationAnalyzer(this, config);
			analyzer.apply(module);
			copyAnalyzer = Optional.of(analyzer);
			message = "Copy elimination analysis completed.\nFile: " + config.getFilename();
		}

		if (config.isEnabled("bound")) {
			analyzeBounds(module);
			message = "Bound analysis completed.\nFile: " + config.getFilename();
		}
		if (config.isEnabled("pattern")) {
			patternMatch(module);
			message = "Pattern matching completed.\nFile: " + config.getFilename();
		}

		// Reads the in-memory WyIL file and generates the code in C
		if (config.isEnabled("code")) {
			CodeGenerator generator = new CodeGenerator(config, copyAnalyzer, deallocAnalyzer);
			generator.apply(module);
			message = "Code Generation completed.\nFile: " + config.getFilename() + ".c, " + config.getFilename()
			+ ".h";
		}

		long endTime = System.currentTimeMillis();
		System.out.println(message + " Time: " + (endTime - start) + " ms Memory Usage: " + memory);
		return generatedFiles;
	}

	/**
	 * Takes the in-memory wyil file and analyzes the bounds of integer
	 * variables in Main function. If any function call is encountered, then
	 * propagate the input bounds to the callee and then analyze the bounds and
	 * produces the context-sensitive bounds for the invoked function. The
	 * bounds of return value is propagated to the caller function.
	 * 
	 * @param module
	 */
	private void analyzeBounds(WyilFile module) {
		BoundAnalyzer boundAnalyzer = BoundAnalyzer.getInstance(module);
		try {
			// Start with main function.
			boundAnalyzer.buildCFG(config, "main");
			// Infer the bounds at the end of main function.
			boundAnalyzer.inferBounds("main");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	/**
	 * Given a code block, tries to find the matching pattern and transform the code into more predictable code.
	 * If no pattern is matched, then no change is made.
	 * @param module
	 *            	 * @param functionOrMethod
	 *            the function code block.
	 * @return the transformed functional code block. If the pattern is not transformable, then
	 *         return the original one.
	 */
	private void patternMatch(WyilFile module) {
		// Iterate each function
		for (FunctionOrMethod functionOrMethod : module.functionOrMethods()) {
			// Begin the function
			System.out.println("----------------Start of " + functionOrMethod.name() + " function----------------");
			PatternMatcher matcher = new PatternMatcher(config);
			Pattern pattern = matcher.analyzePattern(functionOrMethod);
			System.out.println("The original pattern:\n" + pattern);
			PatternTransformer transformer = new PatternTransformer();
			// Find the matching pattern and transform the code into more
			// predictable code.
			FunctionOrMethod transformed_func = transformer.transformPatternUsingVisitor(pattern);
			if (transformed_func != null) {
				Pattern transformed_pattern = matcher.analyzePattern(transformed_func);
				if (!transformed_pattern.isNil) {
					System.out
					.println("From " + pattern.getPatternName() + " to " + transformed_pattern.getPatternName()
					+ ", the transformed pattern:\n" + transformed_pattern);
				}
			}
			System.out.println("----------------End of " + functionOrMethod.name() + " function----------------");
			// Nullify the matcher and transformer
			transformer = null;
			matcher = null;
		}
	}

	@Override
	public Project project() {
		// TODO Auto-generated method stub
		return null;
	}

}
