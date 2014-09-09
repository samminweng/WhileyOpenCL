package wyopcl.testing.C;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestRule;
import org.junit.rules.Timeout;

import wyopcl.testing.BaseTestUtil;

public class ContractiveInvalidTestCase{
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
	public void test_Contractive_Invalid_1() {
		util.exec("Contractive_Invalid_1");
	}

	@Test
	public void test_Contractive_Invalid_2() {
		util.exec("Contractive_Invalid_2");
	}
}
