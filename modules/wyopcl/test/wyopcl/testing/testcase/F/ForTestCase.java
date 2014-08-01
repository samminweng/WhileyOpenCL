package wyopcl.testing.testcase.F;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;

import wyopcl.testing.BaseUtil;

public class ForTestCase{
	
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
	public void test_For_Valid_1() {
		util.exec("For_Valid_1");
	}

	@Test
	public void test_For_Valid_10() {
		util.exec("For_Valid_10");
	}

	@Test
	public void test_For_Valid_11() {
		util.exec("For_Valid_11");
	}

	@Test
	public void test_For_Valid_12() {
		util.exec("For_Valid_12");
	}

	@Test
	public void test_For_Valid_13() {
		util.exec("For_Valid_13");
	}

	@Test
	public void test_For_Valid_14() {
		util.exec("For_Valid_14");
	}

	@Test
	public void test_For_Valid_15() {
		util.exec("For_Valid_15");
	}

	@Test
	public void test_For_Valid_16() {
		util.exec("For_Valid_16");
	}

	@Test
	public void test_For_Valid_17() {
		util.exec("For_Valid_17");
	}

	@Test
	public void test_For_Valid_18() {
		util.exec("For_Valid_18");
	}

	@Test
	public void test_For_Valid_2() {
		util.exec("For_Valid_2");
	}

	@Test
	public void test_For_Valid_3() {
		util.exec("For_Valid_3");
	}

	@Test
	public void test_For_Valid_4() {
		util.exec("For_Valid_4");
	}

	@Ignore("Issue ???") @Test
	public void test_For_Valid_5() {
		util.exec("For_Valid_5");
	}

	@Ignore("Issue ???") @Test
	public void test_For_Valid_6() {
		util.exec("For_Valid_6");
	}

	@Test
	public void test_For_Valid_7() {
		util.exec("For_Valid_7");
	}

	@Test
	public void test_For_Valid_8() {
		util.exec("For_Valid_8");
	}

	@Test
	public void test_For_Valid_9() {
		util.exec("For_Valid_9");
	}


}
