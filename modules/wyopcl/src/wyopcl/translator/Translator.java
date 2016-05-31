package wyopcl.translator;

import java.io.IOException;
import java.util.Collection;
import java.util.HashSet;
import java.util.Optional;
import java.util.Set;

import wybs.lang.Build.Project;
import wybs.lang.Builder;
import wycc.util.Pair;
import wyfs.lang.Path;
import wyfs.lang.Path.Entry;
import wyfs.lang.Path.Root;
import wyil.lang.WyilFile;
import wyopcl.Configuration;
import wyopcl.translator.copy.CopyEliminationAnalyzer;
import wyopcl.translator.deallocate.DeallocationAnalyzer;
import wyopcl.translator.generator.CodeGenerator;

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

	/*
	public static FunctionOrMethod patternMatchingandTransformation(Configuration config, FunctionOrMethod functionOrMethod) {
  		// Begin the function	
  		PatternMatcher matcher = new PatternMatcher(config);
  		Pattern pattern = matcher.analyzePattern(functionOrMethod);
  		//If no pattern is found or the transformation failed, then return the original functional code block.
  		return functionOrMethod;
  	}
 	*/
	@Override
	public Project project() {
		// TODO Auto-generated method stub
		return null;
	}

}
