package wyopcl.translator;

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
	private static HashMap<String, SymbolController> symbol_ctrls = new HashMap<String, SymbolController>();
	private static HashMap<String, CFGraph> cfgraphs = new HashMap<String, CFGraph>();
	// Bound inference processor
	private static BoundInference infer_ctrl = new BoundInference();

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
	 * @param name
	 */
	public static void promoteCFGStatus(String name){
		CFGraph graph = getCFGraph(name);
		if(graph.getStatus() == STATUS.INIT){
			graph.setStatus(STATUS.PROCESSING);
		}else if(graph.getStatus() == STATUS.PROCESSING){
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
	public static void printBounds(Bounds bnds, FunctionOrMethod functionOrMethod) {
		String str = "";
		VariableDeclarations variables = functionOrMethod.attribute(VariableDeclarations.class);

		List<Domain> sortedDomains = bnds.sortedDomains();
		// Print out the bounds
		for (Domain d : sortedDomains) {
			str += "\tdomain(" + getVarName(d, variables) + ")\t=" + d.getBounds() + "\n";
		}

		String func_name = functionOrMethod.name();
		SymbolController sym_ctrl = getSymbolController(func_name);

		List<Symbol> sortedSymbols = sym_ctrl.sortedSymbols();
		// Print out the values of available variables
		for (Symbol symbol : sortedSymbols) {
			// String str_symbols = "";
			String name = symbol.getName();
			// print the 'value' attribute
			Object val = symbol.getAttribute("value");
			if (val != null) {
				str += "\tvalue(" + name + ")\t= " + val + "\n";
			}
		}

		// Print out the size of available variables
		for (Symbol symbol : sortedSymbols) {
			// String str_symbols = "";
			String name = symbol.getName();
			// get the 'type' attribute
			Type type = (Type) symbol.getAttribute("type");
			// print the 'size' att
			if (type instanceof Type.List) {
				Object size = symbol.getAttribute("size");
				str += "\tsize(" + name + ")\t= " + size + "\n";
			}
		}
		str += "Consistency=" + bnds.checkBoundConsistency();
		System.out.println(str);
	}

	public static Bounds inferBounds(Configuration config, String name) {
		CFGraph graph = getCFGraph(name);
		// Sort the blks
		graph.sortedList();
		List<BasicBlock> list = graph.getList();
		Bounds bnds = infer_ctrl.inferBounds(config, list);
		return bnds;
	}

	public static void passSymbols(String name, String operand, String param) {
		SymbolController sym_ctrl = getSymbolController(name);
		// pass the symbol
		Symbol symbol = sym_ctrl.getSymbol(operand).clone();
		// Update the name
		symbol.setName(param);
		sym_ctrl.putSymbol(param, symbol);
		symbol_ctrls.put(name, sym_ctrl);
	}

	/**
	 * Propagate the input bounds to the called function.
	 * 
	 * @param invokeboundAnalyzer
	 *            the analyzer of invoked function.
	 * @param operands
	 *            the operands of calling function
	 * @param bnd
	 *            the bounds of caller function
	 */
	public static void propagateBoundsToFunctionCall(String caller_name, String callee_name, List<Type> params, int[] operands, Bounds bnd) {
		CFGraph graph = BoundAnalyzerHelper.getCFGraph(callee_name);		
		graph.addInputBounds(params, operands, bnd);
		int index = 0;
		// Pass the bounds of input parameters.
		for (Type paramType : params) {
			String param = prefix + index;
			String operand = prefix + operands[index];
			BoundAnalyzerHelper.passSymbols(callee_name, operand, param);
			index++;
		}
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
	 * 
	 * @param config
	 * @param name
	 * @param type
	 * @return
	 */
	public static FunctionOrMethod getFunctionOrMethod(Configuration config, String name, wyil.lang.Type.FunctionOrMethod type) {
		WyilFile module = (WyilFile) config.getProperty("module");
		return module.functionOrMethod(name, type);
	}

	/**
	 * Gets the function name.
	 * 
	 * @return
	 */
	public static String getFunctionName(Configuration config) {
		return (String) config.getProperty("function_name");
	}

	/**
	 * Add loop variables to bound inference processor.
	 */
	public static void addLoopVar(int[] operands) {
		for (int op : operands) {
			infer_ctrl.addLoopVar(prefix + op);
		}
	}

}
