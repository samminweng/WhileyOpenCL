package wyopcl.testing.N;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestRule;
import org.junit.rules.Timeout;

import wyopcl.testing.BaseTestUtil;

public class NegationValidTestCase {
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
	public void test_NegationType_Valid_1() {
		util.exec("NegationType_Valid_1");
	}

	@Test
	public void test_NegationType_Valid_2() {
		util.exec("NegationType_Valid_2");
	}

	@Ignore("Issue ???")
	@Test
	public void test_NegationType_Valid_3() {
		util.exec("NegationType_Valid_3");
	}

	@Test
	public void test_NegationType_Valid_4() {
		util.exec("NegationType_Valid_4");
	}

}
