package wyopcl;

import static wycc.lang.SyntaxError.internalFailure;

import java.util.Map;
import java.util.Map.Entry;

import wybs.lang.Builder;
import wybs.util.StdBuildRule;
import wybs.util.StdProject;
import wycc.util.Logger;
import wyopcl.translator.Configuration;
import wyopcl.translator.Translator;
import wyopcl.util.Interpreter;
import wyopcl.util.InterpreterConfiguration;

public class WyopclBuildTask extends wyc.util.WycBuildTask {
	//The configuration of translator
	private Configuration config;
	//runtime 	
	protected String[] arguments;
	//Enable/Disable the interpreter. The default value is off.
	private boolean enableInterpreter = false;
	
	public void enableInterpreter(){
		this.enableInterpreter = true;
	}
	
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
		Builder builder = null;
		//Check the first argument to determine whether to run the analyzer.		
		if(this.enableInterpreter){
			// Now, add build rule for interpreting the wyil files by using
			// the WyilInterpreter.
			InterpreterConfiguration config = new InterpreterConfiguration(project);
			if (verbose) {
				config.setProperty("logger", new Logger.Default(System.err));
				config.setProperty("verbose", true);
			}
			config.setProperty("arguments", this.arguments);
			builder = new Interpreter(config);
		}else{
			builder = new Translator(config);
		}

		project.add(new StdBuildRule(builder, wyilDir, wyilIncludes,
				wyilExcludes, null));


	}	




}		

