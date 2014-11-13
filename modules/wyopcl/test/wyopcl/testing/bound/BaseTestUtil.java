package wyopcl.testing.bound;

import static org.junit.Assert.assertEquals;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.nio.charset.Charset;
import java.nio.file.Files;
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
	final String path = workspace_path + "tests" + File.separator + "bounds" + File.separator;
	
	private ProcessBuilder pb;
	private Process p;

	public BaseTestUtil() {

	}
	
	public void exec(String file_name) {
		try {			
			//Analyze the bounds of a Whiley program.
			String path_whiley = file_name + ".whiley";
			// Set the working directory.
			pb = new ProcessBuilder("java", "-cp", classpath, "wyopcl.WyopclMain", "-bp", runtime, "-analysis", "range", path_whiley);
			pb.directory(new File(path));

			// System.out.println("" + pb.directory());
			p = pb.start();
			
			BufferedReader reader = new BufferedReader(new InputStreamReader(p.getInputStream(),
					Charset.forName("UTF-8")));
			//Read the sysout file
			String sysout = path+File.separator+file_name+".sysout";

			Iterator<String> iterator = Files.readAllLines(Paths.get(sysout), Charset.defaultCharset()).iterator();
			String output = null;
			while ((output = reader.readLine()) != null) {
				String expected = iterator.next();
				//System.out.println(output);
				assertEquals(expected, output);
			}

			// Ensure no records is left in the list.
			if (iterator.hasNext()) {
				throw new Exception("Test file: " + file_name);
			}
		} catch (Exception e) {
			terminate();
			throw new RuntimeException("Test file: " + file_name, e);
		}
	}
	
	public void terminate() {
		while (p != null) {
			p.destroy();
			p = null;
		}

		pb = null;
	}
	
}
