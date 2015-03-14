package wyopcl.translator;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import wyil.lang.Type;


/**
 * This symbol factory creates, retrieve and maintain the symbols in a function.
 * @author Min-Hsien Weng
 *
 */
public class SymbolController {
	//The symbol table of variables
	private HashMap<String, Symbol> symbols;
		
	public SymbolController(){
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
	
	
	
}
