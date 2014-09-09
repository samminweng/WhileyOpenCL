package wyopcl.testing.I;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestRule;
import org.junit.rules.Timeout;

import wyopcl.testing.BaseTestUtil;

public class IntersectionValidTestCase {
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

	@Ignore("Issue ???")
	@Test
	public void test_Intersection_Valid_1() {
		util.exec("Intersection_Valid_1");
	}

	@Ignore("Issue ???")
	@Test
	public void test_Intersection_Valid_2() {
		util.exec("Intersection_Valid_2");
	}

}
