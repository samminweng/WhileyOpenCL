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
	public void test_If() {
		util.exec("If");
	}	
	
	@Test
	public void test_If_Func_Call() {
		util.exec_Func_Call("If");
	}
	
	
	@Test
	public void test_While() {
		util.exec("While");
	}
	
	@Test
	public void test_While_Func_Call() {
		util.exec_Func_Call("While");
	}
	
	@Test
	public void test_While_1() {
		util.exec("While_1");
	}
	
	@Test
	public void test_While_1_Func_Call() {
		util.exec_Func_Call("While_1");
	}
	
	@Test
	public void test_IfElse_Valid_1() {
		util.exec("IfElse_Valid_1");
	}
	
	@Test
	public void test_IfElse_Valid_1_Func_Call() {
		util.exec_Func_Call("IfElse_Valid_1");
	}

	@Test
	public void test_IfElse_Valid_2() {
		util.exec("IfElse_Valid_2");
	}
	
	@Test
	public void test_IfElse_Valid_2_Func_Call() {
		util.exec_Func_Call("IfElse_Valid_2");
	}
	
	@Test
	public void test_For_Valid_1() {
		util.exec("For_Valid_1");
	}
	
	@Test
	public void test_For_Valid_1_Func_Call() {
		util.exec_Func_Call("For_Valid_1");
	}
	
	@Test
	public void test_While_Valid_1() {
		util.exec("While_Valid_1");
	}
	
	@Test
	public void test_While_Valid_1_Func_Call() {
		util.exec_Func_Call("While_Valid_1");
	}
	
	@Test
	public void test_BoolList_Valid_2() {
		util.exec("BoolList_Valid_2");
	}
	
	@Test
	public void test_BoolList_Valid_2_Func_Call() {
		util.exec_Func_Call("BoolList_Valid_2");
	}
	
}
