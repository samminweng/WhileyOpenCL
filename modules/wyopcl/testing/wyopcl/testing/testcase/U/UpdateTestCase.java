package wyopcl.testing.testcase.U;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestRule;
import org.junit.rules.Timeout;

import wyopcl.testing.BaseUtil;

public class UpdateTestCase{
	@Rule public TestRule timeout = new Timeout(5000);
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
	public void test_Update_Valid_1() {
		util.exec("Update_Valid_1");
	}

	@Ignore("Issue ???") @Test
	public void test_Update_Valid_2() {
		util.exec("Update_Valid_2");
	}

}
