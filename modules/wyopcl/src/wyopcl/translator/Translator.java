package wyopcl.translator;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import wybs.lang.Build.Project;
import wybs.lang.Builder;
import wycc.util.Pair;
import wyfs.lang.Path;
import wyfs.lang.Path.Entry;
import wyfs.lang.Path.Root;
import wyil.lang.Attribute;
import wyil.lang.Code;
import wyil.lang.Type;
import wyil.lang.WyilFile;
import wyil.lang.WyilFile.FunctionOrMethod;
import wyil.util.AttributedCodeBlock;
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
	public Project project() {
		return (Project) config.getProperty("project");
	}

	@Override
	public Set<Entry<?>> build(Collection<Pair<Entry<?>, Root>> delta) throws IOException {
		Runtime runtime = Runtime.getRuntime();
		long start = System.currentTimeMillis();
		long memory = runtime.freeMemory();
		String message = "";
		HashSet<Path.Entry<?>> generatedFiles = new HashSet<Path.Entry<?>>();
		for (Pair<Path.Entry<?>, Path.Root> p : delta) {
			// Path.Root dst = p.second();
			@SuppressWarnings("unchecked")
			Path.Entry<WyilFile> sf = (Path.Entry<WyilFile>) p.first();
			WyilFile module = sf.read();
			// Put the in-memory WyIL file to config for later retrieval.
			this.config.setProperty("module", module);
			String filename = module.filename().split(".whiley")[0];
			this.config.setProperty("filename", filename);
			// Check the mode
			switch (config.getMode()) {
			case "bound":
				analyzeBounds(module);
				message = "Bound analysis completed.\nFile: " + config.getFilename();
				break;
			case "code":
				generateCodeInC(module);
				message = "Code generation completed.\nFile: " + config.getFilename() + ".c";
				break;
			case "pattern":
				patternMatch(module);
				message = "Pattern matching completed.\nFile: " + config.getFilename();
				break;
			default:
				break;
			}
			// Start generating the code.
		}
		long endTime = System.currentTimeMillis();
		System.out.println(message + " Time: " + (endTime - start) + " ms Memory Usage: " + memory);
		return generatedFiles;
	}

	/**
	 * Takes the in-memory wyil file and analyzes the bounds of integer variables in Main function.
	 * using function call.
	 * 
	 * @param module 
	 */
	private void analyzeBounds(WyilFile module) {
		try {
			// Get code block of main function.
			FunctionOrMethod functionOrMethod = module.functionOrMethod("main").get(0);
			// Put the function name to the config
			this.config.setProperty("function_name", functionOrMethod.name());
			List<Code> code_blk = functionOrMethod.body().bytecodes();
			BoundAnalyzer boundAnalyzer = new BoundAnalyzer(config);
			boundAnalyzer.buildCFG(code_blk);
			// Infer the bounds at the end of main function.
			//boundAnalyzer.propagateBounds(functionOrMethod.type().params());
			boundAnalyzer.inferBounds();
			boundAnalyzer = null;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * Reads the in-memory WyIL file and generates the code in C
	 * 
	 * @param module
	 */

	private void generateCodeInC(WyilFile module) {
		// A list of function declaration.
		List<String> function_list = new ArrayList<String>();
		try {
			// Create a writer to write the C code to a *.c file. 
			PrintWriter writer = new PrintWriter(config.getFilename() + ".c");
			CodeGeneratorHelper.generateIncludes(writer, config.getFilename());
			// Iterate each function
			for (FunctionOrMethod functionOrMethod : module.functionOrMethods()) {
				if (config.isPatternMatching()) {
					functionOrMethod = TranslatorHelper.patternMatchingandTransformation(config, functionOrMethod);
				}
				CodeGenerator generator = new CodeGenerator(config, functionOrMethod, module.types());
				String function_del = generator.declareFunction();
				// Add the function declaration to the list
				function_list.add(function_del);
				generator.declareVariables();
				// Iterate each byte-code of a function block and produce a list
				// of C code.
				generator.iterateOverCodeBlock(functionOrMethod.body().bytecodes());
				// Write out the code to *.c
				generator.writeCodeToFile(writer);
				generator = null;
			}
			writer.close();
		} catch (FileNotFoundException e) {
			throw new RuntimeException("Error occurs in writing " + config.getFilename() + ".c");
		}
		// Write out the function signatures to *.h file.
		try {
			PrintWriter writer = new PrintWriter(config.getFilename() + ".h");
			CodeGeneratorHelper.generateConstant(writer, module.constants());
			CodeGeneratorHelper.generateUserDefinedType(writer, module.types());			
			CodeGeneratorHelper.generateHeader(writer, function_list, config.isVerbose());
			
			writer.close();
		} catch (FileNotFoundException e) {
			throw new RuntimeException("Error occurs in writing " + config.getFilename() + ".h");
		}

	}

	/**
	 * Iterate each code of the input function, build up the code blk and then
	 * analyze the loop pattern.
	 * 
	 * @param module
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
					System.out.println("From " + pattern.getPatternName() + " to " + transformed_pattern.getPatternName()
							+ ", the transformed pattern:\n" + transformed_pattern);
				}
			}
			System.out.println("----------------End of " + functionOrMethod.name() + " function----------------");
			// Nullify the matcher and transformer
			transformer = null;
			matcher = null;
		}
	}

}
