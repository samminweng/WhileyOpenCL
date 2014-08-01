package wyopcl.testing.testcase.I;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;

import wyopcl.testing.BaseUtil;

public class IntersectionTestCase {
	private BaseUtil util;	
	@Before
	public void setUp() throws Exception {
		util = new BaseUtil();
	}
	@After
	public void tearDown() throws Exception {
		util = null;
	}
	

	@Ignore("Issue ???") @Test
	public void test_Intersection_Valid_1() {
		util.exec("Intersection_Valid_1");
	}

	@Ignore("Issue ???") @Test
	public void test_Intersection_Valid_2() {
		util.exec("Intersection_Valid_2");
	}
	
}
