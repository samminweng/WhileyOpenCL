package wyopcl.bound;

import static wycc.lang.SyntaxError.internalFailure;

import java.io.IOException;
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
import wyil.lang.WyilFile;
import wyil.lang.WyilFile.Case;
import wyopcl.bound.constraint.Const;
import wyopcl.bound.constraint.GreaterThan;
import wyopcl.bound.constraint.GreaterThanEquals;
import wyopcl.bound.constraint.LessThan;
import wyopcl.bound.constraint.LessThanEquals;

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
	//The hashmap stores the unions of bounds for each function.
	private HashMap<WyilFile.FunctionOrMethodDeclaration, Bounds> unionOfBoundsMap = new HashMap<WyilFile.FunctionOrMethodDeclaration, Bounds>();
	
	private String[] args;
	/**
	 * For logging information.
	 */
	protected Logger logger = Logger.NULL;
	
	public BoundAnalyzer(Project project){
		this.project = project;
	}	
	
	@Override
	public Project project() {
		// TODO Auto-generated method stub
		return project;
	}

	public void setLogger(Logger logger) {
		this.logger = logger;		
	}

	public void setVerbose(boolean verbose) {
		this.verbose = verbose;
		
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
			filename = module.filename();
			//Start analyzing the range.
			//analyze(module);
			analyzeMethodCall(module);
		}

		long endTime = System.currentTimeMillis();
		logger.logTimedMessage("Wyil interpreter completed.\nFile:" + filename,
				(endTime - start), memory - runtime.freeMemory());
		return generatedFiles;
	}

	/**
	 * Extracts the method or function declaration and converts it into a string.
	 * @param method
	 * @return
	 *//*
	private void printFunctionOrMethodDel(WyilFile.FunctionOrMethodDeclaration method){
		String str = "===============================================\n"; 
		//Get the modifier (i.e. public, protected, private...)
		str += ((method.hasModifier(Modifier.PUBLIC)))? Modifier.PUBLIC.toString() : "";
		str += ((method.hasModifier(Modifier.PRIVATE)))? Modifier.PRIVATE.toString() : "";
		str += ((method.hasModifier(Modifier.PROTECTED)))? Modifier.PROTECTED.toString() : "";
		str += ((method.hasModifier(Modifier.NATIVE)))? Modifier.NATIVE.toString() : "";
		str += ((method.hasModifier(Modifier.EXPORT)))? Modifier.EXPORT.toString() : "";
		
		//Get the return type
		str += method.type().ret() + " ";
		//Get the method name
		str += method.name() + "(";
		//Get the parameter type
		for(Type param :method.type().params()) {
			str += param;						
		}
		str+="):";
		System.out.println(str);
	}*/
	
	
	/**
	 * Takes the in-memory wyil file and analyzes the range values for all variables in each function.
	 * @param module
	 */
	public void analyze(WyilFile module){
		Analyzer.getInstance().setModule(module);
		for(WyilFile.FunctionOrMethodDeclaration method : module.functionOrMethods()) {			
			//printFunctionOrMethodDel(method);
			Analyzer.getInstance().setLabel("code");
			int line = 0;
			//Parse each byte-code and add the constraints accordingly.
			for(Case mcase : method.cases()){
				Block blk = mcase.body();
				Iterator<wyil.lang.Code.Block.Entry> iterator = blk.iterator();
				while(iterator.hasNext()){
					//Get the Block.Entry
					Block.Entry entry = iterator.next();
					//check the code type and add the constraints according to code type.
					Analyzer.getInstance().dispatch(entry, unionOfBoundsMap);
					line = Analyzer.getInstance().printWyILCode(entry.code, method.name(), line);
				}
			}	
			//Infer the bounds 
			Bounds bnd = Analyzer.getInstance().inferBoundsOverAllConstraintlists(verbose);
			unionOfBoundsMap.put(method, bnd);
		}	

	}

	
	/**
	 * Takes the in-memory wyil file and analyzes the range values for all variables in each function.
	 * @param module
	 */
	public void analyzeMethodCall(WyilFile module){
		Analyzer.getInstance().setModule(module);
		
		for(WyilFile.FunctionOrMethodDeclaration method : module.functionOrMethod("main")) {			
			//printFunctionOrMethodDel(method);
			Analyzer.getInstance().setLabel("code");
			int line = 0;
			//Parse each byte-code and add the constraints accordingly.
			for(Case mcase : method.cases()){
				Block blk = mcase.body();
				Iterator<wyil.lang.Code.Block.Entry> iterator = blk.iterator();
				while(iterator.hasNext()){
					//Get the Block.Entry
					Block.Entry entry = iterator.next();
					//check the code type and add the constraints according to code type.
					Analyzer.getInstance().dispatch(entry, unionOfBoundsMap);
					line = Analyzer.getInstance().printWyILCode(entry.code, method.name(), line);
				}
			}	
			//Infer the bounds 
			Bounds bnd = Analyzer.getInstance().inferBoundsOverAllConstraintlists(verbose);
			unionOfBoundsMap.put(method, bnd);
		}	

	}
	
	
	
	
	
	

	

}
