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
	//The hashmap stores the unions of bounds for each function.
	//private HashMap<WyilFile.FunctionOrMethodDeclaration, Bounds> unionOfBoundsMap = new HashMap<WyilFile.FunctionOrMethodDeclaration, Bounds>();

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
			//analyzeMethodCall(module);
			//analyzeV2(module);
			analyzeMethodCallV2(module);
		}

		long endTime = System.currentTimeMillis();
		System.err.println("Wyil interpreter completed.\nFile:" + filename+ 
				" Time: "+(endTime - start)+" ms");
		return generatedFiles;
	}

	private void iterateWyILCodeAndAddConstraints(WyilFile.FunctionOrMethodDeclaration functionOrMethod, Analyzer analyzer){
		int line = 0;
		//Parse each byte-code and add the constraints accordingly.
		for(Case mcase : functionOrMethod.cases()){
			Block blk = mcase.body();
			Iterator<wyil.lang.Code.Block.Entry> iterator = blk.iterator();
			while(iterator.hasNext()){
				//Get the Block.Entry
				Block.Entry entry = iterator.next();
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
		for(WyilFile.FunctionOrMethodDeclaration method : module.functionOrMethods()) {			
			Analyzer analyzer = new Analyzer(0);
			iterateWyILCodeAndAddConstraints(method, analyzer);	
			//Infer the bounds 
			analyzer.inferBoundsOverAllConstraintlists(true);
			analyzer = null;
		}
	}
	
	
	


	/**
	 * Pass the bounds from main function to the invoked function.
	 * @param code <code>Codes.Invoke</code> bytecode
	 * @param bnd the bounds of main function
	 * @param analyzer the invoked analyzer.
	 */
	private void passParametersToFunc(Codes.Invoke code, Bounds bnd, Analyzer analyzer){
		int index = 0;
		for(Type paramType: code.type().params()){
			if(analyzer.isIntType(paramType)){
				String param = "%"+code.operand(index);
				//Add lower bounds and upper bounds for input parameters.														
				analyzer.addConstraintToCurrentList(new Range("%"+index, bnd.getLower(param), bnd.getUpper(param)));
			}
		}
	}


	private void passReturnValuesToMain(Codes.Invoke code, Bounds bnd, Analyzer analyzer){
		//propagate the bounds of return values.
		String ret = "%"+code.target();						
		analyzer.addConstraintToCurrentList(new Range(ret,
				bnd.getLower("return"),
				bnd.getUpper("return")));
	}



	/**
	 * Takes the in-memory wyil file and analyzes the range values for all variables in each function.
	 * @param module
	 */
	public void analyzeMethodCall(WyilFile module){
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
						Bounds bnd = analyzer.inferBoundsOverAllConstraintlists(verbose);
						Analyzer invokeanalyzer = new Analyzer(1);
						passParametersToFunc(code, bnd, invokeanalyzer);
						iterateWyILCodeAndAddConstraints(functionOrMethod, invokeanalyzer);
						//Infer the bounds
						bnd = invokeanalyzer.inferBoundsOverAllConstraintlists(true);
						//propagate the bounds of return values.
						passReturnValuesToMain(code, bnd, analyzer);
						invokeanalyzer = null;
					}
				}else{
					analyzer.dispatch(entry);					
				}

			}
		}	
		//Infer the bounds 		
		analyzer.inferBoundsOverAllConstraintlists(true);

	}
	
	
	private void iterateByteCode(AnalyzerV2 analyzer, WyilFile.FunctionOrMethodDeclaration functionOrMethod){
		int line = 0;
		//Parse each byte-code and add the constraints accordingly.
		for(Case mcase : functionOrMethod.cases()){
			Iterator<wyil.lang.Code.Block.Entry> iterator = mcase.body().iterator();
			while(iterator.hasNext()){
				//Get the Block.Entry
				Block.Entry entry = iterator.next();
				line = analyzer.printWyILCode(entry.code, functionOrMethod.name(), line);				
				analyzer.dispatch(entry);				
			}
		}
	}
	
	
	/**
	 * Takes the in-memory wyil file and analyzes the variable ranges for each function.
	 * @param module
	 */
	public void analyzeV2(WyilFile module){
		for(WyilFile.FunctionOrMethodDeclaration functionOrMethod : module.functionOrMethods()) {			
			AnalyzerV2 analyzer = new AnalyzerV2(0);
			analyzer.initializeEntryNode(functionOrMethod.type().params());
			iterateByteCode(analyzer, functionOrMethod);			
			//Infer the bounds 
			Bounds bnd = analyzer.inferBounds(true);
			analyzer = null;
		}
	}
	
	
	/**
	 * Takes the in-memory wyil file and analyzes the range values for all variables in each function.
	 * @param module
	 */
	public void analyzeMethodCallV2(WyilFile module){
		AnalyzerV2 analyzer = new AnalyzerV2(0);
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
						AnalyzerV2 invokeanalyzer = new AnalyzerV2(1);
						int index = 0;
						for(Type paramType: functionOrMethod.type().params()){
							invokeanalyzer.initializeEntryNode(paramType,
									"%"+index,
									bnd.getLower("%"+code.operand(index)),
									bnd.getUpper("%"+code.operand(index)));
							index++;
						}
						iterateByteCode(invokeanalyzer, functionOrMethod);						
						//Infer the bounds
						bnd = invokeanalyzer.inferBounds(true);
						//propagate the bounds of return value.
						String ret = "%"+code.target();						
						analyzer.addConstraint(new Range(ret, bnd.getLower("return"), bnd.getUpper("return")));	
					
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
