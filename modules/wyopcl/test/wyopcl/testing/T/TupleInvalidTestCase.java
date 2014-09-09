package wyopcl.testing.T;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestRule;
import org.junit.rules.Timeout;

import wyopcl.testing.BaseTestUtil;

public class TupleInvalidTestCase {
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
	@Ignore("Missing TupleAssgn_Invalid_1")
	@Test
	public void test_TupleAssgn_Invalid_1() {
		util.exec("TupleAssgn_Invalid_1");
	}
	@Ignore("Missing TupleAssgn_Invalid_2")
	@Test
	public void test_TupleAssgn_Invalid_2() {
		util.exec("TupleAssgn_Invalid_2");
	}
	@Ignore("Missing TupleAssgn_Invalid_3")
	@Test
	public void test_TupleAssgn_Invalid_3() {
		util.exec("TupleAssgn_Invalid_3");
	}
	
	@Test
	public void test_TupleDefine_Invalid_1() {
		util.exec("TupleDefine_Invalid_1");
	}

	@Test
	public void test_TupleDefine_Invalid_2() {
		util.exec("TupleDefine_Invalid_2");
	}

	@Test
	public void test_Tuple_Invalid_1() {
		util.exec("Tuple_Invalid_1");
	}
	@Ignore("Missing Tuple_Invalid_2")
	@Test
	public void test_Tuple_Invalid_2() {
		util.exec("Tuple_Invalid_2");
	}

	@Test
	public void test_Tuple_Invalid_3() {
		util.exec("Tuple_Invalid_3");
	}

	@Test
	public void test_Tuple_Invalid_4() {
		util.exec("Tuple_Invalid_4");
	}

	@Test
	public void test_Tuple_Invalid_5() {
		util.exec("Tuple_Invalid_5");
	}

	@Test
	public void test_Tuple_Invalid_6() {
		util.exec("Tuple_Invalid_6");
	}

	@Test
	public void test_Tuple_Invalid_7() {
		util.exec("Tuple_Invalid_7");
	}
	@Ignore("Missing Tuple_Invalid_8")
	@Test
	public void test_Tuple_Invalid_8() {
		util.exec("Tuple_Invalid_8");
	}

}
