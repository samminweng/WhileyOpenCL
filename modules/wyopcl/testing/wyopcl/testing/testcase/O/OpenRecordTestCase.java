package wyopcl.testing.testcase.O;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;

import wyopcl.testing.BaseUtil;

public class OpenRecordTestCase {
	private BaseUtil util;	
	@Before
	public void setUp() throws Exception {
		util = new BaseUtil();
	}
	@After
	public void tearDown() throws Exception {
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

	@Ignore("Issue ???") @Test
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
