package wyopcl.testing.T;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestRule;
import org.junit.rules.Timeout;

import wyopcl.testing.BaseTestUtil;

public class TryCatchInvalidTestCase {
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
	public void test_TryCatch_Invalid_1() {
		util.exec("TryCatch_Invalid_1");
	}

	@Test
	public void test_TryCatch_Invalid_2() {
		util.exec("TryCatch_Invalid_2");
	}

	@Test
	public void test_TryCatch_Invalid_3() {
		util.exec("TryCatch_Invalid_3");
	}

	@Test
	public void test_TryCatch_Invalid_4() {
		util.exec("TryCatch_Invalid_4");
	}

	@Test
	public void test_TryCatch_Invalid_5() {
		util.exec("TryCatch_Invalid_5");
	}

}
