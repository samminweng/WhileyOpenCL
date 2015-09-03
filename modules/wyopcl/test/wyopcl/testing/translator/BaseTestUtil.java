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
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

public final class BaseTestUtil {
	private final String version = "v0.3.35";
	// user.dir is the current directory.
	private final String workspace_path = System.getProperty("user.dir") + File.separator;
	private final String lib_path = workspace_path + "lib" + File.separator;

	private final String classpath = lib_path + "wyjc-" + version + ".jar" + File.pathSeparator + lib_path + "wyopcl-"
			+ version + ".jar" + File.pathSeparator + lib_path + "wyrl-" + version + ".jar" + File.pathSeparator
			+ lib_path + "wycs-" + version + ".jar" + File.pathSeparator + lib_path + "wybs-" + version + ".jar"
			+ File.pathSeparator + lib_path + "wyil-" + version + ".jar" + File.pathSeparator + lib_path + "wyc-"
			+ version + ".jar" + File.pathSeparator;
	final String runtime = lib_path + "wyrt-" + version + ".jar";
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
				pb = new ProcessBuilder("java", "-cp", classpath, "wyopcl.WyopclMain", "-bp", runtime, "-" + options[0],
						options[1], file.getName());
				break;
			case 3:
				sysout += "." + options[2];
				pb = new ProcessBuilder("java", "-cp", classpath, "wyopcl.WyopclMain", "-bp", runtime, "-" + options[0],
						options[1], options[2], file.getName());
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
			pb = new ProcessBuilder("java", "-cp", classpath, "wyopcl.WyopclMain", "-bp", runtime, "-" + options[0],
					file.getName());
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
	 * Execute the command line from Java program.
	 * 
	 * @param cmd
	 */
	private int runExec(String cmd) {
		// Get the runtime.
		Runtime rt = Runtime.getRuntime();
		// Compile the C program
		Process pr;
		int exitValue = -1;
		try {
			pr = rt.exec(cmd);
			exitValue = pr.waitFor();
			if (exitValue != 0) {
				// Print error messages.
				BufferedReader stdError = new BufferedReader(new InputStreamReader(pr.getErrorStream()));
				String s;
				while ((s = stdError.readLine()) != null) {
					System.err.println(s);
				}
			} else {
				// Print output messages.
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
	 * Translate a Whiley program into the C code.
	 * 
	 * The validation is to compile and run the generated C code and check if
	 * the exit value is 0.
	 * 
	 * 
	 * 
	 * 
	 * @param validDir
	 *            the directory of test case.
	 * @param codeDir
	 *            the working directory
	 * @param filename
	 *            the file name
	 * @param options
	 *            the extra options, e.g. 'copy'
	 */
	public void execCodeGeneration(String validDir, String codeDir, String filename, String... options) {
		try {
			ProcessBuilder pb = null;
			// Set working directory to be 'copy/TestCaseName/'
			File workingDir;
			if (options.length == 0) {
				// No extra options
				pb = new ProcessBuilder("java", "-cp", classpath, "wyopcl.WyopclMain", "-bp", runtime, "-code",
						filename + ".whiley");
				// Set working directory to be 'code/TestCaseName/slow'
				workingDir = new File(codeDir + filename + File.separator + "slow"+ File.separator);
			} else {
				// Create the Java process to run the code generator with
				// optimization.
				pb = new ProcessBuilder("java", "-cp", classpath, "wyopcl.WyopclMain", "-bp", runtime, "-code",
						"-" + options[0], filename + ".whiley");
				// Set working directory to be 'code/TestCaseName/fast'
				workingDir = new File(codeDir + filename + File.separator + "fast" + File.separator);
				// Separate the generated C code. If the naive mode is enabled,
				// then compare the C file with 'slow' extension.
				// If the pattern mode is enabled, then compare the C file with
				// 'fast' extension.
				/**
				 * if(options[0].equals("slow")){ pb = new
				 * ProcessBuilder("java", "-cp", classpath, "wyopcl.WyopclMain",
				 * "-bp", runtime, "-code", file.getName()); }else{ pb = new
				 * ProcessBuilder("java", "-cp", classpath, "wyopcl.WyopclMain",
				 * "-bp", runtime, "-code", "-pattern", file.getName()); }
				 */
			}

			// If workingDir does not exist, then create it.
			if (!workingDir.exists()) {
				//Create the 'TestCase' folder.
				Files.createDirectories(workingDir.toPath().getParent());
				//Create 'fast' or 'slow' subfolder
				Files.createDirectories(workingDir.toPath());
			}

			// Set the working dir to 'workingDir
			pb.directory(new File(validDir));
			// Generate the C code.
			p = pb.start();
			// Cause the current thread to Wait until the process has
			// terminated.
			p.waitFor();

			// Get the generated *.c and *.h
			File cFile = new File(validDir + filename + ".c");
			File hFile = new File(validDir + filename + ".h");
			// Check if the C program is generated or not.
			assertEquals(cFile.exists(), true);
			assertEquals(hFile.exists(), true);
			// Move *.c and *.h to workingDir
			cFile.renameTo(new File(workingDir + File.separator + filename + ".c"));
			hFile.renameTo(new File(workingDir + File.separator + filename + ".h"));

			File cUtil = new File(workingDir + File.separator + "Util.c");
			File hUtil = new File(workingDir + File.separator + "Util.h");
			Files.deleteIfExists(cUtil.toPath());
			Files.deleteIfExists(hUtil.toPath());
			// Copy Util.c and Util.h
			Files.copy(new File(codeDir + "Util.c").toPath(), cUtil.toPath(), StandardCopyOption.COPY_ATTRIBUTES);
			Files.copy(new File(codeDir + "Util.h").toPath(), hUtil.toPath(), StandardCopyOption.COPY_ATTRIBUTES);

			// As each test case is exported as a separate function,
			// The main function must be written out (testMain.c)
			// to call the function of test case.
			String testMain = "#include \"" + filename + ".h\"\n" + "int main(int argc, char** args){\n"
					+ "	test();\n" + "	exit(0);\n" + "}\n";
			PrintWriter writer = new PrintWriter(workingDir + File.separator + "testMain.c");
			writer.print(testMain);
			writer.flush();
			writer.close();
			// Get Operation System.
			String os = System.getProperty("os.name").toLowerCase();
			// Run Windows commands
			if (os.indexOf("win") >= 0) {
				// Compile the C programs, including testMain.c TestCase.c
				int exitValue = runExec("cmd /c gcc " + workingDir + File.separator + "testMain.c " + workingDir
						+ File.separator + filename + ".c " + codeDir + "Util.c -o " + workingDir + File.separator
						+ filename + ".out");
				// Check if exit value is 0. If not, the compilation process has
				// errors.
				assertEquals(exitValue, 0);
				exitValue = runExec("cmd /c " + workingDir + File.separator + filename + ".out");
				assertEquals(exitValue, 0);
			} else {
				// Run Linux commands
				// Compile the C program into *.out and place it in current
				// working directory
				int exitValue = runExec(
						"gcc " + workingDir + filename + ".c " + workingDir + "Util.c -o " + filename + ".out");
				assertEquals(exitValue, 0);
				// Run the generated out file
				exitValue = runExec("./" + filename + ".out");
				assertEquals(exitValue, 0);
			}

			//Delete the Wyil files inside 'valid' folder
			Files.deleteIfExists(FileSystems.getDefault().getPath(validDir + filename + ".wyil"));
		} catch (Exception e) {
			terminate();
			throw new RuntimeException("Test file: " + filename + ".whiley", e);
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
