package wyopcl;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.Map;

import wyc.WycMain;
import wyc.util.WycBuildTask;
import wycc.util.OptArg;
import wyopcl.util.WyopclBuildTask;

public class WyopclMain extends WycMain{

	public static final OptArg[] EXTRA_OPTIONS = { 
		new OptArg("classdir", "cd", OptArg.FILEDIR, "Specify where to place generated class files",
			new File("."))
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
	
	public static void main(String[] args) {
		
		// now, run wyjc build task
		System.exit(new WyopclMain(new WyopclBuildTask(), DEFAULT_OPTIONS).run(args));
	}

}
