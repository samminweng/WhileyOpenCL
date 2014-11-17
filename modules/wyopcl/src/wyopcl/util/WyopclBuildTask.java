package wyopcl.util;

import static wycc.lang.SyntaxError.internalFailure;
import wybs.lang.Builder;
import wybs.util.StdBuildRule;
import wybs.util.StdProject;
import wycc.util.Logger;
import wyopcl.bound.BoundAnalyzer;
import wyopcl.interpreter.WyilInterpreter;

public class WyopclBuildTask extends wyc.util.WycBuildTask {
	
	//runtime 	
	protected String[] arguments;
	//'analysis' option
	private String analysis = null;
	
	public void setAnalysis(String analysis) {
		this.analysis = analysis;
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
		if(analysis!= null){
			//Add the switch for the further analysis.
			builder = new BoundAnalyzer(project);
			//switch(analysis.toLowerCase()){
			//case "function":				
			//	((BoundAnalyzer) builder).setAnalyzeType(false);
			//	break;
			//case "functioncall":
			if(analysis.equals("functioncall")){
				((BoundAnalyzer) builder).setAnalyzeType(true);
			}				
			//	break;
			//default:
			//	internalFailure("Not implemented!", "WyopclBuildTask.java", null);
			//	return;
		//	}
			
			if (verbose) {
				((BoundAnalyzer) builder).setLogger(new Logger.Default(System.err));
				((BoundAnalyzer) builder).setVerbose(verbose);
			}
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

