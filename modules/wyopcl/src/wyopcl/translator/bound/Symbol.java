package wyopcl.translator.bound;

import java.util.Properties;
/**
 * Store the variable information, such as its variable name, type, or specific type attributes (array size). 
 * @author Min-Hsien Weng
 *
 */
public class Symbol implements Cloneable{
	private String name;
	private Properties attributes;
	
	public Symbol(String name){
		this.name = name;
		this.attributes = new Properties();
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
	
}
