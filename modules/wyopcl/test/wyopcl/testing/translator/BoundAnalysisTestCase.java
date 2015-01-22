package wyopcl.testing.translator;

import static org.junit.Assert.*;

import java.io.File;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class BoundAnalysisTestCase {
	private BaseTestUtil util;
	final String valid_path = System.getProperty("user.dir")+ File.separator + "tests" + File.separator + "bounds"
						+ File.separator+"valid"+ File.separator;

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
	public void test_While_Naive() {
		util.execBoundAnalysis(valid_path+"While", "naive");
	}
	
	@Test
	public void test_While_Gradual() {
		util.execBoundAnalysis(valid_path+"While", "gradual");
	}	
	

	@Test
	public void test_IfElse_Valid_2_Naive() {
		util.execBoundAnalysis(valid_path+"IfElse_Valid_2", "naive");
	}
	
	@Test
	public void test_IfElse_Valid_2_Gradual() {
		util.execBoundAnalysis(valid_path+"IfElse_Valid_2", "gradual");
	}
	
	@Test
	public void test_For_Valid_1_Naive() {
		util.execBoundAnalysis(valid_path+"For_Valid_1", "naive");
	}
	
	@Test
	public void test_For_Valid_1_Gradual() {
		util.execBoundAnalysis(valid_path+"For_Valid_1", "gradual");
	}
	
	//@Test
	public void test_While_Valid_1_Naive() {
		util.execBoundAnalysis(valid_path+"While_Valid_1", "naive");
	}
	
	//@Test
	public void test_While_Valid_1_Gradual() {
		util.execBoundAnalysis(valid_path+"While_Valid_1", "gradual");
	}
	
	@Test
	public void test_BoolList_Valid_2_Naive() {
		util.execBoundAnalysis(valid_path+"BoolList_Valid_2", "naive");
	}
	
	@Test
	public void test_BoolList_Valid_2_Gradual() {
		util.execBoundAnalysis(valid_path+"BoolList_Valid_2", "gradual");
	}
	
}
