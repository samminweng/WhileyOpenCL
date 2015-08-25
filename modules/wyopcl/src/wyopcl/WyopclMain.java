package wyopcl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Map;
import java.util.Map.Entry;

import wyc.WycMain;
import wyc.util.WycBuildTask;
import wycc.lang.SyntaxError;
import wycc.lang.SyntaxError.InternalFailure;
import wycc.util.Logger;
import wycc.util.OptArg;
import wyopcl.translator.Configuration;

public class WyopclMain extends WycMain{
	private boolean verbose = false;
	public static final OptArg[] EXTRA_OPTIONS = {		
		//Add the 'alias' option
		new OptArg("copy", "Run the copy elimination analysis to remove the un-necessary array copies at byte-code level.\n" ),
		
		//Add the 'bound' option 
		new OptArg("bound", OptArg.STRING, "Run bound analysis on whiley program with a specific widening strategy:\n"
												 + "\t\t\t   [naive]\tWidening the bounds to infinity.\n"
												 + "\t\t\t   [gradual]\tWidening the bounds to Int16, Int32, Int64 and infinity."),		
		//Add the 'pattern' option
		new OptArg("pattern", "Run the pattern matching to analyze the pattern of a given Whiley Program\n" ),
		
		//Add the 'code' option
		new OptArg("code", "Run the code generate to trasnlate the given Whiley Program into C code.\n" ),
												 
	};
	
	public static OptArg[] DEFAULT_OPTIONS;
	
	static {
		// first append options
		OptArg[] options = new OptArg[WycMain.DEFAULT_OPTIONS.length
				+ EXTRA_OPTIONS.length];
		System.arraycopy(WycMain.DEFAULT_OPTIONS, 0, options, 0,
				WycMain.DEFAULT_OPTIONS.length);
		System.arraycopy(EXTRA_OPTIONS, 0, options,
				WycMain.DEFAULT_OPTIONS.length, EXTRA_OPTIONS.length);
		WyopclMain.DEFAULT_OPTIONS = options;
	}
	
	public WyopclMain(WycBuildTask builder, OptArg[] options) {
		super(builder, options);
	}
	

	
	@Override
	public void configure(Map<String, Object> values) throws IOException {
		super.configure(values);
		verbose = values.containsKey("verbose");
		if(verbose){
			builder.setVerbose(verbose);
		}	
		
		//Check if there is only 'verbose' option. If so, then run the interpreter to execute the program.
		if(values.keySet().size()==0||(values.keySet().size()==1&&verbose)){
			((WyopclBuildTask)builder).enableInterpreter();
		}else{
			//Run the translator with configuration.
			Configuration config = new Configuration();
			/*if(values.containsKey("verbose")){			
				//config.setProperty("logger", new Logger.Default(System.err));
				config.setOption("verbose", true);
			}*/			
			//If the options are matched with existing modes, then enable the translator by writing the mode option. 
			for(Entry<String, Object> entry: values.entrySet()){
				String option = entry.getKey();
				Object value = entry.getValue();
				config.setOption(option, value);
			}
			((WyopclBuildTask)builder).setConfig(config);
		}
	}
	
	
	@Override
	public int run(String[] _args) {
		try {
			// =====================================================================
			// Process Options
			// =====================================================================

			ArrayList<String> args = new ArrayList<String>(Arrays.asList(_args));
			Map<String, Object> values = OptArg.parseOptions(args, options);

			// Second, check if we're printing version
			if (values.containsKey("version")) {
				version();
				return SUCCESS;
			}

			// Otherwise, if no files to compile specified, then print usage
			if (args.isEmpty() || values.containsKey("help")) {
				usage();
				return SUCCESS;
			}		
			
			configure(values);
						
			ArrayList<File> delta = new ArrayList<File>();
			//Additional arguments
			ArrayList<String> arguments = new ArrayList<String>();
			for (String arg : args) {
				if(arg.contains(".whiley")){
					File f = new File(arg);
					if(f.exists()){
						delta.add(f);					
					}else{
						throw new RuntimeException("Could not find "+arg);
					}
				}else{
					arguments.add(arg);
				}
			}
			
			((WyopclBuildTask) builder).setArguments(arguments.toArray(new String[arguments.size()]));
			
			// =====================================================================
			// Run Build Task
			// =====================================================================
			builder.build(delta);

		} catch (InternalFailure e) {
			e.outputSourceError(stderr,false);
			if (verbose) {
				e.printStackTrace(stderr);
			}
			return INTERNAL_FAILURE;
		} catch (SyntaxError e) {
			e.outputSourceError(stderr,false);
			if (verbose) {
				e.printStackTrace(stderr);
			}
			return SYNTAX_ERROR;
		} catch (Throwable e) {
			stderr.println("" + e.getMessage() + "");
			if (verbose) {
				e.printStackTrace(stderr);
			}
			return INTERNAL_FAILURE;
		}

		return SUCCESS;
	}
	
	
	
	public static void main(String[] args) {		
		// run WyopclBuildTask
		System.exit(new WyopclMain(new WyopclBuildTask(), DEFAULT_OPTIONS).run(args));
	}

}
