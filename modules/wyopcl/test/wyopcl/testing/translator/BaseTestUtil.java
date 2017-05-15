package wyopcl.testing.translator;

import static org.junit.Assert.assertEquals;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.FileVisitResult;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.SimpleFileVisitor;
import java.nio.file.StandardCopyOption;
import java.nio.file.attribute.BasicFileAttributes;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Scanner;
import java.util.stream.Collectors;

import org.apache.maven.artifact.ant.shaded.FileUtils;

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

	private final String whiley_runtime_lib = lib_path + "wyrt-" + version + ".jar";

	// Log file
	private final File logfile = new File(workspace_path + "tests" + File.separator + "code" + File.separator + "log.txt");

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
		boolean isSkip = true;
		// Takes out each line from expected file and check if it matches with
		// 1000 line from the output.
		while (((expected = expected_reader.readLine()) != null)) {
			if(isSkip == false){
				// Check if the output is the same as expected.
				String output = output_reader.readLine();
				System.out.println(output);
				assertEquals(expected, output);
			}

			if(expected.startsWith("Whiley => Wyil: compiled 1 file(s)")){
				isSkip = false;
			}

		}
		// Nullify the file input/output objects.
		expected_reader.close();
		output_reader.close();

	}

	/***
	 * Execute the copy analysis and compare the system output with output file.
	 * 
	 * 
	 * 
	 * @param sourceDir
	 * @param testcase
	 * @param options
	 */
	public void execCopyAnalysis(Path sourceDir, String testcase, String... options) {
		// Check the bound option 
		if(options[0] != "-nocopy"){
			throw new RuntimeException("Not passing the 'copy' option in " + testcase + " test case");
		}
		// Get the assertion option (-ea runtime option enables assertion)
		String ea = "disable_assertion";
		if(options.length == 3){
			ea = "enable_assertion";
		}

		Process process;
		try {
			Path destDir = Paths.get(sourceDir + File.separator + testcase + File.separator);
			Path sysout = Paths.get(sourceDir + File.separator + testcase 
					+ File.separator + testcase+"_nocopy_"+ea+".sysout");
			// Make the command
			String cmd = makeCmd(testcase, options);

			// Get the runtime.
			Runtime rt = Runtime.getRuntime();
			// Change the folder Run the command
			process = rt.exec(cmd, null, destDir.toFile());

			process.waitFor();

			// Start the process to analyse the bounds
			InputStream input = process.getInputStream();

			// Check the bound results against pre-stored results
			assertOutput(new BufferedReader(new InputStreamReader(input, Charset.forName("UTF-8"))),
					Files.newBufferedReader(sysout, StandardCharsets.UTF_8));

			// Remove all generated WyIL files.
			Files.deleteIfExists(Paths.get(destDir + testcase + ".wyil"));
		} catch (Exception e) {
			throw new RuntimeException("Test file: " + testcase + ".whiley", e);
		}

		process.destroy();


	}



	/**
	 * Run pattern matching and pattern transformation.
	 * The analysis results are compared with the pre-stored ones,
	 * to check if the output are the same. 
	 * 
	 * @param baseDir
	 * @param testcase
	 * @param options
	 */
	public void execPatternMatch(Path baseDir, String testcase, String... options) {
		// Check the bound option 
		if(options[0] != "-pattern"){
			throw new RuntimeException("Not passing the 'pattern' option in " + testcase + " test case");
		}
		
		Process process;
		try {		
			//Path destDir = Paths.get(sourceDir + File.separator + testcase + File.separator);
			Path sysout = Paths.get(baseDir + File.separator + "Sysout" + File.separator + testcase + ".sysout");
			// Make the command
			String cmd = makeCmd(testcase, options);

			// Get the runtime.
			Runtime rt = Runtime.getRuntime();
			// Change the folder Run the command
			process = rt.exec(cmd, null, baseDir.toFile());

			process.waitFor();

			// Start the process to analyse the bounds
			InputStream input = process.getInputStream();

			// Check the bound results against pre-stored results
			assertOutput(new BufferedReader(new InputStreamReader(input, Charset.forName("UTF-8"))),
					Files.newBufferedReader(sysout, StandardCharsets.UTF_8));

			// Remove all generated WyIL files.
			Files.deleteIfExists(Paths.get(baseDir + testcase + ".wyil"));
		} catch (Exception e) {
			throw new RuntimeException("Test file: " + testcase + ".whiley", e);
		}

		process.destroy();


	}



	/**
	 * Analyze the bounds of a Whiley program using naive or gradual widening strategy,
	 * and compare the bound analysis with the pre-stored results.
	 * 
	 * @param path_whiley
	 * @param widen
	 */
	public void execBoundAnalysis(Path sourceDir, String testcase, String... options) {

		// Get the widen strategy
		String strategy = "naive";
		// Get 'Traversal' option
		String traversal = "DF";
		// Iterate all options to obtain all settings
		for(int index=0; index<options.length;index++){
			String option = options[index];
			if(option == "-bound"){
				strategy = options[index+1];
			}else if(option == "-traversal"){
				traversal = options[index+1];
			}
		}

		Process process;
		try {		
			Path destDir = Paths.get(sourceDir + File.separator + testcase);
			// Copy source.whiley to destDir folder
			Files.copy(Paths.get(sourceDir + File.separator + testcase + ".whiley"),
					Paths.get(destDir + File.separator + testcase + ".whiley"),
					StandardCopyOption.REPLACE_EXISTING);

			Path sysout = Paths.get(destDir + File.separator + traversal+"_"+strategy +"_bound.sysout");
			// Make the command
			String cmd = makeCmd(testcase, options);

			// Get the runtime.
			Runtime rt = Runtime.getRuntime();
			// Change the folder Run the command
			process = rt.exec(cmd, null, destDir.toFile());

			//process.waitFor();

			// Start the process to analyse the bounds
			InputStream input = process.getInputStream();

			Scanner in_sc = new Scanner(input);
			//BufferedReader output_reader = new BufferedReader(new InputStreamReader(input, Charset.forName("UTF-8")));
			BufferedReader expected_reader = Files.newBufferedReader(sysout, StandardCharsets.UTF_8);

			// Check the bound results against pre-stored results
			String expected = null;
			boolean isSkip = true;

			// Takes out each line from expected file and check if it matches with
			// 1000 line from the output.
			while (((expected = expected_reader.readLine()) != null)) {
				if(isSkip == false){
					// Check if the output is the same as expected.
					String output = in_sc.nextLine();
					System.out.println(output);
					assertEquals(expected, output);					
				}

				if(expected.startsWith("Whiley => Wyil: compiled 1 file(s)")){
					isSkip = false;
				}

			}
			// Nullify the file input/output objects.
			expected_reader.close();
			in_sc.close();

			process.waitFor();
			if(process.exitValue() != 0){
				throw new RuntimeException("Fail " + testcase + ".whiley\t Exit value:"+process.exitValue()); 
			}

			// Remove all generated WyIL files.
			Files.deleteIfExists(Paths.get(destDir + testcase + ".wyil"));
		} catch (Exception e) {
			throw new RuntimeException("Test file: " + testcase + ".whiley", e);
		}

		process.destroy();

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
	private int runCmd(String cmd, Path workingDir, boolean isWriteOut) {
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
			FileWriter pbmwriter = null;
			if(isWriteOut){
				// Write output as a PBM file.
				File pbmfile = new File(workingDir+ File.separator +"output.pbm");
				pbmfile.delete();
				pbmfile.createNewFile();
				// Create a writer
				pbmwriter = new FileWriter(pbmfile, true);
			}

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
					if(isWriteOut){
						// Write out line to a file
						pbmwriter.write(line+"\n");
					}		
				}
			}
			// Close the writer
			if(isWriteOut){
				pbmwriter.close();
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
	 * Copy input files to generated C code for some test cases, e.g. LZ77 or SobelEdge
	 * 
	 * 
	 * @param testcase
	 * @param basePath
	 * @param destPath
	 */
	private void copyInputFiles(String testcase, Path basePath, Path destPath){
		try {
			if(testcase.equals("lz77") || testcase.equals("lz77_2")){
				// Copy 'small.in' to the generated fold
				FileUtils.copyFileToDirectory(
						new File(basePath + File.separator +"Inputfiles"+ File.separator + "small.in"),
						destPath.toFile());
			}else if(testcase.equals("lz77_3")){
				// Copy 'small.dat' files to the folder
				FileUtils.copyFileToDirectory( new File(basePath + File.separator +"Inputfiles"+ File.separator + "small.dat"), 
						destPath.toFile());
			}else if(testcase.equals("lz77_compress")){
				// Copy 'small.dat' files to the folder
				FileUtils.copyFileToDirectory( new File(basePath + File.separator +"Inputfiles"+ File.separator + "input2x.in"), 
						destPath.toFile());
			}else if (testcase.equals("fileread") || testcase.equals("fileread2")
					|| testcase.equals("SobelEdge1") || testcase.equals("SobelEdge2")){
				// Copy PBM image files to the folder
				FileUtils.copyFileToDirectory( new File(basePath + File.separator +"Inputfiles"+ File.separator + "image32x32.pbm"), 
						destPath.toFile());
			}
		} catch (IOException e) {
			throw new RuntimeException("Unable to copy files from 'Inputfiles' folder");
		}
	}


	/**
	 * Create the 'destPath' folder 
	 * 
	 * And copy all the required C files or input files from 'sourcePath' to 'destPath'
	 * 
	 * @param testcase
	 * @param sourcePath 
	 * @param destPath
	 */
	private void createFolderAndCopyFiles(String testcase, Path basePath, Path destPath) {
		try {

			// Create the destDir folder.
			if (Files.exists(destPath)) {
				// If destDir exists, then recursively Delete files in the destDir folder.
				FileUtils.cleanDirectory(destPath.toFile());
			} else {
				// Create destDir subfolder
				FileUtils.mkdir(destPath.toString());
			}

			// 1. Copy source Whiley program to destDir directory.
			FileUtils.copyFileToDirectory(new File(basePath + File.separator +"Whileyfiles"+ File.separator + testcase + ".whiley"),
					destPath.toFile());
			// 2. Copy Util.c/WyRT.c and Util.h/WyRT.h to destDir
			FileUtils.copyFileToDirectory(new File(workspace_path + "tests" + File.separator + "code" + File.separator + File.separator+ "Util.c"),
					destPath.toFile());
			FileUtils.copyFileToDirectory(new File(workspace_path + "tests" + File.separator + "code" + File.separator + File.separator+ "WyRT.c"),
					destPath.toFile());
			FileUtils.copyFileToDirectory(new File(workspace_path + "tests" + File.separator + "code" + File.separator + File.separator+ "Util.h"),
					destPath.toFile());
			FileUtils.copyFileToDirectory(new File(workspace_path + "tests" + File.separator + "code" + File.separator + File.separator+ "WyRT.h"),
					destPath.toFile());
		} catch (Exception ex) {
			throw new AssertionError("Fails to create the " + destPath + " folder");
		}
	}

	/**
	 * Use GCC 5.x C11 standard to compile the generated C code into executables.
	 * 
	 * @param testcase
	 * @param destDir
	 * @param isWriteOut decides whether to write output to a file or not.
	 */
	private void compileAndRunCCode(String testcase, Path destDir, boolean isWriteOut) {
		// Get Operation System.
		// 4. Compile and run the C code.
		if (System.getProperty("os.name").toLowerCase().indexOf("win") >= 0) {
			// This option requires the Cygwin and gcc, or MinGW
			// Compile the *.c using GCC
			String path = System.getenv("PATH");// Get PATH environment variable.
			if (path.contains("MinGW")) {
				// Check the exit value. If not 0, the compilation has errors.
				assertEquals(runCmd("cmd /c gcc -std=c11 -D DEBUG *.c -o " + testcase + ".out", destDir, isWriteOut), 0);
			} /*else if (path.contains("cygwin")) {
				// Gcc is a link (Windows command does not get it), so call its actual name (i.e. gcc-3 or gcc-4)
				assertEquals(runCmd("cmd /c gcc-4 -std=c11 -D DEBUG *.c  -o " + testcase + ".out", destDir), 0);
				// Run the output file.
				// assertEquals(runCmd("cmd /c " + testcase + ".out", destDir), 0);
			}*/ else {
				throw new RuntimeException("Missing C compiler, such as gcc or MinGW.");
			}

			// Run the output file.
			assertEquals(runCmd("cmd /c " + testcase + ".out", destDir, isWriteOut), 0);
		} else {
			// Use C11 standard to Compile the C program into *.out and place it in current working directory
			assertEquals(runCmd("gcc -std=c11 -D DEBUG Util.c WyRT.c "+testcase+".c -o " + testcase + ".out", destDir, isWriteOut), 0);
			// Run the generated out file
			assertEquals(runCmd("./" + testcase + ".out", destDir, isWriteOut), 0);
		}

	}

	/***
	 * Verify the output file is the same as the one of naive code
	 * 
	 * 
	 * @param testcase
	 * @param sourceDir
	 * @param codegen
	 */
	public void verifyOutput(String testcase, Path sourceDir, String codegen){
		if(testcase.equals("SobelEdge1")||testcase.equals("SobelEdge2")){
			// The output file of naive code
			File naiveOutput = new File(sourceDir + File.separator + testcase + File.separator
					+ "naive" + File.separator + "output.pbm");
			// The new output file  
			File codegenOutput = new File(sourceDir + File.separator + testcase + File.separator
					+ codegen + File.separator + "output.pbm");
			try {
				FileUtils.contentEquals(naiveOutput, codegenOutput);
			} catch (IOException e) {
				throw new RuntimeException("Outputs are not the same");
			}
		}
		return;
	}


	/**
	 * Make the command line with respect to the passing options.
	 * 
	 * @return the command line that runs on 
	 */
	private String makeCmd(String testcase, String... options){ 
		String cmd = "java -cp " + classpath + " wyopcl.WyopclMain -bp " + whiley_runtime_lib;
		// Run the code generator with optimization.
		int index=0;
		while(index<options.length){
			String option = options[index];
			cmd += " " + option;
			index++;
		}
		// Add test case name
		cmd += " " + testcase + ".whiley";

		return cmd;
	}

	/**
	 * Extract the option value to create the destination folder, which stores all generated 
	 * C code.
	 * 
	 * @param baseDir
	 * @param testcase
	 * @param options
	 * @return
	 */
	private Path processOptions(Path baseDir, String testcase, String... options){
		Path destDir;
		String path = baseDir + File.separator + "impl"+ File.separator+ testcase;
		// Iterate the options and find the type of generated code.
		int index = 0;
		switch(options[0]){
		case "-bound":
			path += File.separator + options[1]+ "_bound";
			index = index +2;
			break;
		case "-pattern":
			path += File.separator + "enable_pattern";
			index = index +2;
			break;
		case "-nocopy":
			if(options[1] == "-ea"){
				path += File.separator + "enable_assertion";
				index = index +2;
			}else{
				path += File.separator + "disable_assertion";
				index = index +1;
			}
			break;
		case "-code":
			index++;
			break;
		}


		if(options.length == index){
			// Generate 'naive' C code
			path += File.separator + "naive";
		}else if(options.length == index + 1){
			// Generate 'nocopy' 'dealloc' C code
			path += File.separator + options[index].replace("-", "");
		}else if(options.length == index + 2){
			// Generate 'nocopy_dealloc' C code
			path += File.separator + options[index].replace("-", "")
					+ "_" + options[index+1].replace("-", "");
		}

		destDir = Paths.get(path);

		return destDir;
	}



	/**
	 * Translate a Whiley program into the C code.
	 * 
	 * The validation is to compile and run the generated C code and check if the exit value is 0.
	 * 
	 *
	 * @param baseDir
	 *            the directory of source Whiley program.
	 * @param destDir
	 *            the directory of generated code.
	 * @param testcase
	 *            the file name
	 * @param options
	 *            the extra options, e.g. 'copy'
	 */
	public void execCodeGeneration(Path baseDir, String testcase, String... options) {
		try {
			// 1. Find the destination folder
			Path destDir= processOptions(baseDir, testcase, options);

			// 2. Prepare folder and copy files
			createFolderAndCopyFiles(testcase, baseDir, destDir);

			// 3. Make the command line arguments.
			String cmd = makeCmd(testcase, options);

			// 4. Generate the C code
			runCmd(cmd, destDir, false);

			// (Optional) Copy input files to folder
			copyInputFiles(testcase, baseDir, destDir);

			// Check if *.c and *.h files are generated or not.
			assertEquals(Files.exists(Paths.get(destDir + File.separator + testcase + ".c")), true);
			assertEquals(Files.exists(Paths.get(destDir + File.separator + testcase + ".h")), true);

			// Get Operation System.
			if(testcase.equals("SobelEdge1")|| testcase.equals("SobelEdge2")){
				// Write output to a PBM file
				compileAndRunCCode(testcase, destDir, true);
			}else{
				compileAndRunCCode(testcase, destDir, false);
			}

			// Delete the Wyil files inside folder
			Files.deleteIfExists(Paths.get(baseDir + testcase + ".wyil"));

		} catch (Exception e) {
			throw new RuntimeException("Test file: " + testcase + ".whiley", e);
		}
	}


}
