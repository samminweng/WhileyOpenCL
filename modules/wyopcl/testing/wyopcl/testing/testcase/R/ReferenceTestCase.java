package wyopcl.testing.testcase.R;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;

import wyopcl.testing.BaseUtil;

public class ReferenceTestCase {
	private BaseUtil util;	
	@Before
	public void setUp() throws Exception {
		util = new BaseUtil();
	}
	@After
	public void tearDown() throws Exception {
		util = null;
	}
	

	@Ignore("???") @Test
	public void test_Reference_Valid_1() {
		util.exec("Reference_Valid_1");
	}

}
