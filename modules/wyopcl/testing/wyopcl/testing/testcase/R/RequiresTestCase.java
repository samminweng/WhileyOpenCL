package wyopcl.testing.testcase.R;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import wyopcl.testing.BaseUtil;

public class RequiresTestCase {
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
	public void test_Requires_Valid_1() {
		util.exec("Requires_Valid_1");
	}

}
