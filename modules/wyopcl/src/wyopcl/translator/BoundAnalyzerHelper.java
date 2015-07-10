package wyopcl.translator;

import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;

import wyil.attributes.VariableDeclarations;
import wyil.attributes.VariableDeclarations.Declaration;
import wyil.lang.Type;
import wyil.lang.WyilFile;
import wyil.lang.WyilFile.FunctionOrMethod;
import wyopcl.translator.bound.BasicBlock;
import wyopcl.translator.bound.BoundInference;
import wyopcl.translator.bound.Bounds;
import wyopcl.translator.bound.CFGraph;
import wyopcl.translator.bound.CFGraph.STATUS;
import wyopcl.translator.bound.Domain;
import wyopcl.translator.bound.constraint.Range;

public final class BoundAnalyzerHelper {
	private static final String prefix = "%";
	// Color code
	private static final String GRAY = (char) 27 + "[30;1m";
	private static final String BLUE = (char) 27 + "[34;1m";
	private static final String RED = (char) 27 + "[31;1m";
	private static final String RESET = (char) 27 + "[0m";
	// Maps of CFGs, symbols
	// Stores all the extracted symbols
	private static HashMap<String, SymbolController> symbol_ctrls = new HashMap<String, SymbolController>();
	private static HashMap<String, CFGraph> cfgraphs = new HashMap<String, CFGraph>();
	// Bound inference processor
	private static BoundInference bound_infer = new BoundInference();

	/**
	 * Checks if the CFGraph of the given function exist.
	 * 
	 * @param name
	 * @return
	 */
	public static boolean isCached(String name) {
		CFGraph graph = getCFGraph(name);
		if (graph != null) {
			if (graph.getStatus() == STATUS.COMPLETE) {
				return true;
			}
		} else {
			// Create an graph and symbol control
			cfgraphs.put(name, new CFGraph());
			symbol_ctrls.put(name, new SymbolController());
		}

		return false;
	}

	/**
	 * Promote and update the status of CF graph.
	 * 
	 * @param name
	 */
	public static void promoteCFGStatus(String name) {
		CFGraph graph = getCFGraph(name);
		if (graph.getStatus() == STATUS.INIT) {
			graph.setStatus(STATUS.PROCESSING);
		} else if (graph.getStatus() == STATUS.PROCESSING) {
			graph.setStatus(STATUS.COMPLETE);
		}
	}

	/**
	 * Given a function name, get the CFGraph.
	 * 
	 * @param name
	 *            the function name
	 * @return the cached CFGraph. If no cached graph is found, return null.
	 */
	public static CFGraph getCFGraph(String name) {
		if (cfgraphs.containsKey(name))
			return cfgraphs.get(name);
		return null;
	}

	/**
	 * Given a function name, get the symbol controller
	 * 
	 * @param name
	 *            the function name
	 * @return
	 */
	public static SymbolController getSymbolController(String name) {
		if (symbol_ctrls.containsKey(name)) {
			return symbol_ctrls.get(name);
		}
		return null;
	}

	/**
	 * Given the register, get the variable name from variable declarations.
	 * 
	 * @param domain
	 *            the domain that contains the register and bounds.
	 * @return the variable name (starting with "%")
	 */
	public static String getVarName(Domain domain, VariableDeclarations variables) {
		int reg = domain.getReg();
		// Check if the register has been kept in the functional variable
		// declarations.
		if (reg < variables.size()) {
			Declaration variable = variables.get(reg);
			if (variable != null) {
				String name = variable.name();
				if (name != null && !name.isEmpty()) {
					return name;
				}
			}
		}
		return domain.getName();
	}

	/**
	 * Print out the bounds, symbol and values.
	 * 
	 * @param bnd
	 *            the bounds
	 */
	public static void printBounds(Bounds bnds, String name, VariableDeclarations variables) {
		
		String str = "Bound Analysis of " + name + ":\n";
	

		List<Domain> sortedDomains = bnds.sortedDomains();
		// Print out the bounds
		for (Domain d : sortedDomains) {
			str += "\tdomain(" + getVarName(d, variables) + ")\t=" + d.getBounds() + "\n";
		}

		SymbolController sym_ctrl = getSymbolController(name);

		List<Symbol> sortedSymbols = sym_ctrl.sortedSymbols();
		// Print out the values of available variables
		for (Symbol symbol : sortedSymbols) {
			// String str_symbols = "";
			String symbol_name = symbol.getName();
			// print the 'value' attribute
			Object val = symbol.getAttribute("value");
			if (val != null) {
				str += "\tvalue(" + symbol_name + ")\t= " + val + "\n";
			}
		}

		// Print out the size of available variables
		for (Symbol symbol : sortedSymbols) {
			// String str_symbols = "";
			String symbol_name = symbol.getName();
			// get the 'type' attribute
			Type type = (Type) symbol.getAttribute("type");
			// print the 'size' att
			if (type instanceof Type.List) {
				Object size = symbol.getAttribute("size");
				str += "\tsize(" + symbol_name + ")\t= " + size + "\n";
			}
		}

		str += "Consistency=" + bnds.checkBoundConsistency();
		System.out.println(str);

	}

