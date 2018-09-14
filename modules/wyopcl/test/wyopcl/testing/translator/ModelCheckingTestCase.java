package wyopcl.testing.translator;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.OpenOption;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Scanner;
import java.util.stream.Collectors;

import org.apache.maven.artifact.ant.shaded.FileUtils;
import org.junit.Test;

import java.nio.charset.StandardCharsets;

public class ModelCheckingTestCase {

	// The source folder of Util.c Util.h WyRT.h WyRT.c
	final Path utilDir = Paths.get(System.getProperty("user.dir") + File.separator + "tests" + File.separator + "code");

	// Modelchecking folder
	final Path modelCheckingDir = Paths
			.get(System.getProperty("user.dir") + File.separator + "tests" + File.separator + "modelchecking");

	// Store the generated Whiley programs
	final Path whileyDir = Paths.get(modelCheckingDir + File.separator + "Whileyfiles");

	// Store the generated C programs
	final Path implDir = Paths.get(modelCheckingDir + File.separator + "impl");

	

	/**
	 * Run Whiley-to-C compiler to optimize and generate C code
	 * 
	 * 
	 * @param testcase
	 */
	private int runCmd(String testcase) {

		String cmd = "java -cp " + BaseTestUtil.classpath + " wyopcl.WyopclMain -bp " + BaseTestUtil.whiley_runtime_lib;
		// Run -nocopy -dealloc -code options to produce optimized C code
		cmd += " -nocopy -dealloc -code";
		cmd += " " + testcase + ".whiley";

		System.out.println(cmd);
		
		Path workingDir = Paths.get(implDir + File.separator + testcase);
		
		// Get the runtime.
		Runtime rt = Runtime.getRuntime();
		// Compile the C program
		Process process;
		int exitValue = -1;
		// Read the output of executables
		Scanner in_sc = null;
		Scanner err_sc = null;
		try {
			// Due to the limited buffer size, Windows/Linux may fail to write the large output from code generator, to
			// the input stream and may cause the process to block, and even deadlock.
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
	 * Recursively permutate the assignments and return the 'collections' array
	 * 
	 * @param assignments
	 * @param start
	 * @param result
	 */
	private void permutation(ArrayList<String> assignments, int start, ArrayList<ArrayList<String>> collections) {
		if (start == assignments.size()) {
			// Put assignments to results
			collections.add(new ArrayList<String>(assignments));
			return;
		}
		// Generate the combination
		for (int i = start; i < assignments.size(); i++) {
			Collections.swap(assignments, start, i);// Swap the 'start' with 'i'
			permutation(assignments, start + 1, collections); // recursively mutate the assignment array
			Collections.swap(assignments, i, start);// Swap back
		}
	}

	/**
	 * Given the variable set, produce the Whiley programs and write out to /modelchecking/WhileyFiles folder.
	 * 
	 * 
	 * @param variables
	 * @param collections
	 *            a collection of Whiley programs, which each contains a set of statements
	 * @throws IOException
	 */
	private ArrayList<String> generateWhileyPrograms(ArrayList<String> variables) throws IOException {
		// The number of variables
		int numVars = variables.size();
		
		ArrayList<String> assignments = new ArrayList<String>();

		// An array stores all the assignments
		for (String selected : variables) {
			ArrayList<String> others = (new ArrayList<String>(variables));
			others.remove(selected);

			// Generate the assignments with selected and other variables
			for (String other : others) {
				assignments.add(selected + " = " + other);
			}
		}

		// Perform the permutation on array 'assignments'. The number is n! (in this case, 3*2*1=6)
		ArrayList<ArrayList<String>> collections = new ArrayList<ArrayList<String>>();
		permutation(assignments, 0, collections);

		ArrayList<String> testcases = new ArrayList<String>();
		// Take out each item from the collection and write as a Whiley file (*.whiley)
		int index = 1;
		for (ArrayList<String> statements : collections) {
			String testcase = "assignment_"+numVars+"Vars_test" + index;
			// Put test case to 'testcases' array
			testcases.add(testcase);
			// Create a Whiley file
			Path path = Paths.get(whileyDir + File.separator + testcase + ".whiley");
			// Delete the file
			Files.deleteIfExists(path);
			File file = new File(path.toString());
			file.createNewFile();// Create a new file

			// Write out import
			String fixed = "import whiley.lang.*\n\n" + "public method main(System.Console console):\n";

			// Write the array generator
			int value = 1;
			for (String variable : variables) {
				fixed += "\tint[] " + variable + " =[" + value + "; 5]\n";
				value++;
			}

			Files.write(path, fixed.getBytes(), StandardOpenOption.CREATE);
			List<String> lines = new ArrayList<String>();
			for (String statement : statements) {
				lines.add("\t" + statement);
			}
			// Write out all lines to the Whiley program
			Files.write(path, lines, StandardOpenOption.APPEND);
			index++;
		}
		return testcases;
	}

	//
	/**
	 * Given three variables and produce Whiley programs. 
	 * For each Whiley program the test produces the optimised C code and compiles and run the code.
	 */
	@Test
	public void test2Variables() throws IOException {
		// Generates the varaibles
		ArrayList<String> variables = new ArrayList<String>();
		variables.add("a");
		variables.add("b");
		// variables.add("c");

		// Write out Whiley programs
		ArrayList<String> testcases = generateWhileyPrograms(variables);

		// Log file stores error messages
		File logfile = new File(modelCheckingDir + File.separator + "log.txt");
		logfile.deleteOnExit();// Delete the file 
		logfile.createNewFile();// Create the file
		
		for (String testcase : testcases) {
			Path destPath = Paths.get(implDir + File.separator + testcase);
			BaseTestUtil.createFolderAndCopyFiles(testcase, modelCheckingDir, destPath);
			String cmd = "java -cp " + BaseTestUtil.classpath + " wyopcl.WyopclMain -bp " + BaseTestUtil.whiley_runtime_lib;
			// Run -nocopy -dealloc -code options to produce optimized C code
			cmd += " -nocopy -dealloc -code";
			cmd += " " + testcase + ".whiley";

			// Run 'cmd' to generate C code
			BaseTestUtil.runCmd(cmd, destPath, false, logfile);
			
			System.out.println(cmd);
			
			Path destDir = Paths.get(implDir + File.separator + testcase);
			BaseTestUtil.compileAndRunCCode(testcase, destDir, false, logfile);
			//runCmd(testcase);
		}

	}
	
	
	@Test
	public void test3Variables() throws IOException {
		// Generates the varaibles
		ArrayList<String> variables = new ArrayList<String>();
		variables.add("a");
		variables.add("b");
		variables.add("c");

		// Write out Whiley programs
		ArrayList<String> testcases = generateWhileyPrograms(variables);

		// Log file stores error messages
		File logfile = new File(modelCheckingDir + File.separator + "log.txt");
		logfile.deleteOnExit();// Delete the file 
		logfile.createNewFile();// Create the file
		
		for (String testcase : testcases) {
			Path destPath = Paths.get(implDir + File.separator + testcase);
			BaseTestUtil.createFolderAndCopyFiles(testcase, modelCheckingDir, destPath);
			String cmd = "java -cp " + BaseTestUtil.classpath + " wyopcl.WyopclMain -bp " + BaseTestUtil.whiley_runtime_lib;
			// Run -nocopy -dealloc -code options to produce optimized C code
			cmd += " -nocopy -dealloc -code";
			cmd += " " + testcase + ".whiley";

			// Run 'cmd' to generate C code
			BaseTestUtil.runCmd(cmd, destPath, false, logfile);
			
			System.out.println(cmd);
			
			Path destDir = Paths.get(implDir + File.separator + testcase);
			BaseTestUtil.compileAndRunCCode(testcase, destDir, false, logfile);
			//runCmd(testcase);
		}

	}
	

}
