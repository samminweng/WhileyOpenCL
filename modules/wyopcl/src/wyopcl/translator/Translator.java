package wyopcl.translator;

import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import wybs.lang.Build.Project;
import wybs.lang.Builder;
import wycc.util.Pair;
import wyfs.lang.Path;
import wyfs.lang.Path.Entry;
import wyfs.lang.Path.Root;
import wyil.lang.WyilFile;
import wyil.lang.WyilFile.FunctionOrMethod;
import wyopcl.Configuration;
import wyopcl.translator.bound.BoundAnalyzer;
import wyopcl.translator.copy.CopyEliminationAnalyzer;
import wyopcl.translator.copy.LiveVariablesAnalysis;
import wyopcl.translator.deallocate.DeallocationAnalyzer;
import wyopcl.translator.generator.CodeGenerator;
import wyopcl.translator.symbolic.PatternMatcher;
import wyopcl.translator.symbolic.PatternTransformer;
import wyopcl.translator.symbolic.pattern.Pattern;

/**
 * Creates the code generator as well as the code analysis, to produce and optimize the c code.
 * 
 * 
 * @author Min-Hsien Weng
 *
 */
public class Translator implements Builder {
	private Configuration config;
	// Function analysis
	private ReadWriteAnalyzer readwriteAnalyzer;
	private ReturnAnalyzer returnAnalyzer;
	private LiveVariablesAnalysis liveAnalyzer;

	public Translator(Configuration config) {
		this.config = config;
	}

	/**
	 * Instantiate all function analysis because those function analyzers are requested parameter for copy or
	 * de-allocation analyzer
	 */
	private void instantiate(WyilFile module, Optional<HashMap<FunctionOrMethod, FunctionOrMethod>> transformFuncMap) {
		
		if(readwriteAnalyzer == null){
			// Create read-write analyzer
			readwriteAnalyzer = new ReadWriteAnalyzer(config);
			// Analyze the byte-code
			readwriteAnalyzer.apply(module, transformFuncMap);
		}
		
		if(returnAnalyzer == null){
			// Create return analyzer
			returnAnalyzer = new ReturnAnalyzer(config);
			// Analyze the byte-code
			returnAnalyzer.apply(module, transformFuncMap);
		}
		
		if(liveAnalyzer == null){
			// Create live variable analyzer
			liveAnalyzer = new LiveVariablesAnalysis(config);
			// Builds up a calling graph and perform live variable checks.
			liveAnalyzer.apply(module, transformFuncMap);
		}
	}

