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
import wyil.lang.Bytecode;
import wyil.lang.Bytecode.Operator;
import wyil.lang.Bytecode.OperatorKind;
import wyil.lang.Bytecode.AssertOrAssume;
import wyil.lang.Bytecode.Const;
import wyil.lang.Bytecode.Convert;
import wyil.lang.Bytecode.Debug;
import wyil.lang.Bytecode.Fail;
import wyil.lang.Bytecode.FieldLoad;
import wyil.lang.Bytecode.Goto;
import wyil.lang.Bytecode.If;
import wyil.lang.Bytecode.IfIs;
import wyil.lang.Bytecode.IndirectInvoke;
import wyil.lang.Bytecode.Invoke;
import wyil.lang.Bytecode.Label;
import wyil.lang.Bytecode.Lambda;
import wyil.lang.Bytecode.Loop;
import wyil.lang.Bytecode.Return;
import wyil.lang.Bytecode.Update;
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

	protected abstract void translate(Return code, FunctionOrMethod function);

	protected abstract void translate(Label code, FunctionOrMethod function);

	protected abstract void translate(Loop code, FunctionOrMethod function);

	protected abstract void translate(IndirectInvoke code, FunctionOrMethod function);

	protected abstract void translate(Invoke code, FunctionOrMethod function);

	protected abstract void translate(If code, FunctionOrMethod function);

	protected abstract void translate(Goto code, FunctionOrMethod function);

	protected abstract void translate(FieldLoad code, FunctionOrMethod function);

	protected abstract void translate(Fail code, FunctionOrMethod function);

	protected abstract void translate(Const code, FunctionOrMethod function);

	protected abstract void translate(Convert code, FunctionOrMethod function);

	protected abstract void translate(AssertOrAssume code, FunctionOrMethod function);

	protected abstract String declareFunction(FunctionOrMethod function);

	protected abstract List<String> declareVariables(FunctionOrMethod function);

	protected abstract void translate(Debug code, FunctionOrMethod function);

	protected abstract void translate(Lambda code, FunctionOrMethod function);

	protected abstract void translate(IfIs code, FunctionOrMethod function);

	// Translate the assignment code
	protected abstract void translateAssign(Operator code, FunctionOrMethod function);
	// Translate the binOP code, e.g. add, rem
	protected abstract void translateBinOp(Operator code, FunctionOrMethod function);
	// Translate the array constructor
	protected abstract void translateNewArray(Operator code, FunctionOrMethod function);
	// Translate the array generator
	protected abstract void translateArrayGen(Operator code, FunctionOrMethod function);
	// Translate the array index
	protected abstract void translateArrayIndex(Operator code, FunctionOrMethod function);
	// Translate the array length
	protected abstract void translateArrayLength(Operator code, FunctionOrMethod function);
	// Translate the record constructor
	protected abstract void translateNewRecord(Operator code, FunctionOrMethod function);
	// Translate the deference 
	protected abstract void translateDeference(Operator code, FunctionOrMethod function);
	// Translate the new object
	protected abstract void translateNew(Operator code, FunctionOrMethod function);
	// Translate the unary operator
	protected abstract void translateUnaryOp(Operator code, FunctionOrMethod function);
	/**
	 * Checks the operator code kind and dispatches it to the corresponding translator
	 * @param code
	 * @param function
	 */
	protected void translate(Operator code, FunctionOrMethod function){
		switch (code.kind()){
		case ASSIGN:
			translateAssign(code, function);
			break;
		case ARRAYCONSTRUCTOR:
			translateNewArray(code, function);
			break;
		case ARRAYGENERATOR:
			translateArrayGen(code, function);
			break;
		case ARRAYINDEX:
			translateArrayIndex(code, function);
			break;
		case ARRAYLENGTH:
			translateArrayLength(code, function);
			break;
		case DEREFERENCE:
			translateDeference(code, function);
			break;
		case NEW:
			translateNew(code, function);
			break;
		case NOT:
			translateUnaryOp(code, function);
			break;
		case RECORDCONSTRUCTOR:
			translateNewRecord(code, function);
			break;		
		default:
			translateBinOp(code, function);
			break;
		
		}
		
	}
	

	/**
	 * Iterates over the list of byte-code to generate the corresponding C code.
	 * Checks the type of the wyil code and dispatches the code to the analyzer
	 * for being executed by the <code>analyze(code)</code>
	 * 
	 * @param code
	 * @param func_name
	 */
	protected void iterateCode(Bytecode code, FunctionOrMethod function) {

		try {
			// enable the assertion
			if (code instanceof Bytecode.AssertOrAssume) {
				translate((Bytecode.AssertOrAssume) code, function);
			} else if (code instanceof Bytecode.Operator) {
				translate((Bytecode.Operator) code, function);
			} else if (code instanceof Bytecode.Convert) {
				translate((Bytecode.Convert) code, function);
			} else if (code instanceof Bytecode.Const) {
				translate((Bytecode.Const) code, function);
			} else if (code instanceof Bytecode.Debug) {
				translate((Bytecode.Debug) code, function);
			} else if (code instanceof Bytecode.Fail) {
				translate((Bytecode.Fail) code, function);
			} else if (code instanceof Bytecode.FieldLoad) {
				translate((Bytecode.FieldLoad) code, function);
			} else if (code instanceof Bytecode.Goto) {
				translate((Bytecode.Goto) code, function);
			} else if (code instanceof Bytecode.If) {
				translate((Bytecode.If) code, function);
			} else if (code instanceof Bytecode.IfIs) {
				translate((Bytecode.IfIs) code, function);
			} else if (code instanceof Bytecode.IndirectInvoke) {
				translate((Bytecode.IndirectInvoke) code, function);
			} else if (code instanceof Bytecode.Invoke) {
				translate((Bytecode.Invoke) code, function);
			} else if (code instanceof Bytecode.Loop) {
				translate((Bytecode.Loop) code, function);
			} else if (code instanceof Bytecode.Label) {
				translate((Bytecode.Label) code, function);
			} else if (code instanceof Bytecode.Lambda) {
				translate((Bytecode.Lambda) code, function);
			} else if (code instanceof Bytecode.Return) {
				translate((Bytecode.Return) code, function);
			} else if (code instanceof Bytecode.Switch) {
				throw new RuntimeException("Not implemented! " + code.toString(), null);
			}  else if (code instanceof Bytecode.Update) {
				translate((Bytecode.Update) code, function);
			} else {
				throw new RuntimeException("Not implemented! " + code.toString(), null);
			}

		} catch (Exception ex) {
			// Print out the error message along with code.
			throw new RuntimeException(ex.getMessage() + " at " + code, null);
		}

	}

}
