package wyopcl.testing.translator;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.Arrays;
import java.util.Collection;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;

/**
 * Use JUnit Parameterized Test to generate the C code for a variety of Whiley programs, and then compile and run the C
 * code. See <a href="http://www.tutorialspoint.com/junit/junit_parameterized_test.htm">junit_parameterized_test</a>
 * 
 * @author Min-Hsien Weng
 */
@RunWith(Parameterized.class)
public class CodeGenerationTestCase {
	private BaseTestUtil util;
	final Path codeDir = Paths.get(System.getProperty("user.dir") + File.separator + "tests" + File.separator + "code");
	private String testcase;// A list of test cases

	@Before
	public void initialize() throws IOException {
		util = new BaseTestUtil();
	}

	@After
	public void tearDown() throws Exception {
		util.terminate();
		util = null;
	}

	/**
	 * Pass the test case parameters as the arguments to the method
	 * 
	 * @param testcase
	 */
	public CodeGenerationTestCase(String testcase) {
		this.testcase = testcase;		
		System.out.print("=== "+testcase+" ===\n");
	}

	@Parameterized.Parameters(name = "{index}:{0}")
	public static Collection<String> testCases() {
		return Arrays.asList(new String[] { 
				"rectangle",
				"swap",
				"reverse",
				"mergesort",
				"bubblesort",
				"newTicTacToe",
				"MatrixMult",
				"factorial",
				"Fibonacci",
				"MatrixMult2",
				"MatrixMult3",
				"gcd",
				"CoinGame",
				"CoinGame1",
				"CoinGame2",
				"CoinGame3",
				"CoinGame4",
				"nqueens",
				"nqueens2",
				"FunctionCall1",
				"FunctionCall2",
				"FunctionCall3",
				"FunctionCall4",
				"FunctionOverload", // Define types and functions with the same name 
				"FunctionOverload2", // Define two functions with the same name
				"ArrayAppend", // Test 'append' function
				"ArrayAppend2", // Test 'append' function at WyRT runtime library
				"ArrayAppend3", // Test 'toString' function in cashtill test case 
				"cashtill",
				"lz77",
				"lz77_2",
				"fileread", //Read 'feep.pbm' as a byte array
				"fileread2",// Read 'feep.pbm' and output the array to console 
				"SobelEdge1", // Read 'feep.pbm', detect the edges and output the resulting array
				"SobelEdge2", // Similar to 'SobelEdge1' with additional 'image' structure
				
		});
	}

	@Test
	public void testNaiveCCode() {
		System.out.print("Naive C code \n");
		util.execCodeGeneration(codeDir, testcase);
	}

	@Test
	public void testNaiveDeallocatedCCode() {
		System.out.print("Naive + deallocated C code \n");
		util.execCodeGeneration(codeDir, testcase, "dealloc");
		// Check output 
		util.verifyOutput(testcase, codeDir, "dealloc");
	}

	@Test
	public void testNoCopyCCode() {
		System.out.print("Copy eliminated C code \n");
		util.execCodeGeneration(codeDir, testcase, "nocopy");
		// Verify output of sobel edges
		util.verifyOutput(testcase, codeDir, "nocopy");
	}

	@Test
	public void testNoCopyDeallocatedCCode() {
		System.out.print("Copy eliminated + deallocated C code \n");
		util.execCodeGeneration(codeDir, testcase, "nocopy", "dealloc");
		// Check output 
		util.verifyOutput(testcase, codeDir, "nocopy_dealloc");
	}	
	
}
