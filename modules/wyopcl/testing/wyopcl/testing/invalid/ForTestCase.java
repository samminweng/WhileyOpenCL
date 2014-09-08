package wyopcl.testing.invalid;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestRule;
import org.junit.rules.Timeout;

import wyopcl.testing.BaseUtil;

public class ForTestCase{
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

	@Test
	public void test_For_Invalid_1() {
		util.exec("For_Invalid_1");
	}

	
	@Test
	public void test_For_Invalid_5() {
		util.exec("For_Invalid_5");
	}

	@Test
	public void test_For_Invalid_6() {
		util.exec("For_Invalid_6");
	}

	@Test
	public void test_For_Invalid_7() {
		util.exec("For_Invalid_7");
	}

	@Test
	public void test_For_Invalid_8() {
		util.exec("For_Invalid_8");
	}

	@Test
	public void test_For_Invalid_9() {
		util.exec("For_Invalid_9");
	}


}
