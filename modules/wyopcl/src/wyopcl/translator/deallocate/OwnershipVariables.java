package wyopcl.translator.deallocate;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.stream.Collectors;



/**
 * Stores and compute array reference variables in 'ownership' set
 * 
 * @author Min-Hsien Weng
 *
 */
public class OwnershipVariables {
	private HashSet<Integer> ownerships;// Stores registers of array variables
	
	public OwnershipVariables(){
		this.ownerships = new HashSet<Integer>();
	}
	
	/***
	 * Add ownership to an array variable ('reg')
	 * @param reg
	 */
	protected void addOwnership(int reg){
		this.ownerships.add(reg);
	}
	
	/**
	 * Remove the ownership of an array variable ('reg')
	 * @param reg
	 */
	protected void transferOwnership(int reg){
		this.ownerships.remove(reg);
	}
	
	/**
	 * Returns a list of array variables 
	 * @return
	 */
	protected List<Integer> getOwnership(){
		return this.ownerships.stream().collect(Collectors.toList());
	}
	
	
}
