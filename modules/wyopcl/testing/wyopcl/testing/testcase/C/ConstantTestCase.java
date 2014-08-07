package wyopcl.testing.testcase.C;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestRule;
import org.junit.rules.Timeout;

import wyopcl.testing.BaseUtil;

public class ConstantTestCase {
	@Rule public TestRule timeout = new Timeout(5000);
	private BaseUtil util;	
	@Before
	public void setUp() throws Exception {
		util = new BaseUtil();
	}
	@After
	public void tearDown() throws Exception {
		util.terminate();
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
