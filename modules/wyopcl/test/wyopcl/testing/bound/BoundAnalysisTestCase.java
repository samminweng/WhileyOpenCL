package wyopcl.testing.bound;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class BoundAnalysisTestCase {
	private BaseTestUtil util;

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
		util.exec_naive_widening("While");
	}
	
	@Test
	public void test_While_Gradual() {
		util.exec_gradual_widening("While");
	}	
	
	
	@Test
	public void test_IfElse_Valid_1_Naive() {
		util.exec_naive_widening("IfElse_Valid_1");
	}
	
	@Test
	public void test_IfElse_Valid_1_Gradual() {
		util.exec_gradual_widening("IfElse_Valid_1");
	}

	@Test
	public void test_IfElse_Valid_2_Naive() {
		util.exec_naive_widening("IfElse_Valid_2");
	}
	
	@Test
	public void test_IfElse_Valid_2_Gradual() {
		util.exec_gradual_widening("IfElse_Valid_2");
	}
	
	@Test
	public void test_For_Valid_1_Naive() {
		util.exec_naive_widening("For_Valid_1");
	}
	
	@Test
	public void test_For_Valid_1_Gradual() {
		util.exec_gradual_widening("For_Valid_1");
	}
	
	@Test
	public void test_While_Valid_1_Naive() {
		util.exec_naive_widening("While_Valid_1");
	}
	
	@Test
	public void test_While_Valid_1_Gradual() {
		util.exec_gradual_widening("While_Valid_1");
	}
	
	@Test
	public void test_BoolList_Valid_2_Naive() {
		util.exec_naive_widening("BoolList_Valid_2");
	}
	
	@Test
	public void test_BoolList_Valid_2_Gradual() {
		util.exec_gradual_widening("BoolList_Valid_2");
	}
	
}
