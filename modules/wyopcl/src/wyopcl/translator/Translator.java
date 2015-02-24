package wyopcl.translator;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
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
import wyil.lang.Code.Block;
import wyil.lang.Codes;
import wyil.lang.Type;
import wyil.lang.WyilFile;
import wyil.lang.WyilFile.Case;
import wyopcl.translator.bound.BoundAnalyzer;
import wyopcl.translator.generator.CodeGenerator;
import wyopcl.translator.generator.Utility;
import wyopcl.translator.symbolic.PatternMatcher;
import wyopcl.translator.symbolic.pattern.Pattern;
import wyopcl.translator.symbolic.pattern.WhileLoopPattern;
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

	private String getOutputFilename(){
		String filename = config.getFilename();
		//Get widening strategy
		if(config.isMultiWiden()){
			filename += ".gradual";
		}else{
			filename += ".naive";
		}
		filename += ".sysout";
		return filename;
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
			config.setProperty("filename", module.filename().split(".whiley")[0].replace(".\\", ""));				
			//Check the mode
			switch(config.getMode()){
			case BoundAnalysis:
				analyzeFunctionCall(module);
				message = "Bound analysis completed.\nFile: " + config.getFilename();
				break;
			case CodeGeneration:
				generateCodeInC(module);
				message = "Code generation completed.\nFile: "+config.getFilename()+".c";
				break;
			case PatternMatching:
				analyzePatterns(module);
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
	private void analyzeFunctionCall(WyilFile module){		
		try {
			PrintWriter writer = null;
			if(!config.isVerbose()){
				writer  = new PrintWriter(getOutputFilename());
			}else{
				writer = new PrintWriter(System.out, true);
			}
			WyilFile.FunctionOrMethodDeclaration main = module.functionOrMethod("main").get(0);
			BoundAnalyzer boundAnalyzer = new BoundAnalyzer(0, config, main, module, writer);
			boundAnalyzer.iterateByteCode();
			//Infer the bounds at the end of main function.
			boundAnalyzer.inferBounds(true);			
			boundAnalyzer = null;
			writer.close();
			if(!config.isVerbose()){
				//Print out the bound analysis results to console.
				for(String line: Files.readAllLines(Paths.get(getOutputFilename()), StandardCharsets.UTF_8)){
					System.out.println(line);
				}
			}

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}

	/**
	 * Reads the in-memory WyIL file and generates the code in C
	 * @param module
	 */
	private void generateCodeInC(WyilFile module){		
		CodeGenerator generator = new CodeGenerator(config);
		//Create a writer to write the C code to a *.c file.
		PrintWriter writer;		
		try {
			writer = new PrintWriter(config.getFilename()+".c");
			Utility.generateIncludes(writer, config.getFilename());
			Utility.generateClone(writer);		
			Utility.generateAppend(writer);
			boolean isBoolType = false;
			//Iterate each function
			for(WyilFile.FunctionOrMethodDeclaration functionOrMethod : module.functionOrMethods()) {
				String function_del = generator.translate(functionOrMethod);
				//Iterate each byte-code of a function block.			
				for(Case mcase : functionOrMethod.cases()){			
					int line = 0;
					//Parse each byte-code and add the constraints accordingly.
					for(Block.Entry entry :mcase.body()){
						//Get the Block.Entry
						if(config.isVerbose()){
							line = generator.printWyILCode(entry.code, functionOrMethod.name(), line);
						}				
						generator.dispatch(entry);				
					}
				}
				isBoolType |= generator.isBoolTypeIntroduced();
				//Write out the code to *.c
				generator.printoutCode(writer, function_del);

			}
			Utility.generateToString(writer, isBoolType);

			writer.close();
		} catch (FileNotFoundException e) {			
			throw new RuntimeException("Error occurs in writing "+config.getFilename()+".c");
		}

		//Write out the function signatures to *.h file.		
		try{
			writer = new PrintWriter(config.getFilename()+".h");
			Utility.generateHeader(writer, generator.list_func, config.isVerbose());
			writer.close();
		}catch (FileNotFoundException e) {
			throw new RuntimeException("Error occurs in writing "+config.getFilename()+".h");
		}
		generator = null;
	}

	
	/**
	 *  Iterate each code of the input function, build up the code blk and then analyze the loop pattern.
	 * @param module 
	 */
	private void analyzePatterns(WyilFile module){
		PatternMatcher matcher = new PatternMatcher(config);
		//Iterate each function
		for(WyilFile.FunctionOrMethodDeclaration functionOrMethod : module.functionOrMethods()) {
			//Store the list of code for a function.
			List<Code> code_blk = new ArrayList<Code>();			
			
			int line = 0;
			String func_name = functionOrMethod.name();			
			ArrayList<Type> param_size = functionOrMethod.type().params();
			//Begin the function
			System.out.println("\n----------------Start of "+func_name+" function----------------");	
			//Iterate each byte-code of a function block.			
			for(Case mcase : functionOrMethod.cases()){				
				//Parse each byte-code and add the constraints accordingly.
				for(Block.Entry entry :mcase.body()){
					Code code = entry.code;
					//Print out the bytecode if verbose is enabled.
					if(config.isVerbose()){
						if(code instanceof Codes.Label){
							System.out.println(func_name+"."+(++line)+" ["+code+"]");
						}else{
							System.out.println(func_name+"."+(++line)+" [\t"+code+"]");
						}
					}	
					code_blk.add(code);					
				}				
				//End of the function
			}
			
			Pattern pattern = matcher.analyzePattern(param_size, code_blk);
			System.out.println("The original pattern:\n"+pattern);
			if(pattern instanceof WhileLoopPattern){
				Pattern pattern_1 = matcher.transformPattern((WhileLoopPattern)pattern);			
				System.out.println("From "+pattern.getType()+" to "+pattern_1.getType()+", the transformed pattern:\n"+pattern_1);
			}
			
			code_blk = null;
			System.out.println("\n----------------End of "+func_name+" function----------------\n");
		}
	}
}
