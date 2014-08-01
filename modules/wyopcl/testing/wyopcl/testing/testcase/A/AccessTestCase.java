package wyopcl.testing.testcase.A;

import junit.framework.TestCase;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import wyopcl.testing.BaseUtil;

public class AccessTestCase {
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
	public void test_Access_Valid_1() {		
		util.exec("Access_Valid_1");
	}

	@Test
	public void test_Access_Valid_2() {
		util.exec("Access_Valid_2");
	}
}
