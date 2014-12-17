package wyopcl;

import static wycc.lang.SyntaxError.internalFailure;
import wybs.lang.Builder;
import wybs.util.StdBuildRule;
import wybs.util.StdProject;
import wycc.util.Logger;
import wyopcl.translator.Configuration;
import wyopcl.translator.Translator;
import wyopcl.translator.Configuration.Mode;
import wyopcl.translator.Configuration.WidenStrategy;
import wyopcl.util.Interpreter;
import wyopcl.util.InterpreterConfiguration;

public class WyopclBuildTask extends wyc.util.WycBuildTask {	
	//runtime 	
	protected String[] arguments;
	//'mode' option for the translator
	private String mode= null;
	
	public void setMode(String mode) {
		this.mode = mode;
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
		if(mode != null){
			//Create a config object to store the properties
			Configuration config = new Configuration(project);
			switch(mode){
				case "naive":
					config.setProperty("widen", WidenStrategy.NAIVE);
					break;
				case "gradual":
					config.setProperty("widen", WidenStrategy.GRADUAL);
					break;
			}				
			config.setProperty("mode", Mode.BoundAnalysis);
			
			if (verbose) {
				config.setProperty("logger", new Logger.Default(System.err));
				config.setProperty("verbose", true);
			}			
			config.setProperty("argument", arguments);			
			builder = new Translator(config);			
		}else{
			// Now, add build rule for interpreting the wyil files by using
			// the WyilInterpreter.
			InterpreterConfiguration config = new InterpreterConfiguration(project);
			if (verbose) {
				config.setProperty("logger", new Logger.Default(System.err));
				config.setProperty("verbose", true);
			}
			config.setProperty("arguments", this.arguments);
			builder = new Interpreter(config);
		}

		project.add(new StdBuildRule(builder, wyilDir, wyilIncludes,
				wyilExcludes, null));


	}	




}		

