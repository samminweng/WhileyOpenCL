package wyopcl.testing.M;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestRule;
import org.junit.rules.Timeout;

import wyopcl.testing.BaseTestUtil;

public class MethodValidTestCase {
	@Rule
	public TestRule timeout = new Timeout(5000);
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
	public void test_MethodCall_Valid_1() {
		util.exec("MethodCall_Valid_1");
	}

	@Test
	public void test_MethodCall_Valid_2() {
		util.exec("MethodCall_Valid_2");
	}

	@Test
	public void test_MethodCall_Valid_3() {
		util.exec("MethodCall_Valid_3");
	}

	@Test
	public void test_MethodCall_Valid_4() {
		util.exec("MethodCall_Valid_4");
	}

	@Test
	public void test_MethodRef_Valid_1() {
		util.exec("MethodRef_Valid_1");
	}

	@Test
	public void test_MethodRef_Valid_2() {
		util.exec("MethodRef_Valid_2");
	}

	@Test
	// @Ignore("Timeout")
	public void test_Method_Valid_1() {
		util.exec("Method_Valid_1");
	}

	@Test
	public void test_MultiLineComment_Valid_1() {
		util.exec("MultiLineComment_Valid_1");
	}

	@Test
	public void test_MultiLineComment_Valid_2() {
		util.exec("MultiLineComment_Valid_2");
	}
}
