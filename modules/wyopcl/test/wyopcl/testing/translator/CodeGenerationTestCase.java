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
	// Standard error file
	final File stderr = new File(System.getProperty("user.dir") + File.separator + "tests" + File.separator + "code"
			+ File.separator + "Report" + File.separator + "report-stderr.txt");

	@Before
	public void initialize() throws IOException {
		// Create standard output and error file
		if (!stderr.exists()) {
			stderr.createNewFile();
		}
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
				"SobelEdgeDetect2"
				// "lambda"
		});
	}

	@Test
	public void testNaiveCCode() throws IOException {
		String line = "=== Naive C code for " + testcase + ".whiley ===\n";
		System.out.print(line);
		Files.write(stderr.toPath(), line.getBytes(), StandardOpenOption.APPEND);
		util.execCodeGeneration(codeDir, testcase);
	}

	@Test
	public void testNaiveDeallocatedCCode() throws IOException {
		String line = "=== Naive + deallocated C code for " + testcase + ".whiley ===\n";
		System.out.print(line);
		Files.write(stderr.toPath(), line.getBytes(), StandardOpenOption.APPEND);
		util.execCodeGeneration(codeDir, testcase, "dealloc");
	}

	@Test
	public void testCopyCCode() throws IOException {
		String line = "=== Copy reduced C code for " + testcase + ".whiley ===\n";
		System.out.print(line);
		Files.write(stderr.toPath(), line.getBytes(), StandardOpenOption.APPEND);
		util.execCodeGeneration(codeDir, testcase, "nocopy");
	}

	@Test
	public void testCopyDeallocatedCCode() throws IOException {
		String line = "=== Copy eliminated + deallocated C code for " + testcase + ".whiley ===\n";
		System.out.print(line);
		Files.write(stderr.toPath(), line.getBytes(), StandardOpenOption.APPEND);
		util.execCodeGeneration(codeDir, testcase, "nocopy", "dealloc");
	}
}
