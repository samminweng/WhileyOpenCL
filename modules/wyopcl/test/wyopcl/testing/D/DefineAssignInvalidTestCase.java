package wyopcl.testing.D;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestRule;
import org.junit.rules.Timeout;

import wyopcl.testing.BaseTestUtil;

public class DefineAssignInvalidTestCase {
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
	
	@Ignore("Missing DefineAssign_Invalid_1.sysout")
	@Test
	public void test_DefineAssign_Invalid_1() {
		util.exec("DefineAssign_Invalid_1");
	}
	@Ignore("Missing DefineAssign_Invalid_2.sysout")
	@Test
	public void test_DefineAssign_Invalid_2() {
		util.exec("DefineAssign_Invalid_2");
	}
	@Ignore("Missing DefineAssign_Invalid_3.sysout")
	@Test
	public void test_DefineAssign_Invalid_3() {
		util.exec("DefineAssign_Invalid_3");
	}
	@Ignore("Missing DefineAssign_Invalid_4.sysout")
	@Test
	public void test_DefineAssign_Invalid_4() {
		util.exec("DefineAssign_Invalid_4");
	}

}
