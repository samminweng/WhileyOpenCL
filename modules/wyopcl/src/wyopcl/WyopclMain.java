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
import wycc.util.OptArg;
/**
 * Main entry is used to parse command line arguments,
 * to create the translator and optimize the generated code.
 * 
 * 
 * @author Min-Hsien Weng
 *
 */
public class WyopclMain extends WycMain {
	private boolean verbose = false;
	public static final OptArg[] EXTRA_OPTIONS = {
			
			// Add the 'dealloc' to release the unused memory using macro system
			new OptArg(Configuration.DEALLOC, "Run the deallocation analysis to free un-used memory"),

			// Add the 'nocopy' option to eliminate un-needed copies
			new OptArg(Configuration.NOCOPY,
					"Run the copy elimination analysis to eliminate the un-necessary copies.\n"),

			// Add the 'bound' option
			new OptArg(Configuration.BOUND, OptArg.STRING,
					"Run bound analysis on whiley program with a specific widening strategy:\n"
							+ "\t\t\t   [naive]\tWidening the bounds to infinity.\n"
							+ "\t\t\t   [gradual]\tWidening the bounds to Int16, Int32, Int64 and infinity."),
			
			// Add the 'pattern' option
			new OptArg(Configuration.PATTERN, OptArg.STRING,
					"Run pattern macthing on a specific function:\n"
					+"\t\t\t   [function_name]\tThe function name that will be applied with pattern matching.\n"
					),

			// Add the 'code' option
			new OptArg(Configuration.CODE, 
					"Run the code generator to translate the compiled Whiley Program into C code.\n"),

	};

	public static OptArg[] DEFAULT_OPTIONS;

	static {
		// first append options
		OptArg[] options = new OptArg[WycMain.DEFAULT_OPTIONS.length + EXTRA_OPTIONS.length];
		System.arraycopy(WycMain.DEFAULT_OPTIONS, 0, options, 0, WycMain.DEFAULT_OPTIONS.length);
		System.arraycopy(EXTRA_OPTIONS, 0, options, WycMain.DEFAULT_OPTIONS.length, EXTRA_OPTIONS.length);
		WyopclMain.DEFAULT_OPTIONS = options;
	}

	public WyopclMain(WycBuildTask builder, OptArg[] options) {
		super(builder, options);
	}

	@Override
	public void configure(Map<String, Object> values) throws IOException {
		super.configure(values);
		verbose = values.containsKey("verbose");
		if (verbose) {
			builder.setVerbose(verbose);
		}

		
		// Run the translator with configuration.
		Configuration config = new Configuration();
		// Iterate each passing option to enable/disable code optimizer (e.g. copy or de-allocation analysis)
		for (Entry<String, Object> entry : values.entrySet()) {
			String option = entry.getKey();
			Object value = entry.getValue();
			config.setOption(option, value);
		}
		
		// Pass the configuration to translator
		((WyopclBuildTask) builder).setConfig(config);
		
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

			
			// Get the file path of source whiley program
			ArrayList<File> delta = new ArrayList<File>();
			ArrayList<String> arguments = new ArrayList<String>();
			for (String arg : args) {
				if (arg.contains(".whiley")) {
					File f = new File(arg);
					if (f.exists()) {
						delta.add(f);
					} else {
						throw new RuntimeException("Could not find " + arg);
					}
				} else {
					arguments.add(arg);
				}
			}
			// Pass the command line arguments to 'translator' 
			((WyopclBuildTask) builder).setArguments(arguments.toArray(new String[arguments.size()]));

			// =====================================================================
			// Run Build Task
			// =====================================================================
			builder.build(delta);

		} catch (InternalFailure e) {
			e.outputSourceError(stderr, false);
			if (verbose) {
				e.printStackTrace(stderr);
			}
			return INTERNAL_FAILURE;
		} catch (SyntaxError e) {
			e.outputSourceError(stderr, false);
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
		// Create a builder/translator
		WyopclBuildTask builder = new WyopclBuildTask();
		// Compile the whiley into WyIL code, and run the builder
		System.exit(new WyopclMain(builder, DEFAULT_OPTIONS).run(args));
	}

}
