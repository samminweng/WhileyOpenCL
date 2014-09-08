package wyopcl.testing.valid;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestRule;
import org.junit.rules.Timeout;

import wyopcl.testing.BaseUtil;

public class CoercionTestCase {
	@Rule
	public TestRule timeout = new Timeout(5000);
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
	public void test_Coercion_Valid_1() {
		util.exec("Coercion_Valid_1");
	}

	@Test
	public void test_Coercion_Valid_2() {
		util.exec("Coercion_Valid_2");
	}

	@Test
	public void test_Coercion_Valid_3() {
		util.exec("Coercion_Valid_3");
	}

	@Test
	public void test_Coercion_Valid_4() {
		util.exec("Coercion_Valid_4");
	}

	@Test
	@Ignore("No such a file.")
	public void test_Coercion_Valid_5() {
		util.exec("Coercion_Valid_5");
	}

	@Test
	public void test_Coercion_Valid_6() {
		util.exec("Coercion_Valid_6");
	}

	@Test
	public void test_Coercion_Valid_7() {
		util.exec("Coercion_Valid_7");
	}

	@Test
	public void test_Coercion_Valid_8() {
		util.exec("Coercion_Valid_8");
	}
}
