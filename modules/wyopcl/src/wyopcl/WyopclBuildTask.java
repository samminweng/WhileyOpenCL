package wyopcl;

import wybs.lang.Builder;
import wybs.util.StdBuildRule;
import wybs.util.StdProject;
import wyopcl.translator.Translator;
/**
 * An builder is used to create the translator to produce c code 
 * and optimizes the generated code according to command-line options.
 * 
 * For example, 
 * <pre><code>
 * 			$wyopcl -code -dealloc swap.whiley
 * </code></pre>
 * will apply de-allocation analysis and produce the code that has few leaks.
 * 
 * @author Min-Hsien Weng
 *
 */
public class WyopclBuildTask extends wyc.util.WycBuildTask {
	//Configuration file
	private Configuration config;
	// Arguments from command line
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

