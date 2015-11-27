package wyopcl.translator.deallocate;

import java.util.HashMap;

import wybs.lang.Builder;
import wyil.lang.WyilFile.FunctionOrMethod;
import wyopcl.Configuration;
import wyopcl.translator.Analyzer;


/**
 * 
 * @author Min-Hsien Weng
 *
 */
public class DeallocationAnalyzer extends Analyzer {
	private HashMap<FunctionOrMethod, OwnershipVariables> ownerships;
	public DeallocationAnalyzer(Configuration config){
		super(config);
		this.ownerships = new HashMap<FunctionOrMethod, OwnershipVariables>();
	}
	
	/**
	 * Bound 'reg' to array ownership set 
	 * @param reg
	 * @param f
	 */
	public void addOwnership(int reg, FunctionOrMethod function){
		OwnershipVariables ownership = this.ownerships.putIfAbsent(function, new OwnershipVariables());
		ownership.addOwnership(reg);
	}
}
