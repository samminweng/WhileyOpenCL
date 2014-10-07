package wyopcl.bound;

import static wycc.lang.SyntaxError.internalFailure;

import java.io.IOException;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import wybs.lang.Build.Project;
import wybs.lang.Builder;
import wycc.lang.SyntaxError;
import wycc.util.Pair;
import wyfs.lang.Path;
import wyfs.lang.Path.Entry;
import wyfs.lang.Path.Root;
import wyil.lang.Code;
import wyil.lang.Code.Block;
import wyil.lang.Codes;
import wyil.lang.Modifier;
import wyil.lang.Type;
import wyil.lang.WyilFile;
import wyil.lang.WyilFile.Case;
import wyopcl.bound.analyzer.ConstAnalyzer;
import wyopcl.bound.analyzer.IfAnalyzer;
import wyopcl.bound.analyzer.InvokeAnalyzer;
import wyopcl.bound.analyzer.LabelAnalyzer;
import wyopcl.bound.analyzer.ReturnAnalyzer;
import wyopcl.bound.analyzer.UnaryOperatorAnalyzer;

/**
 * analyzes the wyil bytecode by adding the constraints, which are parsed from each bytecode,
 * and inferring the bounds consistent with all constraints.
 *  
 * @author Min-Hsien Weng
 *
 */
public class BoundAnalyzer extends Analyzer implements Builder{
	
	
	public BoundAnalyzer(Project project){
		Analyzer.setProject(project);
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
			Analyzer.setFilename(module.filename());
			Analyzer.setModule(module);
			//Start analyzing the range.
			this.startAnalysis();
		}

