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
	@Override
	public int compareTo(Symbol s1) {
		if(this.name.equals(s1.getName())){
			return 0;
		}
		if(this.name.contains("%")&& s1.name.contains("%")){
			int reg_0 = Integer.parseInt(this.name.split("%")[1]);
			int reg_1 = Integer.parseInt(s1.name.split("%")[1]);
			return reg_0 - reg_1;
		}			
		
		return Integer.MIN_VALUE;
	}	
	
	
}
