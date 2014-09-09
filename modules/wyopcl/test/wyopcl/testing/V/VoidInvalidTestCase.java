package wyopcl.testing.V;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestRule;
import org.junit.rules.Timeout;

import wyopcl.testing.BaseTestUtil;

public class VoidInvalidTestCase {
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
	@Ignore("Missing Void_Invalid_1.sysout")
	@Test
	public void test_Void_Invalid_1() {
		util.exec("Void_Invalid_1");
	}
	@Ignore("Missing Void_Invalid_2.sysout")
	@Test
	public void test_Void_Invalid_2() {
		util.exec("Void_Invalid_2");
	}
	@Ignore("Missing Void_Invalid_3.sysout")
	@Test
	public void test_Void_Invalid_3() {
		util.exec("Void_Invalid_3");
	}

}
