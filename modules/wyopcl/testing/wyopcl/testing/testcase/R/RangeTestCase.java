package wyopcl.testing.testcase.R;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import wyopcl.testing.BaseUtil;

public class RangeTestCase {
	
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
	public void test_Range_Valid_1() {
		util.exec("Range_Valid_1");
	}

}
