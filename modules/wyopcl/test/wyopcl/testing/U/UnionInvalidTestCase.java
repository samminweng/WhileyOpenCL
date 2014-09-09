package wyopcl.testing.U;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestRule;
import org.junit.rules.Timeout;

import wyopcl.testing.BaseTestUtil;

public class UnionInvalidTestCase {
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

	@Test
	public void test_UnionType_Invalid_1() {
		util.exec("UnionType_Invalid_1");
	}
	@Ignore("Missing UnionType_Invalid_10")
	@Test
	public void test_UnionType_Invalid_10() {
		util.exec("UnionType_Invalid_10");
	}	

	@Test
	public void test_UnionType_Invalid_2() {
		util.exec("UnionType_Invalid_2");
	}	

	@Test
	public void test_UnionType_Invalid_3() {
		util.exec("UnionType_Invalid_3");
	}

	@Test
	public void test_UnionType_Invalid_4() {
		util.exec("UnionType_Invalid_4");
	}

	@Test
	public void test_UnionType_Invalid_5() {
		util.exec("UnionType_Invalid_5");
	}

	@Test
	public void test_UnionType_Invalid_6() {
		util.exec("UnionType_Invalid_6");
	}

	@Test
	public void test_UnionType_Invalid_7() {
		util.exec("UnionType_Invalid_7");
	}
	@Ignore("Missing UnionType_Invalid_8")
	@Test
	public void test_UnionType_Invalid_8() {
		util.exec("UnionType_Invalid_8");
	}
	@Ignore("Missing UnionType_Invalid_9")
	@Test
	public void test_UnionType_Invalid_9() {
		util.exec("UnionType_Invalid_9");
	}

}
