package wyopcl.translator.generator;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import wyil.attributes.VariableDeclarations;
import wyil.attributes.VariableDeclarations.Declaration;
import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Type;
import wyil.lang.WyilFile.FunctionOrMethod;

/**
 * Stores the generated code for a function.
 * 
 * @author Min-Hsien Weng
 *
 */
public class CodeStore {
	private String prefix = "_";
	private boolean isVerbose;
	private String indent;
	private FunctionOrMethod function;
	private List<String> statements;// store the list of translated C code.
	private HashMap<Integer, String> fields;// Stores the fields of register, e.g. 'println', 'print_s', 'println_s'

	public CodeStore(FunctionOrMethod function, boolean isVerbose) {
		this.isVerbose = isVerbose;
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