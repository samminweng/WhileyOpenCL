package wyopcl.translator.bound;

import java.util.Properties;
/**
 * Store the variable information, such as its variable name, type, or specific type attributes (array size). 
 * @author Min-Hsien Weng
 *
 */
public class Symbol implements Cloneable, Comparable<Symbol>{
	private String name;
	private Properties attributes;

	public Symbol(String name){
		this.name = name;
		this.attributes = new Properties();
	}
	/**
	 * Update the name of the symbol
	 * @param name
	 */
	public void setName(String name){
		this.name = name;
	}
	
	public String getName(){
		return this.name;
	}
	
	
	/**
	 * Add the attribute
	 * @param att_name
	 * @param att_value
	 */
	public void setAttribute(String att_name, Object att_value){	
		this.attributes.put(att_name, att_value);
	}
	/**
	 * Get the attribute
	 * @param att_name
	 * @return the attribute value. Return null if no such an attribute.
	 */
	public Object getAttribute(String att_name){
		if(!this.attributes.containsKey(att_name)){
			return null;
		}
		return this.attributes.get(att_name);
	}

	@Override
	public String toString() {
		return "Symbol [name=" + name + ", attributes=" + attributes + "]";
	}
	@Override
	protected Symbol clone() {
		Symbol symbol;
		symbol = new Symbol(name);		
		symbol.attributes = (Properties) this.attributes.clone();
		return symbol;
	}
	
	private int getReg(String name){
		//return the register no.
		if(name.matches("^%\\d.*")){
			if(name.contains("_")){
				String[] name_str = name.split("_");
				return Integer.parseInt(name_str[0].substring(1));
			}
			return Integer.parseInt(name.split("^%")[1]);
		}
	
		//Return the maximal values for other cases.
		return Integer.MAX_VALUE;
	}
	
	@Override
	public int compareTo(Symbol s) {
		if(this.name.equals(s.getName())){
			return 0;
		}
		return getReg(this.name) - getReg(s.name);
	}	
	
	
}
