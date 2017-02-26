package wyopcl.translator.bound;

import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map.Entry;
import java.util.stream.Collectors;

import wyil.attributes.VariableDeclarations;
import wyil.attributes.VariableDeclarations.Declaration;
import wyil.lang.Codes;
import wyil.lang.Type;
import wyil.lang.WyilFile;
import wyil.lang.WyilFile.FunctionOrMethod;
import wyopcl.Configuration;
import wyopcl.translator.bound.BoundBlock.BlockType;
import wyopcl.translator.bound.BoundGraph.STATUS;
import wyopcl.translator.bound.constraint.Assign;
import wyopcl.translator.bound.constraint.Range;
/**
 * Aims to assist the analyzer to build up CFGraph, propagate bounds
 * between caller and callee, and store and retrieve symbols.  
 * 
 * @author Min-Hsien Weng
 *
 */
final class BoundAnalyzerHelper {
	private static final String prefix = "_";
	// Maps of CFGs
	private static HashMap<String, BoundGraph> cfgraphs = new HashMap<String, BoundGraph>();

	/**
	 * Checks if the CFGraph of the given function exist.
	 * 
	 * @param name
	 * @return
	 */
	protected static boolean isCached(String name) {
		BoundGraph graph = getCFGraph(name);
		if (graph != null) {
			if (graph.getStatus() == STATUS.COMPLETE) {
				return true;
			}
		} else {
			// Create an graph and symbol control
			cfgraphs.put(name, new BoundGraph());
		}

		return false;
	}


