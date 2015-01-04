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
import wyil.lang.WyilFile;
import wyil.lang.Code.Block;
import wyil.lang.WyilFile.Case;
import wyopcl.translator.bound.Analyzer;
import wyopcl.translator.generator.CodeGenerator;
import wyopcl.translator.generator.Utility;
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
			config.setProperty("filename", module.filename().split(".whiley")[0].replace(".\\", ""));				
			//Check the mode
			switch(config.getMode()){
				case BoundAnalysis:
					analyzeFunctionCall(module);
					message = "Bound analysis completed";
					break;
				case CodeGeneration:
					generateCodeInC(module);
					message = "Code generation completed";
					break;
			default:
				break;
			}
			
			//Start generating the code.
			
		}
		
		long endTime = System.currentTimeMillis();
		config.getLogger().logTimedMessage(message+"\nFile:" + config.getFilename()+".whiley Time: "+(endTime - start)+" ms",
				(endTime - start), memory);
		return generatedFiles;
	}
	
	
	/**
	 * Takes the in-memory wyil file and analyzes the variable ranges for each function.
	 * @param module
	 */
	@SuppressWarnings("unused")
	private void analyze(WyilFile module){
		for(WyilFile.FunctionOrMethodDeclaration functionOrMethod : module.functionOrMethods()) {			
			Analyzer analyzer = new Analyzer(0, config, functionOrMethod, module);			
			analyzer.iterateByteCode();			
			//Infer and print the final bounds.
			analyzer.inferBounds();	
			analyzer = null;
		}
	}
	
	
	/**
	 * Takes the in-memory wyil file and analyzes the ranges using function call.
	 * @param module
	 */
	private void analyzeFunctionCall(WyilFile module){
		WyilFile.FunctionOrMethodDeclaration main = module.functionOrMethod("main").get(0);
		Analyzer analyzer = new Analyzer(0, config, main, module);
		//Infer the bounds
		analyzer.iterateByteCode();	
		analyzer.inferBounds();			
		analyzer = null;
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
			Utility.generateGetSize(writer);
			Utility.generateClone(writer);
			Utility.generateToString(writer);
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
				//Write out the code to *.c
				generator.printoutCode(writer, function_del);
			}			
			writer.close();
		} catch (FileNotFoundException e) {			
			throw new RuntimeException("Error occurs in writing "+config.getFilename()+".c");
		}
		
		//Write out the function signatures to *.h file.		
		try{
			writer = new PrintWriter(config.getFilename()+".h");
			Utility.generateHeader(writer, generator.list_func);
			writer.close();
		}catch (FileNotFoundException e) {
			throw new RuntimeException("Error occurs in writing "+config.getFilename()+".h");
		}
		generator = null;
	}

}
