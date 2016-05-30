package wyopcl.translator;

import java.util.HashMap;
import java.util.HashSet;

import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.WyilFile;
import wyil.lang.WyilFile.FunctionOrMethod;

/**
 * Iterate each function and adds all the return registers to the set in each function.
 * 
 * If the register is not in the set, then it is not a return register.
 * 
 * 
 * @author Min-Hsien Weng
 *
 */
public class ReturnAnalyzer {
	// Store the set of return registers for each function.
	private HashMap<FunctionOrMethod, HashSet<Integer>> stores;
	
	public ReturnAnalyzer(){
		this.stores = new HashMap<FunctionOrMethod, HashSet<Integer>>();
	}
	
	
	/**
	 * Go through every function, and checks each return byte-code
	 * and adds the return register to the set.
	 * 
	 *
	 * @param module
	 */
	public void apply(WyilFile module) {
		// Iterate each function
		for (FunctionOrMethod function : module.functionOrMethods()) {
			HashSet<Integer> store;
			if (!stores.containsKey(function)) {
				stores.put(function, new HashSet<Integer>());
			}
			// Store read-write registers
			store = stores.get(function);
			// Go through each return bytecode
			for (Code code : function.body().bytecodes()) {
				if(code instanceof Codes.Return){
					Codes.Return r = (Codes.Return)code;
					if(r.targets().length>0){
						//add return register to set
						store.add(r.target(0));
					}
				}
			}
		}
	}
	
	
	/**
	 * Check if a register is returned by the 'function'
	 * 
	 * @param register
	 * @param function
	 * @return true if the register is returned. Return false if it is not returned. 
	 */
	public boolean isReturned(int register, FunctionOrMethod function) {
		HashSet<Integer> store = stores.get(function);
		if(store.contains(register)){
			return true;
		}
		
		return false;
	}
	
}
