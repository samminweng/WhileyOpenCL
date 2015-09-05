package wyopcl.testing.translator;

import static org.junit.Assert.assertEquals;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.charset.Charset;
import java.nio.file.FileSystems;
import java.nio.file.FileVisitResult;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.SimpleFileVisitor;
import java.nio.file.StandardCopyOption;
import java.nio.file.attribute.BasicFileAttributes;
import java.util.ArrayList;
import java.util.List;

public final class BaseTestUtil {
	private final String version = "v0.3.35";
	// user.dir is the current directory.
	private final String workspace_path = System.getProperty("user.dir") + File.separator;
	private final String lib_path = workspace_path + "lib" + File.separator;

	protected final String classpath = lib_path + "wyjc-" + version + ".jar" + File.pathSeparator + lib_path + "wyopcl-"
			+ version + ".jar" + File.pathSeparator + lib_path + "wyrl-" + version + ".jar" + File.pathSeparator
			+ lib_path + "wycs-" + version + ".jar" + File.pathSeparator + lib_path + "wybs-" + version + ".jar"
			+ File.pathSeparator + lib_path + "wyil-" + version + ".jar" + File.pathSeparator + lib_path + "wyc-"
			+ version + ".jar" + File.pathSeparator;
	protected final String whiley_runtime_lib = lib_path + "wyrt-" + version + ".jar";
	Process p;

	public BaseTestUtil() {

	}

	/**
	 * Execute the wyopcl with the given option and check if the executed result
	 * match with the expected output file.
	 * 
	 * @param pb
	 *            the process builder
	 * @param output_reader
	 *            the reader of the output (console/file). Execute the process
	 *            and read the output results as a buffered reader.
	 * @param expected_reader
	 *            the reader of the predefined output file (*.sysout). Read the
	 *            expected output file.
	 * @throws IOException
	 */
	private void assertOutput(BufferedReader output_reader, BufferedReader expected_reader) throws IOException {
		String expected = null;
		// Takes out each line from expected file and check if it matches with
		// each line from the output.
		while ((expected = expected_reader.readLine()) != null) {
			String output = output_reader.readLine();
			assertEquals(expected, output);
		}
		// Nullify the file input/output objects.
		expected_reader.close();
		expected_reader = null;
		output_reader.close();
		output_reader = null;
	}

