package wyopcl.testing.testcase.L;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import wyopcl.testing.BaseUtil;

public class LambdaTestCase {
	
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
	public void test_Lambda_Valid_1() {
		util.exec("Lambda_Valid_1");
	}

	@Test
	public void test_Lambda_Valid_2() {
		util.exec("Lambda_Valid_2");
	}

	@Test
	public void test_Lambda_Valid_3() {
		util.exec("Lambda_Valid_3");
	}

	@Test
	public void test_Lambda_Valid_4() {
		util.exec("Lambda_Valid_4");
	}

	@Test
	public void test_Lambda_Valid_5() {
		util.exec("Lambda_Valid_5");
	}

	@Test
	public void test_Lambda_Valid_6() {
		util.exec("Lambda_Valid_6");
	}

	@Test
	public void test_Lambda_Valid_7() {
		util.exec("Lambda_Valid_7");
	}

	@Test
	public void test_Lambda_Valid_8() {
		util.exec("Lambda_Valid_8");
	}

}
