package wyopcl.testing.translator;

import static org.junit.Assert.assertEquals;

import java.io.BufferedReader;
import java.io.File;
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
	public void exec(String path_whiley, String widen) {
		File file = new File(path_whiley+ ".whiley");
		try {	
			// Set the working directory.
			if(widen.equals("gradual")){
				pb = new ProcessBuilder("java", "-cp", classpath, "wyopcl.WyopclMain", "-bp", runtime, "-range", "gradual", file.getName());
			}else{
				pb = new ProcessBuilder("java", "-cp", classpath, "wyopcl.WyopclMain", "-bp", runtime, "-range", "naive", file.getName());
			}
			
			pb.directory(file.getParentFile());
			System.out.println("" + pb.directory());
			p = pb.start();
			
			BufferedReader reader = new BufferedReader(new InputStreamReader(p.getInputStream(),
					Charset.forName("UTF-8")));
			//Read the sysout file
			String sysout;
			if(widen.equals("gradual")){
				sysout = path_whiley+".gradual.sysout";
			}else{
				sysout = path_whiley+".naive.sysout";
			}

			Iterator<String> iterator = Files.readAllLines(Paths.get(sysout), Charset.defaultCharset()).iterator();
			String output = null;
			while ((output = reader.readLine()) != null) {
				String expected = iterator.next();
				//System.out.println(output);
				assertEquals(expected, output);
			}

			// Ensure no records is left in the list.
			if (iterator.hasNext()) {
				throw new Exception("Test file: " + file.getName());
			}
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
