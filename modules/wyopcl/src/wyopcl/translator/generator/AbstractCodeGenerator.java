package wyopcl.translator.generator;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map.Entry;
import java.util.Set;

import wyc.lang.Stmt.VariableDeclaration;
import wycc.lang.SyntaxError;
import wyil.attributes.VariableDeclarations;
import wyil.attributes.VariableDeclarations.Declaration;
import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Codes.ArrayGenerator;
import wyil.lang.Codes.AssertOrAssume;
import wyil.lang.Codes.Assign;
import wyil.lang.Codes.BinaryOperator;
import wyil.lang.Codes.Const;
import wyil.lang.Codes.Convert;
import wyil.lang.Codes.Dereference;
import wyil.lang.Codes.Fail;
import wyil.lang.Codes.FieldLoad;
import wyil.lang.Codes.Goto;
import wyil.lang.Codes.If;
import wyil.lang.Codes.IfIs;
import wyil.lang.Codes.IndexOf;
import wyil.lang.Codes.IndirectInvoke;
import wyil.lang.Codes.Invoke;
import wyil.lang.Codes.Label;
import wyil.lang.Codes.Lambda;
import wyil.lang.Codes.LengthOf;
import wyil.lang.Codes.Loop;
import wyil.lang.Codes.NewArray;
import wyil.lang.Codes.NewObject;
import wyil.lang.Codes.NewRecord;
import wyil.lang.Codes.Nop;
import wyil.lang.Codes.Return;
import wyil.lang.Codes.UnaryOperator;
import wyil.lang.Codes.Update;
import wyil.lang.Type;
import wyil.lang.WyilFile;
import wyil.lang.WyilFile.Constant;
import wyil.lang.WyilFile.FunctionOrMethod;
import wyopcl.Configuration;

/**
 * Defines the functions for code generator.
 * 
 * @author Min-Hsien Weng
 *
 */
public abstract class AbstractCodeGenerator {
	protected final String prefix = "_";
	protected final Configuration config;
	// Store generated code
	protected CodeStores stores;

	public AbstractCodeGenerator(Configuration config) {
		this.config = config;
		
	}	
	

	protected abstract void apply(WyilFile module);
	
	protected abstract void translate(Update code, FunctionOrMethod function);

	protected abstract void translate(UnaryOperator code, FunctionOrMethod function);

	protected abstract void translate(Nop code, FunctionOrMethod function);

	protected abstract void translate(Return code, FunctionOrMethod function);

	protected abstract void translate(NewRecord code, FunctionOrMethod function);

	protected abstract void translate(LengthOf code, FunctionOrMethod function);

	protected abstract void translate(Label code, FunctionOrMethod function);

	protected abstract void translate(Loop code, FunctionOrMethod function);

	protected abstract void translate(IndirectInvoke code, FunctionOrMethod function);

	protected abstract void translate(Invoke code, FunctionOrMethod function);

	protected abstract void translate(IndexOf code, FunctionOrMethod function);

	protected abstract void translate(If code, FunctionOrMethod function);

	protected abstract void translate(Goto code, FunctionOrMethod function);

	protected abstract void translate(FieldLoad code, FunctionOrMethod function);

	protected abstract void translate(Fail code, FunctionOrMethod function);

	protected abstract void translate(Const code, FunctionOrMethod function);

	protected abstract void translate(Convert code, FunctionOrMethod function);

	protected abstract void translate(BinaryOperator code, FunctionOrMethod function);

	protected abstract void translate(Assign code, FunctionOrMethod function);

	protected abstract void translate(AssertOrAssume code, FunctionOrMethod function);

	protected abstract String declareFunction(FunctionOrMethod function);

	protected abstract List<String> declareVariables(FunctionOrMethod function);
	