	/**
	 * Promote and update the status of CF graph.
	 * 
	 * @param name
	 */
	protected static void promoteCFGStatus(String name) {
		BoundGraph graph = getCFGraph(name);
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
	protected static BoundGraph getCFGraph(String name) {
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
	/*private static SymbolFactory getSymbolFactory(String name) {
		if (!symbol_factorys.containsKey(name)) {
			symbol_factorys.put(name, new SymbolFactory());
		}
		return symbol_factorys.get(name);
	}*/

	/**
	 * Given the register, get the variable name from variable declarations.
	 * 
	 * @param domain
	 *            the domain that contains the register and bounds.
	 * @return the variable name (starting with "_")
	 */
	protected static String getVarName(int reg, VariableDeclarations variables) {
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
		return prefix+reg;
	}

	/**
	 * Print out the bounds, symbol and values.
	 * 
	 * @param bnd
	 *            the bounds
	 */
	protected static void printBoundsAndSize(WyilFile module, Bounds bnds, String name) {
		FunctionOrMethod functionOrMethod = module.functionOrMethod(name).get(0);
		VariableDeclarations variables = functionOrMethod.attribute(VariableDeclarations.class);

		String str = "=================================\n\n" + "Bound Analysis of '" + name + "' function:\n";
		List<Domain> sortedDomains = bnds.sortedDomains();
		// Print out the bounds
		for (Domain d : sortedDomains) {			
			int register = d.getReg();
			String varName = "";
			if(register >= 0){
				varName = getVarName(register, variables);
				// Check if the domain is array size variable 
				if(d.getName().contains("_size")){
					varName += "_size";
				}
			}else{
				// Use domain name
				varName = d.getName();
			}
			str += "\tdomain(" + varName + ")\t=" + d.getBounds() + "\n";
		}
		
		
		/*SymbolFactory factory = getSymbolFactory(name);

		List<Symbol> sortedSymbols = factory.sortedSymbols();
		// Print out the size of available variables
		for (Symbol symbol : sortedSymbols) {
			String varName = symbol.getName();
			if(symbol.getName().contains(prefix)){
				int reg = Integer.parseInt(symbol.getName().split(prefix)[1]);
				varName = getVarName(reg, variables);
			}
			// print the 'size' att
			Object size = symbol.getAttribute("size");
			str += "\tsize(" + varName + ")\t= " + size + "\n";
		}*/

		str += "Consistency=" + bnds.checkBoundConsistency();
		str += "\n\n=================================";
		
		System.out.println(str);

	}

	/**
	 * Get all variables (registers) used in a function.
	 * 
	 * 
	 * @param function function
	 * @return a list of variables.
	 */
	protected static List<String> getFunctionVars(WyilFile module, String name){
		// Check if the function exists
		if(module.functionOrMethod(name).size() == 0){
			return null;
		}
		// Get the function
		FunctionOrMethod function = module.functionOrMethod(name).get(0);
		// A list of variable (_register)
		List<String> vars = new ArrayList<String>();
		
		VariableDeclarations declarations = function.attribute(VariableDeclarations.class);
		for(int register=0;register<declarations.size();register++){
			vars.add(prefix+register);
		}
		return vars;
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
	 * @param passing_params
	 *            the operands of calling function
	 * @param caller_bnds
	 *            the bounds of caller function
	 */
	protected static void propagateInputBoundsToCallee(FunctionOrMethod callee, Codes.Invoke code, Bounds caller_bnds) {
		// Callee function name
		BoundGraph graph = getCFGraph(callee.name());
		//clear all the bounds in each block
		for(BoundBlock blk: graph.getBlockList()){
			blk.emptyBounds(null);
		}

		BoundBlock entry = graph.getBasicBlock("entry", BlockType.ENTRY);
		//Clear all the constraints/bounds in entry block.		
		entry.emptyConstraints();
		int index = 0;
		// Go through each parameter of callee
		int[] passing_params = code.operands();
		for (Type paramType : callee.type().params()) {
			String r_input = prefix + index; // The register at callee site
			String passing_param = prefix + passing_params[index];// The registers at caller site
			// Check the type
			if (isIntType(paramType)) {
				// Pass the return bounds
				entry.addDomain(new Domain(r_input, caller_bnds.getLower(passing_param), caller_bnds.getUpper(passing_param)));
			}
			// Pass the bounds of array size to calling function
			if(paramType instanceof Type.Array){
				String param_size = r_input + "_size";
				String operand_size = passing_param + "_size";
				// Pass the bounds of array size
				entry.addDomain(new Domain(param_size, caller_bnds.getLower(operand_size), caller_bnds.getUpper(operand_size)));
			}
			index++;
		}
	}
	
	
	/**
	 * Propagate the bounds of return value to the caller.
	 * 
	 * @param invokeboundAnalyzer
	 * @param ret_reg
	 * @param ret_type
	 * @param callee_bnd
	 */
	protected static void propagateBoundsBackCaller(FunctionOrMethod caller, Codes.Invoke code, Bounds callee_bnd) {
		if(code.targets().length>0){
			// Get the return variable
			String ret_reg = prefix+code.target(0);
			Type ret_type = code.type(0).returns().get(0);
			
			// Get the current block
			BoundBlock blk = getCFGraph(caller.name()).getCurrentBlock();
			
			if(isIntType(ret_type)) {
				// Get the bounds of return variable from callee
				// Propagate the bounds as a constraint 
				blk.addConstraint(new Range(ret_reg, callee_bnd.getLower("return"), callee_bnd.getUpper("return")));
			}

			if(ret_type instanceof Type.Array){
				// Pass the bounds of array size to calling functio
				// And propagate the bounds of return array size to caller site with a Range constraint
				blk.addConstraint(new Range(ret_reg+"_size", callee_bnd.getLower("return_size"), callee_bnd.getUpper("return_size")));
			}
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
	protected static void printCFG(Configuration config, String name) {
		//Check if the verbose is on.
		if(!config.isVerbose()){
			return;
		}

		String dot_string = "digraph " + name + "{\n";
		BoundGraph graph = getCFGraph(name);
		List<BoundBlock> blks = graph.getBlockList();
		for (BoundBlock blk : blks) {
			if (!blk.isLeaf()) {
				for (BoundBlock child : blk.getChildNodes()) {
					dot_string += "\"" + blk.getLabel() + " [" + blk.getType() + "]\"->\"" + child.getLabel() + " [" + child.getType() + "]\";\n";
				}
			}
		}
		dot_string += "\n}";
		// )Write out the CFG-function_name.dot
		try {
			PrintWriter cfg_writer = new PrintWriter(name + ".dot", "UTF-8");
			cfg_writer.println(dot_string);
			cfg_writer.close();
		} catch (FileNotFoundException | UnsupportedEncodingException e) {
			throw new RuntimeException("Error in printCFG function");
		}
	}

	/**
	 * Check if the type is instance of Integer by inferring the type from
	 * <code>wyil.Lang.Type</code> objects, including the effective collection
	 * types.
	 * 
	 * @param type
	 * @return true if the type is or contains an integer type.
	 */
	protected static boolean isIntType(Type type) {
		if (type instanceof Type.Int) {
			return true;
		}

		if (type instanceof Type.Array) {
			return isIntType(((Type.Array) type).element());
		}


		return false;
	}

	

}
