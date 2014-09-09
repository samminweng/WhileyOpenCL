package wyopcl.testing.T;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestRule;
import org.junit.rules.Timeout;

import wyopcl.testing.BaseTestUtil;

public class TypeEqualsInvalidTestCase {
	@Rule public TestRule timeout = new Timeout(5000);
	private BaseTestUtil util;	
	@Before
	public void setUp() throws Exception {
		util = new BaseTestUtil();
	}
	@After
	public void tearDown() throws Exception {
		util.terminate();
		util = null;
	}

	@Test
	public void test_TypeEquals_Valid_1() {
		util.exec("TypeEquals_Valid_1");
	}	

	@Test
	public void test_TypeEquals_Valid_2() {
		util.exec("TypeEquals_Valid_2");
	}
	
	
	@Test
	public void test_TypeEquals_Valid_5() {
		util.exec("TypeEquals_Valid_5");
	}

	@Test
	public void test_TypeEquals_Valid_6() {
		util.exec("TypeEquals_Valid_6");
	}	
}
