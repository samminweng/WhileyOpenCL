package wyopcl.testing.testcase.S;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import wyopcl.testing.BaseUtil;

public class SwitchTestCase {
	
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
	public void test_Switch_Valid_1() {
		util.exec("Switch_Valid_1");
	}

	@Test
	public void test_Switch_Valid_10() {
		util.exec("Switch_Valid_10");
	}

	@Test
	public void test_Switch_Valid_11() {
		util.exec("Switch_Valid_11");
	}

	@Test
	public void test_Switch_Valid_12() {
		util.exec("Switch_Valid_12");
	}

	@Test
	public void test_Switch_Valid_13() {
		util.exec("Switch_Valid_13");
	}

	@Test
	public void test_Switch_Valid_2() {
		util.exec("Switch_Valid_2");
	}

	@Test
	public void test_Switch_Valid_3() {
		util.exec("Switch_Valid_3");
	}

	@Test
	public void test_Switch_Valid_4() {
		util.exec("Switch_Valid_4");
	}

	@Test
	public void test_Switch_Valid_5() {
		util.exec("Switch_Valid_5");
	}

	@Test
	public void test_Switch_Valid_6() {
		util.exec("Switch_Valid_6");
	}

	@Test
	public void test_Switch_Valid_7() {
		util.exec("Switch_Valid_7");
	}

	@Test
	public void test_Switch_Valid_8() {
		util.exec("Switch_Valid_8");
	}

	@Test
	public void test_Switch_Valid_9() {
		util.exec("Switch_Valid_9");
	}

}
