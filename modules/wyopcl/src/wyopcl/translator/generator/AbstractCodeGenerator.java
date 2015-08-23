package wyopcl.translator.generator;

import static wycc.lang.SyntaxError.internalFailure;

import java.io.PrintWriter;
import java.util.ArrayList;
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
import wyil.lang.Codes.Fail;
import wyil.lang.Codes.FieldLoad;
import wyil.lang.Codes.Goto;
import wyil.lang.Codes.If;
import wyil.lang.Codes.IndexOf;
import wyil.lang.Codes.IndirectInvoke;
import wyil.lang.Codes.Invoke;
import wyil.lang.Codes.Label;
import wyil.lang.Codes.LengthOf;
import wyil.lang.Codes.ListOperator;
import wyil.lang.Codes.Loop;
import wyil.lang.Codes.NewList;
import wyil.lang.Codes.NewRecord;
import wyil.lang.Codes.Nop;
import wyil.lang.Codes.Return;
import wyil.lang.Codes.UnaryOperator;
import wyil.lang.Codes.Update;
import wyil.lang.Type;
import wyil.lang.WyilFile;
import wyil.lang.WyilFile.FunctionOrMethod;
import wyopcl.translator.Configuration;
/**
 * Defines the functions for code generator.
 * @author Min-Hsien Weng
 *
 */
public abstract class AbstractCodeGenerator {	
	protected final String prefix = "_";
	protected final Configuration config;
	//Store generated code
	protected HashMap<FunctionOrMethod, CodeStore> stores = new HashMap<FunctionOrMethod, CodeStore>();

	public AbstractCodeGenerator(Configuration config) {
		this.config = config;
	}

	/**
	 * Takes the byte-code and produces the code.
	 * @param module
	 */
	public void apply(WyilFile module) {
		// Apply live analysis on each function, except for main function.
		for (FunctionOrMethod function : module.functionOrMethods()) {			
			//Declare function signature
			declareFunction(function);
			//Declare variables.
			declareVariables(function);
		}
	}

