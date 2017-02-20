package wyopcl.translator.bound;

import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;
import java.util.Map.Entry;
import java.util.stream.Collectors;

import wyil.attributes.VariableDeclarations;
import wyil.attributes.VariableDeclarations.Declaration;
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
	public static boolean isCached(String name) {
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
	public static void promoteCFGStatus(String name) {
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
	public static BoundGraph getCFGraph(String name) {
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
	private static String getVarName(int reg, VariableDeclarations variables) {
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
	public static void printBoundsAndSize(WyilFile module, Bounds bnds, String name) {
		FunctionOrMethod functionOrMethod = module.functionOrMethod(name).get(0);
		VariableDeclarations variables = functionOrMethod.attribute(VariableDeclarations.class);

		String str = "Bound Analysis of " + name + ":\n";
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
		BoundGraph graph = getCFGraph(callee_name);
		//clear all the bounds in each block
		for(BoundBlock blk: graph.getBlockList()){
			blk.emptyBounds();
		}

		BoundBlock entry = graph.getBasicBlock("entry", BlockType.ENTRY);
		//Clear all the constraints/bounds in entry block.		
		entry.emptyConstraints();
		int index = 0;
		for (Type paramType : params) {
			String r_input = prefix + index; // The register at callee site
			String r_param = prefix + operands[index];// The registers at caller site
			// Check the type
			if (isIntType(paramType)) {
				// Pass the return bounds
				Domain input = new Domain(r_input, bnd.getLower(r_param), bnd.getUpper(r_param));
				entry.addDomain(input);
			}
			// Pass the bounds of array size to calling function
			if(paramType instanceof Type.Array){
				String param_size = r_input + "_size";
				String operand_size = r_param + "_size";
				// Pass the bounds of array size
				Domain input_size = new Domain(param_size, bnd.getLower(operand_size), bnd.getUpper(operand_size));
				entry.addDomain(input_size);
			}
			index++;
		}
	}
	/**
	 * Get the size info of input parameters for a function call and pass the sizes to the invoked function.
	 * @param caller_name
	 * @param callee_name
	 * @param params
	 * @param operands
	 */
	/*public static void propagateSizeInfoToFunctionCall(String caller_name, String callee_name, List<Type> params, int[] operands) {
		// Pass the bounds of input parameters.
		for (int index=0;index < params.size();index++) {			
			String op_reg = prefix + operands[index];
			String param_reg = prefix + index;
			//Check parameter type
			if(params.get(index) instanceof Type.Array){
				//Get size info from caller
				BigInteger size = getSizeInfo(caller_name, op_reg);
				if(size != null){
					//Pass size to callee
					addSizeInfo(callee_name, param_reg, size);	
				}
			}

		}
	}*/

	/**
	 * Add size info for the specific register.
	 * @param name the function name
	 * @param reg register
	 */
	/*public static void addSizeInfo(String name, String reg, BigInteger size){
		SymbolFactory sym_factory = getSymbolFactory(name);
		// Get the 'size' attribute from
		sym_factory.putAttribute(reg, "size", size);	

	}*/
	/**
	 * Get the size info for 
	 * @param name the function name
	 * @param reg register
	 */
	/*public static BigInteger getSizeInfo(String name, String reg){
		SymbolFactory sym_factory = getSymbolFactory(name);
		Object size = sym_factory.getAttribute(reg, "size");
		if(size != null){
			return (BigInteger)size;
		}

		return null;
	}
	 */

	/**
	 * Propagate the bounds of return value to the caller.
	 * 
	 * @param invokeboundAnalyzer
	 * @param ret_reg
	 * @param ret_type
	 * @param bnd
	 */
	public static void propagateBoundsFromFunctionCall(String caller_name, String callee_name, String ret_reg, Type ret_type, Bounds bnd) {
		BoundBlock blk = getCFGraph(caller_name).getCurrentBlock();
		if (ret_type != null){
			if(isIntType(ret_type)) {
				// Get the bounds of return variable
				Domain ret = bnd.getDomain("return");
				// Propagate the bounds of return value to caller site with a Range constraint
				Range range = new Range(ret_reg, ret.getLowerBound(), ret.getUpperBound());
				blk.addConstraint(range);
			}

			// Pass the bounds of array size to calling function
			if(ret_type instanceof Type.Array){
				Domain ret_size = bnd.getDomain("return_size");
				// Propagate the bounds of return array size to caller site with a Range constraint
				Range range = new Range(ret_reg+"_size", ret_size.getLowerBound(), ret_size.getUpperBound());
				blk.addConstraint(range);
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
	public static void printCFG(Configuration config, String name) {
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
	public static boolean isIntType(Type type) {
		if (type instanceof Type.Int) {
			return true;
		}

		if (type instanceof Type.Array) {
			return isIntType(((Type.Array) type).element());
		}


		return false;
	}


}
