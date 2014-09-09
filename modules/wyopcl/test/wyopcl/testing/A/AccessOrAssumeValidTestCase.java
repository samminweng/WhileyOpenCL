package wyopcl.testing.A;

import junit.framework.TestCase;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestRule;
import org.junit.rules.Timeout;

import wyopcl.testing.BaseTestUtil;

public class AccessOrAssumeValidTestCase {
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
	public void test_Access_Valid_1() {
		util.exec("Access_Valid_1");
	}

	@Test
	public void test_Access_Valid_2() {
		util.exec("Access_Valid_2");
	}
	
	@Test
	public void test_Assume_Valid_1() {
		util.exec("Assume_Valid_1");
	}

	@Test
	public void test_Assume_Valid_2() {
		util.exec("Assume_Valid_2");
	}
	
}
