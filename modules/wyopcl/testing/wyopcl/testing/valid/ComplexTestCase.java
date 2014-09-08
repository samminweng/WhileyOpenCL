package wyopcl.testing.valid;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestRule;
import org.junit.rules.Timeout;

import wyopcl.testing.BaseUtil;

public class ComplexTestCase {
	@Rule
	public TestRule timeout = new Timeout(10000);
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
	public void test_Complex_Valid_1() {
		util.exec("Complex_Valid_1");
	}

	@Test
	public void test_Complex_Valid_2() {
		util.exec("Complex_Valid_2");
	}

	@Ignore("Issue ???")
	@Test
	public void test_Complex_Valid_3() {
		util.exec("Complex_Valid_3");
	}

	@Test
	public void test_Complex_Valid_4() {
		util.exec("Complex_Valid_4");
	}

	@Test
	public void test_Complex_Valid_5() {
		util.exec("Complex_Valid_5");
	}

	@Test
	public void test_Complex_Valid_6() {
		util.exec("Complex_Valid_6");
	}

}
