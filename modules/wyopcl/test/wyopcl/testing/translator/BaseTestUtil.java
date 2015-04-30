package wyopcl.testing.translator;

import static org.junit.Assert.assertEquals;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.Charset;

public final class BaseTestUtil {
	private final String version = "v0.3.33";
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
	public BaseTestUtil() {
		
	}
	
	/**
	 * Execute the wyopcl with the given option and check if the executed result match with the expected output file. 
	 * @param pb the process builder
	 * @param sysout
	 * @throws IOException
	 */
	private void assertOutput(ProcessBuilder pb, String sysout) throws IOException{
		Process p = pb.start();
		//Execute the process and read the output results as a buffered reader.
		BufferedReader executed_reader = new BufferedReader(new InputStreamReader(p.getInputStream(), Charset.forName("UTF-8")));
		//Read the expected output file.
		FileReader file_reader = new FileReader(sysout);
		BufferedReader expected_reader = new BufferedReader(file_reader);
		String output = null;
		while ((output = executed_reader.readLine()) != null) {
			String expected = expected_reader.readLine();
			if(expected != null){
				assertEquals(expected, output);
			}				
		}
		//Nullify the file input/output objects.	
		expected_reader.close();
		file_reader.close();
		file_reader = null;
		expected_reader = null;
		executed_reader.close();
		executed_reader =null;
		//Terminate the process.
		while (p != null) {
			p.destroy();
			p = null;
		}
		
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
			
			String sysout_file_name = path+filename+"."+options[0]+"."+options[1];
			// Set the working directory.
			switch(options.length){
			case 2:
				pb = new ProcessBuilder("java", "-cp", classpath, "wyopcl.WyopclMain", "-bp", runtime, "-"+options[0], options[1], file.getName());
				break;
			case 3:
				sysout_file_name += "."+options[2];
				pb = new ProcessBuilder("java", "-cp", classpath, "wyopcl.WyopclMain", "-bp", runtime, "-"+options[0], options[1], options[2], file.getName());
				break;
			}			
			sysout_file_name += ".sysout";
			pb.directory(file.getParentFile());
			assertOutput(pb, sysout_file_name);			
			
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
			String sysout = path+filename+"."+options[0];
			// Create the process with the given options
			pb = new ProcessBuilder("java", "-cp", classpath, "wyopcl.WyopclMain", "-bp", runtime, "-"+options[0], file.getName());
			sysout += ".sysout";
			pb.directory(file.getParentFile());			
			assertOutput(pb, sysout);
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
	 *//*
	public void execCodeGeneration(String path_whiley) {
		File file = new File(path_whiley+ ".whiley");
		try {			
			pb = new ProcessBuilder("java", "-cp", classpath, "wyopcl.WyopclMain", "-bp", runtime, "-code", file.getName());
			pb.directory(file.getParentFile());			
			p = pb.start();
			
			BufferedReader reader = new BufferedReader(new InputStreamReader(p.getInputStream(), Charset.forName("UTF-8")));
			String output = null;
			while ((output = reader.readLine()) != null) {
				System.out.println(output);
			}			
			reader.close();
			System.out.println("Finish" + pb.directory()+path_whiley+ ".whiley");
			
		} catch (Exception e) {
			terminate();
			throw new RuntimeException("Test file: " + file.getName(), e);
		}		
		file = null;		
	}*/
	
	
	public void terminate() {
		
	}
	
}
