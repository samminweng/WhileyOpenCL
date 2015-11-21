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
import wyil.lang.Codes.LengthOf;
import wyil.lang.Codes.ListGenerator;
import wyil.lang.Codes.Loop;
import wyil.lang.Codes.NewList;
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
import wyopcl.translator.Configuration;

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
	protected HashMap<FunctionOrMethod, CodeStore> stores;
	private List<wyil.lang.WyilFile.Type> userTypes;// Store all the user-defined types at source level, e.g. Board.

	public AbstractCodeGenerator(Configuration config) {
		this.config = config;
		this.stores = new HashMap<FunctionOrMethod, CodeStore>();
	}	
	/**
	 * Write out 'includes' both in 'test_case.c' and 'test_case.h'
	 * @param test_case
	 */
	/*private void writeIncludes(String test_case){
		//Remove the generated *.c and *.h files to have a clean folder.
		FileWriter writer;
		try {
			// Create a new 'test_case.h' or over-write an existing one
			File header = new File(test_case+".h");
			writer = new FileWriter(header, false);
			writer.append("#include \"Util.h\"\n");
			writer.close();
			header = null;
			
			// Create a new 'test_case.c'
			File source = new File(test_case + ".c");
			writer = new FileWriter(source, false);
			writer.append("#include \""+test_case+".h\"\n");
			writer.close();
			source = null;
			
		} catch (IOException e) {
			throw new RuntimeException("Errors occurs in deleting files");
		}


	}
*/

	/**
	 * Takes the byte-code and produces the code.
	 * 
	 * @param module
	 */
	public void apply(WyilFile module) {
		//this.writeIncludes(this.config.getFilename());
		this.writeIncludes();
		// Defines constants
		this.writeConstants((List<Constant>)module.constants());
		
		// Get and add all the user-defined types.
		this.userTypes = (List<wyil.lang.WyilFile.Type>) module.types();
		// Write out user-defined types.
		this.writeUserTypes(userTypes);
		
		// Translate each function
		for (FunctionOrMethod function : module.functionOrMethods()) {
			// Iterate and translate each code into the target language.
			this.iterateCodes(function.body().bytecodes(), function);
			// Write the code
			this.writeFunction(function);
		}
	}

	/**
	 * Get the user defined type by the name
	 * 
	 * @param name
	 * @return
	 */
	/*protected wyil.lang.WyilFile.Type getUserDefinedType(String name) {
		List<wyil.lang.WyilFile.Type> userTypes = (List<wyil.lang.WyilFile.Type>) module.types();
		for (wyil.lang.WyilFile.Type user_type : this.userTypes) {
			if (user_type.name().equals(name)) {
				return user_type;
			}
		}
		return null;
	}*/

	/**
	 * Get the user defined type by checking if the user type has the same fields as the given record type.
	 * 
	 * @param type
	 *            the record type.
	 * @return the user type. Return null if no type is matched.
	 */
	protected wyil.lang.WyilFile.Type getUserDefinedType(Type.Record type) {
		for (wyil.lang.WyilFile.Type user_type : this.userTypes) {
			if (user_type.type() instanceof Type.Record) {
				Type.Record record = (Type.Record) user_type.type();
				// check if record and type have the same fields.
				boolean isTheSame = true;
				for (Entry<String, Type> field : type.fields().entrySet()) {
					Type recordFieldType = record.field(field.getKey());
					if (recordFieldType != null) {
						isTheSame &= true;
					} else {
						isTheSame &= false;
					}
				}

				if (isTheSame) {
					return user_type;
				}
			}
		}
		return null;
	}


	/**
	 * Check if the type is instance of Integer by inferring the type from
	 * <code>wyil.Lang.Type</code> objects, including the effective collection
	 * types.
	 * 
	 * @param type
	 * @return true if the type is or contains an integer type.
	 */
	public boolean isIntType(Type type) {
		if (type instanceof Type.Int) {
			return true;
		}

		if (type instanceof Type.Array) {
			return isIntType(((Type.Array) type).element());
		}

		if (type instanceof Type.Tuple) {
			// Check the type of value field.
			Type element = ((Type.Tuple) type).element(1);
			return isIntType(element);
		}

		return false;
	}

	/**
	 * Get the code store of the given function.
	 * 
	 * @param function
	 * @return
	 */
	protected CodeStore getCodeStore(FunctionOrMethod function) {
		// Lazy initailization.
		if (!stores.containsKey(function)) {
			// Put the code store into the stores
			stores.put(function, new CodeStore(function, config.isVerbose()));
		}
		return stores.get(function);
	}

	protected abstract void translate(Update code, FunctionOrMethod function);

	protected abstract void translate(UnaryOperator code, FunctionOrMethod function);

	protected abstract void translate(Nop code, FunctionOrMethod function);

	protected abstract void translate(Return code, FunctionOrMethod function);

	protected abstract void translate(NewRecord code, FunctionOrMethod function);

	protected abstract void translate(NewList code, FunctionOrMethod function);

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

	protected abstract String declareVariables(FunctionOrMethod function);

	protected abstract String translateType(Type type);

	protected abstract void writeConstants(List<Constant> constants);

	protected abstract void writeUserTypes(List<wyil.lang.WyilFile.Type> userTypes);

	protected abstract void writeFunction(FunctionOrMethod function);
	
	protected abstract void writeIncludes();
	

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
					throw new RuntimeException("Not implemented! "+ code.toString(), null);
				} else if (code instanceof Codes.LengthOf) {
					translate((Codes.LengthOf) code, function);
				} else if (code instanceof Codes.ListGenerator){
					translate((Codes.ListGenerator)code, function);
				} else if (code instanceof Codes.Move) {
					throw new RuntimeException("Not implemented! "+ code.toString(), null);
				} else if (code instanceof Codes.NewList) {
					translate((Codes.NewList) code, function);
				} else if (code instanceof Codes.NewRecord) {
					translate((Codes.NewRecord) code, function);
				} else if (code instanceof Codes.NewTuple) {
					throw new RuntimeException("Not implemented! "+ code.toString(), null);
				} else if (code instanceof Codes.Return) {
					translate((Codes.Return) code, function);
				} else if (code instanceof Codes.NewObject) {
					translate((Codes.NewObject)code, function);
				} else if (code instanceof Codes.Nop) {
					translate((Codes.Nop) code, function);
				} else if (code instanceof Codes.Switch) {
					throw new RuntimeException("Not implemented! "+ code.toString(), null);
				} else if (code instanceof Codes.TupleLoad) {
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

	protected abstract void translate(ListGenerator code, FunctionOrMethod function);

	protected abstract void translate(NewObject code, FunctionOrMethod function);

	protected abstract void translate(Dereference code, FunctionOrMethod function);

	protected abstract void translate(IfIs code, FunctionOrMethod function);

	//protected abstract void translate(SubList code, FunctionOrMethod function);

}
