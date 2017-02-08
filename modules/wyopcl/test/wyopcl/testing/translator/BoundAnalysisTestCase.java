package wyopcl.testing.translator;

import java.io.File;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.Collection;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;
@RunWith(Parameterized.class)
public class BoundAnalysisTestCase {
	private BaseTestUtil util;
	final Path codeDir = Paths.get(System.getProperty("user.dir")+ File.separator + "tests" + File.separator + "bounds");
	private String testcase;// A list of test cases
	
	@Before
	public void initialize() throws Exception {
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
	public BoundAnalysisTestCase(String testcase) {
		this.testcase = testcase;
		System.out.print("=== "+testcase+" ===\n");
	}
	
	@Parameterized.Parameters(name = "{index}:{0}")
	public static Collection<String> testCases() {
		
		// Add a list of test cases
		return Arrays.asList(new String[] { 
				"IfElse", 
				"WhileLoop",
				"WhileLoop1", 
				"bubblesort"
			});
	}
	
	@Test
	public void testBoundNaiveWiden() {
		System.out.print("Bound Analysis: Naive Widen Bound\n");
		util.execCodeGeneration(codeDir, testcase, "bound", "naive");
	}
	
	@Test
	public void testBoundGradualWiden() {
		System.out.print("Bound Analysis: Gradual Widen Bound\n");
		util.execCodeGeneration(codeDir, testcase, "bound", "widen");
	}
	
	
}
