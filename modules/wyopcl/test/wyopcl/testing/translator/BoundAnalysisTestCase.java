package wyopcl.testing.translator;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;

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
	
	// The function names that are used for testing pattern matching
	//private static HashMap<String, String> pattern_matching;
	
	
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
		
		/*pattern_matching = new HashMap<String, String>()
		{{
			//put("ArrayAppend", "appendArray");
		}};
		*/
		// Add a list of test cases
		return Arrays.asList(new String[] { 
				"IfElse", 
				"WhileLoop", 
				"While_Valid_1",
				//"ArrayAppend"
		});
	}
	
	@Test
	public void testNaiveWiden() {
		System.out.print("Naive Widen Bound\n");
		util.execCodeGeneration(codeDir, testcase, "bound", "naive");
	}
	
	@Test
	public void testGradualWiden() {
		System.out.print("Gradual Widen Bound\n");
		util.execCodeGeneration(codeDir, testcase, "bound", "widen");
	}
	
	/*@Test
	public void testPatternMatching(){
		if(pattern_matching.containsKey(testcase)){
			System.out.print("Pattern Matching\n");
			String func_name = pattern_matching.get(testcase);
			util.execCodeGeneration(codeDir, testcase, "pattern", func_name);
		}
		
	}*/
	
}
