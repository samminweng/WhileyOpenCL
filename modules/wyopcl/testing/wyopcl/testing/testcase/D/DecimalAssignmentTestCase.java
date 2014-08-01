package wyopcl.testing.testcase.D;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import wyopcl.testing.BaseUtil;

public class DecimalAssignmentTestCase {
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
	public void test_DecimalAssignment_Valid_1() {
		util.exec("DecimalAssignment_Valid_1");
	}


}
