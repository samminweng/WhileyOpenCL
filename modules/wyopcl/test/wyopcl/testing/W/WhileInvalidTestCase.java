package wyopcl.testing.W;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestRule;
import org.junit.rules.Timeout;

import wyopcl.testing.BaseTestUtil;

public class WhileInvalidTestCase {
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
	public void test_While_Invalid_1() {
		util.exec("While_Invalid_1");
	}
	@Ignore("Missing While_Invalid_10.sysout")
	@Test
	public void test_While_Invalid_10() {
		util.exec("While_Invalid_10");
	}
	@Ignore("Missing While_Invalid_11.sysout")
	@Test
	public void test_While_Invalid_11() {
		util.exec("While_Invalid_11");
	}
	@Ignore("Missing While_Invalid_12.sysout")
	@Test
	public void test_While_Invalid_12() {
		util.exec("While_Invalid_12");
	}
	@Ignore("Missing While_Invalid_13.sysout")
	@Test
	public void test_While_Invalid_13() {
		util.exec("While_Invalid_13");
	}	

	@Test
	public void test_While_Invalid_2() {
		util.exec("While_Invalid_2");
	}
	
	@Test
	public void test_While_Invalid_3() {
		util.exec("While_Invalid_3");
	}
	
	@Test
	public void test_While_Invalid_4() {
		util.exec("While_Invalid_4");
	}
	@Test
	public void test_While_Invalid_5() {
		util.exec("While_Invalid_5");
	}
	@Test
	public void test_While_Invalid_6() {
		util.exec("While_Invalid_6");
	}
	@Test
	public void test_While_Invalid_7() {
		util.exec("While_Invalid_7");
	}

	@Test
	public void test_While_Invalid_8() {
		util.exec("While_Invalid_8");
	}
	
	@Test
	public void test_While_Invalid_9() {
		util.exec("While_Invalid_9");
	}

}
