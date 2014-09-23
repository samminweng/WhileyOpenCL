package wyopcl.testing.M;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestRule;
import org.junit.rules.Timeout;

import wyopcl.testing.BaseTestUtil;

public class MethodInvalidTestCase {
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
	public void test_MethodCall_Invalid_1() {
		util.exec("MethodCall_Invalid_1");
	}

	@Test
	public void test_MethodCall_Invalid_2() {
		util.exec("MethodCall_Invalid_2");
	}

	@Test
	public void test_MethodCall_Invalid_3() {
		util.exec("MethodCall_Invalid_3");
	}

	@Test
	public void test_MethodCall_Invalid_4() {
		util.exec("MethodCall_Invalid_4");
	}
	
	@Test
	public void test_MethodCall_Invalid_5() {
		util.exec("MethodCall_Invalid_5");
	}

	@Test
	public void test_MethodCall_Invalid_6() {
		util.exec("MethodCall_Invalid_6");
	}

	@Test
	public void test_MethodCall_Invalid_7() {
		util.exec("MethodCall_Invalid_7");
	}

	@Test
	public void test_MethodCall_Invalid_8() {
		util.exec("MethodCall_Invalid_8");
	}
	@Ignore("unclassified")
	@Test
	public void test_MethodRef_Invalid_1() {
		util.exec("MethodRef_Invalid_1");
	}
	@Ignore("Internal Failure") 
	@Test
	public void test_MethodRef_Invalid_2() {
		util.exec("MethodRef_Invalid_2");
	}
	@Ignore("unclassified")
	@Test
	public void test_MethodRef_Invalid_3() {
		util.exec("MethodRef_Invalid_3");
	}

}
