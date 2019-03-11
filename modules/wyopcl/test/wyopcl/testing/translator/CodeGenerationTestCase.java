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

import org.apache.maven.artifact.ant.shaded.FileUtils;
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
				"opt_append", // Test case for arraylist-like append
				"CallerMacro1", // Test case for 'CALLER' macro
				"CallerMacro2", // Test case for 'Caller' macro
				"CallerMacro3", // Test case for 'Caller' macro
				"CallerMacro4", // Test case for 'Caller' macro
				"CallerMacro5", // Test case for 'Caller' macro
				"ResetMacro1", // Test case for 'RESET' macro
				"ResetMacro2", // Test case for 'RESET' macro
				"ResetMacro3", // Test case for 'RESET' macro
				"ResetMacro4", // Test case for 'RESET' macro
				"FunctionCall1",
				"FunctionCall2",
				"FunctionCall3",
				"FunctionCall4",
				"ArrayAppend", // Test 'append' function
				"ArrayAppend2", // Test 'append' function at WyRT runtime library
				"ArrayAppend3", // Test 'toString' function in cashtill test case
				// Not used in benchmarks
				// "rectangle", // Use 'rectangle' structure
				"swap",				
				"factorial",
				"Fibonacci",
				"gcd",
				"FunctionOverload", // Define types and functions with the same name 
				"FunctionOverload2", // Define two functions with the same name	
				"fileread", //Read 'feep.pbm' as a byte array
				"fileread2",// Read 'feep.pbm' and output the array to console
				//"nqueens", 
				// This case uses an array of structures and recursive function call, so we disable this case.
				"livecheck",
				// Micro-benchmarks
				"reverse",
				"mergesort",
				"bubblesort",
				"newTicTacToe",
				// This case uses an array of structures, which is not suitable for our deallocation macro
				// So we disable it.
				"MatrixMult",
				// Benchmarks
				"CoinGame",
				"CoinGame1",
				"CoinGame2",
				"CoinGame3",
				"CoinGame4",
				"cashtill",
				"lz77_compress", // Compress a file by appending one item to array 
				"lz77_opt_compress", // Compress a file by pre-allocating the array
				"lz77_decompress", // Uncompress the lz77 file and append to the output array
				"lz77_opt_decompress", // Optimized lz77 decompression by using ArrayList appending
				"SobelEdge", // Read 'feep.pbm', detect the edges and output the resulting array
				"IntToByte", // Generate a byte array 
				"PassedParameterTwice", // The same parameter is passed twice 
//				"Recursion"
		});
	}
	
	// Generate and optimize code with assertion enabled
	@Test
	public void testEANaiveCCode() throws IOException  {
		System.out.print("Naive C code \n");		
		util.execCodeGeneration(codeDir, testcase, "-code", "-ea");
	}

	@Test
	public void testEANaiveDeallocatedCCode() throws IOException  {
		System.out.print("Naive + deallocated C code \n");		
		util.execCodeGeneration(codeDir, testcase, "-code", "-dealloc", "-ea");
		// Check output 
		util.verifyOutput(testcase, codeDir, "dealloc");
	}

	@Test
	public void testEANoCopyCCode() throws IOException {
		System.out.print("Copy eliminated C code \n");		
		util.execCodeGeneration(codeDir, testcase, "-code", "-nocopy", "-ea");
		// Verify output of sobel edges
		util.verifyOutput(testcase, codeDir, "nocopy");
	}

	@Test
	public void testEANoCopyDeallocatedCCode() throws IOException {
		System.out.print("Copy eliminated + deallocated C code \n");		
		util.execCodeGeneration(codeDir, testcase, "-code", "-nocopy", "-dealloc", "-ea");
		// Check output 
		util.verifyOutput(testcase, codeDir, "nocopy_dealloc");
	}
	
}