		long endTime = System.currentTimeMillis();
		logger.logTimedMessage("Wyil interpreter completed.\nFile:" + Analyzer.getFilename(),
				(endTime - start), memory - runtime.freeMemory());
		return generatedFiles;
	}

	/**
	 * Extracts the method or function declaration and converts it into a string.
	 * @param method
	 * @return
	 */
	private String getFunctionOrMethodDel(WyilFile.FunctionOrMethodDeclaration method){
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
		return str;
	}
	

	/**
	 * Takes the in-memory wyil file and analyzes the range values for all variables.
	 * @param module
	 */
	private void startAnalysis(){
		
		for(WyilFile.FunctionOrMethodDeclaration method : getModule().functionOrMethods()) {
			System.out.println(getFunctionOrMethodDel(method));
			Analyzer.setLabel("code");
			for(Case mcase : method.cases()){
				Block blk = mcase.body();
				Iterator<wyil.lang.Code.Block.Entry> iterator = blk.iterator();
				while(iterator.hasNext()){
					//Get the Block.Entry
					Block.Entry entry = iterator.next();
					//check the code type and add the constraints 
					dispatch(entry);
				}
			}	
			
			analyze();
		
		}
		

	}


	private void dispatch(Block.Entry entry){
		Code code = entry.code; 
		try{
			if (code instanceof Codes.AssertOrAssume) {			
				//AssertOrAssumeInterpreter.getInstance().interpret((Codes.AssertOrAssume)code, stackframe);
			} else if (code instanceof Codes.Assign) {			
				//AssignInterpreter.getInstance().interpret((Codes.Assign)code, stackframe);
			} else if (code instanceof Codes.BinaryOperator) {			
				//BinaryOperatorInterpreter.getInstance().interpret((Codes.BinaryOperator)code, stackframe);
			} else if (code instanceof Codes.ListOperator) {
				//ListOperatorInterpreter.getInstance().interpret((Codes.ListOperator)code, stackframe);
			} else if (code instanceof Codes.StringOperator) {
				//StringOperatorInterpreter.getInstance().interpret((Codes.StringOperator)code, stackframe);
			} else if (code instanceof Codes.Convert) {			
				//ConvertInterpreter.getInstance().interpret((Codes.Convert)code, stackframe);
			} else if (code instanceof Codes.Const) {			
				ConstAnalyzer.getInstance().analyze((Codes.Const)code);
			} else if (code instanceof Codes.Debug) {
				//DebugInterpreter.getInstance().interpret((Codes.Debug)code, stackframe);
			} else if (code instanceof Codes.Dereference) {
				//DereferenceInterpreter.getInstance().interpret((Codes.Dereference)code, stackframe);
			} else if (code instanceof Codes.Fail) {
				//FailInterpreter.getInstance().interpret((Codes.Fail)code, stackframe);
			} else if (code instanceof Codes.FieldLoad) {		
				//FieldLoadInterpreter.getInstance().interpret((Codes.FieldLoad)code, stackframe);			
			} else if (code instanceof Codes.ForAll) {				
				//ForAllInterpreter.getInstance().interpret((Codes.ForAll)code, stackframe);
			} else if (code instanceof Codes.Goto) {	
				//GotoInterpreter.getInstance().interpret((Codes.Goto)code, stackframe);
			} else if (code instanceof Codes.If) {
				IfAnalyzer.getInstance().analyze((Codes.If)code);			
			} else if (code instanceof Codes.IfIs) {
				//IfIsInterpreter.getInstance().interpret((Codes.IfIs)code, stackframe);
			} else if (code instanceof Codes.IndirectInvoke) {			
				//IndirectInvokeInterpreter.getInstance().interpret((Codes.IndirectInvoke)code, stackframe);
			} else if (code instanceof Codes.Invoke) {			
				InvokeAnalyzer.getInstance().analyze((Codes.Invoke)code);
			} else if (code instanceof Codes.Invert) {
				//InvertInterpreter.getInstance().interpret((Codes.Invert)code, stackframe);
			} else if (code instanceof Codes.LoopEnd) {
				//LoopEndInterpreter.getInstance().interpret((Codes.LoopEnd)code, stackframe);									
			} else if (code instanceof Codes.Label) {
				LabelAnalyzer.getInstance().analyze((Codes.Label)code);
			} else if (code instanceof Codes.Lambda) {
				//LambdaInterpreter.getInstance().interpret((Codes.Lambda)code, stackframe);
			} else if (code instanceof Codes.LengthOf) {			
				//LengthOfInterpreter.getInstance().interpret((Codes.LengthOf)code, stackframe);
			} else if (code instanceof Codes.IndexOf) {			
				//IndexOfInterpreter.getInstance().interpret((Codes.IndexOf)code, stackframe);
			} else if (code instanceof Codes.Loop) {			
				//LoopInterpreter.getInstance().interpret((Codes.Loop)code, stackframe);			
			} else if (code instanceof Codes.Move) {
				internalFailure("Not implemented!", Analyzer.getFilename(), entry);
			} else if (code instanceof Codes.NewMap) {
				//NewMapInterpreter.getInstance().interpret((Codes.NewMap)code, stackframe);
			} else if (code instanceof Codes.NewList) {			
				//NewListInterpreter.getInstance().interpret((Codes.NewList)code, stackframe);
			} else if (code instanceof Codes.NewRecord) {
				//NewRecordInterpreter.getInstance().interpret((Codes.NewRecord)code, stackframe);
			} else if (code instanceof Codes.NewSet) {
				//NewSetInterpreter.getInstance().interpret((Codes.NewSet)code, stackframe);
			} else if (code instanceof Codes.NewTuple) {
				//NewTupleInterpreter.getInstance().interpret((Codes.NewTuple)code, stackframe);
			} else if (code instanceof Codes.Return) {			
				ReturnAnalyzer.getInstance().analyze((Codes.Return)code);
			} else if (code instanceof Codes.NewObject) {
				//NewObjectInterpreter.getInstance().interpret((Codes.NewObject)code, stackframe);
			} else if (code instanceof Codes.Nop) {
				//NopInterpreter.getInstance().interpret((Codes.Nop)code, stackframe);
			} else if (code instanceof Codes.SetOperator){
				//SetOperatorInterpreter.getInstance().interpret((Codes.SetOperator)code, stackframe);
			} else if (code instanceof Codes.SubList) {
				//SubListInterpreter.getInstance().interpret((Codes.SubList)code, stackframe);
			} else if (code instanceof Codes.SubString) {
				//SubStringInterpreter.getInstance().interpret((Codes.SubString)code, stackframe);
			} else if (code instanceof Codes.Switch) {
				//SwitchInterpreter.getInstance().interpret((Codes.Switch)code, stackframe);
			} else if (code instanceof Codes.Throw) {
				//ThrowInterpreter.getInstance().interpret((Codes.Throw)code, stackframe);
			} else if (code instanceof Codes.TryCatch) {
				//TryCatchInterpreter.getInstance().interpret((Codes.TryCatch)code, stackframe);
			} else if (code instanceof Codes.TupleLoad) {
				//TupleLoadInterpreter.getInstance().interpret((Codes.TupleLoad)code, stackframe);
			} else if (code instanceof Codes.UnaryOperator){
				UnaryOperatorAnalyzer.getInstance().analyze((Codes.UnaryOperator)code);
			} else if (code instanceof Codes.Update) {
				//UpdateInterpreter.getInstance().interpret((Codes.Update)code, stackframe);
			} else {
				internalFailure("unknown wyil code encountered (" + code + ")", Analyzer.getFilename(), entry);
			}
		} catch (SyntaxError ex) {
			throw ex;	
		} catch (Exception ex) {		
			internalFailure(ex.getMessage(), Analyzer.getFilename(), entry, ex);
		}

		printBytecode(code);
	}












}
