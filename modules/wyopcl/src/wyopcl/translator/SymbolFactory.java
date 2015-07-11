package wyopcl.translator;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import wyil.lang.Type;

/**
 * This symbol factory creates, retrieve and maintain the symbols for a function.
 * All the extracted symbols are store in a hashmap.
 * 
 * @author Min-Hsien Weng
 *
 */
public class SymbolFactory {
	private static final String prefix = "%";
	//The symbol table of variables
	private HashMap<String, Symbol> symbols;

	public SymbolFactory(){
		this.symbols = new HashMap<String, Symbol>();
	}

	/**
	 * Get the symbol info for a variable.
	 * @param target
	 * @return
	 */
	public Symbol getSymbol(String target){
		if(!symbols.containsKey(target)){
			Symbol var = new Symbol(target);
			symbols.put(target, var);
		}
		return symbols.get(target);
	}
	/**
	 * Put the symbol into the table 
	 * @param target
	 * @param symbol
	 */
	public void putSymbol(String target, Symbol symbol){
		symbols.put(target, symbol);
	}

	/**
	 * Get the attribute of a variable
	 * @param target
	 * @param att_name
	 * @return the attribute value. Return null if the variable does not contain the attribute.
	 */
	public Object getAttribute(String target, String att_name){
		Symbol symbol = getSymbol(target);
		return symbol.getAttribute(att_name);
	}	

	/**
	 * Get a list of attributes from symbol table
	 * @param ops a list of operands
	 * @param prefix the prefix string of the registers
	 * @param att_name the attribute name
	 * @return
	 */
	public List<Object> getAttributes(int[] ops, String prefix, String att_name){
		List<Object> list = new ArrayList<Object>();
		for(int op: ops){
			list.add(getAttribute(prefix+op, att_name));
		}		
		return list;
	}	

	/**
	 * Add the variable attribute to the hashmap.
	 * @param target the variable name
	 * @param att_name the attribute name
	 * @param att_value the attribute value
	 * @return
	 */
	public void putAttribute(String target, String att_name, Object att_value){
		Symbol symbol = getSymbol(target);
		symbol.setAttribute(att_name, att_value);
	}

	/**
	 * Sorts the symbols in the Hashmap by their values
	 * @return
	 */
	public List<Symbol> sortedSymbols(){
		//Sort the symbol tables		
		List<Symbol> sortedSymbols = new ArrayList<Symbol>(symbols.values());
		Collections.sort(sortedSymbols);
		return sortedSymbols;		
	}


	/**
	 * Check if the Bool type is used in the function.
	 * @return
	 */
	public boolean isBoolTypeUsed(){
		//Check if any symbol is bool type
		Boolean isTypeUsed = false;
		for(String var_name:symbols.keySet()){
			Type type = (Type) getAttribute(var_name, "type");
			if(type instanceof Type.Bool){
				isTypeUsed = true;				
			}			
		}		
		return isTypeUsed;		
	}

	/**
	 * Propagate the symbols of input parameters from the caller to callee 
	 * @param caller_factory the symbol factory of caller.
	 * @param param
	 */
	public void addInputSymbols(SymbolFactory caller_factory, int[] operands, List<Type> params){
		int reg = 0;
		// Pass the bounds of input parameters.
		while (reg < params.size()) {
			String param = prefix + reg;
			String operand = prefix + operands[reg];
			// pass the symbol
			Symbol symbol = caller_factory.getSymbol(operand).clone();
			// Update the name
			symbol.setName(param);
			this.putSymbol(param, symbol);
			reg++;
		}
	}

	/**
	 * Propagates the symbol of return value from callee to caller.
	 * @param callee the symbol factory of callee
	 */
	public void addOutputSymbols(SymbolFactory callee_factory, String ret_reg, Type ret_type){
		if (TranslatorHelper.isIntType(ret_type)) {
			// Add 'type' attribute of 'return_reg'
			this.putAttribute(ret_reg, "type", ret_type);
		}

		// Add 'size' attribute
		if (ret_type instanceof Type.List) {
			BigInteger size = (BigInteger) callee_factory.getAttribute("return", "size");
			this.putAttribute(ret_reg, "size", size);
		}
	}


}