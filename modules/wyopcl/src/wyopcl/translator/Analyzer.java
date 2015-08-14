package wyopcl.translator;

import java.util.HashMap;
import java.util.List;

import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Codes.Assign;
import wyil.lang.Codes.Assume;
import wyil.lang.Codes.BinaryOperator;
import wyil.lang.Codes.Const;
import wyil.lang.Codes.Convert;
import wyil.lang.Codes.Fail;
import wyil.lang.Codes.FieldLoad;
import wyil.lang.Codes.Goto;
import wyil.lang.Codes.If;
import wyil.lang.Codes.IndexOf;
import wyil.lang.Codes.Invariant;
import wyil.lang.Codes.Invoke;
import wyil.lang.Codes.Label;
import wyil.lang.Codes.LengthOf;
import wyil.lang.Codes.ListOperator;
import wyil.lang.Codes.Loop;
import wyil.lang.Codes.NewList;
import wyil.lang.Codes.NewTuple;
import wyil.lang.Codes.Return;
import wyil.lang.Codes.SubList;
import wyil.lang.Codes.TupleLoad;
import wyil.lang.Codes.UnaryOperator;
import wyil.lang.Codes.Update;
import wyil.lang.WyilFile.FunctionOrMethod;
import wyopcl.translator.bound.CFGraph;
import wyopcl.translator.bound.SymbolFactory;
/**
 * Aims to build control flow graph for a function.
 * 
 * 
 * @author Min-Hsien Weng
 *
 */
public abstract class Analyzer {
	private static final String prefix = "%";
	// Maps of CFGs, symbols
	private static HashMap<String, SymbolFactory> symbol_factorys = new HashMap<String, SymbolFactory>();
	private static HashMap<String, CFGraph> cfgraphs = new HashMap<String, CFGraph>();
	
	
	public void analyze(FunctionOrMethod function){
		
		
	}
	
	
	/**
	 * Build up the control flow graph: iterating each byte-code to extract the
	 * constraints, create the block (e.g. loop structure/if-else branches) or
	 * reuse the current block to put the constraints into the corresponding
	 * block.
	 * 
	 * @param name
	 *            the function name that is currently being analyzed.
	 * @param code_blk
	 *            the list of byte-code
	 */
	protected void analyze(String name, List<Code> code_blk, int line) {
		// Parse each byte-code and add the constraints accordingly.
		for (Code code : code_blk) {
			if (!AnalyzerHelper.isCached(name)) {
				// Get the Block.Entry and print out each byte-code
				line = TranslatorHelper.printWyILCode(code, name, line);
			}
			
			if (code instanceof Codes.Invoke) {
				analyze((Codes.Invoke) code, name);
			} else {
				// Parse each byte-code and add the constraints accordingly.
				try {
					if (code instanceof Codes.Invariant) {
						analyze((Codes.Invariant) code, name);
					} else if (code instanceof Codes.Assign) {
						analyze((Codes.Assign) code, name);
					} else if (code instanceof Codes.Assume){
						analyze((Codes.Assume)code, name);
					} else if (code instanceof Codes.BinaryOperator) {
						analyze((Codes.BinaryOperator) code, name);
					} else if (code instanceof Codes.Convert) {
						analyze((Codes.Convert) code, name);
					} else if (code instanceof Codes.Const) {
						analyze((Codes.Const) code, name);
					} else if (code instanceof Codes.Debug) {
						throw new RuntimeException("Not implemented!");
					} else if (code instanceof Codes.Dereference) {
						throw new RuntimeException("Not implemented!");
					} else if (code instanceof Codes.FieldLoad) {
						analyze((Codes.FieldLoad) code, name);
					} else if (code instanceof Codes.Fail) {
						analyze((Codes.Fail) code, name);
					} else if (code instanceof Codes.Goto) {
						analyze((Codes.Goto) code, name);
					} else if (code instanceof Codes.If) {
						analyze((Codes.If) code, name);
					} else if (code instanceof Codes.IfIs) {
						throw new RuntimeException("Not implemented!");
					} else if (code instanceof Codes.IndexOf) {
						analyze((Codes.IndexOf) code, name);
					} else if (code instanceof Codes.IndirectInvoke) {
						throw new RuntimeException("Not implemented!");
					} else if (code instanceof Codes.Invert) {
						throw new RuntimeException("Not implemented!");
					} else if (code instanceof Codes.ListOperator) {
						analyze((Codes.ListOperator) code, name);
					} else if (code instanceof Codes.Loop) {
						analyze((Codes.Loop) code, name);
					} else if (code instanceof Codes.Label) {
						analyze((Codes.Label) code, name);
					} else if (code instanceof Codes.Lambda) {
						throw new RuntimeException("Not implemented!");
					} else if (code instanceof Codes.LengthOf) {
						analyze((Codes.LengthOf) code, name);
					} else if (code instanceof Codes.Move) {
						throw new RuntimeException("Not implemented!");
					} else if (code instanceof Codes.NewList) {
						analyze((Codes.NewList) code, name);
					} else if (code instanceof Codes.NewRecord) {
						throw new RuntimeException("Not implemented!");
					} else if (code instanceof Codes.NewTuple) {
						analyze((Codes.NewTuple) code, name);
					} else if (code instanceof Codes.Return) {
						analyze((Codes.Return) code, name);
					} else if (code instanceof Codes.NewObject) {
						throw new RuntimeException("Not implemented!");
					} else if (code instanceof Codes.Nop) {
						throw new RuntimeException("Not implemented!");
					} else if (code instanceof Codes.SubList) {
						analyze((Codes.SubList) code, name);
					} else if (code instanceof Codes.Switch) {
						throw new RuntimeException("Not implemented!");
					} else if (code instanceof Codes.TupleLoad) {
						analyze((Codes.TupleLoad) code, name);
					} else if (code instanceof Codes.UnaryOperator) {
						analyze((Codes.UnaryOperator) code, name);
					} else if (code instanceof Codes.Update) {
						analyze((Codes.Update) code, name);
					} else {
						throw new RuntimeException("unknown wyil code encountered (" + code + ")");
					}
				} catch (Exception ex) {
					throw new RuntimeException(ex.getMessage());
				}
			}
		}
	}

