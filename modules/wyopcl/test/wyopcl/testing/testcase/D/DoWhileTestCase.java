package wyopcl.testing.testcase.D;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;

import wyopcl.testing.BaseUtil;

public class DoWhileTestCase {
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
	public void test_DoWhile_Valid_1() {
		util.exec("DoWhile_Valid_1");
	}

	@Test
	public void test_DoWhile_Valid_2() {
		util.exec("DoWhile_Valid_2");
	}

	@Test
	public void test_DoWhile_Valid_3() {
		util.exec("DoWhile_Valid_3");
	}

	@Ignore("???") @Test
	public void test_DoWhile_Valid_4() {
		util.exec("DoWhile_Valid_4");
	}

	@Test
	public void test_DoWhile_Valid_5() {
		util.exec("DoWhile_Valid_5");
	}

}
