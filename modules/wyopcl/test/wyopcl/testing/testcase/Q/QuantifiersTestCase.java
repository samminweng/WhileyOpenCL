package wyopcl.testing.testcase.Q;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import wyopcl.testing.BaseUtil;

public class QuantifiersTestCase {
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
	public void test_Quantifiers_Valid_1() {
		util.exec("Quantifiers_Valid_1");
	}


}
