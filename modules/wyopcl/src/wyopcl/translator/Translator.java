package wyopcl.translator;

import java.io.IOException;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import wybs.lang.Build.Project;
import wybs.lang.Builder;
import wycc.util.Pair;
import wyfs.lang.Path;
import wyfs.lang.Path.Entry;
import wyfs.lang.Path.Root;
import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.WyilFile;
import wyopcl.translator.Configuration.Mode;
import wyopcl.translator.bound.Analyzer;
import wyopcl.translator.generator.CodeGenerator;
/**
 * Main entry point
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
		HashSet<Path.Entry<?>> generatedFiles = new HashSet<Path.Entry<?>>();
		for(Pair<Path.Entry<?>,Path.Root> p : delta) {
			//Path.Root dst = p.second();
			Path.Entry<WyilFile> sf = (Path.Entry<WyilFile>) p.first();
			WyilFile module = sf.read();
			config.setProperty("filename", module.filename().split(".whiley")[0]);				
			//Check the mode
			switch(config.getMode()){
				case BoundAnalysis:
					analyzeFunctionCall(module);
					break;
				case CodeGeneration:
					break;
			default:
				break;
			}
			
			//Start generating the code.
			
		}
		
		long endTime = System.currentTimeMillis();
		config.getLogger().logTimedMessage("Bound Analysis completed\nFile:" + config.getFilename()+".whiley Time: "+(endTime - start)+" ms",
				(endTime - start), memory);
		return generatedFiles;
	}
	
	
	/**
	 * Takes the in-memory wyil file and analyzes the variable ranges for each function.
	 * @param module
	 */
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
	
	
	private void generate(WyilFile module){
		for(WyilFile.FunctionOrMethodDeclaration functionOrMethod : module.functionOrMethods()) {			
			CodeGenerator generator = new CodeGenerator(config);			
						
			//Infer and print the final bounds.
			generator = null;
		}
	}
	
	
	
	

}
