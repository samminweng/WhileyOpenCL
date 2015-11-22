package wyopcl.translator.generator;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map.Entry;

import wyil.attributes.VariableDeclarations;
import wyil.attributes.VariableDeclarations.Declaration;
import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Type;
import wyil.lang.WyilFile.FunctionOrMethod;

/**
 * Stores the generated code and provides common functionality for code generator.
 * 
 * @author Min-Hsien Weng
 *
 */
public class CodeStores {
	private String prefix = "_";
	private boolean isVerbose;
	private List<wyil.lang.WyilFile.Type> userTypes;// Store all the user-defined types at source level, e.g. Board.
	protected HashMap<FunctionOrMethod, CodeStore> stores; // Store generated code for each function
	
	public CodeStores(boolean isVerbose, List<wyil.lang.WyilFile.Type> userTypes){
		this.isVerbose = isVerbose;		
		this.stores = new HashMap<FunctionOrMethod, CodeStore>();
		this.userTypes = userTypes;
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
			stores.put(function, new CodeStore(function));
		}
		return stores.get(function);
	}
	
	
	/**
	 * Get the user defined type by checking if the user type has the same fields as the given record type.
	 * 
	 * @param type
	 *            the record type.
	 * @return the user type. Return null if no type is matched.
	 */
	public wyil.lang.WyilFile.Type getUserDefinedType(Type.Record type) {
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
	
	
	protected class CodeStore{
		private String indent;
		
		private FunctionOrMethod function;
		private List<String> statements;// store the list of translated C code.
		private HashMap<Integer, String> fields;// Stores the fields of register, e.g. 'println', 'print_s', 'println_s'

		public CodeStore(FunctionOrMethod function) {
			this.indent = "\t";
			this.function = function;
			this.statements = new ArrayList<String>();
			this.fields = new HashMap<Integer, String>();			
		}

		/**
		 * Load the field to the given register.
		 * @param reg
		 * @param field
		 */
		protected void loadField(int reg, String field){
			this.fields.put(reg, field);
		}
		/**
		 * Get the field of the given register.
		 * @param reg
		 * @return
		 */
		protected String getField(int reg){
			return this.fields.get(reg);
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
		public void addStatement(Code code, String statement) {
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
				if (isVerbose) {
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
			// Check if the register has been kept in the declarations.
			Declaration declaration = vars.get(reg);
			if (declaration != null) {
				String name = declaration.name();
				if (name != null && !name.isEmpty()) {
					return name;
				}
			}
			return prefix + reg;
		}
	}
	
	
	

	
	
	
}