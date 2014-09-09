package wyopcl.testing.B;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestRule;
import org.junit.rules.Timeout;

import wyopcl.testing.BaseTestUtil;

public class ByteInvalidTestCase {
	@Rule public TestRule timeout = new Timeout(30000);
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
	public void test_Byte_Invalid_1() {
		util.exec("Byte_Invalid_1");
	}

	
}
