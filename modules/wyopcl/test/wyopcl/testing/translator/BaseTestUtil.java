package wyopcl.testing.translator;

import static org.junit.Assert.assertEquals;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.nio.CharBuffer;
import java.nio.charset.Charset;
import java.nio.file.FileSystems;
import java.nio.file.FileVisitResult;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.SimpleFileVisitor;
import java.nio.file.StandardOpenOption;
import java.nio.file.attribute.BasicFileAttributes;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;
import java.util.stream.Collectors;

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

	// Log file
	final File logfile = new File(System.getProperty("user.dir") + File.separator + "tests" + File.separator + "code"
			+ File.separator + "Report" + File.separator + "log.txt");

	// Util.c file
	final File utilcfile = new File(System.getProperty("user.dir") + File.separator + "tests" + File.separator + "code"
			+ File.separator + "Util.c");
	// Util.h file
	final File utilhfile = new File(System.getProperty("user.dir") + File.separator + "tests" + File.separator + "code"
			+ File.separator + "Util.h");
	
	
	Process p;

	public BaseTestUtil() {

	}

	/**
	 * Execute the wyopcl with the given option and check if the executed result match with the expected output file.
	 * 
	 * @param pb
	 *            the process builder
	 * @param output_reader
	 *            the reader of the output (console/file). Execute the process and read the output results as a buffered
	 *            reader.
	 * @param expected_reader
	 *            the reader of the predefined output file (*.sysout). Read the expected output file.
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
	 * Analyze the bounds of a Whiley program using naive or gradual widening strategy.
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
	 * Write
	 * @throws IOException 
	 */
	private void writeLogs(HashMap<String, Long> logs) throws IOException {

		

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
		Process process;
		int exitValue = -1;
		// Read the output of executables
		Scanner in_sc = null;
		Scanner err_sc = null;
		try {
			/**
			 * Due to the limited buffer size, Windows/Linux may fail to write the large output from code generator, to
			 * the input stream and may cause the process to block, and even deadlock.
			 */
			process = rt.exec(cmd, null, workingDir.toFile());

			// Store messages with an array list, to avoid duplicate messages and reduce log file size
			List<String> messages = new ArrayList<String>();
			// Instantly write out the output message to avoid the process to block.
			InputStream input = process.getInputStream();
			in_sc = new Scanner(input);
			while (in_sc.hasNextLine()) {
				String line = in_sc.nextLine();
				// De-bugging message can be ignored, to speed up ant task
				if (line.startsWith("DEBUG:")) {
					// Store debugging messages only
					line = line + " in " + workingDir.getFileName() + " folder";
					messages.add(line);
				} else {
					// Print out the message on console
					System.out.println(line);
				}
			}

			// Get the return value.
			exitValue = process.waitFor();
			if (exitValue != 0) {
				// If not success, then print error messages.
				InputStream error = process.getErrorStream();
				// Read error stream using scanner and print out each line of error message.
				err_sc = new Scanner(error);
				while (err_sc.hasNext()) {
					String line = err_sc.nextLine();
					System.err.println(line);
					messages.add(line);
				}
			}

			// Aggregate the message and count the number of occurrence
			// And output the results as a hashmap
			Map<String, Long> logs = messages.stream()
					.collect(Collectors.groupingBy(msg -> msg, Collectors.counting()));
			// Create log file to write out debug and error messages
			if (!logfile.exists()) {
				logfile.createNewFile();
			}
			FileWriter writer = new FileWriter(logfile, true);
			logs.forEach((line, count) -> {
				try {
					writer.write(line + "\tFrequency: " + count+"\n");
				} catch (IOException e) {
					throw new RuntimeException("Error erors while writing "+logfile+ " file.");
				}
			});
			
			writer.close();

		} catch (IOException | InterruptedException e) {
			throw new RuntimeException("Errors occurs in executing '" + cmd + "'");
		} finally {
			// Close the scanner and stream
			if (in_sc != null) {
				in_sc.close();
			}

			if (err_sc != null) {
				err_sc.close();
			}

		}
		return exitValue;
	}

	/**
	 * Check that 'destDir' exists and Create 'destDir' folder. If so, delete existing 'destDir' folder. And then create
	 * 'destDir' directory.
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
	 * 
	 * @param testcase
	 * @param destDir
	 */
	private void compileAndRunCCode(String testcase, Path destDir) {
		// Get Operation System.
		// 4. Compile and run the C code.
		if (System.getProperty("os.name").toLowerCase().indexOf("win") >= 0) {
			// This option requires the Cygwin and gcc, or MinGW
			// Compile the *.c using GCC
			String path = System.getenv("PATH");// Get PATH environment variable.
			if (path.contains("MinGW")) {
				// Check the exit value. If not 0, the compilation has errors.
				assertEquals(runCmd("cmd /c gcc -std=c99 -D DEBUG *.c  -o " + testcase + ".out", destDir), 0);
			} else if (path.contains("cygwin")) {
				// Gcc is a link (Windows command does not get it), so call its actual name (i.e. gcc-3 or gcc-4)
				assertEquals(runCmd("cmd /c gcc-4 -std=c99 -D DEBUG *.c  -o " + testcase + ".out", destDir), 0);
				// Run the output file.
				// assertEquals(runCmd("cmd /c " + testcase + ".out", destDir), 0);
			} else {
				throw new RuntimeException("Missing C compiler, such as gcc or MinGW.");
			}

			// Run the output file.
			assertEquals(runCmd("cmd /c " + testcase + ".out", destDir), 0);
		} else {
			// Use C99 standard to Compile the C program into *.out and place it in current working directory
			assertEquals(runCmd("gcc -std=c99 -D DEBUG Util.c " + testcase + ".c -o " + testcase + ".out", destDir), 0);
			// Run the generated out file
			assertEquals(runCmd("./" + testcase + ".out", destDir), 0);
		}

	}

	/**
	 * Translate a Whiley program into the C code.
	 * 
	 * The validation is to compile and run the generated C code and check if the exit value is 0.
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
			// Widen strategy
			String widen = null;
			// The function name for pattern matching 
			String func_name = null;
			// Separate the generated C code.
			switch (options.length) {
			case 0:
				// No extra options
				// Set destDir directory to be 'code/TestCaseName/naive'
				destDir = Paths.get(sourceDir + File.separator + testcase + File.separator + "naive" + File.separator);
				break;
			case 1:
				if (options[0].equals("nocopy")) {
					// Set working directory to be 'code/TestCaseName/copy'
					destDir = Paths.get(
							sourceDir + File.separator + testcase + File.separator + "copy_reduced" + File.separator);
				} else if (options[0].equals("dealloc")) {
					// Applies de-allocation analysis on naive C code
					destDir = Paths.get(
							sourceDir + File.separator + testcase + File.separator + "naive_dealloc" + File.separator);
				} else {
					throw new RuntimeException("Not Implemented");
				}
				break;
			case 2:
				if(options[0].equals("bound")){
					widen = options[1];
					destDir = Paths.get(sourceDir + File.separator + testcase + File.separator + "bound_"+widen
							+ File.separator);
				} else if(options[0].equals("pattern")){
					func_name = options[1];
					destDir = Paths.get(sourceDir + File.separator + testcase + File.separator + "pattern_"+func_name
							+ File.separator);
				} else{
					destDir = Paths.get(sourceDir + File.separator + testcase + File.separator + "copy_reduced_dealloc"
							+ File.separator);
				}				
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
			Files.copy(utilcfile.toPath(),
					Paths.get(destDir + File.separator + "Util.c"));
			Files.copy(utilhfile.toPath(),
					Paths.get(destDir + File.separator + "Util.h"));
			// (Optional) Copy 'small.in' to destDir  
			if(testcase.equals("fileread") || testcase.equals("lz77") || testcase.equals("lz77_2")){
				// 'medium.in
				File smallin = new File(System.getProperty("user.dir") + File.separator + "tests" + File.separator + "code"
						+ File.separator + "medium.in");
				
				Files.copy(smallin.toPath(), Paths.get(destDir + File.separator + "medium.in"));
				
			}
			

			// 3. Generate the C code.
			String cmd = "java -cp " + classpath + " wyopcl.WyopclMain -bp " + whiley_runtime_lib + " -code";
			// Run the code generator with optimization.
			int index=0;;
			while(index<options.length){
				String option = options[index];
				if(option.equals("bound") || option.equals("pattern")){
					// Append two options 
					cmd += " -" + option + " " +options[index+1];
					index += 2;
				}else{
					// Add extra option.
					cmd += " -" + option;
					index++;
				}			
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

	/*
	 * public void execCopyAnalysis(Path path, String testcase) { // Run commmands String cmd = "java -cp " + classpath
	 * + " wyopcl.WyopclMain -bp " + whiley_runtime_lib + " -code -copy" + " " + testcase + ".whiley"; Path destDir =
	 * Paths.get(path + File.separator + testcase + File.separator); // Generate Copy-eliminated C code runCmd(cmd,
	 * destDir); // Compile and run the generated C code compileAndRunCCode(testcase, destDir); // Delete the Wyil files
	 * inside folder try { Files.deleteIfExists(FileSystems.getDefault().getPath(destDir + testcase + ".wyil")); } catch
	 * (IOException e) { throw new RuntimeException("Errors!!!"); } }
	 */

}
