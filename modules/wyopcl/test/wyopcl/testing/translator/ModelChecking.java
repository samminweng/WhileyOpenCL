package wyopcl.testing.translator;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.OpenOption;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.apache.tools.ant.util.FileUtils;
import org.junit.Test;

import java.nio.charset.StandardCharsets;

public class ModelChecking {
	// Store the generated Whiley programs
	final Path whileyDir = Paths.get(System.getProperty("user.dir") + File.separator + "tests" + File.separator
			+ "modelchecking" + File.separator + "WhileyFiles");

	/**
	 * Recursively permutate the assignments and return the 'result' array
	 * 
	 * @param assignments
	 * @param start
	 * @param result
	 */
	void permutation(ArrayList<String> assignments, int start, ArrayList<ArrayList<String>> results) {
		if (start == assignments.size()) {
			// Put assignments to results
			results.add(new ArrayList<String>(assignments));
			return;
		}
		// Generate the combination 
		for (int i = start; i < assignments.size(); i++) {
			Collections.swap(assignments, start, i);// Swap the 'start' with 'i'
			permutation(assignments, start + 1, results); // recursively mutate the assignment array
			Collections.swap(assignments, i, start);// Swap back
		}
	}

	@Test
	/**
	 * Given three variables and produce
	 */
	public void testTwoVariables() throws IOException {
		//
		ArrayList<String> variables = new ArrayList<String>();
		variables.add("a");
		variables.add("b");
		//variables.add("c");

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

		// Print out the assignments
		//for (String assignment : assignments) {
		//	System.out.println(assignment);
		//}

		// Perform the permutation on array 'assignments'. The number is n! (in this case, 3*2*1=6)
		ArrayList<ArrayList<String>> results = new ArrayList<ArrayList<String>>();
		permutation(assignments, 0, results);
		
		// Print out each result and write each generated Whiley program as a file		
		int index=1;
		for(ArrayList<String> result : results) {
			// Create a Whiley file
			Path path = Paths.get(whileyDir + File.separator + "assignment_test"+index + ".whiley");
			// Delete the file
			Files.deleteIfExists(path);
			File file = new File(path.toString());
			file.createNewFile();// Create a new file
			
			// Write out import 
			String fixed = "import whiley.lang.*\n\n" 
			              + "public method main(System.Console console):\n";
			
			// Write the array generator
			int value =1;
			for(String variable : variables) {
				fixed += "\tint[] " + variable + " =["+ value+"; 5]\n"; 
				value++;
			}			
			
			Files.write(path, fixed.getBytes(), StandardOpenOption.CREATE);
			List<String> lines = new ArrayList<String>();
			for (String statement : result) {
				lines.add("\t"+ statement);
			}
			// Write out all lines to the Whiley program
			Files.write(path, lines, StandardOpenOption.APPEND);
			index++;
		}
	}

}
