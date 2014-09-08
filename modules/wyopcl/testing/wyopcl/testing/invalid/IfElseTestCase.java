package wyopcl.testing.invalid;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestRule;
import org.junit.rules.Timeout;

import wyopcl.testing.BaseUtil;

public class IfElseTestCase {
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
	public void test_If_Invalid_1() {
		util.exec("If_Invalid_1");
	}

	@Test
	public void test_If_Invalid_2() {
		util.exec("If_Invalid_2");
	}

	@Test
	public void test_If_Invalid_3() {
		util.exec("If_Invalid_3");
	}

	@Test
	public void test_If_Invalid_4() {
		util.exec("If_Invalid_4");
	}
	
	@Test
	public void test_If_Invalid_5() {
		util.exec("If_Invalid_5");
	}

}
