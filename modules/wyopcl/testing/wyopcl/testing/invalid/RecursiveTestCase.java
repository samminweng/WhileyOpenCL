package wyopcl.testing.invalid;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestRule;
import org.junit.rules.Timeout;

import wyopcl.testing.BaseUtil;

public class RecursiveTestCase {
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
	public void test_RecursiveType_Invalid_1() {
		util.exec("RecursiveType_Invalid_1");
	}

	@Test
	public void test_RecursiveType_Invalid_10() {
		util.exec("RecursiveType_Invalid_10");
	}

	@Test
	public void test_RecursiveType_Invalid_2() {
		util.exec("RecursiveType_Invalid_2");
	}

	@Test
	public void test_RecursiveType_Invalid_3() {
		util.exec("RecursiveType_Invalid_3");
	}

	@Test
	public void test_RecursiveType_Invalid_4() {
		util.exec("RecursiveType_Invalid_4");
	}

	@Ignore("#18") @Test
	public void test_RecursiveType_Invalid_5() {
		util.exec("RecursiveType_Invalid_5");
	}

	@Test
	public void test_RecursiveType_Invalid_6() {
		util.exec("RecursiveType_Invalid_6");
	}

	@Test
	public void test_RecursiveType_Invalid_7() {
		util.exec("RecursiveType_Invalid_7");
	}

	@Test
	public void test_RecursiveType_Invalid_8() {
		util.exec("RecursiveType_Invalid_8");
	}

	@Test
	public void test_RecursiveType_Invalid_9() {
		util.exec("RecursiveType_Invalid_9");
	}

}
