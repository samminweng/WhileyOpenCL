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
import wyil.lang.Code;
import wyil.lang.Type;
import wyil.lang.WyilFile;
import wyil.lang.WyilFile.FunctionOrMethodDeclaration;
import wyopcl.translator.bound.BoundAnalyzer;
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
public class Translator implements Builder{
	private Configuration config;	

	public Translator(Configuration config){
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
		for(Pair<Path.Entry<?>,Path.Root> p : delta) {
			//Path.Root dst = p.second();
			@SuppressWarnings("unchecked")
			Path.Entry<WyilFile> sf = (Path.Entry<WyilFile>) p.first();
			WyilFile module = sf.read();
			//Put the in-memory WyIL file to config for later retrieval.
			this.config.setProperty("module", module);
			this.config.setProperty("filename", module.filename().split(".whiley")[0].replace(".\\", ""));				
			//Check the mode
			switch(config.getMode()){
			case "bound":
				analyzeFunction(module);
				message = "Bound analysis completed.\nFile: " + config.getFilename();
				break;
			case "code":
				generateCodeInC(module);
				message = "Code generation completed.\nFile: "+config.getFilename()+".c";
				break;
			case "pattern":
				patternMatch(module);
				message = "Pattern matching completed.\nFile: " + config.getFilename();
				break;
			default:
				break;
			}			
			//Start generating the code.
		}
		long endTime = System.currentTimeMillis();
		System.out.println(message+" Time: "+(endTime - start)+" ms Memory Usage: "+ memory);	
		return generatedFiles;
	}


	/**
	 * Takes the in-memory wyil file and analyzes the ranges using function call.
	 * @param module
	 */
	private void analyzeFunction(WyilFile module){		
		try {			
			FunctionOrMethodDeclaration functionOrMethod = module.functionOrMethod("main").get(0);
			//Put the function name to the config
			this.config.setProperty("function_name", functionOrMethod.name());
			List<Code> code_blk = TranslatorHelper.getCodeBlock(functionOrMethod);				
			BoundAnalyzer boundAnalyzer = new BoundAnalyzer(config, code_blk);
			boundAnalyzer.propagateBounds(functionOrMethod.type().params());
			boundAnalyzer.iterateByteCode();
			//Infer the bounds at the end of main function.
			boundAnalyzer.inferBounds();			
			boundAnalyzer = null;			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}



	/**
	 * Reads the in-memory WyIL file and generates the code in C
	 * @param module
	 */
	private void generateCodeInC(WyilFile module){
		//Check if the Bool type is used in the program.
		boolean isBoolType = false;
		//A list of function declaration. 
		List<String> function_list = new ArrayList<String>();	
		//Create a writer to write the C code to a *.c file.
		PrintWriter writer;		
		try {
			writer = new PrintWriter(config.getFilename()+".c");
			CodeGeneratorHelper.generateIncludes(writer, config.getFilename());
			CodeGeneratorHelper.generateClone(writer);		
			CodeGeneratorHelper.generateAppend(writer);
			CodeGeneratorHelper.generateIndirectInvoked(writer);
			CodeGeneratorHelper.generateFree_doublePtr(writer);
			//Iterate each function
			for(WyilFile.FunctionOrMethodDeclaration functionOrMethod : module.functionOrMethods()) {
				CodeGenerator generator = new CodeGenerator(config);
				String function_del = generator.translate(functionOrMethod);
				//Add the function declaration to the list
				function_list.add(function_del);
				//Find the matching pattern and transform the code into more predictable code. 		
				List<Code> code_blk = TranslatorHelper.patternMatchingandTransformation(
						config,
						functionOrMethod.type().params(), 
						TranslatorHelper.getCodeBlock(functionOrMethod));
				//Iterate each byte-code of a function block.	
				generator.IterateBytecode(code_blk, functionOrMethod.name());
				isBoolType |= generator.isBoolTypeIntroduced();
				//Write out the code to *.c
				generator.printoutCode(writer, function_del);
				generator = null;
			}
			CodeGeneratorHelper.generateToString(writer, isBoolType);
			writer.close();
		} catch (FileNotFoundException e) {			
			throw new RuntimeException("Error occurs in writing "+config.getFilename()+".c");
		}
		//Write out the function signatures to *.h file.		
		try{
			writer = new PrintWriter(config.getFilename()+".h");
			CodeGeneratorHelper.generateHeader(writer, function_list, config.isVerbose());
			writer.close();
		}catch (FileNotFoundException e) {
			throw new RuntimeException("Error occurs in writing "+config.getFilename()+".h");
		}

	}


	/**
	 *  Iterate each code of the input function, build up the code blk and then analyze the loop pattern.
	 * @param module 
	 */
	private void patternMatch(WyilFile module){

		//Iterate each function
		for(WyilFile.FunctionOrMethodDeclaration functionOrMethod : module.functionOrMethods()) {
			String func_name = functionOrMethod.name();			
			ArrayList<Type> params = functionOrMethod.type().params();
			//Begin the function
			System.out.println("\n----------------Start of "+func_name+" function----------------");
			//Find the matching pattern and transform the code into more predictable code. 		
			List<Code> code_blk = TranslatorHelper.patternMatchingandTransformation(
					config,
					functionOrMethod.type().params(), 
					TranslatorHelper.getCodeBlock(functionOrMethod));
			System.out.println("\n----------------End of "+func_name+" function----------------\n");
		}		
	}





}
