package wyopcl.testing.invalid;

import junit.framework.TestCase;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestRule;
import org.junit.rules.Timeout;

import wyopcl.testing.BaseUtil;

public class AssertTestCase {
	//@Rule public TestRule timeout = new Timeout(5000);
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
	public void test_Assert_Invalid_1() {		
		util.exec("Assert_Invalid_1");
	}

	@Test	
	public void test_Assert_Invalid_2() {		
		util.exec("Assert_Invalid_2");
	}
}