	/**
	 * Get the code store of the given function.
	 * @param function
	 * @return
	 */
	protected CodeStore getCodeStore(FunctionOrMethod function){
		//Lazy initailization. 
		if(!stores.containsKey(function)){
			//Put the code store into the stores
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

	protected abstract void translate(ListOperator code, FunctionOrMethod function);

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

	protected abstract void declareVariables(FunctionOrMethod function);
	
	protected abstract String translate(Type type);

	protected abstract void writeCodeToFile(PrintWriter writer, FunctionOrMethod function);
	
	/**
	 * Iterates over the list of byte-code to generate the corresponding C code.
	 * Checks the type of the wyil code and dispatches the code to the analyzer
	 * for being executed by the <code>analyze(code)</code>
	 * 
	 * @param code_blk
	 * @param func_name
	 */
	protected void iterateOverCodeBlock(List<Code> code_blk, FunctionOrMethod function) {
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
					internalFailure("Not implemented!", code.toString(), null);
				} else if (code instanceof Codes.Dereference) {
					internalFailure("Not implemented!", code.toString(), null);
				} else if (code instanceof Codes.Fail) {
					translate((Codes.Fail) code, function);
				} else if (code instanceof Codes.FieldLoad) {
					translate((Codes.FieldLoad) code, function);
				} else if (code instanceof Codes.Goto) {
					translate((Codes.Goto) code, function);
				} else if (code instanceof Codes.If) {
					translate((Codes.If) code, function);
				} else if (code instanceof Codes.IfIs) {
					internalFailure("Not implemented!", code.toString(), null);
				} else if (code instanceof Codes.IndexOf) {
					translate((Codes.IndexOf) code, function);
				} else if (code instanceof Codes.IndirectInvoke) {
					translate((Codes.IndirectInvoke) code, function);
				} else if (code instanceof Codes.Invoke) {
					translate((Codes.Invoke) code, function);
				} else if (code instanceof Codes.Invert) {
					internalFailure("Not implemented!", code.toString(), null);
				} else if (code instanceof Codes.ListOperator) {
					translate((Codes.ListOperator) code, function);
				} else if (code instanceof Codes.Loop) {
					translate((Codes.Loop) code, function);
				} else if (code instanceof Codes.Label) {
					translate((Codes.Label) code, function);
				} else if (code instanceof Codes.Lambda) {
					internalFailure("Not implemented!", code.toString(), null);
				} else if (code instanceof Codes.LengthOf) {
					translate((Codes.LengthOf) code, function);
				} else if (code instanceof Codes.Move) {
					internalFailure("Not implemented!", code.toString(), null);
				} else if (code instanceof Codes.NewList) {
					translate((Codes.NewList) code, function);
				} else if (code instanceof Codes.NewRecord) {
					translate((Codes.NewRecord) code, function);
				} else if (code instanceof Codes.NewTuple) {
					internalFailure("Not implemented!", code.toString(), null);
				} else if (code instanceof Codes.Return) {
					translate((Codes.Return) code, function);
				} else if (code instanceof Codes.NewObject) {
					internalFailure("Not implemented!", code.toString(), null);
				} else if (code instanceof Codes.Nop) {
					translate((Codes.Nop) code, function);
				} else if (code instanceof Codes.SubList) {
					internalFailure("Not implemented!", code.toString(), null);
				} else if (code instanceof Codes.Switch) {
					internalFailure("Not implemented!", code.toString(), null);
				} else if (code instanceof Codes.TupleLoad) {
					internalFailure("Not implemented!", code.toString(), null);
				} else if (code instanceof Codes.UnaryOperator) {
					translate((Codes.UnaryOperator) code, function);
				} else if (code instanceof Codes.Update) {
					translate((Codes.Update) code, function);
				} else {
					internalFailure("unknown wyil code encountered (" + code + ")", "", null);
				}
			
			} catch (SyntaxError ex) {
				throw ex;
			} catch (Exception ex) {
				internalFailure(ex.getMessage(), "", null, ex);
			}
		}
	}

	

	

	/**
	 * Stores the generated code for a function.
	 * @author Min-Hsien Weng
	 *
	 */
	protected class CodeStore{
		
		protected String indent;
		protected FunctionOrMethod function;
		protected List<String> statements;// store the list of translated C code.
		//protected LinkedHashMap<String, Type> vars;// stores the variable type declaration and preserve the insertion orders of variables.
		//protected List<String> input_params;// Store all the names of input parameters.
		
		public CodeStore(FunctionOrMethod function){
			this.indent = "\t";
			this.function = function;
			this.statements = new ArrayList<String>();
			//this.input_params = new ArrayList<String>();
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
			// If so, the variable is an intermediate variable. Otherwise, it could
			// be an input parameter.
			if (!variable_name.isEmpty() && !(variable_name.matches("^_[0-9]+$"))) {
				// Check if the input parameter contains the variable name.
				

				//if(function.type().params().size()
				
				//return this.input_params.contains(variable_name);
			}

			return false;
		}
		
	
	
		/**
		 * Adds the type declaration for a variable. But serveral types are not
		 * added to the table. For example,
		 * 
		 * <pre>
		 * <code>
		 * method(any) -> void
		 * </code>
		 * </pre>
		 * 
		 * @param type
		 *            the Whiley type
		 * @param var
		 *            the name of variable
		 */
		/*protected void addDeclaration(Type type, String var) {
			// Check if the type is a record and its field contains "println" .
			if (type instanceof Type.Record) {
				Type.Record record = (Type.Record) type;
				// Add the record type to the list
				// if(!this.record_types.contains(record)){
				// this.record_types.add(record);
				// }

				// If so, then the record loads the "println" from the
				// sys.out.console.
				// At this stage, we dont use this record.
				if (record.field("println") != null) {
					return;
				}
			}

			if (type instanceof Type.Method) {
				return;
			}

			if (type instanceof Type.List) {
				vars.put(var, type);
				// add the additional parameter 'reg_size' to indicate the array
				// size.
				vars.put(var + "_size", Type.Int.T_INT);
			} else {
				vars.put(var, type);
			}
		}*/
		
		
		/**
		 * Adds the statement to the list and print out the statement if the verbose
		 * option is on.
		 * 
		 * @param code
		 *            the WyIL code
		 * @param stat
		 *            the C code
		 */
		protected void addStatement(Code code, String stat) {
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
			if (stat != null) {
				if (config.isVerbose()) {
					System.out.println(stat);
				}
				statements.add(stat);
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
			//if (reg < vars.size()) {
				Declaration declaration = vars.get(reg);
				if (declaration != null) {
					String name = declaration.name();
					if (name != null && !name.isEmpty()) {
						return prefix + name;
					}
				}
			//}
			return prefix + reg;
		}
		
		
		
	}
	
	
	
}
