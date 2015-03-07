package wyopcl;

import java.util.List;
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
	private Configuration config;
	private String[] args;
	public WyopclBuildTask() {
		super();
	}
	
	public void setConfig(Map<String, Object> values){
		this.config = new Configuration();
		if(values.containsKey("verbose")){			
			config.setProperty("logger", new Logger.Default(System.err));
			config.setProperty("verbose", true);
		}			
		//If the options are matched with existing modes, then enable the translator by writing the mode option. 
		for(Entry<String, Object> entry: values.entrySet()){
			String option = entry.getKey();
			Object value = entry.getValue();
			config.setMode(option, value);
		}		
	}
	
	
	public void setArguments(List<String> args){
		this.args = args.toArray(new String[args.size()]);
	}
	
	
	@Override
	protected void addBuildRules(StdProject project) {
		// Add default build rule for converting whiley files into wyil files. 
		super.addBuildRules(project);
		Builder builder;
		//Check the first argument to determine whether to run the analyzer.		
		if(config != null && config.getMode() != null){						
			builder = new Translator(config);
		}else{
			// Now, add build rule for interpreting the wyil files by using
			// the WyilInterpreter.
			InterpreterConfiguration interpreterconfig = new InterpreterConfiguration(project);
			if (verbose) {
				interpreterconfig.setProperty("logger", new Logger.Default(System.err));
				interpreterconfig.setProperty("verbose", true);
			}
			interpreterconfig.setProperty("arguments", args);			
			builder = new Interpreter(interpreterconfig);
		}

		project.add(new StdBuildRule(builder, wyilDir, wyilIncludes,
				wyilExcludes, null));
	}	

}		