	/**
	 * Infer the bounds of a function
	 * 
	 * @param config
	 * @param name
	 *            the function name
	 * @return
	 */
	public static Bounds inferBounds(Configuration config, String name) {
		CFGraph graph = getCFGraph(name);
		// Sort the blks
		graph.sortedList();
		Bounds bnds = bound_infer.inferBounds(config, graph.getList());
		return bnds;
	}

	private static void passSymbols(SymbolController sym_ctrl, List<Type> params, int[] operands) {
		int reg = 0;
		// Pass the bounds of input parameters.
		for (Type paramType : params) {
			String param = prefix + reg;
			String operand = prefix + operands[reg];
			// pass the symbol
			Symbol symbol = sym_ctrl.getSymbol(operand).clone();
			// Update the name
			symbol.setName(param);
			sym_ctrl.putSymbol(param, symbol);
			reg++;
		}
	}

	/**
	 * Propagate the input bounds to the callee function.
	 * 
	 * @param caller_name
	 *            the name of caller function.
	 * 
	 * @param callee_name
	 *            the name of callee function.
	 * 
	 * @param invokeboundAnalyzer
	 *            the analyzer of invoked function.
	 * @param operands
	 *            the operands of calling function
	 * @param bnd
	 *            the bounds of caller function
	 */
	public static void propagateInputBoundsToFunctionCall(String caller_name, String callee_name, List<Type> params, int[] operands, Bounds bnd) {
		CFGraph graph = getCFGraph(callee_name);
		graph.addInputBounds(params, operands, bnd);
		SymbolController sym_ctrl = getSymbolController(callee_name);
		passSymbols(sym_ctrl, params, operands);
	}

	/**
	 * Propagate the bounds of return value to the caller.
	 * 
	 * @param invokeboundAnalyzer
	 * @param ret_reg
	 * @param ret_type
	 * @param bnd
	 */
	public static void propagateBoundsFromFunctionCall(String caller_name, String callee_name, String ret_reg, Type ret_type, Bounds bnd) {
		CFGraph graph = getCFGraph(caller_name);
		SymbolController caller_sym_ctrl = getSymbolController(caller_name);
		SymbolController callee_sym_ctrl = getSymbolController(callee_name);

		// put the 'type' attribute of 'return_reg'
		caller_sym_ctrl.putAttribute(ret_reg, "type", ret_type);

		if (TranslatorHelper.isIntType(ret_type)) {
			// propagate the bounds of return value.
			graph.addConstraint(new Range(ret_reg, bnd.getLower("return"), bnd.getUpper("return")));
			// Add 'type' attribute
			caller_sym_ctrl.putAttribute(ret_reg, "type", ret_type);
		}

		// Add 'size' attribute
		if (ret_type instanceof Type.List) {
			BigInteger size = (BigInteger) callee_sym_ctrl.getAttribute("return", "size");
			caller_sym_ctrl.putAttribute(ret_reg, "size", size);
		}
	}

	/**
	 * TODO : Add the type check to find the extract function declaration.
	 * 
	 * Gets the function declaration by name.
	 * 
	 * 
	 * @param config
	 * @param name
	 *            the function name
	 *            
	 * @return
	 */
	public static FunctionOrMethod getFunctionOrMethod(Configuration config, String name) {
		WyilFile module = (WyilFile) config.getProperty("module");
		return module.functionOrMethod(name).get(0);
	}

	/**
	 * Add loop variables to bound inference processor.
	 */
	public static void addLoopVar(int[] operands) {
		for (int op : operands) {
			bound_infer.addLoopVar(prefix + op);
		}
	}

	/**
	 * Outputs the control flow graphs (*.dot).
	 * 
	 * @param blks
	 *            the list of block
	 * @param filename
	 *            the name of input file.
	 * @param func_name
	 *            the name of function.
	 */
	public static void printCFG(String name) {

		String dot_string = "digraph " + name + "{\n";
		CFGraph graph = getCFGraph(name);
		List<BasicBlock> blks = graph.getList();
		for (BasicBlock blk : blks) {
			if (!blk.isLeaf()) {
				for (BasicBlock child : blk.getChildNodes()) {
					dot_string += "\"" + blk.getBranch() + " [" + blk.getType() + "]\"->\"" + child.getBranch() + " [" + child.getType() + "]\";\n";
				}
			}
		}
		dot_string += "\n}";
		// Write out the CFG-function_name.dot
		try {
			PrintWriter cfg_writer = new PrintWriter(name + ".dot", "UTF-8");
			cfg_writer.println(dot_string);
			cfg_writer.close();
		} catch (FileNotFoundException | UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
