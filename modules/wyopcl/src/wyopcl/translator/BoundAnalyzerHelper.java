package wyopcl.translator;

import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;

import wyil.attributes.VariableDeclarations;
import wyil.attributes.VariableDeclarations.Declaration;
import wyil.lang.Type;
import wyil.lang.WyilFile;
import wyil.lang.WyilFile.FunctionOrMethod;
import wyopcl.translator.bound.BasicBlock;
import wyopcl.translator.bound.Bounds;
import wyopcl.translator.bound.CFGraph;
import wyopcl.translator.bound.CFGraph.STATUS;
import wyopcl.translator.bound.Domain;
import wyopcl.translator.bound.constraint.Constraint;
import wyopcl.translator.bound.constraint.Range;
/**
 * Aims to assist the bound analyzer to build up CFGraph, propagate bounds
 * between caller and callee, and store and retrieve symbols.  
 * 
 * @author Min-Hsien Weng
 *
 */
public final class BoundAnalyzerHelper {
	private static final String prefix = "%";
	// Color code
	private static final String GRAY = (char) 27 + "[30;1m";
	private static final String BLUE = (char) 27 + "[34;1m";
	private static final String RED = (char) 27 + "[31;1m";
	private static final String RESET = (char) 27 + "[0m";
	// Maps of CFGs, symbols
	private static HashMap<String, SymbolFactory> symbol_factorys = new HashMap<String, SymbolFactory>();
	private static HashMap<String, CFGraph> cfgraphs = new HashMap<String, CFGraph>();

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
			symbol_factorys.put(name, new SymbolFactory());
		}

		return false;
	}

	/**
	 * Given a constraint, add it to the CFGraph of a funcion
	 * @param name the function name
	 * @param c the constraint
	 */
	/*public static void addConstraint(String name, Constraint c){
		if(!isCached(name)){
			CFGraph graph = getCFGraph(name);
			graph.addConstraint(c);
		}
	}*/
	
	
	
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
	public static SymbolFactory getSymbolFactory(String name) {
		if (!symbol_factorys.containsKey(name)) {
			symbol_factorys.put(name, new SymbolFactory());
		}
		return symbol_factorys.get(name);
	}

	/**
	 * Given the register, get the variable name from variable declarations.
	 * 
	 * @param domain
	 *            the domain that contains the register and bounds.
	 * @return the variable name (starting with "%")
	 */
	private static String getVarName(Domain domain, VariableDeclarations variables) {
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
	public static void printBoundsAndSymbols(Configuration config, Bounds bnds, String name) {
		FunctionOrMethod functionOrMethod = getFunctionOrMethod(config, name);
		VariableDeclarations variables = functionOrMethod.attribute(VariableDeclarations.class);
		
		String str = "Bound Analysis of " + name + ":\n";
		List<Domain> sortedDomains = bnds.sortedDomains();
		// Print out the bounds
		for (Domain d : sortedDomains) {
			str += "\tdomain(" + getVarName(d, variables) + ")\t=" + d.getBounds() + "\n";
		}

		SymbolFactory sym_ctrl = getSymbolFactory(name);

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
	}

	public static void propagateInputSymbolsToFunctionCall(String caller_name, String callee_name, List<Type> params, int[] operands) {
		SymbolFactory caller_factory = getSymbolFactory(caller_name);
		SymbolFactory callee_factory = getSymbolFactory(callee_name);
		
		callee_factory.addInputSymbols(caller_factory, operands, params);
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
		if (TranslatorHelper.isIntType(ret_type)) {
			// propagate the bounds of return value.
			graph.addConstraint(new Range(ret_reg, bnd.getLower("return"), bnd.getUpper("return")));
		}

		SymbolFactory caller_factory = getSymbolFactory(caller_name);
		SymbolFactory callee_factory = getSymbolFactory(callee_name);		
		caller_factory.addOutputSymbols(callee_factory, ret_reg, ret_type);
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
	 * Outputs the control flow graphs (*.dot).
	 * 
	 * @param blks
	 *            the list of block
	 * @param filename
	 *            the name of input file.
	 * @param func_name
	 *            the name of function.
	 */
	public static void printCFG(Configuration config, String name) {
		//Check if the verbose is on.
		if(!config.isVerbose()){
			return;
		}
		
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
