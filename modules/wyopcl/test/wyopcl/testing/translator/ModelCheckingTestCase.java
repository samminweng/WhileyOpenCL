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
	private ArrayList<String> generateWhileyPrograms(ArrayList<String> variables) {
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
				String testcase = "assignment_" + numVars + "Vars_test" + index;
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
				
				int i = 0;
				for (String statement : statements) {					
					lines.add("\t" + statement);
					if(i == 2) {
						// Add extra read statement
						lines.add("\tint i = b[0] //Test if there is invalid read error");
					}
					i++;
				}
				// Write out all lines to the Whiley program
				Files.write(path, lines, StandardOpenOption.APPEND);
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
	 * 1. Generate the Whiley programs
	 * 2. Compile the Whiley program into C code with either deallocation analysis, or combined copy and deallocation 
	 *    analysis
	 * 3. Compile the generated C code
	 * 4. Run the executable.
	 * 
	 */
	private void generateWhileyAndProduceCCodeAndRunIt(ArrayList<String> variables) {
		// Write out Whiley programs
		ArrayList<String> testcases = generateWhileyPrograms(variables);
		//String[] codetypes = { "dealloc", "nocopy_dealloc" };
		String[] codetypes = { "nocopy_dealloc" };

		for (String testcase : testcases) {
			// For each test case produce two kinds of code type, i.e. dealloc, and nocopy + dealloc
			for (String codetype : codetypes) {
				Path destPath = Paths.get(implDir + File.separator + codetype + File.separator + testcase);
				BaseTestUtil.createFolderAndCopyFiles(testcase, modelCheckingDir, destPath);
				String cmd = "java -cp " + BaseTestUtil.classpath + " wyopcl.WyopclMain -bp "
						+ BaseTestUtil.whiley_runtime_lib;

				switch (codetype) {
				case "dealloc":
					// Run -dealloc -code options to produce deallocated-only C code
					cmd += " -dealloc -code";
					break;
				case "nocopy_dealloc":
					// Run -nocopy -dealloc -code options to produce deallocated + copy eliminated C code
					cmd += " -nocopy -dealloc -code";
					break;
				}

				cmd += " " + testcase + ".whiley";

				// Run 'cmd' to generate C code
				BaseTestUtil.runCmd(cmd, destPath, false);
				// Print out the command
				System.out.println(cmd);

				Path destDir = Paths.get(implDir + File.separator + codetype + File.separator + testcase);
				// Compile the C code with '-D DEBUG' and run it
				// so that we can check if our assumption !a_dealloc || a != b is true
				BaseTestUtil.compileAndRunCCode(testcase, destDir, false);

			}
		}

	}

	//
	/**
	 * Given three variables and produce Whiley programs. 
	 * For each Whiley program the test produces the optimised C code
	 * and compiles and run the code.
	 */
	@Test
	public void test2Variables() throws IOException {
		// Generates the varaibles
		ArrayList<String> variables = new ArrayList<String>();
		variables.add("a");
		variables.add("b");
		generateWhileyAndProduceCCodeAndRunIt(variables);
	}

	@Test
	public void test3Variables() throws IOException {
		// Generates the varaibles
		ArrayList<String> variables = new ArrayList<String>();
		variables.add("a");
		variables.add("b");
		variables.add("c");

		generateWhileyAndProduceCCodeAndRunIt(variables);

	}

}