	/**
	 * <p>
	 * Analyze the Update code at the function.
	 * </p>
	 * @param code
	 * @param name
	 */
	protected abstract void analyze(Update code, String name);

	/**
	 * <p>
	 * Analyze the UnaryOperator code of function.
	 * </p>
	 * @param code
	 * @param name
	 */
	protected abstract void analyze(UnaryOperator code, String name);

	protected abstract void analyze(TupleLoad code, String name);

	protected abstract void analyze(SubList code, String name);

	protected abstract void analyze(Return code, String name);

	protected abstract void analyze(NewTuple code, String name);

	protected abstract void analyze(NewList code, String name);

	protected abstract void analyze(LengthOf code, String name);

	protected abstract void analyze(Label code, String name);

	protected abstract void analyze(Loop code, String name);

	protected abstract void analyze(ListOperator code, String name);

	protected abstract void analyze(IndexOf code, String name);

	protected abstract void analyze(If code, String name);

	protected abstract void analyze(Goto code, String name);

	protected abstract void analyze(Fail code, String name);

	protected abstract void analyze(FieldLoad code, String name);

	protected abstract void analyze(Const code, String name);

	protected abstract void analyze(Convert code, String name);

	protected abstract void analyze(BinaryOperator code, String name);

	protected abstract void analyze(Assume code, String name); 

	protected abstract void analyze(Assign code, String name);

	protected abstract void analyze(Invariant code, String name);

	protected abstract void analyze(Invoke code, String name);
	
}
