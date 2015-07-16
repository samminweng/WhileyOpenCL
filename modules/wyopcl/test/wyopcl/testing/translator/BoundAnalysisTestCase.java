package wyopcl.testing.translator;

import java.io.File;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class BoundAnalysisTestCase {
	private BaseTestUtil util;
	final String valid_path = System.getProperty("user.dir")+ File.separator + "tests" + File.separator + "bounds" + File.separator;

	@Before
	public void setUp() throws Exception {
		util = new BaseTestUtil();
	}

	@After
	public void tearDown() throws Exception {
		util.terminate();
		util = null;
	}
	
	
	@Test
	public void test_WhileLoop_Naive() {
		util.execBoundAnalysis(valid_path, "WhileLoop", "bound", "naive");
	}
	
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
	
}
