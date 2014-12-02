package wyopcl.util;

import static wycc.lang.SyntaxError.internalFailure;
import wybs.lang.Builder;
import wybs.util.StdBuildRule;
import wybs.util.StdProject;
import wycc.util.Logger;
import wyopcl.bound.AnalyzerConfiguration;
import wyopcl.bound.AnalyzerConfiguration.WidenStrategy;
import wyopcl.bound.BoundAnalyzer;
import wyopcl.interpreter.WyilInterpreter;

public class WyopclBuildTask extends wyc.util.WycBuildTask {
	
	//runtime 	
	protected String[] arguments;
	//'range' option
	private String range= null;
	
	public void setRange(String range) {
		this.range = range;
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
		Builder builder;
		//Check the first argument to determine whether to run the analyzer.		
		if(range != null){
			//Create a config object to store the properties
			AnalyzerConfiguration config = new AnalyzerConfiguration(project);
			config.setInvoked(true);
			if(range!=null){
				switch(range){
				case "naive":
					config.setWidenStrategy(WidenStrategy.NAIVE);
					break;
				case "gradual":
					config.setWidenStrategy(WidenStrategy.MULTILEVEL);
				}
				
			}
			
			if (verbose) {
				config.setLogger(new Logger.Default(System.err));
				config.setVerbose(verbose);
			}
			
			builder = new BoundAnalyzer(config);
			
		}else{
			// Now, add build rule for interpreting the wyil files by using
			// the WyilInterpreter.			
			builder = new WyilInterpreter(project);
			if (verbose) {
				((WyilInterpreter) builder).setLogger(new Logger.Default(System.err));
				((WyilInterpreter) builder).setVerbose(verbose);
			}

			((WyilInterpreter) builder).setArgs(this.arguments);

			
		}

		project.add(new StdBuildRule(builder, wyilDir, wyilIncludes,
				wyilExcludes, null));


	}	




}		

