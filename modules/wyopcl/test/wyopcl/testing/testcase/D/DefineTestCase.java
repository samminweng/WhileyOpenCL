package wyopcl.testing.testcase.D;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import wyopcl.testing.BaseUtil;

public class DefineTestCase {
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
	public void test_Define_Valid_1() {
		util.exec("Define_Valid_1");
	}

	@Test
	public void test_Define_Valid_2() {
		util.exec("Define_Valid_2");
	}

	@Test
	public void test_Define_Valid_3() {
		util.exec("Define_Valid_3");
	}

	@Test
	public void test_Define_Valid_4() {
		util.exec("Define_Valid_4");
	}

}
