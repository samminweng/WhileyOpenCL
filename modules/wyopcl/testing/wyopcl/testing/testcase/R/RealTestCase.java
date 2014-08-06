package wyopcl.testing.testcase.R;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestRule;
import org.junit.rules.Timeout;

import wyopcl.testing.BaseUtil;

public class RealTestCase {
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
	public void test_RealConst_Valid_1() {
		util.exec("RealConst_Valid_1");
	}

	@Test
	public void test_RealDiv_Valid_1() {
		util.exec("RealDiv_Valid_1");
	}

	@Test
	public void test_RealDiv_Valid_2() {
		util.exec("RealDiv_Valid_2");
	}

	@Test
	public void test_RealDiv_Valid_3() {
		util.exec("RealDiv_Valid_3");
	}

	@Test
	public void test_RealDiv_Valid_4() {
		util.exec("RealDiv_Valid_4");
	}

	@Test
	public void test_RealDiv_Valid_5() {
		util.exec("RealDiv_Valid_5");
	}

	@Test
	public void test_RealDiv_Valid_6() {
		util.exec("RealDiv_Valid_6");
	}

	@Test
	public void test_RealDiv_Valid_7() {
		util.exec("RealDiv_Valid_7");
	}

	@Test
	public void test_RealNeg_Valid_1() {
		util.exec("RealNeg_Valid_1");
	}

	@Test
	public void test_RealNeg_Valid_2() {
		util.exec("RealNeg_Valid_2");
	}

	@Test
	public void test_RealSplit_Valid_1() {
		util.exec("RealSplit_Valid_1");
	}

	@Test
	public void test_RealSub_Valid_1() {
		util.exec("RealSub_Valid_1");
	}

	@Test
	public void test_RealSub_Valid_2() {
		util.exec("RealSub_Valid_2");
	}

	@Test
	public void test_RealSub_Valid_3() {
		util.exec("RealSub_Valid_3");
	}

	@Test
	public void test_Real_Valid_1() {
		util.exec("Real_Valid_1");
	}

}
