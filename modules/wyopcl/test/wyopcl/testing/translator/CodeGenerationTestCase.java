package wyopcl.testing.translator;

import static org.junit.Assert.assertEquals;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.junit.After;
import org.junit.Assume;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;

/**
 * Use JUnit Parameterized Test to generate the C code for a variety of Whiley programs, and then compile and run the C code. 
 * See <a href="http://www.tutorialspoint.com/junit/junit_parameterized_test.htm">junit_parameterized_test</a>
 * @author Min-Hsien Weng
 */
@RunWith(Parameterized.class)
public class CodeGenerationTestCase {
	private BaseTestUtil util;
	final Path codeDir = Paths.get(System.getProperty("user.dir")+ File.separator + "tests" + File.separator + "code");
	private String testcase;// Store test case
	
	
	@Before
	public void initialize() {
		util = new BaseTestUtil();
	}
	
	@After
	public void tearDown() throws Exception {
		util.terminate();
		util = null;
	}
	
	/**
	 * Pass the test case parameters as the arguments to the method
	 * @param testcase
	 */
	public CodeGenerationTestCase(String testcase){
		this.testcase = testcase;
	}
	
	
	public static Collection<String> ignores(){
		return Arrays.asList(new String[]{
				"gcd",
				"CoinGame"
		});
	}
	
	
	@Parameterized.Parameters(name = "{index}:{0}")
	public static Collection<String> testCases() {
		return Arrays.asList(new String[] {
				"swap",
				"reverse",
				"mergesort",
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
				"nqueens2"
				//"lambda"
		});
	}
	
	
	
	
	@Test
	public void testNaiveCCode(){
		System.out.println("Generate the naive C code for " + testcase + ".whiley");
		util.execCodeGeneration(codeDir, testcase);
	}
	
	@Test
	public void testNaiveDeallocatedCCode(){
		System.out.println("Generate the naive and deallocated C code for " + testcase + ".whiley");   
		util.execCodeGeneration(codeDir, testcase, "dealloc");
	}
	
	@Test 
	public void testCopyCCode(){
		System.out.println("Generate the copy eliminated C code for " + testcase + ".whiley");   
		util.execCodeGeneration(codeDir, testcase, "copy");
	}
	
	@Test 
	public void testCopyDeallocatedCCode(){
		System.out.println("Generate the copy eliminated and deallocated C code for " + testcase + ".whiley");   
		util.execCodeGeneration(codeDir, testcase, "copy", "dealloc");
	}
}
