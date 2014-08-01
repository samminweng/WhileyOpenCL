package wyopcl.testing.testcase.S;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import wyopcl.testing.BaseUtil;

public class SkipTestCase {
	
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
	public void test_Skip_Valid_1() {
		util.exec("Skip_Valid_1");
	}


}
