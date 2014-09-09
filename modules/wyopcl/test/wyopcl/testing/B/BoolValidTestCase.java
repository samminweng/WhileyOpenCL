package wyopcl.testing.B;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestRule;
import org.junit.rules.Timeout;

import wyopcl.testing.BaseTestUtil;

public class BoolValidTestCase {
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
	public void test_BoolAssign_Valid_1() {
		util.exec("BoolAssign_Valid_1");
	}

	@Test
	public void test_BoolAssign_Valid_2() {
		util.exec("BoolAssign_Valid_2");
	}

	@Test
	public void test_BoolAssign_Valid_3() {
		util.exec("BoolAssign_Valid_3");
	}

	@Test
	public void test_BoolAssign_Valid_4() {
		util.exec("BoolAssign_Valid_4");
	}

	@Test
	public void test_BoolAssign_Valid_5() {
		util.exec("BoolAssign_Valid_5");
	}

	@Test
	public void test_BoolAssign_Valid_6() {
		util.exec("BoolAssign_Valid_6");
	}

	@Test
	public void test_BoolFun_Valid_1() {
		util.exec("BoolFun_Valid_1");
	}

	@Test
	public void test_BoolIfElse_Valid_1() {
		util.exec("BoolIfElse_Valid_1");
	}

	@Test
	public void test_BoolIfElse_Valid_2() {
		util.exec("BoolIfElse_Valid_2");
	}

	@Test
	public void test_BoolList_Valid_1() {
		util.exec("BoolList_Valid_1");
	}

	@Test
	public void test_BoolList_Valid_2() {
		util.exec("BoolList_Valid_2");
	}

	@Test
	public void test_BoolList_Valid_3() {
		util.exec("BoolList_Valid_3");
	}

	@Test
	public void test_BoolRecord_Valid_1() {
		util.exec("BoolRecord_Valid_1");
	}

	@Test
	public void test_BoolRecord_Valid_2() {
		util.exec("BoolRecord_Valid_2");
	}

	@Test
	public void test_BoolRequires_Valid_1() {
		util.exec("BoolRequires_Valid_1");
	}

	@Test
	public void test_BoolReturn_Valid_1() {
		util.exec("BoolReturn_Valid_1");
	}

}
