package wyopcl.testing.testcase.T;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;

import wyopcl.testing.BaseUtil;

public class TryCatchTestCase {
	
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
	public void test_TryCatch_Valid_1() {
		util.exec("TryCatch_Valid_1");
	}

	@Ignore("???") @Test
	public void test_TryCatch_Valid_2() {
		util.exec("TryCatch_Valid_2");
	}

	@Ignore("???") @Test
	public void test_TryCatch_Valid_3() {
		util.exec("TryCatch_Valid_3");
	}

	@Ignore("???") @Test
	public void test_TryCatch_Valid_4() {
		util.exec("TryCatch_Valid_4");
	}

}
