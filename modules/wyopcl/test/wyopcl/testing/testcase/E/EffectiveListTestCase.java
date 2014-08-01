package wyopcl.testing.testcase.E;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import wyopcl.testing.BaseUtil;

public class EffectiveListTestCase {
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
	public void test_EffectiveList_Valid_1() {
		util.exec("EffectiveList_Valid_1");
	}

}
