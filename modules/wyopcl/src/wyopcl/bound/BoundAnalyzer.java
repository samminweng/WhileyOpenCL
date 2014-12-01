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
		return config.getProject();
	}	

	@SuppressWarnings("unchecked")
	@Override
	public Set<Entry<?>> build(Collection<Pair<Entry<?>, Root>> delta) throws IOException {
		//Runtime runtime = Runtime.getRuntime();
		long start = System.currentTimeMillis();
		//long memory = runtime.freeMemory();
		HashSet<Path.Entry<?>> generatedFiles = new HashSet<Path.Entry<?>>();
		for(Pair<Path.Entry<?>,Path.Root> p : delta) {
			//Path.Root dst = p.second();
			Path.Entry<WyilFile> sf = (Path.Entry<WyilFile>) p.first();
			WyilFile module = sf.read();
			config.setFilename(module.filename().split(".whiley")[0]);				
			//Start analyzing the range.
			if(config.isFunctionCall()){
				analyzeFunctionCall(module);
			}else{
				analyze(module);
			}
		}
		
		long endTime = System.currentTimeMillis();
		System.err.println("Bound Analysis completed.\nFile:" + config.getFilename() +".whiley Time: "+(endTime - start)+" ms");
		return generatedFiles;
	}
	
	/**
	 * Iterate each bytecode
	 * @param analyzer
	 * @param functionOrMethod
	 */
	private void iterateByteCode(Analyzer analyzer, WyilFile.FunctionOrMethodDeclaration functionOrMethod){
		int line = 0;
		for(Case mcase : functionOrMethod.cases()){
			analyzer.createEntryNode(functionOrMethod.type().params());
			//Parse each byte-code and add the constraints accordingly.
			for(Block.Entry entry :mcase.body()){
				//Get the Block.Entry
				line = analyzer.printWyILCode(entry.code, functionOrMethod.name(), line);
				analyzer.dispatch(entry);				
			}
		}
	}
	
	
	/**
	 * Takes the in-memory wyil file and analyzes the variable ranges for each function.
	 * @param module
	 */
	public void analyze(WyilFile module){
		for(WyilFile.FunctionOrMethodDeclaration functionOrMethod : module.functionOrMethods()) {			
			Analyzer analyzer = new Analyzer(0, config);			
			iterateByteCode(analyzer, functionOrMethod);			
			//Infer and print the final bounds.
			analyzer.inferBounds(functionOrMethod.name());	
			analyzer = null;
		}
	}
	
	
	/**
	 * Takes the in-memory wyil file and analyzes the range values for all variables in each function.
	 * @param module
	 */
	private void analyzeFunctionCall(WyilFile module){
		Analyzer analyzer = new Analyzer(0, config);
		WyilFile.FunctionOrMethodDeclaration main = module.functionOrMethod("main").get(0);
		int line = 0;
		//Parse each byte-code and add the constraints accordingly.
		for(Case mcase : main.cases()){
			for(Block.Entry entry: mcase.body()){				
				line = analyzer.printWyILCode(entry.code, main.name(), line);							
				//check the code type and add the constraints according to code type.
				if(entry.code instanceof Codes.Invoke){
					//Get the function
					Codes.Invoke code = (Codes.Invoke)entry.code;
					FunctionOrMethodDeclaration functionOrMethod = module.functionOrMethod(code.name.name(), code.type());					
					if(functionOrMethod != null){
						//Infer the bounds						
						Bounds bnd = analyzer.inferBounds(functionOrMethod.name());
						Analyzer invokeanalyzer = new Analyzer(1, config);
						int index = 0;
						//Pass the bounds of input parameters.
						for(Type paramType: functionOrMethod.type().params()){
							invokeanalyzer.createEntryNode(paramType,
									"%"+index,
									bnd.getLower("%"+code.operand(index)),
									bnd.getUpper("%"+code.operand(index)));
							index++;
						}
						iterateByteCode(invokeanalyzer, functionOrMethod);						
						//Infer the bounds
						invokeanalyzer.inferBounds(functionOrMethod.name());												
						//propagate the bounds of return value.
						analyzer.addConstraint(new Range("%"+code.target(), bnd.getLower("return"), bnd.getUpper("return")));
						invokeanalyzer = null;
					}
				}else{
					analyzer.dispatch(entry);					
				}
			}			
		}	
		//Infer the bounds 		
		analyzer.inferBounds(main.name());
			
		analyzer = null;

	}








}
