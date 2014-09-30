package wyopcl.util;

import wybs.util.StdBuildRule;
import wybs.util.StdProject;
import wycc.util.Logger;
import wyopcl.interpreter.WyilInterpreter;

public class WyopclBuildTask extends wyc.util.WycBuildTask {
	
	// ===================================================
	// Runtime Arguments
	// ===================================================
	protected String[] arguments;
	public void setArguments(String[] arguments) {
		this.arguments = arguments;
	}
	
	public WyopclBuildTask() {
		super();
		//super(new Registry());
	}
		
	@Override
	protected void addBuildRules(StdProject project) {
		// Add default build rule for converting whiley files into wyil files. 
		super.addBuildRules(project);
		
		// Now, add build rule for interpreting the wyil files by using
		// the WyilInterpreter.		
	
		WyilInterpreter wyilInterpreter = new WyilInterpreter(project);
		
		if (verbose) {
			wyilInterpreter.setLogger(new Logger.Default(System.err));
			wyilInterpreter.setVerbose(verbose);
		}
		
		if(verification){
			wyilInterpreter.setVerify(verification);
		}
		
		wyilInterpreter.setArgs(this.arguments);
		
		project.add(new StdBuildRule(wyilInterpreter, wyilDir, wyilIncludes,
				wyilExcludes, null));
		
	}
	
	
}		

