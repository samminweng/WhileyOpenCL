package wyopcl.testing.invalid;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestRule;
import org.junit.rules.Timeout;

import wyopcl.testing.BaseUtil;

public class OpenRecordTestCase {
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
	public void test_OpenRecord_Invalid_1() {
		util.exec("OpenRecord_Invalid_1");
	}

	@Test
	public void test_OpenRecord_Invalid_10() {
		util.exec("OpenRecord_Invalid_10");
	}

	@Test
	public void test_OpenRecord_Invalid_2() {
		util.exec("OpenRecord_Invalid_2");
	}

	@Test
	public void test_OpenRecord_Invalid_3() {
		util.exec("OpenRecord_Invalid_3");
	}

	@Test
	public void test_OpenRecord_Invalid_4() {
		util.exec("OpenRecord_Invalid_4");
	}

	@Test
	public void test_OpenRecord_Invalid_5() {
		util.exec("OpenRecord_Invalid_5");
	}

	@Test
	public void test_OpenRecord_Invalid_6() {
		util.exec("OpenRecord_Invalid_6");
	}

	@Test
	public void test_OpenRecord_Invalid_7() {
		util.exec("OpenRecord_Invalid_7");
	}

	

}
