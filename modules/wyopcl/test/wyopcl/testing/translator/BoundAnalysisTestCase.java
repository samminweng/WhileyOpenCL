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
				"While_Valid_1"
		});
	}
	
	@Test
	public void testNaiveCCode() {
		System.out.print("Naive Bound C code \n");
		util.execCodeGeneration(codeDir, testcase, "bound", "naive");
	}
	
	@Test
	public void test_WhileLoop_Naive() {
		System.out.print("Widen Bound C code \n");
		util.execCodeGeneration(codeDir, testcase, "bound", "widen");
	}
	
	/*
	
	@Test
	public void test_WhileLoop_Gradual() {
		util.execBoundAnalysis(valid_path, "WhileLoop", "bound", "gradual");
	}	
	

	@Test
	public void test_IfElse_Valid_2_Naive() {
		util.execBoundAnalysis(valid_path, "IfElse_Valid_2", "bound", "naive");
	}
	
	@Test
	public void test_IfElse_Valid_2_Gradual() {
		util.execBoundAnalysis(valid_path, "IfElse_Valid_2", "bound", "gradual");
	}
	
	@Test
	public void test_BoolList_Valid_2_Naive() {
		util.execBoundAnalysis(valid_path, "BoolList_Valid_2", "bound", "naive");
	}
	
	@Test
	public void test_BoolList_Valid_2_Gradual() {
		util.execBoundAnalysis(valid_path, "BoolList_Valid_2", "bound", "gradual");
	}
	
	@Test
	public void test_ListAppend_Valid_3_Naive() {
		util.execBoundAnalysis(valid_path, "ListAppend_Valid_3", "bound", "naive");
	}
	
	@Test
	public void test_ListAppend_Valid_3_Gradual() {
		util.execBoundAnalysis(valid_path, "ListAppend_Valid_3", "bound", "gradual");
	}
	*/
}
