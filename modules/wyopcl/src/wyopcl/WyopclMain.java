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
	public static final OptArg[] EXTRA_OPTIONS = {
		//Add the 'bound' option 
		new OptArg("bound", null, OptArg.STRING, "Run bound analysis on whiley program using the below widening strategy:\n"
				+ "\t\t\t   [naive]\tWidening the bounds to infinity.\n"
				+ "\t\t\t   [gradual]\tWidening the bounds to Int16, Int32, Int64 and infinity."),
				new OptArg("code", "Generate the code in C for the whiley program"),
				new OptArg("pattern", "Find the patterns for loops in the whiley program.")
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
		((WyopclBuildTask)builder).setConfig(values);
	}

	@Override
	public int run(String[] _args) {
		boolean verbose = false;
		try {
			// =====================================================================
			// Process Options
			// =====================================================================
			ArrayList<String> args = new ArrayList<String>(Arrays.asList(_args));
			Map<String, Object> values = OptArg.parseOptions(args, options);

			//First, check if we're printing out all messages
			verbose = values.containsKey("verbose");
			
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
			for (String arg : args) {
				if(arg.contains(".whiley")){
					File f = new File(arg);
					if(f.exists()){
						delta.add(f);					
					}else{
						throw new RuntimeException("Could not find "+arg);
					}
				}
			}
			((WyopclBuildTask)builder).setArguments(args);
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
