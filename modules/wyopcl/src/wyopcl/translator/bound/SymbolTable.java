package wyopcl.translator.bound;

import java.util.HashMap;
/**
 * Stores the information about the program variables. 
 * @author Min-Hsien Weng
 *
 */
public class SymbolTable {	
	//The type attributes for each variable.
	private HashMap<String, Symbol> symbols;
	public SymbolTable(){
		symbols = new HashMap<String, Symbol>();
	}	

	/**
	 * Get the symbol info for a variable.
	 * @param name
	 * @return
	 */
	public Symbol getSymbol(String name){
		if(!symbols.containsKey(name)){
			Symbol var = new Symbol(name);
			symbols.put(name, var);
		}
		return symbols.get(name);
	}
	
	public void putSymbol(String name, Symbol symbol){
		symbols.put(name, symbol);
	}
	
	
	
	/**
	 * Add the variable attribute to the hashmap.
	 * @param name the variable name
	 * @param att_name the attribute name
	 * @param att_value the attribute value
	 * @return
	 */
	public void putAttribute(String name, String att_name, Object att_value){
		Symbol symbol = getSymbol(name);
		symbol.setAttribute(att_name, att_value);
	}
	
	/**
	 * Get the attribute of a variable
	 * @param name
	 * @param att_name
	 * @return the attribute value. Return null if the variable does not contain the attribute.
	 */
	public Object getAttribute(String name, String att_name){
		Symbol symbol = getSymbol(name);
		return symbol.getAttribute(att_name);
		
		
	}
	
	
}
