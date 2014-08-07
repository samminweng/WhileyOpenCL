package wyopcl.testing.testcase.D;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestRule;
import org.junit.rules.Timeout;

import wyopcl.testing.BaseUtil;

public class DictionaryTestCase{
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
	public void test_Dictionary_Valid_1() {
		util.exec("Dictionary_Valid_1");
	}

	@Test
	public void test_Dictionary_Valid_10() {
		util.exec("Dictionary_Valid_10");
	}

	@Test
	public void test_Dictionary_Valid_11() {
		util.exec("Dictionary_Valid_11");
	}

	@Test
	public void test_Dictionary_Valid_12() {
		util.exec("Dictionary_Valid_12");
	}

	@Test
	public void test_Dictionary_Valid_13() {
		util.exec("Dictionary_Valid_13");
	}

	@Test
	public void test_Dictionary_Valid_14() {
		util.exec("Dictionary_Valid_14");
	}

	@Test
	public void test_Dictionary_Valid_15() {
		util.exec("Dictionary_Valid_15");
	}

	@Test
	public void test_Dictionary_Valid_16() {
		util.exec("Dictionary_Valid_16");
	}

	@Test
	public void test_Dictionary_Valid_2() {
		util.exec("Dictionary_Valid_2");
	}

	@Test
	public void test_Dictionary_Valid_3() {
		util.exec("Dictionary_Valid_3");
	}

	@Test
	public void test_Dictionary_Valid_4() {
		util.exec("Dictionary_Valid_4");
	}

	@Test
	public void test_Dictionary_Valid_5() {
		util.exec("Dictionary_Valid_5");
	}

	@Test
	public void test_Dictionary_Valid_6() {
		util.exec("Dictionary_Valid_6");
	}

	@Test
	public void test_Dictionary_Valid_7() {
		util.exec("Dictionary_Valid_7");
	}

	@Test
	public void test_Dictionary_Valid_8() {
		util.exec("Dictionary_Valid_8");
	}

	@Test
	public void test_Dictionary_Valid_9() {
		util.exec("Dictionary_Valid_9");
	}

}
