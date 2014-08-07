package wyopcl.testing.testcase.A;

import junit.framework.TestCase;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestRule;
import org.junit.rules.Timeout;

import wyopcl.testing.BaseUtil;

public class AccessTestCase {
	@Rule public TestRule timeout = new Timeout(5000);
	private BaseUtil util;	
	@Before
	public void setUp() throws Exception {
		util = new BaseUtil();
	}
	@After
	public void tearDown() throws Exception {
		util.terminate();
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
