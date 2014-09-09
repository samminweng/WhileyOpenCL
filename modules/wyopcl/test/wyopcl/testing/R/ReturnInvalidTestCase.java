package wyopcl.testing.R;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestRule;
import org.junit.rules.Timeout;

import wyopcl.testing.BaseTestUtil;

public class ReturnInvalidTestCase {
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
	public void test_Return_Invalid_1() {
		util.exec("Return_Invalid_1");
	}
	@Ignore("Missing Return_Invalid_10.sysout")
	@Test
	public void test_Return_Invalid_10() {
		util.exec("Return_Invalid_10");
	}
	@Ignore("Missing Return_Invalid_11.sysout")
	@Test
	public void test_Return_Invalid_11() {
		util.exec("Return_Invalid_11");
	}
	
	@Test
	public void test_Return_Invalid_2() {
		util.exec("Return_Invalid_2");
	}
	
	
	@Test
	public void test_Return_Invalid_3() {
		util.exec("Return_Invalid_3");
	}
	
	@Test
	public void test_Return_Invalid_4() {
		util.exec("Return_Invalid_4");
	}
	
	@Test
	public void test_Return_Invalid_5() {
		util.exec("Return_Invalid_5");
	}
	
	@Test
	public void test_Return_Invalid_6() {
		util.exec("Return_Invalid_6");
	}

	@Test
	public void test_Return_Invalid_7() {
		util.exec("Return_Invalid_7");
	}
	
	@Test
	public void test_Return_Invalid_8() {
		util.exec("Return_Invalid_8");
	}
	
	@Test
	public void test_Return_Invalid_9() {
		util.exec("Return_Invalid_9");
	}
}
