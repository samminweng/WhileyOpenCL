package wyopcl.testing.invalid;

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
		util.terminate();
		util = null;
	}
	
	
	@Test
	public void test_ListAccess_Invalid_1() {
		util.exec("ListAccess_Invalid_1");
	}

	@Test
	public void test_ListAccess_Invalid_3() {
		util.exec("ListAccess_Invalid_3");
	}

	@Test
	public void test_ListAccess_Invalid_5() {
		util.exec("ListAccess_Invalid_5");
	}
	
	@Test
	public void test_ListAppend_Invalid_1() {
		util.exec("ListAppend_Invalid_1");
	}
	
	@Test
	public void test_ListAppend_Invalid_2() {
		util.exec("ListAppend_Invalid_2");
	}

	@Test
	public void test_ListAppend_Invalid_3() {
		util.exec("ListAppend_Invalid_3");
	}

	@Test
	public void test_ListAppend_Invalid_4() {
		util.exec("ListAppend_Invalid_4");
	}

	@Test
	public void test_ListAppend_Invalid_5() {
		util.exec("ListAppend_Invalid_5");
	}
	

	@Test
	public void test_ListAssign_Invalid_1() {
		util.exec("ListAssign_Invalid_1");
	}

	@Test
	public void test_ListAssign_Invalid_11() {
		util.exec("ListAssign_Invalid_11");
	}

	@Test
	public void test_ListAssign_Invalid_2() {
		util.exec("ListAssign_Invalid_2");
	}

	@Test
	public void test_ListAssign_Invalid_3() {
		util.exec("ListAssign_Invalid_3");
	}
	

	@Test
	public void test_ListConversion_Invalid_1() {
		util.exec("ListConversion_Invalid_1");
	}

	@Test
	public void test_ListElemOf_Invalid_1() {
		util.exec("ListElemOf_Invalid_1");
	}
	
	@Test
	public void test_ListElemOf_Invalid_2() {
		util.exec("ListElemOf_Invalid_2");
	}

	@Test
	public void test_ListEmpty_Invalid_1() {
		util.exec("ListEmpty_Invalid_1");
	}
	
	@Test
	public void test_ListEmpty_Invalid_2() {
		util.exec("ListEmpty_Invalid_2");
	}

	@Test
	public void test_ListEquals_Invalid_1() {
		util.exec("ListEquals_Invalid_1");
	}	

	@Test
	public void test_ListLength_Invalid_1() {
		util.exec("ListLength_Invalid_1");
	}

	@Test
	public void test_ListLength_Invalid_2() {
		util.exec("ListLength_Invalid_2");
	}

	@Test
	public void test_ListLength_Invalid_3() {
		util.exec("ListLength_Invalid_3");
	}

	@Test
	public void test_ListSublist_Invalid_1() {
		util.exec("ListSublist_Invalid_1");
	}

	@Test
	public void test_ListSublist_Invalid_2() {
		util.exec("ListSublist_Invalid_2");
	}

	@Test
	public void test_ListSublist_Invalid_3() {
		util.exec("ListSublist_Invalid_3");
	}

	@Test
	public void test_ListUpdate_Invalid_1() {
		util.exec("ListUpdate_Invalid_1");
	}

	@Test
	public void test_List_Invalid_1() {
		util.exec("List_Invalid_1");
	}
	
	@Test
	public void test_List_Invalid_2() {
		util.exec("List_Invalid_2");
	}
	
	@Test
	public void test_List_Invalid_3() {
		util.exec("List_Invalid_3");
	}
	
	@Test
	public void test_List_Invalid_4() {
		util.exec("List_Invalid_4");
	}
	
	
	@Test
	public void test_List_Invalid_5() {
		util.exec("List_Invalid_5");
	}
	
	@Test
	public void test_List_Invalid_6() {
		util.exec("List_Invalid_6");
	}
	
	@Test
	public void test_List_Invalid_7() {
		util.exec("List_Invalid_7");
	}
}
