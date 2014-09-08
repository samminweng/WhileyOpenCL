package wyopcl.testing.valid;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestRule;
import org.junit.rules.Timeout;

import wyopcl.testing.BaseUtil;

public class OpenRecordTestCase {
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
	public void test_OpenRecord_Valid_1() {
		util.exec("OpenRecord_Valid_1");
	}

	@Test
	public void test_OpenRecord_Valid_10() {
		util.exec("OpenRecord_Valid_10");
	}

	@Test
	public void test_OpenRecord_Valid_2() {
		util.exec("OpenRecord_Valid_2");
	}

	@Ignore("Issue ???")
	@Test
	public void test_OpenRecord_Valid_3() {
		util.exec("OpenRecord_Valid_3");
	}

	@Test
	public void test_OpenRecord_Valid_4() {
		util.exec("OpenRecord_Valid_4");
	}

	@Test
	public void test_OpenRecord_Valid_5() {
		util.exec("OpenRecord_Valid_5");
	}

	@Test
	public void test_OpenRecord_Valid_6() {
		util.exec("OpenRecord_Valid_6");
	}

	@Test
	public void test_OpenRecord_Valid_7() {
		util.exec("OpenRecord_Valid_7");
	}

	@Test
	public void test_OpenRecord_Valid_8() {
		util.exec("OpenRecord_Valid_8");
	}

	@Test
	public void test_OpenRecord_Valid_9() {
		util.exec("OpenRecord_Valid_9");
	}

}
