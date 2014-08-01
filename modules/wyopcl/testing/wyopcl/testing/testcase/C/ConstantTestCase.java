package wyopcl.testing.testcase.C;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;

import wyopcl.testing.BaseUtil;

public class ConstantTestCase {
	private BaseUtil util;	
	@Before
	public void setUp() throws Exception {
		util = new BaseUtil();
	}
	@After
	public void tearDown() throws Exception {
		util = null;
	}
	@Ignore("#311") @Test
	public void test_Constant_Valid_1() {
		util.exec("Constant_Valid_1");
	}

	@Ignore("#311") @Test
	public void test_Constant_Valid_2() {
		util.exec("Constant_Valid_2");
	}

	@Test
	public void test_Constant_Valid_3() {
		util.exec("Constant_Valid_3");
	}

}