	@Override
	public Set<Entry<?>> build(Collection<Pair<Entry<?>, Root>> delta) throws IOException {
		Runtime runtime = Runtime.getRuntime();
		long start = System.currentTimeMillis();
		long memory = runtime.freeMemory();
		String message = "";
		WyilFile module = null;

		// Compile whiley program into WyIL code
		HashSet<Path.Entry<?>> generatedFiles = new HashSet<Path.Entry<?>>();
		for (Pair<Path.Entry<?>, Path.Root> p : delta) {
			// Path.Root dst = p.second();
			@SuppressWarnings("unchecked")
			Path.Entry<WyilFile> sf = (Path.Entry<WyilFile>) p.first();
			module = sf.read();
		}

		// Put the in-memory WyIL file to config for later retrieval.
		this.config.setOption("module", module);
		
		// Store the byte-code of transformed function 
		Optional<HashMap<FunctionOrMethod, FunctionOrMethod>> transformFuncMap = Optional.empty();
		// Check if pattern matching is enabled. 
		if(config.isEnabled("pattern")){
			// Create the hash map
			HashMap<FunctionOrMethod, FunctionOrMethod> map = new HashMap<FunctionOrMethod, FunctionOrMethod>();
			// Get the function name
			String func_name = config.getFunctionName();
			// Get the WyIL code by given function name
			List<FunctionOrMethod> funcs = module.functionOrMethod(func_name);
			if(funcs == null|| (funcs != null && funcs.isEmpty())){
				throw new RuntimeException("Could not find '"+func_name+ "' function. File: " + config.getFilename());
			}
			// Get the WyIL code
			FunctionOrMethod functionOrMethod = funcs.get(0);
			Pattern pattern;
			// Perform pattern matching
			PatternMatcher matcher = new PatternMatcher(config);
			try{
				pattern = matcher.analyzePattern(functionOrMethod);
				// Print out the matched pattern
				message += "Pattern matching on "+ func_name+" function completed. \n" + pattern;
			}catch(Exception ex){
				throw new RuntimeException("Errors on Pattern Matching"); 
			}
			// Transform the pattern if possible
			PatternTransformer transformer = new PatternTransformer(config);
			try{
				// Output the transformed function
				FunctionOrMethod transformedFunctionOrMethod = transformer.transformPatternUsingVisitor(pattern);
				if(transformedFunctionOrMethod != null){
					map.put(functionOrMethod, transformedFunctionOrMethod);
					// Print out the matched transformation
					message += "\nPattern transformation on "+ func_name+" function completed. ";
				}				
			}catch(Exception ex){
				throw new RuntimeException("Errors on Pattern Transformation"); 
			}
			
			transformFuncMap = Optional.of(map);
			message += " File: " + config.getFilename()+".wyil";
		}
		

		// Check if the copy elimination analysis is enabled.
		Optional<CopyEliminationAnalyzer> copyAnalyzer = Optional.empty();
		if (config.isEnabled("nocopy")) {
			instantiate(module, transformFuncMap);
			CopyEliminationAnalyzer analyzer = new CopyEliminationAnalyzer(config,
					readwriteAnalyzer, returnAnalyzer, liveAnalyzer);
			analyzer.apply(module, transformFuncMap);
			copyAnalyzer = Optional.of(analyzer);
			message += "\nCopy elimination analysis completed. File: " + config.getFilename()+".wyil";
		}

		// Check if deallocation analysis is enabled or not
		Optional<DeallocationAnalyzer> deallocAnalyzer = Optional.empty();
		if (config.isEnabled("dealloc")) {
			instantiate(module, transformFuncMap);
			// Create an instance of DealloctionAnalyzer
			DeallocationAnalyzer analyzer = new DeallocationAnalyzer(config, readwriteAnalyzer, returnAnalyzer,
					liveAnalyzer);
			analyzer.apply(module, transformFuncMap);
			// Create a deallocatedAnalyzer that may hold a null analyzer.
			deallocAnalyzer = Optional.of(analyzer);
			message += "\nDeallocation analysis completed.\nFile: " + config.getFilename()+".wyil";
		}


		// Check if the bound analysis is enabled.
		Optional<BoundAnalyzer> boundAnalyzer = Optional.empty();
		if (config.isEnabled("bound")) {
			/**
			 * Takes the in-memory wyil file and analyzes the bounds of integer variables in Main function. If any function call
			 * is encountered, then propagate the input bounds to the callee and then analyze the bounds and produces the
			 * context-sensitive bounds for the invoked function. The bounds of return value is propagated to the caller
			 * function.
			 */
			BoundAnalyzer analyzer = new BoundAnalyzer(module);
			try {
				// Start with main function.
				analyzer.buildCFG(config, "main");
				// Infer the bounds at the end of main function.
				analyzer.inferFunctionBounds("main");
			} catch (Exception e) {
				throw new RuntimeException("Errors on Bound Analysis");
			}
			boundAnalyzer = Optional.of(analyzer);
			message += "\nBound analysis completed. File: " + config.getFilename();
		}

		// Reads the in-memory WyIL file and generates the code in C
		if (config.isEnabled("code")) {
			CodeGenerator generator = new CodeGenerator(config, copyAnalyzer, deallocAnalyzer, boundAnalyzer, transformFuncMap);
			generator.apply(module);
			message += "\nCode Generation completed. File: " + config.getFilename() + ".c, " + config.getFilename()
					+ ".h";
		}

		long endTime = System.currentTimeMillis();
		System.out.println(message);
		//System.out.println(message + " Time: " + (endTime - start) + " ms Memory Usage: " + memory);
		return generatedFiles;
	}

	@Override
	public Project project() {
		// TODO Auto-generated method stub
		return null;
	}

}
