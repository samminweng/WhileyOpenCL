package wyboogie;


import wybs.lang.Builder;
import wybs.util.StdBuildRule;
import wybs.util.StdProject;

public class WyboogieBuildTask extends wyc.util.WycBuildTask {
	//The configuration of translator
	//runtime 	
	protected String[] arguments;

	public void setArguments(String[] arguments) {
		this.arguments = arguments;
	}

	public WyboogieBuildTask() {
		super();
	}

	@Override
	protected void addBuildRules(StdProject project) {
		// Add default build rule for converting whiley files into wyil files. 
		super.addBuildRules(project);
		Builder builder = new CodeGenerator();

		project.add(new StdBuildRule(builder, wyilDir, wyilIncludes,
				wyilExcludes, null));
	}	

}		

