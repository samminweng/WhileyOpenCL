package wyopcl.translator.bound;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;


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

	
	public List<Symbol> sortedSymbols(){
		//Sort the symbol tables		
		List<Symbol> sortedSymbols = new ArrayList<Symbol>(symbols.values());
		Collections.sort(sortedSymbols);
		
		/*//Print out the bounds
		for(Symbol symbol : sortedSymbols){
			String str_symbols = "";
			String name = symbol.getName();
			if(bnd.isExisting(name)){
				Domain d = bnd.getDomain(name);
				str_symbols+="\t"+d+"\n";
			}			
			if(!str_symbols.equals("")){
				writer.print(str_symbols);
			}
		}*/

		/*//Print out the values of available variables
		for(Symbol symbol : sortedSymbols){
			String str_symbols = "";
			String name = symbol.getName();					
			//print the 'value' attribute
			Object val = symbol.getAttribute("value");
			if(val != null){
				str_symbols += "\tvalue("+name+")\t= "+val+"\n";
			}

			if(!str_symbols.equals("")){
				writer.print(str_symbols);
			}
		}

		//Print out the size of available variables
		for(Symbol symbol : sortedSymbols){
			String str_symbols = "";
			String name = symbol.getName();
			//get the 'type' attribute
			Type type = (Type) symbol.getAttribute("type");						
			//print the 'size' att
			if(type instanceof Type.List){
				Object size = symbol.getAttribute("size");
				str_symbols += "\tsize("+name+")\t= "+size+"\n";
			}
			if(!str_symbols.equals("")){
				writer.print(str_symbols);
			}
		}
		sortedSymbols = null;*/
		
		return sortedSymbols;
		
	}
	
	
}
