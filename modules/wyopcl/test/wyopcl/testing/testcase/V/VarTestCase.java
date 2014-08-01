package wyopcl.testing.testcase.V;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import wyopcl.testing.BaseUtil;

public class VarTestCase {
	private BaseUtil util;	
	@Before
	public void setUp() throws Exception {
		util = new BaseUtil();
	}
	@After
	public void tearDown() throws Exception {
		util = null;
	}
	
	@Test
	public void test_VarDecl_Valid_1() {
		util.exec("VarDecl_Valid_1");
	}

	@Test
	public void test_VarDecl_Valid_2() {
		util.exec("VarDecl_Valid_2");
	}

	@Test
	public void test_VarDecl_Valid_3() {
		util.exec("VarDecl_Valid_3");
	}

	@Test
	public void test_VarDecl_Valid_4() {
		util.exec("VarDecl_Valid_4");
	}

}
