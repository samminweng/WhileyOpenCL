package wyopcl.testing.testcase.N;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;

import wyopcl.testing.BaseUtil;

public class NegationTestCase {
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
	public void test_NegationType_Valid_1() {
		util.exec("NegationType_Valid_1");
	}

	@Test
	public void test_NegationType_Valid_2() {
		util.exec("NegationType_Valid_2");
	}

	@Ignore("Issue ???") @Test
	public void test_NegationType_Valid_3() {
		util.exec("NegationType_Valid_3");
	}

	@Test
	public void test_NegationType_Valid_4() {
		util.exec("NegationType_Valid_4");
	}

	

}
