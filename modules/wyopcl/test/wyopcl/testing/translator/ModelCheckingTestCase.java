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
				switch (category) {
				case "functioncall":
					// Add a function that may return input 'x'
					lines.add("//function 'func' that may return input 'x'");
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
					break;
				case "functioncall2":
					// Add a function that never return 'x'
					lines.add("//Function 'func' never returns input 'x'");
					lines.add("function func(int[] x, int num) -> int[]:");
					lines.add("\tint[] a = [0;3]");
					lines.add("\tint[] b = [1;3]");
					lines.add("\tx[0] = num // Change 'x'");
					lines.add("\tint[] c = a");
					lines.add("\tint[] d = b");
					lines.add("\tif num >9:");
					lines.add("\t\treturn c // Does not return 'x'");
					lines.add("\telse:");
					lines.add("\t\treturn d // Does not return 'x'");
					break;
				case "functioncall3":
					// Add a function that always return input 'a'
					lines.add("//Function 'func' always returns input 'a'");
					lines.add("function func(int[] a) -> int[]:");
					lines.add("\tint i = 0");
					lines.add("\twhile i < |a|:");
					lines.add("\t\ta[i] = 5");
					lines.add("\t\ti = i + 1");
					lines.add("\treturn a");
					break;
				case "functioncall4":
					// Add a more complicated function that always return input 'a'
					lines.add("//Function 'func' always returns input 'a'");
					lines.add("function func(int[] a, int i, int j) -> int[]:");
					lines.add("\tif a[i] < a[j]:");
					lines.add("\t\ti = 0");
					lines.add("\t\twhile i < j:");
					lines.add("\t\t\ta[i] = a[j]");
					lines.add("\t\t\ti = i + 1");
					lines.add("\t\treturn a");
					lines.add("\telse:");
					lines.add("\t\ti = j + 1");
					lines.add("\t\twhile i < |a|:");
					lines.add("\t\t\ta[i] = a[j]");
					lines.add("\t\t\ti = i + 1");
					lines.add("\t\treturn a");
					break;
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
				// Add a function call at the end of loop
				switch (category) {
				case "functioncall":
					lines.add("\t\ta = func(b, 11)");
					break;
				case "functioncall2":
					lines.add("\t\ta = func(b, 11)");
					break;
				case "functioncall3":
					lines.add("\t\ta = func(b)");
					break;
				case "functioncall4":
					lines.add("\t\ta = func(b, 2, 3)");
					break;
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

	// Return analysis result
	static final String AlwaysReturn = "AlwaysReturn";
	static final String NeverReturn = "NeverReturn";
	static final String MaybeReturn = "MaybeReturn";
	

	// Liveness analysis result
	static final String Live = "Live";
	static final String NotLive = "NotLive";

	// Read-write analysis result
	static final String ReadOnly = "ReadOnly";
	static final String	ReadWrite = "ReadWrite";

	/**
	 * Produce the combination of parameters
	 * 
	 * 
	 * @param parameters
	 * @return
	 */
	private ArrayList<String> permutateAnalysisResult(String[] parameters) {

		// Define three factors
		ArrayList<String> returnness = new ArrayList<String>();
		// Generate the combination of returness analysis
		returnness.add(AlwaysReturn + "_" + parameters[0]);
		returnness.add(AlwaysReturn + "_" + parameters[1]);
		returnness.add(MaybeReturn + "_" + parameters[0] + "|" + NeverReturn + "_" + parameters[1]);
		returnness.add(MaybeReturn + "_" + parameters[1] + "|" + NeverReturn + "_" + parameters[0]);
		returnness.add(NeverReturn + "_" + parameters[0] + "|" + NeverReturn + "_" + parameters[1]);
		returnness.add(MaybeReturn + "_" + parameters[0] + "|" + MaybeReturn + "_" + parameters[1]);

		// Produce the combination of liveness analysis
		ArrayList<String> liveness = new ArrayList<String>();
		liveness.add(Live + "_" + parameters[0] + "|" + Live + "_" + parameters[1]);
		liveness.add(Live + "_" + parameters[0] + "|" + NotLive + "_" + parameters[1]);
		liveness.add(NotLive + "_" + parameters[0] + "|" + Live + "_" + parameters[1]);
		liveness.add(NotLive + "_" + parameters[0] + "|" + NotLive + "_" + parameters[1]);

		// Produce the combination of read-write analysis
		ArrayList<String> mutateness = new ArrayList<String>();
		mutateness.add(ReadOnly + "_" + parameters[0] + "|" + ReadOnly + "_" + parameters[1]);
		mutateness.add(ReadOnly + "_" + parameters[0] + "|" + ReadWrite + "_" + parameters[1]);
		mutateness.add(ReadWrite + "_" + parameters[0] + "|" + ReadOnly + "_" + parameters[1]);
		mutateness.add(ReadWrite + "_" + parameters[0] + "|" + ReadWrite + "_" + parameters[1]);

		// Produce the final combination
		ArrayList<String> combination = new ArrayList<String>();
		for (String live : liveness) {
			for (String mutate : mutateness) {
				for (String ret : returnness) {
					combination.add(live + "\t" + mutate + "\t" + ret);
				}
			}
		}
		assert combination.size() == 96;
		for (int index = 1; index <= combination.size(); index++) {
			System.out.println("Test case " + index + "\t" + combination.get(index - 1));
		}

		return combination;
	}

	/**
	 * Generate the called function 'r = func(a1, a2) ' with respect to below setting: a1: live / not live read-only /
	 * read-write a2: live / not live read-only / read-write ---------------------------- always-returned a1/
	 * always-returned a2/ maybe a1 + never a2 / maybe a2 + never a1 / never a1 + never a2 / maybe a1 + maybe a2
	 * 
	 * @param variables
	 * @param category
	 * @return
	 */
	private ArrayList<String> generateWhileyProgramsV2(String category, String[] parameters) {
		ArrayList<String> testcases = new ArrayList<String>();
		try {
			//String[] parameters = { "a", "b" };
			ArrayList<String> combination = permutateAnalysisResult(parameters);

			// // Take out each item from the collection and write as a Whiley file (*.whiley)
			for (int index = 1; index <= combination.size(); index++) {
				String testcase = category + "_test" + index;
				// Put test case to 'testcases' array
				testcases.add(testcase);
				// Create a Whiley file
				Path path = Paths.get(whileyDir + File.separator + category + File.separator + testcase + ".whiley");
				// Delete the file
				//
				Files.deleteIfExists(path);
				File file = new File(path.toString());
				file.createNewFile();// Create a new file
				// Get configure
				String c = combination.get(index - 1);
				String[] config = c.split("\t");
				// Get the liveness
				String liveness = config[0];
				String mutateness = config[1];
				String returnness = config[2];
				//
				List<String> lines = new ArrayList<String>();
				// Write out import
				lines.add("import whiley.lang.*\n");
				// Write out the called function
				lines.add("function func(int[] " + parameters[0] + ", int[] " + parameters[1] + ") -> int[]:");
				// Get read-write property of parameters
				String[] readwrite = mutateness.split("\\|");
				// Go through each parameter's readwrite property
				for (int i = 0; i < parameters.length; i++) {
					if (readwrite[i].contains("ReadWrite")) {
						// Add an array update
						lines.add("\t" + parameters[i] + "[0] = 0" + "\t//" + readwrite[i]);
					} else {
						// Add a read statement
						lines.add("\tint r" + parameters[i] + " = " + parameters[i] + "[0]" + "\t//" + readwrite[i]);
					}
				}
				// Get the return properties of parameters
				String[] return_properties = returnness.split("\\|");
				if (return_properties.length == 1) {// Always returned
					// Get the parameter
					String parameter = return_properties[0].split("_")[1];
					lines.add("\treturn " + parameter + "\t//" + return_properties[0]);
				} else {
					// Store all never-returned parameters
					ArrayList<String> neverReturnedParameters = new ArrayList<String>();
					// Go through each parameter's return property
					for (String ret : return_properties) {
						String parameter = ret.split("_")[1];
						if (ret.contains("NeverReturn")) {
							neverReturnedParameters.add(parameter);
						}
					}
					// All parameters are never returned
					if (neverReturnedParameters.size() == parameters.length) {
						lines.add("\treturn [3;3]" + "\t//" + returnness);
					} else if (neverReturnedParameters.size() == 0) {
						// all parameters may be returned
						// Add a if-else branch
						lines.add("\tif " + parameters[0] + "[0] == " + parameters[1] + "[0]:" + "\t// " + returnness);
						lines.add("\t\treturn " + parameters[0]);
						lines.add("\telse:");
						lines.add("\t\treturn " + parameters[1]);
					} else {
						// Some parameters may be returned
						lines.add("\tif " + parameters[0] + "[0] == " + parameters[1] + "[0]:" + "\t// " + returnness);
						if (neverReturnedParameters.contains(parameters[0])) {
							lines.add("\t\treturn [3;3]");// Return a new array
						} else {
							lines.add("\t\treturn " + parameters[0]);
						}
						lines.add("\telse:");
						if (neverReturnedParameters.contains(parameters[1])) {
							lines.add("\t\treturn [3;3]");// Return a new array
						} else {
							lines.add("\t\treturn " + parameters[1]);
						}
					}
				}
				// Write the method 'main'
				lines.add("public method main(System.Console console):");
				// Write the array generator, e.g. int[] a =[2; 2]
				String[] variables = { "a", "b" };
				for (String variable : variables) {
					lines.add("\tint[] " + variable + " = [2; 2]");
				}
				// Write out a function call
				lines.add("\tint[] c = func(a, b)");// Initialise the loop variable
				// Get the live variable
				String[] live_properties = liveness.split("\\|");
				for (String live : live_properties) {
					String variable = live.split("_")[1];
					if (!live.contains("NotLive_")) {
						// Write a read command
						lines.add("\tconsole.out.println(" + variable + "[0]) //" + live);
					}
				}
				// Write out all lines to the Whiley program
				Files.write(path, lines, StandardOpenOption.CREATE);
			}
		} catch (Exception e) {
			throw new RuntimeException("Errors!!! generateWhileyProgramsV2 fails to execute!!!");
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
	private void generateWhileyAndProduceCCodeAndRunIt(ArrayList<String> testcases, String category) {
		for (String testcase : testcases) {
			Path destPath = Paths.get(implDir + File.separator + category + File.separator + testcase);
			Path sourceDir = Paths.get(modelCheckingDir + File.separator + "Whileyfiles" + File.separator + category
					+ File.separator + testcase + ".whiley");

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
	public void test2Parameters_functioncall() throws IOException {
		String[] parameters = { "a", "b" };
		ArrayList<String> testcases = generateWhileyProgramsV2("2parameter", parameters);
		generateWhileyAndProduceCCodeAndRunIt(testcases, "2parameter");
	}

	// @Test
	public void test3Variables_assignment() throws IOException {
		// Generates the varaibles
		ArrayList<String> variables = new ArrayList<String>();
		variables.add("a");
		variables.add("b");
		variables.add("c");
		ArrayList<String> testcases = generateWhileyPrograms(variables, "assignment");

		generateWhileyAndProduceCCodeAndRunIt(testcases, "assignment");

	}

	// @Test
	public void test3Variables_functioncall() throws IOException {
		// Generates the varaibles
		ArrayList<String> variables = new ArrayList<String>();
		variables.add("a");
		variables.add("b");
		variables.add("c");
		ArrayList<String> testcases = generateWhileyPrograms(variables, "functioncall");
		// The called function may return input array
		generateWhileyAndProduceCCodeAndRunIt(testcases, "functioncall");

	}

	// @Test
	public void test3Variables_functioncall2() throws IOException {
		// Generates the varaibles
		ArrayList<String> variables = new ArrayList<String>();
		variables.add("a");
		variables.add("b");
		variables.add("c");
		ArrayList<String> testcases = generateWhileyPrograms(variables, "functioncall2");
		// The called function never returns input array
		generateWhileyAndProduceCCodeAndRunIt(testcases, "functioncall2");

	}

	// @Test
	public void test3Variables_functioncall3() throws IOException {
		// Generates the varaibles
		ArrayList<String> variables = new ArrayList<String>();
		variables.add("a");
		variables.add("b");
		variables.add("c");
		ArrayList<String> testcases = generateWhileyPrograms(variables, "functioncall3");
		// The called function always returns input array
		generateWhileyAndProduceCCodeAndRunIt(testcases, "functioncall3");

	}

	// @Test
	public void test3Variables_functioncall4() throws IOException {
		// Generates the varaibles
		ArrayList<String> variables = new ArrayList<String>();
		variables.add("a");
		variables.add("b");
		variables.add("c");
		ArrayList<String> testcases = generateWhileyPrograms(variables, "functioncall4");
		// The called function always returns input array
		generateWhileyAndProduceCCodeAndRunIt(testcases, "functioncall4");

	}
}
