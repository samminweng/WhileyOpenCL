package wyopcl.testing.translator;

import static org.junit.Assert.assertEquals;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.nio.charset.Charset;
import java.nio.file.FileSystems;
import java.nio.file.FileVisitResult;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.SimpleFileVisitor;
import java.nio.file.attribute.BasicFileAttributes;

import wyc.WycMain;
import wyc.util.WycBuildTask;
import wyopcl.WyopclMain;

public final class BaseTestUtil {
	private final String version = "v0.3.39";
	// user.dir is the current directory.
	private final String workspace_path = System.getProperty("user.dir") + File.separator;
	private final String lib_path = workspace_path + "lib" + File.separator;

	protected final String classpath = lib_path + "wyjc-" + version + ".jar" + File.pathSeparator + lib_path + "wyopcl-"
			+ version + ".jar" + File.pathSeparator + lib_path + "wyrl-" + version + ".jar" + File.pathSeparator
			+ lib_path + "wycs-" + version + ".jar" + File.pathSeparator + lib_path + "wybs-" + version + ".jar"
			+ File.pathSeparator + lib_path + "wyil-" + version + ".jar" + File.pathSeparator + lib_path + "wyc-"
			+ version + ".jar" + File.pathSeparator;
	final String whiley_runtime_lib = lib_path + "wyrt-" + version + ".jar";
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
			/**
			 * Due to the limited buffer size, Windows/Linux may fail to write
			 * the large output from code generator, to the input stream and may
			 * cause the process to block, and even deadlock.
			 */
			pr = rt.exec(cmd, null, workingDir.toFile());
			// Instantly write out the output message to avoid the process to block.
			BufferedReader stdIn = new BufferedReader(new InputStreamReader(pr.getInputStream()));
			String s;
			while ((s = stdIn.readLine()) != null) {
				System.out.println(s);
			}
			// Get the return value.
			exitValue = pr.waitFor();
			if (exitValue != 0) {
				// If not success, then print error messages.
				BufferedReader stdError = new BufferedReader(new InputStreamReader(pr.getErrorStream()));
				while ((s = stdError.readLine()) != null) {
					System.err.println(s);
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
	 * Use GCC C99 standard to compile the generated C code into executables.
	 * @param testcase
	 * @param destDir
	 */
	private void compileAndRunCCode(String testcase, Path destDir){
		// Get Operation System.
		// 4. Compile and run the C code.
		if (System.getProperty("os.name").toLowerCase().indexOf("win") >= 0) {
			// This option requires the Cygwin and gcc, or MinGW
			// Compile the *.c using GCC
			String path = System.getenv("PATH");// Get PATH environment variable.
			if (path.contains("MinGW")) {
				// Check the exit value. If not 0, the compilation has errors.
				assertEquals(runCmd("cmd /c gcc -std=c99 *.c  -o " + testcase + ".out", destDir), 0);
			} else if (path.contains("cygwin")) {
				// Gcc is a link (Windows command does not get it), so call its actual name (i.e. gcc-3 or gcc-4)
				assertEquals(runCmd("cmd /c gcc-4 -std=c99 *.c  -o " + testcase + ".out", destDir), 0);
				// Run the output file.
				//assertEquals(runCmd("cmd /c " + testcase + ".out", destDir), 0);
			} else {
				throw new RuntimeException("Missing C compiler, such as gcc or MinGW.");
			}

			// Run the output file.
			assertEquals(runCmd("cmd /c " + testcase + ".out", destDir), 0);
		} else {
			// Use C99 standard to Compile the C program into *.out and place it in current working directory
			assertEquals(runCmd("gcc -std=c99 Util.c " +testcase+".c -o " + testcase + ".out", destDir), 0);
			// Run the generated out file
			assertEquals(runCmd("./" + testcase + ".out", destDir), 0);
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
	public void execCodeGeneration(Path sourceDir, String testcase, String... options) {
		try {
			Path destDir;
			// Separate the generated C code.
			switch(options.length){
			case 0:
				// No extra options
				// Set destDir directory to be 'code/TestCaseName/naive'
				destDir = Paths.get(sourceDir + File.separator + testcase + File.separator + "naive" + File.separator);
				break;
			case 1:
				if(options[0].equals("copy")){
					// Set working directory to be 'code/TestCaseName/copy'
					destDir = Paths.get(sourceDir + File.separator + testcase + File.separator + "copy_reduced" + File.separator);
				}else if(options[0].equals("dealloc")){
					// Applies de-allocation analysis on naive C code
					destDir = Paths.get(sourceDir + File.separator + testcase + File.separator + "naive_dealloc" + File.separator);	
				}else{
					throw new RuntimeException("Not Implemented");
				}
				break;
			case 2:
				destDir = Paths.get(sourceDir + File.separator + testcase + File.separator + "copy_reduced_dealloc" + File.separator);
				break;
			default:
				throw new RuntimeException("Not implemented");
			}


			// Create destDir
			createDestDir(destDir);

			// 1. Copy source Whiley program to destDir directory.
			Path whileyFile = Paths.get(sourceDir + File.separator + testcase + ".whiley");
			// Copy source.whiley to destDir folder
			Files.copy(whileyFile, Paths.get(destDir + File.separator + testcase + ".whiley"));

			// 2. Copy Util.c and Util.h from parent folder to destDir
			Files.copy(Paths.get(destDir.getParent().getParent() + File.separator + "Util.c"),
					Paths.get(destDir + File.separator + "Util.c"));
			Files.copy(Paths.get(destDir.getParent().getParent() + File.separator + "Util.h"),
					Paths.get(destDir + File.separator + "Util.h"));

			// 3. Generate the C code.
			String cmd = "java -cp " + classpath + " wyopcl.WyopclMain -bp " + whiley_runtime_lib + " -code";
			// Add extra optimization option.
			for (String option : options) {
				// Run the code generator with optimization.
				cmd += " -" + option;
			}
			// Add test case name
			cmd += " " + testcase + ".whiley";
			runCmd(cmd, destDir);

			// Check if *.c and *.h files are generated or not.
			assertEquals(Files.exists(Paths.get(destDir + File.separator + testcase + ".c")), true);
			assertEquals(Files.exists(Paths.get(destDir + File.separator + testcase + ".h")), true);

			// Get Operation System.
			compileAndRunCCode(testcase, destDir);
			
			// Delete the Wyil files inside folder
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

	/*public void execCopyAnalysis(Path path, String testcase) {
		// Run commmands
		String cmd = "java -cp " + classpath + " wyopcl.WyopclMain -bp " + whiley_runtime_lib + " -code -copy"
				+ " " + testcase + ".whiley";
		Path destDir = Paths.get(path + File.separator + testcase + File.separator);
		// Generate Copy-eliminated C code
		runCmd(cmd, destDir);
		// Compile and run the generated C code
		compileAndRunCCode(testcase, destDir);
		// Delete the Wyil files inside folder
		try {
			Files.deleteIfExists(FileSystems.getDefault().getPath(destDir + testcase + ".wyil"));
		} catch (IOException e) {
			throw new RuntimeException("Errors!!!");
		}
	}*/

}
