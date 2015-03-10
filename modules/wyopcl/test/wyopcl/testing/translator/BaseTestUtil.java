package wyopcl.testing.translator;

import static org.junit.Assert.assertEquals;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.InputStreamReader;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Iterator;

public final class BaseTestUtil {
	private final String version = "v0.3.31";
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
	
	private ProcessBuilder pb;
	private Process p;

	public BaseTestUtil() {

	}
	/**
	 * Analyze the bounds of a Whiley program using naive or gradual widening strategy.
	 * @param path_whiley
	 * @param widen
	 */
	public void execBoundAnalysis(String path, String filename, String... options) {
		File file = new File(path+filename+ ".whiley");
		try {	
			
			String sysout_file_name = path+filename+"."+options[0]+"."+options[1];
			// Set the working directory.
			switch(options.length){
			case 2:
				pb = new ProcessBuilder("java", "-cp", classpath, "wyopcl.WyopclMain", "-bp", runtime, options[0], options[1], file.getName());
				break;
			case 3:
				sysout_file_name += "."+options[2];
				pb = new ProcessBuilder("java", "-cp", classpath, "wyopcl.WyopclMain", "-bp", runtime, options[0], options[1], options[2], file.getName());
				break;
			}			
			sysout_file_name += ".sysout"; 
			
			pb.directory(file.getParentFile());
			System.out.println("" + pb.directory());
			p = pb.start();
			
			BufferedReader executed_reader = new BufferedReader(new InputStreamReader(p.getInputStream(), Charset.forName("UTF-8")));
			//Write the output to the corresponding files.
			File sysout_file = new File(sysout_file_name);
			FileReader file_reader = new FileReader(sysout_file);
			BufferedReader expected_reader = new BufferedReader(file_reader);
			
			String output = null;
			while ((output = executed_reader.readLine()) != null) {
				String expected = expected_reader.readLine();
				//Ignored the memory usage...
				if(expected != null){
					assertEquals(expected, output);
				}				
			}
			
			executed_reader.close();
			expected_reader.close();
			file_reader.close();
			//Nullify the file input/output objects.			
			executed_reader =null;
			sysout_file = null;
			file_reader = null;
			expected_reader = null;
		} catch (Exception e) {
			terminate();
			throw new RuntimeException("Test file: " + file.getName(), e);
		}
		
		file = null;		
	}

	/**
	 * Translate a Whiley program into the C code. 
	 * @param path_whiley
	 * @param widen
	 */
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
				//assertEquals(expected, output);
			}			
			reader.close();
			System.out.println("Finish" + pb.directory()+path_whiley+ ".whiley");
			
		} catch (Exception e) {
			terminate();
			throw new RuntimeException("Test file: " + file.getName(), e);
		}		
		file = null;		
	}
	
	
	public void terminate() {
		while (p != null) {
			p.destroy();
			p = null;
		}

		pb = null;
	}
	
}
