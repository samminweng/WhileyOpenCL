package wyopcl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Map;

import wyc.WycMain;
import wyc.util.WycBuildTask;
import wycc.lang.SyntaxError;
import wycc.lang.SyntaxError.InternalFailure;
import wycc.util.OptArg;
import wyopcl.util.WyopclBuildTask;

public class WyopclMain extends WycMain{

	public static final OptArg[] EXTRA_OPTIONS = { 
//		new OptArg("classdir", "cd", OptArg.FILEDIR, "Specify where to place generated class files",
//			new File("."))
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
		
		File classDir = (File) values.get("classdir");
		if (classDir != null) {
			((WyopclBuildTask) builder).setClassDir(classDir);
		}
	}
	
	
	@Override
	public int run(String[] _args) {
		boolean verbose = false;
		boolean brief = false;
		
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

			brief = values.containsKey("brief");
			
			// =====================================================================
			// Configure Build Task & Sanity Check
			// =====================================================================
			verbose = values.containsKey("verbose");
			
			configure(values);
						
			ArrayList<File> delta = new ArrayList<File>();
			//Additional arguments
			ArrayList<String> arguments = new ArrayList<String>();
			for (String arg : args) {
				File f = new File(arg);
				if(f.exists()){
					delta.add(f);
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
			e.outputSourceError(stderr,brief);
			if (verbose) {
				e.printStackTrace(stderr);
			}
			return INTERNAL_FAILURE;
		} catch (SyntaxError e) {
			e.outputSourceError(stderr,brief);
			if (verbose) {
				e.printStackTrace(stderr);
			}
			return SYNTAX_ERROR;
		} catch (Throwable e) {
			stderr.println("internal failure (" + e.getMessage() + ")");
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
