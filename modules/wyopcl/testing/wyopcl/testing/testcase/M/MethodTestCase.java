package wyopcl.testing.testcase.M;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;

import wyopcl.testing.BaseUtil;

public class MethodTestCase {
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
	public void test_MethodCall_Valid_1() {
		util.exec("MethodCall_Valid_1");
	}

	@Test
	public void test_MethodCall_Valid_2() {
		util.exec("MethodCall_Valid_2");
	}

	@Test
	public void test_MethodCall_Valid_3() {
		util.exec("MethodCall_Valid_3");
	}

	@Ignore("???") @Test
	public void test_MethodCall_Valid_4() {
		util.exec("MethodCall_Valid_4");
	}

	@Test
	public void test_MethodRef_Valid_1() {
		util.exec("MethodRef_Valid_1");
	}

	@Test
	public void test_MethodRef_Valid_2() {
		util.exec("MethodRef_Valid_2");
	}

	@Test
	public void test_Method_Valid_1() {
		util.exec("Method_Valid_1");
	}

	@Test
	public void test_MultiLineComment_Valid_1() {
		util.exec("MultiLineComment_Valid_1");
	}

	@Test
	public void test_MultiLineComment_Valid_2() {
		util.exec("MultiLineComment_Valid_2");
	}
}
