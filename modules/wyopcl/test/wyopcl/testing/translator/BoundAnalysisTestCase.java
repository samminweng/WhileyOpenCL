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
	public void test_Valid_While_Naive() {
		util.exec(valid_path+"While", "naive");
	}
	
	@Test
	public void test_Valid_While_Gradual() {
		util.exec(valid_path+"While", "gradual");
	}	
	
	
	@Test
	public void test_Valid_IfElse_Valid_1_Naive() {
		util.exec(valid_path+"IfElse_Valid_1", "naive");
	}
	
	@Test
	public void test_Valid_IfElse_Valid_1_Gradual() {
		util.exec(valid_path+"IfElse_Valid_1", "gradual");
	}

	@Test
	public void test_Valid_IfElse_Valid_2_Naive() {
		util.exec(valid_path+"IfElse_Valid_2", "naive");
	}
	
	@Test
	public void test_Valid_IfElse_Valid_2_Gradual() {
		util.exec(valid_path+"IfElse_Valid_2", "gradual");
	}
	
	@Test
	public void test_Valid_For_Valid_1_Naive() {
		util.exec(valid_path+"For_Valid_1", "naive");
	}
	
	@Test
	public void test_Valid_For_Valid_1_Gradual() {
		util.exec(valid_path+"For_Valid_1", "gradual");
	}
	
	@Test
	public void test_Valid_While_Valid_1_Naive() {
		util.exec(valid_path+"While_Valid_1", "naive");
	}
	
	@Test
	public void test_Valid_While_Valid_1_Gradual() {
		util.exec(valid_path+"While_Valid_1", "gradual");
	}
	
	@Test
	public void test_Valid_BoolList_Valid_2_Naive() {
		util.exec(valid_path+"BoolList_Valid_2", "naive");
	}
	
	@Test
	public void test_BoolList_Valid_2_Gradual() {
		util.exec(valid_path+"BoolList_Valid_2", "gradual");
	}
	
}
