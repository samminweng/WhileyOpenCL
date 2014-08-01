package wyopcl.testing.testcase.P;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import wyopcl.testing.BaseUtil;

public class ProcessTestCase{
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
	public void test_ProcessAccess_Valid_1() {
		util.exec("ProcessAccess_Valid_1");
	}

	@Test
	public void test_ProcessAccess_Valid_2() {
		util.exec("ProcessAccess_Valid_2");
	}

	@Test
	public void test_Process_Valid_1() {
		util.exec("Process_Valid_1");
	}

	@Test
	public void test_Process_Valid_10() {
		util.exec("Process_Valid_10");
	}

	@Test
	public void test_Process_Valid_11() {
		util.exec("Process_Valid_11");
	}

	@Test
	public void test_Process_Valid_12() {
		util.exec("Process_Valid_12");
	}

	@Test
	public void test_Process_Valid_13() {
		util.exec("Process_Valid_13");
	}

	@Test
	public void test_Process_Valid_14() {
		util.exec("Process_Valid_14");
	}

	@Test
	public void test_Process_Valid_2() {
		util.exec("Process_Valid_2");
	}

	@Test
	public void test_Process_Valid_3() {
		util.exec("Process_Valid_3");
	}

	@Test
	public void test_Process_Valid_4() {
		util.exec("Process_Valid_4");
	}

	@Test
	public void test_Process_Valid_5() {
		util.exec("Process_Valid_5");
	}

	@Test
	public void test_Process_Valid_6() {
		util.exec("Process_Valid_6");
	}

	@Test
	public void test_Process_Valid_7() {
		util.exec("Process_Valid_7");
	}

	@Test
	public void test_Process_Valid_8() {
		util.exec("Process_Valid_8");
	}

	@Test
	public void test_Process_Valid_9() {
		util.exec("Process_Valid_9");
	}

}
