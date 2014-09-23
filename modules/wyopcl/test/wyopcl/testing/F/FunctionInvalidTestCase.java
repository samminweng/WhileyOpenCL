package wyopcl.testing.F;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestRule;
import org.junit.rules.Timeout;

import wyopcl.testing.BaseTestUtil;

public class FunctionInvalidTestCase {
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
	public void test_FunctionRef_Invalid_1() {
		util.exec("FunctionRef_Invalid_1");
	}

	@Test
	public void test_FunctionRef_Invalid_2() {
		util.exec("FunctionRef_Invalid_2");
	}

	@Test
	public void test_FunctionRef_Invalid_3() {
		util.exec("FunctionRef_Invalid_3");
	}

	@Test
	public void test_FunctionRef_Invalid_4() {
		util.exec("FunctionRef_Invalid_4");
	}

	@Test
	public void test_FunctionRef_Invalid_5() {
		util.exec("FunctionRef_Invalid_5");
	}

	@Test
	public void test_FunctionRef_Invalid_6() {
		util.exec("FunctionRef_Invalid_6");
	}

	@Test
	public void test_FunctionRef_Invalid_7() {
		util.exec("FunctionRef_Invalid_7");
	}
	@Ignore("Missing FunctionRef_Invalid_9.sysout")
	@Test
	public void test_FunctionRef_Invalid_9() {
		util.exec("FunctionRef_Invalid_9");
	}

	@Test
	public void test_Function_Invalid_1() {
		util.exec("Function_Invalid_1");
	}

	@Test
	public void test_Function_Invalid_10() {
		util.exec("Function_Invalid_10");
	}
	
	@Ignore("Internal Failure")
	@Test
	public void test_Function_Invalid_2() {
		util.exec("Function_Invalid_2");
	}

	@Test
	public void test_Function_Invalid_3() {
		util.exec("Function_Invalid_3");
	}

	@Test
	public void test_Function_Invalid_4() {
		util.exec("Function_Invalid_4");
	}
	@Ignore("unclassified")
	@Test
	public void test_Function_Invalid_9() {
		util.exec("Function_Invalid_9");
	}

	
}
