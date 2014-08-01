package wyopcl.testing.testcase.H;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import wyopcl.testing.BaseUtil;

public class HexAssignTestCase {
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
	public void test_HexAssign_Valid_1() {
		util.exec("HexAssign_Valid_1");
	}

}
