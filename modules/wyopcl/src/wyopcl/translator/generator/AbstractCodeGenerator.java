package wyopcl.translator.generator;

import java.io.FileNotFoundException;
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
		this.userTypes = new ArrayList<wyil.lang.WyilFile.Type>();
	}	
	
	/**
	 * Takes the byte-code and produces the code.
	 * 
	 * @param module
	 */
	public void apply(WyilFile module) {		
		//Remove the generated *.c and *.h files to have a clean folder.
		try {
			//Delete *.c
			Path path = Paths.get(config.getFilename()+".c");
			Files.deleteIfExists(path);
			//Delete *.h
			path = Paths.get(config.getFilename()+".h");
			Files.deleteIfExists(path);
		} catch (IOException e) {
			throw new RuntimeException("Errors occurs in deleting files");
		}
		// Write out the contants
		this.wrieteCodeToFile((List<Constant>)module.constants());
		// Get and add all the user-defined types.
		userTypes = (List<wyil.lang.WyilFile.Type>) module.types();
		// Write out user defined types to header file (*.h)
		this.writeCodeToFile(userTypes);
		
		// Translate each function
		for (FunctionOrMethod function : module.functionOrMethods()) {
			// Iterate and translate each code into the target language.
			this.iterateCodes(function.body().bytecodes(), function);
			// Write the code
			this.writeCodeToFile(function);
		}
	}
	
	/**
	 * Get the user defined type by the name
	 * 
	 * @param name
	 * @return
	 */
	protected wyil.lang.WyilFile.Type getUserDefinedType(String name) {
		for (wyil.lang.WyilFile.Type user_type : this.userTypes) {
			if (user_type.name().equals(name)) {
				return user_type;
			}
		}
		return null;
	}

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
	 * Get the actual (source-level) variable name of a register
	 *   
	 * @param reg
	 * @param function
	 * @return
	 */
	/*public String getActualVarName(int reg, FunctionOrMethod function){
		//Get the mapping table between variable name and register.
		CodeStore store = stores.get(function);
		return store.getVar(reg);
	}*/
	
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
			stores.put(function, new CodeStore(function));
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

	//protected abstract void translate(ListOperator code, FunctionOrMethod function);

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
	
	protected abstract void wrieteCodeToFile(List<Constant> constants);

	protected abstract void writeCodeToFile(List<wyil.lang.WyilFile.Type> userTypes);
	
	protected abstract void writeCodeToFile(FunctionOrMethod function);

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

	/**
	 * Stores the generated code for a function.
	 * 
	 * @author Min-Hsien Weng
	 *
	 */
	protected class CodeStore {
		private String indent;
		private FunctionOrMethod function;
		private List<String> statements;// store the list of translated C code.

		public CodeStore(FunctionOrMethod function) {
			this.indent = "\t";
			this.function = function;
			this.statements = new ArrayList<String>();
		}

		/**
		 * Given a variable name, check if it is the size variable of input
		 * parameter. For example,
		 * 
		 * <pre>
		 * <code>
		 * long long* reverse(long long* _ls, long long _ls_size)
		 * </code>
		 * </pre>
		 * 
		 * The '_ls_size' variable is the size variable of input parameter 'ls'.
		 * 
		 * @param var_name
		 * @return true if the variable is the size variable of input parameter.
		 * 
		 */
		private Boolean isInputParameter(String var_name) {
			// Check if the variable is the size variable of the input
			// parameter.
			String variable_name = var_name;
			if (variable_name.contains("_size")) {
				// Get the array variable.
				String[] split = variable_name.split("_size");
				// Check if the split variable name has at least two items.
				if (split.length >= 1) {
					variable_name = split[0];
				}
			}
			// Check if the variable_name is an number.
			// If so, the variable is an intermediate variable. Otherwise, it
			// could
			// be an input parameter.
			if (!variable_name.isEmpty() && !(variable_name.matches("^_[0-9]+$"))) {
				// Check if the input parameter contains the variable name.
				int reg = Integer.parseInt(variable_name);
				// Check if the register <= parameter size.
				if (reg < function.type().params().size()) {
					return true;
				}
			}
			return false;
		}

		protected List<String> getStatements() {
			return this.statements;
		}

		/**
		 * Adds the statement to the list and print out the statement if the
		 * verbose option is on.
		 * 
		 * @param code
		 *            the WyIL code
		 * @param statement
		 *            the C code
		 */
		protected void addStatement(Code code, String statement) {
			// Add the WyIL code as a comment
			if (code != null) {
				if (code instanceof Codes.Label) {
					// No indentation for label bytecode
					statements.add("//" + code.toString());
				} else {
					statements.add(indent + "//" + code.toString());
				}

			}
			// Add the translated statement.
			if (statement != null) {
				if (config.isVerbose()) {
					System.out.println(statement);
				}
				statements.add(statement);
			}
		}

		/**
		 * Increase the indentation.
		 */
		protected void increaseIndent() {
			this.indent += "\t";
		}

		protected String getIndent() {
			return this.indent;
		}

		/**
		 * Decrease the indentation.
		 */
		protected void decreaseIndent() {
			this.indent = this.indent.replaceFirst("\t", "");
		}

		/**
		 * Get the type of a variable.
		 * 
		 * @param reg
		 * @return
		 */
		protected Type getVarType(int reg) {
			VariableDeclarations vars = function.attribute(VariableDeclarations.class);
			Declaration declaration = vars.get(reg);
			return declaration.type();
		}

		/**
		 * Get the variable name of the given register
		 * 
		 * @param reg
		 *            the register
		 * @return the variable name (starting with "_")
		 */
		protected String getVar(int reg) {
			VariableDeclarations vars = function.attribute(VariableDeclarations.class);
			// Check if the register has been kept in the functional variable
			// declarations.
			// if (reg < vars.size()) {
			Declaration declaration = vars.get(reg);
			if (declaration != null) {
				String name = declaration.name();
				if (name != null && !name.isEmpty()) {
					return prefix + name;
				}
			}
			// }
			return prefix + reg;
		}

	}

}
