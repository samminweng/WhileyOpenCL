package wyopcl.testing.invalid;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestRule;
import org.junit.rules.Timeout;

import wyopcl.testing.BaseUtil;

public class ConstrainedTestCase {
	@Rule 
	public TestRule timeout = new Timeout(10000);
	
	
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
	public void test_ConstrainedDictionary_Invalid_1() {
		util.exec("ConstrainedDictionary_Invalid_1");
	}

	@Test
	public void test_ConstrainedInt_Invalid_1() {
		util.exec("ConstrainedInt_Invalid_1");
	}

	@Test
	public void test_ConstrainedInt_Invalid_10() {
		util.exec("ConstrainedInt_Invalid_10");
	}

	@Test
	public void test_ConstrainedInt_Invalid_12() {
		util.exec("ConstrainedInt_Invalid_12");
	}

	
	@Test
	public void test_ConstrainedInt_Invalid_2() {
		util.exec("ConstrainedInt_Invalid_2");
	}	

	@Test
	public void test_ConstrainedInt_Invalid_3() {
		util.exec("ConstrainedInt_Invalid_3");
	}

	@Test
	public void test_ConstrainedInt_Invalid_4() {
		util.exec("ConstrainedInt_Invalid_4");
	}

	@Test
	public void test_ConstrainedInt_Invalid_5() {
		util.exec("ConstrainedInt_Invalid_5");
	}

	@Test
	public void test_ConstrainedInt_Invalid_6() {
		util.exec("ConstrainedInt_Invalid_6");
	}

	@Test
	public void test_ConstrainedInt_Invalid_8() {
		util.exec("ConstrainedInt_Invalid_8");
	}
	
	@Test
	public void test_ConstrainedInt_Invalid_9() {
		util.exec("ConstrainedInt_Invalid_9");
	}

	@Test
	public void test_ConstrainedList_Invalid_1() {
		util.exec("ConstrainedList_Invalid_1");
	}
	
	@Test
	public void test_ConstrainedList_Invalid_2() {
		util.exec("ConstrainedList_Invalid_2");
	}

	@Test
	public void test_ConstrainedList_Invalid_3() {
		util.exec("ConstrainedList_Invalid_3");
	}

	
	@Test
	public void test_ConstrainedSet_Invalid_1() {
		util.exec("ConstrainedSet_Invalid_1");
	}

	@Test
	public void test_ConstrainedSet_Invalid_2() {
		util.exec("ConstrainedSet_Invalid_2");
	}

	@Test
	public void test_ConstrainedSet_Invalid_3() {
		util.exec("ConstrainedSet_Invalid_3");
	}
	
	@Test
	public void test_ConstrainedTuple_Invalid_1() {
		util.exec("ConstrainedTuple_Invalid_1");
	}

	
}
