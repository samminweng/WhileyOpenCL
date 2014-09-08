package wyopcl.testing.invalid;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestRule;
import org.junit.rules.Timeout;

import wyopcl.testing.BaseUtil;

public class RealTestCase {
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
	public void test_RealAdd_Invalid_1() {
		util.exec("RealAdd_Invalid_1");
	}

	@Test
	public void test_RealConvert_Invalid_1() {
		util.exec("RealConvert_Invalid_1");
	}

	@Test
	public void test_RealConvert_Invalid_2() {
		util.exec("RealConvert_Invalid_2");
	}
	
	@Test
	public void test_RealDiv_Invalid_1() {
		util.exec("RealDiv_Invalid_1");
	}

	@Test
	public void test_RealDiv_Invalid_2() {
		util.exec("RealDiv_Invalid_2");
	}	

	@Test
	public void test_RealMul_Invalid_1() {
		util.exec("RealMul_Invalid_1");
	}
	
}
