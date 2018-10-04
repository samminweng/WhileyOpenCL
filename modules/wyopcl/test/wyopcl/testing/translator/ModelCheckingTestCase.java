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

import com.sun.glass.ui.CommonDialogs.Type;

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
	private ArrayList<String> generateWhileyPrograms(ArrayList<String> variables, String category) {
		ArrayList<String> testcases = new ArrayList<String>();
		try {
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

			// Take out each item from the collection and write as a Whiley file (*.whiley)
			int index = 1;
			for (ArrayList<String> statements : collections) {
				String testcase = category + "_" + numVars + "Vars_test" + index;
				// Put test case to 'testcases' array
				testcases.add(testcase);
				// Create a Whiley file
				Path path = Paths.get(whileyDir + File.separator + category + File.separator + testcase + ".whiley");
				// Delete the file

				Files.deleteIfExists(path);
				File file = new File(path.toString());
				file.createNewFile();// Create a new file

				List<String> lines = new ArrayList<String>();
				// Write out import
				lines.add("import whiley.lang.*\n");
				// Write out the function
				if (category.equals("functioncall")) {
					lines.add("function func(int[] x, int num) -> int[]:");
					lines.add("\tint[] a = [0;3]");
					lines.add("\tint[] b = [1;3]");
					lines.add("\tint[] c = a");
					lines.add("\tint[] d = b");
					lines.add("\tif num > 10:");
					lines.add("\t\treturn x");
					lines.add("\telse:");
					lines.add("\t\t\tif num >9:");
					lines.add("\t\t\t\treturn c");
					lines.add("\treturn d");
				}

				lines.add("public method main(System.Console console):");
				// Write the array generator, e.g. int[] a =[1; 5]
				int value = 1;
				for (String variable : variables) {
					lines.add("\tint[] " + variable + " =[" + value + "; 5]");
					value++;
				}
				// Write out a loop
				lines.add("\tint j = 0");// Initialise the loop variable
				lines.add("\twhile j < 10:");// Add a loop condition

				// Write out all the assignments
				int i = 0;
				for (String statement : statements) {
					lines.add("\t\t" + statement);
					if (i == 2) {
						// Add extra read statement
						lines.add("\t\tint i = b[0] //Test if there is invalid read error");
					}
					i++;
				}
				if (category.equals("functioncall")) {
					// Add a function call at the end of loop
					lines.add("\t\ta = func(b, 11)");
				}

				// Increment the loop variable
				lines.add("\t\tj = j + 1");

				// Write out all lines to the Whiley program
				Files.write(path, lines, StandardOpenOption.CREATE);
				index++;
			}
		} catch (IOException e) {
			throw new RuntimeException("Errors!!! generateWhileyPrograms fails to execute!!!");
		}

		return testcases;

	}

	/**
	 * Given a list of variable,
	 * 
	 * 1. Generate the Whiley programs 2. Compile the Whiley program into C code with either deallocation analysis, or
	 * combined copy and deallocation analysis 3. Compile the generated C code 4. Run the executable.
	 * 
	 */
	private void generateWhileyAndProduceCCodeAndRunIt(ArrayList<String> variables, String category) {
		// Write out Whiley programs
		ArrayList<String> testcases = generateWhileyPrograms(variables, category);

		for (String testcase : testcases) {
			Path destPath = Paths.get(implDir + File.separator + category + File.separator + testcase);
			Path sourceDir = Paths.get(modelCheckingDir + File.separator +"Whileyfiles" + File.separator
					                   + category + File.separator + testcase + ".whiley");
			
			BaseTestUtil.createFolderAndCopyFiles(testcase, sourceDir, destPath);
			String cmd = "java -cp " + BaseTestUtil.classpath + " wyopcl.WyopclMain -bp "
					+ BaseTestUtil.whiley_runtime_lib;

			// Run -nocopy -dealloc -code options to produce deallocated + copy eliminated C code
			cmd += " -nocopy -dealloc -code";

			cmd += " " + testcase + ".whiley";

			// Run 'cmd' to generate C code
			BaseTestUtil.runCmd(cmd, destPath, false);
			// Print out the command
			System.out.println(cmd);

			Path destDir = Paths.get(implDir + File.separator + category + File.separator + testcase);
			// Compile the C code with '-D DEBUG' and run it
			// so that we can check if our assumption !a_dealloc || a != b is true
			BaseTestUtil.compileAndRunCCode(testcase, destDir, false);

		}

	}

	//
	/**
	 * Given three variables and produce Whiley programs. For each Whiley program the test produces the optimised C code
	 * and compiles and run the code.
	 */
	@Test
	public void test2Variables_assignment() throws IOException {
		// Generates the varaibles
		ArrayList<String> variables = new ArrayList<String>();
		variables.add("a");
		variables.add("b");
		generateWhileyAndProduceCCodeAndRunIt(variables, "assignment");
	}

	@Test
	public void test3Variables_assignment() throws IOException {
		// Generates the varaibles
		ArrayList<String> variables = new ArrayList<String>();
		variables.add("a");
		variables.add("b");
		variables.add("c");

		generateWhileyAndProduceCCodeAndRunIt(variables, "assignment");

	}

	@Test
	public void test3Variables_functioncall() throws IOException {
		// Generates the varaibles
		ArrayList<String> variables = new ArrayList<String>();
		variables.add("a");
		variables.add("b");
		variables.add("c");

		generateWhileyAndProduceCCodeAndRunIt(variables, "functioncall");

	}
}
