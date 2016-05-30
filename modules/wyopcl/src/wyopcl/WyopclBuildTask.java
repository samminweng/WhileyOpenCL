package wyopcl;

import wybs.lang.Builder;
import wybs.util.StdBuildRule;
import wybs.util.StdProject;
import wyopcl.translator.Translator;
//import wyopcl.util.Interpreter;
//import wyopcl.util.InterpreterConfiguration;

public class WyopclBuildTask extends wyc.util.WycBuildTask {
	//The configuration of translator
	private Configuration config;
	//runtime 	
	protected String[] arguments;
	
	public void setConfig(Configuration config){
		this.config = config;
	}
	

	public void setArguments(String[] arguments) {
		this.arguments = arguments;
	}

	public WyopclBuildTask() {
		super();
	}

	@Override
	protected void addBuildRules(StdProject project) {
		// Add default build rule for converting whiley files into wyil files. 
		super.addBuildRules(project);
		Builder builder = new Translator(config);

		project.add(new StdBuildRule(builder, wyilDir, wyilIncludes,
				wyilExcludes, null));

	}

}		

