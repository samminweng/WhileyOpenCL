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

	/*private void printBounds(Bounds bnd){
		String font_color_start = (char)27 +"[31m";
		String font_color_end = (char)27 + "[0m";
		System.out.println(bnd.toString()
						+"\nisBoundConsistency="+bnd.checkBoundConsistency());
	}*/

	private Bounds getBoundsByFunc(FunctionOrMethodDeclaration functionOrMethod){
		if(!unionOfBoundsMap.containsKey(functionOrMethod)){
			unionOfBoundsMap.put(functionOrMethod, new Bounds());
		}		
		return unionOfBoundsMap.get(functionOrMethod);

	}


	private void IterateWyILCodeAndAddConstraints(WyilFile.FunctionOrMethodDeclaration functionOrMethod, Analyzer analyzer){
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
			IterateWyILCodeAndAddConstraints(method, analyzer);	
			//Infer the bounds 
			analyzer.inferBoundsOverAllConstraintlists(true);
			analyzer = null;
		}
	}


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
						//unionOfBoundsMap.put(main, analyzer.inferBoundsOverAllConstraintlists(verbose));
						Bounds bnd = analyzer.inferBoundsOverAllConstraintlists(verbose);
						Analyzer invokeanalyzer = new Analyzer(1);
						/*int index = 0;
						for(Type paramType: code.type().params()){
							//Get the input parameters of integer type
							if(paramType instanceof Type.Int ||
									(paramType instanceof Type.List && ((Type.List)paramType).element() instanceof Type.Int)){
								String param = "%"+code.operand(index);
								//Add lower bounds and upper bounds for input parameters.														
								invokeanalyzer.addConstraintToCurrentList(new Range("%"+index,
										getBoundsByFunc(main).getLower(param),
										getBoundsByFunc(main).getUpper(param)));
							}
							index++;			
						}*/
						passParametersToFunc(code, bnd, invokeanalyzer);
						
						IterateWyILCodeAndAddConstraints(functionOrMethod, invokeanalyzer);
						//Infer the bounds
						unionOfBoundsMap.put(functionOrMethod, invokeanalyzer.inferBoundsOverAllConstraintlists(true));
						invokeanalyzer = null;						
						//propagate the bounds of return values.
						String ret = "%"+code.target();						
						analyzer.addConstraintToCurrentList(new Range(ret,
								getBoundsByFunc(functionOrMethod).getLower("return"),
								getBoundsByFunc(functionOrMethod).getUpper("return")));
					}
				}else{
					analyzer.dispatch(entry);					
				}

			}
		}	
		//Infer the bounds 
		unionOfBoundsMap.put(main, analyzer.inferBoundsOverAllConstraintlists(verbose));
		analyzer.inferBoundsOverAllConstraintlists(true);

	}









}
