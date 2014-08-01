package wyopcl.testing.testcase.I;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import wyopcl.testing.BaseUtil;

public class IfElseTestCase {
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
	public void test_IfElse_Valid_1() {
		util.exec("IfElse_Valid_1");
	}

	@Test
	public void test_IfElse_Valid_2() {
		util.exec("IfElse_Valid_2");
	}

	@Test
	public void test_IfElse_Valid_3() {
		util.exec("IfElse_Valid_3");
	}

	@Test
	public void test_IfElse_Valid_4() {
		util.exec("IfElse_Valid_4");
	}

}