	/**
	 * Iterates over the list of byte-code to generate the corresponding C code.
	 * Checks the type of the wyil code and dispatches the code to the analyzer
	 * for being executed by the <code>analyze(code)</code>
	 * 
	 * @param code_blk
	 * @param func_name
	 */
	protected void iterateCodes(List<Code> code_blk, FunctionOrMethod function) {
		for (Code code : code_blk) {
			try {
				// enable the assertion
				if (code instanceof Codes.AssertOrAssume) {
					translate((Codes.AssertOrAssume) code, function);
				} else if (code instanceof Codes.Assign) {
					translate((Codes.Assign) code, function);
				} else if (code instanceof Codes.BinaryOperator) {
					translate((Codes.BinaryOperator) code, function);
				} else if (code instanceof Codes.Convert) {
					translate((Codes.Convert) code, function);
				} else if (code instanceof Codes.Const) {
					translate((Codes.Const) code, function);
				} else if (code instanceof Codes.Debug) {
					throw new RuntimeException("Not implemented! "+ code.toString(), null);
				} else if (code instanceof Codes.Dereference) {
					translate((Codes.Dereference)code, function);
				} else if (code instanceof Codes.Fail) {
					translate((Codes.Fail) code, function);
				} else if (code instanceof Codes.FieldLoad) {
					translate((Codes.FieldLoad) code, function);
				} else if (code instanceof Codes.Goto) {
					translate((Codes.Goto) code, function);
				} else if (code instanceof Codes.If) {
					translate((Codes.If) code, function);
				} else if (code instanceof Codes.IfIs) {
					translate((Codes.IfIs)code, function);
				} else if (code instanceof Codes.IndexOf) {
					translate((Codes.IndexOf) code, function);
				} else if (code instanceof Codes.IndirectInvoke) {
					translate((Codes.IndirectInvoke) code, function);
				} else if (code instanceof Codes.Invoke) {
					translate((Codes.Invoke) code, function);
				} else if (code instanceof Codes.Invert) {
					throw new RuntimeException("Not implemented! "+ code.toString(), null);
				} else if (code instanceof Codes.Loop) {
					translate((Codes.Loop) code, function);
				} else if (code instanceof Codes.Label) {
					translate((Codes.Label) code, function);
				} else if (code instanceof Codes.Lambda) {
					translate((Codes.Lambda)code, function);
				} else if (code instanceof Codes.LengthOf) {
					translate((Codes.LengthOf) code, function);
				} else if (code instanceof Codes.ArrayGenerator){
					translate((Codes.ArrayGenerator)code, function);
				} else if (code instanceof Codes.Move) {
					throw new RuntimeException("Not implemented! "+ code.toString(), null);
				} else if (code instanceof Codes.NewArray) {
					translate((Codes.NewArray) code, function);
				} else if (code instanceof Codes.NewRecord) {
					translate((Codes.NewRecord) code, function);
				} else if (code instanceof Codes.Return) {
					translate((Codes.Return) code, function);
				} else if (code instanceof Codes.NewObject) {
					translate((Codes.NewObject)code, function);
				} else if (code instanceof Codes.Nop) {
					translate((Codes.Nop) code, function);
				} else if (code instanceof Codes.Switch) {
					throw new RuntimeException("Not implemented! "+ code.toString(), null);
				} else if (code instanceof Codes.UnaryOperator) {
					translate((Codes.UnaryOperator) code, function);
				} else if (code instanceof Codes.Update) {
					translate((Codes.Update) code, function);
				} else {
					throw new RuntimeException("Not implemented! "+ code.toString(), null);
				}

			} catch (Exception ex) {
				// Print out the error message along with code.
				throw new RuntimeException(ex.getMessage() + " at " + code, null);
			}
		}
	}

	
	protected abstract void translate(Lambda code, FunctionOrMethod function);

	protected abstract void translate(NewArray code, FunctionOrMethod function);

	protected abstract void translate(ArrayGenerator code, FunctionOrMethod function);

	protected abstract void translate(NewObject code, FunctionOrMethod function);

	protected abstract void translate(Dereference code, FunctionOrMethod function);

	protected abstract void translate(IfIs code, FunctionOrMethod function);

}
