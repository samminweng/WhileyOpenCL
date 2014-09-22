package wyopcl.testing.M;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestRule;
import org.junit.rules.Timeout;

import wyopcl.testing.BaseTestUtil;

public class MessageValidTestCase {
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
	public void test_MessageRef_Valid_1() {
		util.exec("MessageRef_Valid_1");
	}

	/**
	 * The expected result is different from executed one.
	 * Expected: 128
	 * Actual: 124 
	 */
	@Test
	public void test_MessageRef_Valid_2() {
		util.exec("MessageRef_Valid_2");
	}

	@Test
	public void test_MessageSend_Valid_1() {
		util.exec("MessageSend_Valid_1");
	}

	@Test
	public void test_MessageSend_Valid_2() {
		util.exec("MessageSend_Valid_2");
	}

	@Test
	public void test_MessageSend_Valid_3() {
		util.exec("MessageSend_Valid_3");
	}

	@Test
	public void test_MessageSend_Valid_4() {
		util.exec("MessageSend_Valid_4");
	}

	@Test
	public void test_MessageSend_Valid_5() {
		util.exec("MessageSend_Valid_5");
	}

}
