package wyopcl.testing.testcase.L;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestRule;
import org.junit.rules.Timeout;

import wyopcl.testing.BaseUtil;

public class LengthOfTestCase {
	@Rule public TestRule timeout = new Timeout(5000);
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
	public void test_LengthOf_Valid_1() {
		util.exec("LengthOf_Valid_1");
	}

	@Test
	public void test_LengthOf_Valid_2() {
		util.exec("LengthOf_Valid_2");
	}

	@Test
	public void test_LengthOf_Valid_3() {
		util.exec("LengthOf_Valid_3");
	}

	@Test
	public void test_LengthOf_Valid_4() {
		util.exec("LengthOf_Valid_4");
	}

	@Test
	public void test_LengthOf_Valid_5() {
		util.exec("LengthOf_Valid_5");
	}


}
