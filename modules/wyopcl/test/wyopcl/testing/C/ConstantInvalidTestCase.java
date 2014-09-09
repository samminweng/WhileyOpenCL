package wyopcl.testing.C;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestRule;
import org.junit.rules.Timeout;

import wyopcl.testing.BaseTestUtil;

public class ConstantInvalidTestCase {
	@Rule public TestRule timeout = new Timeout(5000);
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
	@Ignore("Missing the Constant_Invalid_1.sysout")
	public void test_Constant_Invalid_1() {
		util.exec("Constant_Invalid_1");
	}

	@Test
	public void test_Constant_Invalid_2() {
		util.exec("Constant_Invalid_2");
	}

	

}
