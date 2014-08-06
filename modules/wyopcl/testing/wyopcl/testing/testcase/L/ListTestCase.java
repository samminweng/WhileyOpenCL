package wyopcl.testing.testcase.L;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestRule;
import org.junit.rules.Timeout;

import wyopcl.testing.BaseUtil;

public class ListTestCase {
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
	
	
	@Test
	public void test_ListAccess_Valid_1() {
		util.exec("ListAccess_Valid_1");
	}

	@Test
	public void test_ListAccess_Valid_3() {
		util.exec("ListAccess_Valid_3");
	}

	@Test
	public void test_ListAccess_Valid_5() {
		util.exec("ListAccess_Valid_5");
	}

	@Ignore("Issue ???") @Test
	public void test_ListAccess_Valid_6() {
		util.exec("ListAccess_Valid_6");
	}

	@Ignore("Issue ???") @Test
	public void test_ListAccess_Valid_7() {
		util.exec("ListAccess_Valid_7");
	}

	@Test
	public void test_ListAccess_Valid_8() {
		util.exec("ListAccess_Valid_8");
	}

	@Test
	public void test_ListAppend_Valid_1() {
		util.exec("ListAppend_Valid_1");
	}

	@Test
	public void test_ListAppend_Valid_11() {
		util.exec("ListAppend_Valid_11");
	}

	@Test
	public void test_ListAppend_Valid_13() {
		util.exec("ListAppend_Valid_13");
	}

	@Test
	public void test_ListAppend_Valid_14() {
		util.exec("ListAppend_Valid_14");
	}

	@Test
	public void test_ListAppend_Valid_2() {
		util.exec("ListAppend_Valid_2");
	}

	@Test
	public void test_ListAppend_Valid_3() {
		util.exec("ListAppend_Valid_3");
	}

	@Test
	public void test_ListAppend_Valid_4() {
		util.exec("ListAppend_Valid_4");
	}

	@Test
	public void test_ListAppend_Valid_5() {
		util.exec("ListAppend_Valid_5");
	}

	@Test
	public void test_ListAppend_Valid_6() {
		util.exec("ListAppend_Valid_6");
	}

	@Test
	public void test_ListAppend_Valid_7() {
		util.exec("ListAppend_Valid_7");
	}

	@Test
	public void test_ListAppend_Valid_8() {
		util.exec("ListAppend_Valid_8");
	}

	@Test
	public void test_ListAppend_Valid_9() {
		util.exec("ListAppend_Valid_9");
	}

	@Test
	public void test_ListAssign_Valid_1() {
		util.exec("ListAssign_Valid_1");
	}

	@Test
	public void test_ListAssign_Valid_11() {
		util.exec("ListAssign_Valid_11");
	}

	@Test
	public void test_ListAssign_Valid_2() {
		util.exec("ListAssign_Valid_2");
	}

	@Test
	public void test_ListAssign_Valid_3() {
		util.exec("ListAssign_Valid_3");
	}

	@Test
	public void test_ListAssign_Valid_4() {
		util.exec("ListAssign_Valid_4");
	}

	@Test
	public void test_ListAssign_Valid_5() {
		util.exec("ListAssign_Valid_5");
	}

	@Test
	public void test_ListAssign_Valid_6() {
		util.exec("ListAssign_Valid_6");
	}

	@Test
	public void test_ListAssign_Valid_7() {
		util.exec("ListAssign_Valid_7");
	}

	@Test
	public void test_ListAssign_Valid_8() {
		util.exec("ListAssign_Valid_8");
	}

	@Test
	public void test_ListAssign_Valid_9() {
		util.exec("ListAssign_Valid_9");
	}

	@Test
	public void test_ListConversion_Valid_1() {
		util.exec("ListConversion_Valid_1");
	}

	@Test
	public void test_ListElemOf_Valid_1() {
		util.exec("ListElemOf_Valid_1");
	}

	@Test
	public void test_ListEmpty_Valid_1() {
		util.exec("ListEmpty_Valid_1");
	}

	@Test
	public void test_ListEquals_Valid_1() {
		util.exec("ListEquals_Valid_1");
	}

	@Test
	public void test_ListGenerator_Valid_1() {
		util.exec("ListGenerator_Valid_1");
	}

	@Test
	public void test_ListGenerator_Valid_2() {
		util.exec("ListGenerator_Valid_2");
	}

	@Test
	public void test_ListGenerator_Valid_3() {
		util.exec("ListGenerator_Valid_3");
	}

	@Test
	public void test_ListGenerator_Valid_5() {
		util.exec("ListGenerator_Valid_5");
	}

	@Test
	public void test_ListLength_Valid_1() {
		util.exec("ListLength_Valid_1");
	}

	@Test
	public void test_ListLength_Valid_2() {
		util.exec("ListLength_Valid_2");
	}

	@Test
	public void test_ListLength_Valid_3() {
		util.exec("ListLength_Valid_3");
	}

	@Test
	public void test_ListRange_Valid_1() {
		util.exec("ListRange_Valid_1");
	}

	@Test
	public void test_ListSublist_Valid_1() {
		util.exec("ListSublist_Valid_1");
	}

	@Test
	public void test_ListSublist_Valid_2() {
		util.exec("ListSublist_Valid_2");
	}

	@Test
	public void test_ListSublist_Valid_3() {
		util.exec("ListSublist_Valid_3");
	}

	@Test
	public void test_ListSublist_Valid_4() {
		util.exec("ListSublist_Valid_4");
	}

	@Test
	public void test_ListSublist_Valid_5() {
		util.exec("ListSublist_Valid_5");
	}

}
