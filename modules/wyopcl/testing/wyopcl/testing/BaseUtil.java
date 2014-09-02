package wyopcl.testing;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

import junit.framework.AssertionFailedError;
import static org.junit.Assert.*;

public class BaseUtil {
	final String version = "v0.3.29";
	// user.dir is the current directory.
	final String classpath = System.getProperty("user.dir") + File.separator + "lib" + File.separator + "wyjc-"
			+ version + ".jar" + File.pathSeparator + System.getProperty("user.dir") + File.separator + "lib"
			+ File.separator + "wyopcl-" + version + ".jar" + File.pathSeparator + System.getProperty("user.dir")
			+ File.separator + "lib" + File.separator + "wyrl-" + version + ".jar" + File.pathSeparator
			+ System.getProperty("user.dir") + File.separator + "lib" + File.separator + "wycs-" + version + ".jar"
			+ File.pathSeparator + System.getProperty("user.dir") + File.separator + "lib" + File.separator + "wybs-"
			+ version + ".jar" + File.pathSeparator + System.getProperty("user.dir") + File.separator + "lib"
			+ File.separator + "wyil-" + version + ".jar" + File.pathSeparator + System.getProperty("user.dir")
			+ File.separator + "lib" + File.separator + "wyc-" + version + ".jar" + File.pathSeparator;
	final String runtime = System.getProperty("user.dir") + File.separator + "lib" + File.separator + "wyrt-" + version
			+ ".jar";
	final String valid_test_folder = System.getProperty("user.dir") + File.separator + "tests" + File.separator
			+ "valid" + File.separator;

	private ProcessBuilder pb;
	private Process p;

	public BaseUtil() {

	}

	public void exec(String file_name) {
		try {

			// Run the whiley program with interpreter.
			String path_whiley = file_name + ".whiley";
			// Set the working directory.
			pb = new ProcessBuilder("java", "-cp", classpath, "wyopcl.WyopclMain", "-bp", runtime, path_whiley);
			pb.directory(new File(valid_test_folder));
			// System.out.println("" + pb.directory());
			p = pb.start();

			Iterator<String> iterator;
			BufferedReader reader = new BufferedReader(new InputStreamReader(p.getInputStream(),
					Charset.forName("UTF-8")));
			String line = null;

			// Load the output file (*.sysout).
			String path_sysout = valid_test_folder + file_name + ".sysout";
			List<String> expected = Files.readAllLines(Paths.get(path_sysout), Charset.defaultCharset());
			iterator = expected.iterator();
			
				while ((line = reader.readLine()) != null) {
					String out = iterator.next();
					System.out.println(line);
					assertEquals(out, line);
				}
		
			// Ensure no records is left in the list.
			if(iterator.hasNext()){
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
