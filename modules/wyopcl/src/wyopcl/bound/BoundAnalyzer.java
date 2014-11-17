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
	private Build.Project project;
	private String filename;
	private boolean verbose = false;
	private boolean isFunctionCall = false;
	/**
	 * For logging information.
	 */
	protected Logger logger = Logger.NULL;

	public BoundAnalyzer(Project project){
		this.project = project;
	}	

	@Override
	public Project project() {
		return project;
	}

	public void setLogger(Logger logger) {
		this.logger = logger;		
	}

	public void setVerbose(boolean verbose) {
		this.verbose = verbose;
	}
	
	/**
	 * Set the type of analyzing the functions.
	 * @param type
	 */
	public void setAnalyzeType(boolean isFuncType){
		this.isFunctionCall = isFuncType;		
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
			filename = module.filename().split(".whiley")[0];				
			//Start analyzing the range.
			if(isFunctionCall){
				analyzeFunctionCall(module);
			}else{
				analyze(module);
			}
		}
		
		long endTime = System.currentTimeMillis();
		System.err.println("Wyil interpreter completed.\nFile:" + filename +".whiley Time: "+(endTime - start)+" ms");
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
			Iterator<wyil.lang.Code.Block.Entry> iterator = mcase.body().iterator();
			//Parse each byte-code and add the constraints accordingly.
			while(iterator.hasNext()){
				//Get the Block.Entry
				Block.Entry entry = iterator.next();
				if(verbose){
					line = analyzer.printWyILCode(entry.code, functionOrMethod.name(), line);
				}
				analyzer.dispatch(entry);				
			}
			if(verbose){
				analyzer.printCFG(filename, functionOrMethod.name());
			}
			
		}
	}
	
	/**
	 * Writes out the bounds to a file (*.sysout) for the
	 * aggressive tests.
	 * @param func_name the name of a function.
	 * @param bnd the bounds of a function.
	 */
	public void printOutBounds(String func_name, Bounds bnd){
		System.out.println("Bounds of "+func_name);
		System.out.println(bnd.toString());
		System.out.println("Consistency="+bnd.checkBoundConsistency());
	}
	
	
	/**
	 * Takes the in-memory wyil file and analyzes the variable ranges for each function.
	 * @param module
	 */
	public void analyze(WyilFile module){
		for(WyilFile.FunctionOrMethodDeclaration functionOrMethod : module.functionOrMethods()) {			
			Analyzer analyzer = new Analyzer(0);			
			iterateByteCode(analyzer, functionOrMethod);			
			//Infer and print the final bounds.
			Bounds bnd = analyzer.inferBounds(verbose);
			if(verbose){
				analyzer.printBounds(bnd);
			}			
			printOutBounds(functionOrMethod.name(), bnd);
			analyzer = null;
		}
	}
	
	
	/**
	 * Takes the in-memory wyil file and analyzes the range values for all variables in each function.
	 * @param module
	 */
	public void analyzeFunctionCall(WyilFile module){
		Analyzer analyzer = new Analyzer(0);
		WyilFile.FunctionOrMethodDeclaration main = module.functionOrMethod("main").get(0);
		int line = 0;
		//Parse each byte-code and add the constraints accordingly.
		for(Case mcase : main.cases()){
			Block blk = mcase.body();
			Iterator<wyil.lang.Code.Block.Entry> iterator = blk.iterator();
			while(iterator.hasNext()){
				//Get the Block.Entry
				Block.Entry entry = iterator.next();
				line = analyzer.printWyILCode(entry.code, main.name(), line);
				//check the code type and add the constraints according to code type.
				if(entry.code instanceof Codes.Invoke){
					//Get the function
					Codes.Invoke code = (Codes.Invoke)entry.code;
					FunctionOrMethodDeclaration functionOrMethod = module.functionOrMethod(code.name.name(), code.type());					
					if(functionOrMethod != null){
						//Infer the bounds						
						Bounds bnd = analyzer.inferBounds(true);
						Analyzer invokeanalyzer = new Analyzer(1);
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
						bnd = invokeanalyzer.inferBounds(true);
						//propagate the bounds of return value.
						//analyzer.addConstraint(new Range("%"+code.target(), bnd.getLower("return"), bnd.getUpper("return")));	
					
						invokeanalyzer = null;
					}
				}else{
					analyzer.dispatch(entry);					
				}

			}
		}	
		//Infer the bounds 		
		analyzer.inferBounds(true);

	}








}
