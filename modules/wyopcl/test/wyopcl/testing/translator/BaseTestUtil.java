package wyopcl.testing.translator;

import static org.junit.Assert.assertEquals;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.Charset;

public final class BaseTestUtil {
	private final String version = "v0.3.35";
	// user.dir is the current directory.
	private final String workspace_path = System.getProperty("user.dir")+ File.separator;
	private final String lib_path = workspace_path + "lib"+ File.separator;
	
	private final String classpath = lib_path + "wyjc-"	+ version + ".jar" + File.pathSeparator 
			+ lib_path + "wyopcl-" + version + ".jar" + File.pathSeparator 
			+ lib_path + "wyrl-" + version + ".jar" + File.pathSeparator
			+ lib_path + "wycs-" + version + ".jar"	+ File.pathSeparator
			+ lib_path + "wybs-"+ version + ".jar" + File.pathSeparator 
			+ lib_path + "wyil-" + version + ".jar" + File.pathSeparator
			+ lib_path + "wyc-" + version + ".jar" + File.pathSeparator;
	final String runtime = lib_path + "wyrt-" + version + ".jar";
	Process p;
	public BaseTestUtil() {
		
	}
	
	/**
	 * Execute the wyopcl with the given option and check if the executed result match with the expected output file. 
	 * @param pb the process builder
	 * @param output_reader the reader of the output (console/file). Execute the process and read the output results as a buffered reader.
	 * @param expected_reader the reader of the predefined output file (*.sysout). Read the expected output file.
	 * @throws IOException
	 */
	private void assertOutput(BufferedReader output_reader, BufferedReader expected_reader) throws IOException{
		String expected = null;
		//Takes out each line from expected file and check if it matches with each line from the output.
		while ((expected = expected_reader.readLine()) != null) {
			String output = output_reader.readLine();
			assertEquals(expected, output);			
		}
		//Nullify the file input/output objects.	
		expected_reader.close();
		expected_reader = null;
		output_reader.close();
		output_reader =null;
	}
	
	
	/**
	 * Analyze the bounds of a Whiley program using naive or gradual widening strategy.
	 * @param path_whiley
	 * @param widen
	 */
	public void execBoundAnalysis(String path, String filename, String... options) {
		ProcessBuilder pb = null;		
		File file = new File(path+filename+ ".whiley");
		try {
			String sysout = path+filename+"."+options[0]+"."+options[1];
			// Set the working directory.
			switch(options.length){
			case 2:
				pb = new ProcessBuilder("java", "-cp", classpath, "wyopcl.WyopclMain", "-bp", runtime, "-"+options[0], options[1], file.getName());
				break;
			case 3:
				sysout += "."+options[2];
				pb = new ProcessBuilder("java", "-cp", classpath, "wyopcl.WyopclMain", "-bp", runtime, "-"+options[0], options[1], options[2], file.getName());
				break;
			}			
			sysout += ".sysout";
			pb.directory(file.getParentFile());
			//start the process.
			p = pb.start();		
			assertOutput(new BufferedReader(new InputStreamReader(p.getInputStream(), Charset.forName("UTF-8"))),
					new BufferedReader(new FileReader(sysout)));
		} catch (Exception e) {
			terminate();
			throw new RuntimeException("Test file: " + file.getName(), e);
		}
		file = null;
		pb = null;
	}
	
	
	/**
	 * Find the pattern for all the functions in a Whiley program using pattern option.
	 * @param path_whiley
	 * @param widen
	 */
	public void execPattern(String path, String filename, String... options) {
		ProcessBuilder pb = null;
		File file = new File(path+filename+ ".whiley");
		try {
			String sysout = path+filename+"."+options[0]+".sysout";
			// Create the process with the given options
			pb = new ProcessBuilder("java", "-cp", classpath, "wyopcl.WyopclMain", "-bp", runtime, "-"+options[0], file.getName());
			pb.directory(file.getParentFile());
			p = pb.start();			
			assertOutput(new BufferedReader(new InputStreamReader(p.getInputStream(), Charset.forName("UTF-8"))),
					new BufferedReader(new FileReader(sysout)));
		} catch (Exception e) {
			terminate();
			throw new RuntimeException("Test file: " + file.getName(), e);
		}
		
		file = null;
		pb = null;
	}
	
	

	/**
	 * Translate a Whiley program into the C code. 
	 * @param path_whiley
	 * @param widen
	 */
	public void execCodeGeneration(String path, String filename, String... options) {
		ProcessBuilder pb = null;
		File file = new File(path+filename+ ".whiley");
		try {
			String sysout;
			if(options.length==0){
				sysout = path+filename+".c.sysout";
				pb = new ProcessBuilder("java", "-cp", classpath, "wyopcl.WyopclMain", "-bp", runtime, "-code", file.getName());
			}else{
				//Separate the generated C code. If the naive mode is enabled, then compare the C file with 'slow' extension.
				//If the pattern mode is enabled, then compare the C file with 'fast' extension.
				if(options[0].equals("slow")){
					pb = new ProcessBuilder("java", "-cp", classpath, "wyopcl.WyopclMain", "-bp", runtime, "-code", file.getName());
				}else{
					pb = new ProcessBuilder("java", "-cp", classpath, "wyopcl.WyopclMain", "-bp", runtime, "-code", "-pattern", file.getName());
				}				
				sysout = path+filename+"."+options[0]+".c.sysout";
			}
			
			pb.directory(file.getParentFile());	
			//Generate the C code.
			p = pb.start();
			//Cause the current thread to Wait until the process has terminated.
			p.waitFor();
			//Compare the generated C code with the predefined output.
			assertOutput(new BufferedReader(new FileReader(path+filename+".c")),
					new BufferedReader(new FileReader(sysout)));
		} catch (Exception e) {
			terminate();
			throw new RuntimeException("Test file: " + file.getName(), e);
		}		
		file = null;		
	}
	
	
	public void terminate() {
		//Terminate the process.
		while (p != null) {
			p.destroy();
			p = null;
		}
	}
	
}
