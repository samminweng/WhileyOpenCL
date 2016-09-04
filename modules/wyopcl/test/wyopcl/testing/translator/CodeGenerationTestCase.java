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
	 * Print out the messages to console and file
	 * @param line
	 * @throws IOException
	 */
	private void printMsg(String line){
		System.out.print(line);
	}
	
	
	/**
	 * Pass the test case parameters as the arguments to the method
	 * 
	 * @param testcase
	 */
	public CodeGenerationTestCase(String testcase) {
		this.testcase = testcase;		
		printMsg("=== "+testcase+" ===\n");
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
				"SobelEdgeDetect",
				"SobelEdgeDetect1",
				"SobelEdgeDetect2", 
				"lz77"
				// "lambda"
		});
	}

	@Test
	public void testNaiveCCode() {
		printMsg( "Naive C code \n");
		util.execCodeGeneration(codeDir, testcase);
	}

	@Test
	public void testNaiveDeallocatedCCode() {
		printMsg("Naive + deallocated C code \n");
		util.execCodeGeneration(codeDir, testcase, "dealloc");
	}

	@Test
	public void testCopyCCode() {
		printMsg("Copy reduced C code \n");
		util.execCodeGeneration(codeDir, testcase, "nocopy");
	}

	@Test
	public void testCopyDeallocatedCCode() {
		printMsg("Copy reduced + deallocated C code \n");
		util.execCodeGeneration(codeDir, testcase, "nocopy", "dealloc");
	}
}
