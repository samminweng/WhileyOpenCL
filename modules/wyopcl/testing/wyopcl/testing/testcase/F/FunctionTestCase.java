package wyopcl.testing.testcase.F;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestRule;
import org.junit.rules.Timeout;

import wyopcl.testing.BaseUtil;

public class FunctionTestCase {
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
	public void test_FunctionRef_Valid_1() {
		util.exec("FunctionRef_Valid_1");
	}

	@Ignore("Issue ???") @Test
	public void test_FunctionRef_Valid_2() {
		util.exec("FunctionRef_Valid_2");
	}

	@Ignore("???") @Test
	public void test_FunctionRef_Valid_3() {
		util.exec("FunctionRef_Valid_3");
	}

	@Test
	public void test_FunctionRef_Valid_4() {
		util.exec("FunctionRef_Valid_4");
	}

	@Test
	public void test_FunctionRef_Valid_5() {
		util.exec("FunctionRef_Valid_5");
	}

	@Test
	public void test_FunctionRef_Valid_6() {
		util.exec("FunctionRef_Valid_6");
	}

	@Test
	public void test_FunctionRef_Valid_7() {
		util.exec("FunctionRef_Valid_7");
	}

	@Test
	public void test_FunctionRef_Valid_8() {
		util.exec("FunctionRef_Valid_8");
	}

	@Test
	public void test_FunctionRef_Valid_9() {
		util.exec("FunctionRef_Valid_9");
	}

	@Test
	public void test_Function_Valid_1() {
		util.exec("Function_Valid_1");
	}

	@Test
	public void test_Function_Valid_10() {
		util.exec("Function_Valid_10");
	}

	@Test
	public void test_Function_Valid_12() {
		util.exec("Function_Valid_12");
	}

	@Test
	public void test_Function_Valid_13() {
		util.exec("Function_Valid_13");
	}

	@Test
	public void test_Function_Valid_14() {
		util.exec("Function_Valid_14");
	}

	@Test
	public void test_Function_Valid_16() {
		util.exec("Function_Valid_16");
	}

	@Test
	public void test_Function_Valid_17() {
		util.exec("Function_Valid_17");
	}

	@Test
	public void test_Function_Valid_18() {
		util.exec("Function_Valid_18");
	}

	@Test
	public void test_Function_Valid_19() {
		util.exec("Function_Valid_19");
	}

	@Test
	public void test_Function_Valid_2() {
		util.exec("Function_Valid_2");
	}

	@Test
	public void test_Function_Valid_20() {
		util.exec("Function_Valid_20");
	}

	@Test
	public void test_Function_Valid_21() {
		util.exec("Function_Valid_21");
	}

	@Test
	public void test_Function_Valid_3() {
		util.exec("Function_Valid_3");
	}

	@Test
	public void test_Function_Valid_4() {
		util.exec("Function_Valid_4");
	}

	@Test
	public void test_Function_Valid_5() {
		util.exec("Function_Valid_5");
	}

	@Test
	public void test_Function_Valid_6() {
		util.exec("Function_Valid_6");
	}

	@Test
	public void test_Function_Valid_7() {
		util.exec("Function_Valid_7");
	}

	@Test
	public void test_Function_Valid_8() {
		util.exec("Function_Valid_8");
	}

	@Test
	public void test_Function_Valid_9() {
		util.exec("Function_Valid_9");
	}

	
}
