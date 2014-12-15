package wyopcl.bound;

import static wycc.lang.SyntaxError.internalFailure;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.nio.file.Files;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import wybs.lang.Build.Project;
import wybs.lang.Build;
import wybs.lang.Builder;
import wycc.lang.SyntaxError;
import wycc.util.Logger;
import wycc.util.Logger.Default;
import wycc.util.Pair;
import wyfs.lang.Path;
import wyfs.lang.Path.Entry;
import wyfs.lang.Path.Root;
import wyil.lang.Code;
import wyil.lang.Code.Block;
import wyil.lang.Codes;
import wyil.lang.Constant;
import wyil.lang.Modifier;
import wyil.lang.Type;
import wyil.lang.Type.FunctionOrMethod;
import wyil.lang.WyilFile;
import wyil.lang.WyilFile.Case;
import wyil.lang.WyilFile.FunctionOrMethodDeclaration;
import wyopcl.bound.constraint.Const;
import wyopcl.bound.constraint.GreaterThan;
import wyopcl.bound.constraint.GreaterThanEquals;
import wyopcl.bound.constraint.LessThan;
import wyopcl.bound.constraint.LessThanEquals;
import wyopcl.bound.constraint.Range;
import wyopcl.bound.constraint.Union;

/**
 * analyzes the wyil bytecode by adding the constraints, which are parsed from each bytecode,
 * and inferring the bounds consistent with all constraints.
 *  
 * @author Min-Hsien Weng
 *
 */
public class BoundAnalyzer implements Builder{
	private final AnalyzerConfiguration config;
	
	public BoundAnalyzer(AnalyzerConfiguration config){
		this.config = config;
	}	

	@Override
	public Project project() {
		return (Project) config.getProperty("project");
	}	

	@SuppressWarnings("unchecked")
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
			//Start analyzing the bounds.
			analyzeFunctionCall(module);
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

}