	/**
	 * Analyze the bounds of a Whiley program using naive or gradual widening
	 * strategy.
	 * 
	 * @param path_whiley
	 * @param widen
	 */
	public void execBoundAnalysis(String path, String filename, String... options) {
		ProcessBuilder pb = null;
		File file = new File(path + filename + ".whiley");
		try {
			String sysout = path + filename + "." + options[0] + "." + options[1];
			// Set the working directory.
			switch (options.length) {
			case 2:
				pb = new ProcessBuilder("java", "-cp", classpath, "wyopcl.WyopclMain", "-bp", whiley_runtime_lib,
						"-" + options[0], options[1], file.getName());
				break;
			case 3:
				sysout += "." + options[2];
				pb = new ProcessBuilder("java", "-cp", classpath, "wyopcl.WyopclMain", "-bp", whiley_runtime_lib,
						"-" + options[0], options[1], options[2], file.getName());
				break;
			}
			sysout += ".sysout";
			pb.directory(file.getParentFile());
			// start the process.
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
	 * Find the pattern for all the functions in a Whiley program using pattern
	 * option.
	 * 
	 * @param path_whiley
	 * @param widen
	 */
	public void execPattern(String path, String filename, String... options) {
		ProcessBuilder pb = null;
		File file = new File(path + filename + ".whiley");
		try {
			String sysout = path + filename + "." + options[0] + ".sysout";
			// Create the process with the given options
			pb = new ProcessBuilder("java", "-cp", classpath, "wyopcl.WyopclMain", "-bp", whiley_runtime_lib,
					"-" + options[0], file.getName());
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
	 * Use Java process to execute the command line .
	 * 
	 * @param cmd
	 *            Command name
	 * @param args
	 *            Arguments
	 * @param workingDir
	 *            Working directory
	 */
	private int runCmd(String cmd, Path workingDir) {
		// Get the runtime.
		Runtime rt = Runtime.getRuntime();
		// Compile the C program
		Process pr;
		int exitValue = -1;
		try {
			pr = rt.exec(cmd, null, workingDir.toFile());
			exitValue = pr.waitFor();
			if (exitValue != 0) {
				// If not success, then print error messages.
				BufferedReader stdError = new BufferedReader(new InputStreamReader(pr.getErrorStream()));
				String s;
				while ((s = stdError.readLine()) != null) {
					System.err.println(s);
				}
			} else {
				// If success, then print output messages.
				BufferedReader stdIn = new BufferedReader(new InputStreamReader(pr.getInputStream()));
				String s;
				while ((s = stdIn.readLine()) != null) {
					System.out.println(s);
				}
			}
		} catch (IOException | InterruptedException e) {
			throw new RuntimeException("Errors occurs in executing '" + cmd + "'");
		}
		return exitValue;
	}

	/**
	 * Check that 'destDir' exists and Create 'destDir' folder. If so, delete
	 * existing 'destDir' folder. And then create 'destDir' directory.
	 * 
	 * @param destDir
	 */
	private void createDestDir(Path destDir) {
		try {
			// Check the parent folder exits.
			if (!Files.exists(destDir.getParent())) {
				Files.createDirectories(destDir.getParent());
			}
			// Create the destDir folder. 
			if (Files.exists(destDir)) {
				// If destDir exists, then delete it.
				// Recursively Delete files in the destDir folder.
				Files.walkFileTree(destDir, new SimpleFileVisitor<Path>() {
					@Override
					public FileVisitResult visitFile(Path file, BasicFileAttributes attrs) throws IOException {
						Files.delete(file);
						return FileVisitResult.CONTINUE;
					}
				});
			} else {
				// Create destDir subfolder
				Files.createDirectories(destDir);
			}
		} catch (Exception ex) {
			throw new AssertionError("Fails to create the " + destDir + " folder");
		}
	}

	/**
	 * Translate a Whiley program into the C code.
	 * 
	 * The validation is to compile and run the generated C code and check if
	 * the exit value is 0.
	 * 
	 *
	 * @param sourceDir
	 *            the directory of source Whiley program.
	 * @param destDir
	 *            the directory of generated code.
	 * @param testcase
	 *            the file name
	 * @param options
	 *            the extra options, e.g. 'copy'
	 */
	public void execCodeGeneration(Path sourceDir, Path destDir, String testcase, String... options) {
		try {
			// Separate the generated C code. If no optimization is enabled,
			// then generate C code in 'slow' extension.
			if (options.length == 0) {
				// No extra options
				// Set destDir directory to be 'code/TestCaseName/slow'
				destDir = Paths.get(destDir + File.separator + testcase + File.separator + "slow" + File.separator);
			} else {
				// Set working directory to be 'code/TestCaseName/fast'
				destDir = Paths.get(destDir + File.separator + testcase + File.separator + "fast" + File.separator);
			}
			// Create destDir
			createDestDir(destDir);

			//1. Copy source Whiley program to destDir directory.
			Path whileyFile = Paths.get(sourceDir + File.separator + testcase + ".whiley");
			// Check if whiley file exists.
			assertEquals(Files.exists(whileyFile), true);
			// Copy source.whiley to destDir folder
			Files.copy(whileyFile, Paths.get(destDir+File.separator+testcase + ".whiley"));
			
			//2. Copy Util.c and Util.h from parent folder to destDir
			Files.copy(Paths.get(destDir.getParent().getParent() + File.separator + "Util.c"), Paths.get(destDir + File.separator + "Util.c"));
			Files.copy(Paths.get(destDir.getParent().getParent() + File.separator + "Util.h"), Paths.get(destDir + File.separator + "Util.h"));
			
			//3. Generate the C code.
			String cmd = "java";
			// A list of arguments.
			cmd += " -cp "+classpath;// class path
			cmd += " wyopcl.WyopclMain";// main class
			cmd += " -bp "+whiley_runtime_lib;// Whiley runtime library
			cmd += " -code";// Generate code.
			// Add extra optimization option.
			for (String option : options) {
				// Run the code generator with optimization.
				cmd += " "+ option;
			}
			// Add test case name
			cmd += " "+testcase + ".whiley";
			runCmd(cmd, destDir);

			// Check if *.c and *.h files are generated or not.
			Path cFile = Paths.get(destDir + File.separator + testcase + ".c");
			Path hFile = Paths.get(destDir + File.separator + testcase + ".h");
			assertEquals(Files.exists(cFile), true);
			assertEquals(Files.exists(hFile), true);
		

			// As each test case is exported as a separate function,
			// The main function must be written out (testMain.c)
			// to call the function of test case.
			String testMain = "#include \"" + testcase + ".h\"\n" + "int main(int argc, char** args){\n"
					+ "	test();\n}\n";
			PrintWriter writer = new PrintWriter(destDir + File.separator + "testMain.c");
			writer.print(testMain);
			writer.flush();
			writer.close();
			// Get Operation System.
			String os = System.getProperty("os.name").toLowerCase();
			//4. Compile and run the C code.
			if (os.indexOf("win") >= 0) {
				// Compile the  testMain.c, TestCase.c and Util.c
				int exitValue = runCmd("cmd /c gcc " + "testMain.c Util.c " + testcase + ".c  -o " + testcase + ".out", destDir);
				// Check if exit value is 0. If not, the compilation process has
				// errors.
				assertEquals(exitValue, 0);
				exitValue = runCmd("cmd /c " + testcase + ".out", destDir);
				assertEquals(exitValue, 0);
			} else {
				// Run Linux commands
				// Compile the C program into *.out and place it in current
				// working directory
				int exitValue = runCmd("gcc " + "testMain.c Util.c " + testcase + ".c  -o " + testcase + ".out", destDir);
				assertEquals(exitValue, 0);
				// Run the generated out file
				exitValue = runCmd("./" + testcase + ".out", destDir);
				assertEquals(exitValue, 0);
			}
			// Delete the Wyil files inside 'valid' folder
			Files.deleteIfExists(FileSystems.getDefault().getPath(sourceDir + testcase + ".wyil"));
		} catch (Exception e) {
			terminate();
			throw new RuntimeException("Test file: " + testcase + ".whiley", e);
		}
	}

	public void terminate() {
		// Terminate the process.
		while (p != null) {
			p.destroy();
			p = null;
		}
	}

}
