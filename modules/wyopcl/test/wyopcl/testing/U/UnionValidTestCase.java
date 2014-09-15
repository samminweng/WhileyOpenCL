package wyopcl.testing.U;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestRule;
import org.junit.rules.Timeout;

import wyopcl.testing.BaseTestUtil;

public class UnionValidTestCase {
	@Rule
	public TestRule timeout = new Timeout(5000);
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
	public void test_UnionType_Valid_1() {
		util.exec("UnionType_Valid_1");
	}

	@Test
	public void test_UnionType_Valid_10() {
		util.exec("UnionType_Valid_10");
	}

	@Test
	public void test_UnionType_Valid_11() {
		util.exec("UnionType_Valid_11");
	}

	@Test
	public void test_UnionType_Valid_12() {
		util.exec("UnionType_Valid_12");
	}

	@Test
	public void test_UnionType_Valid_13() {
		util.exec("UnionType_Valid_13");
	}

	@Test
	public void test_UnionType_Valid_14() {
		util.exec("UnionType_Valid_14");
	}

	@Test
	public void test_UnionType_Valid_15() {
		util.exec("UnionType_Valid_15");
	}

	@Test
	public void test_UnionType_Valid_16() {
		util.exec("UnionType_Valid_16");
	}

	@Test
	public void test_UnionType_Valid_17() {
		util.exec("UnionType_Valid_17");
	}

	@Test
	public void test_UnionType_Valid_18() {
		util.exec("UnionType_Valid_18");
	}

	@Test
	public void test_UnionType_Valid_19() {
		util.exec("UnionType_Valid_19");
	}

	@Test
	public void test_UnionType_Valid_2() {
		util.exec("UnionType_Valid_2");
	}

	@Test
	public void test_UnionType_Valid_20() {
		util.exec("UnionType_Valid_20");
	}

	@Test
	public void test_UnionType_Valid_21() {
		util.exec("UnionType_Valid_21");
	}

	@Test
	public void test_UnionType_Valid_22() {
		util.exec("UnionType_Valid_22");
	}

	@Test
	public void test_UnionType_Valid_23() {
		util.exec("UnionType_Valid_23");
	}

	@Test
	public void test_UnionType_Valid_3() {
		util.exec("UnionType_Valid_3");
	}

	@Test
	public void test_UnionType_Valid_4() {
		util.exec("UnionType_Valid_4");
	}

	@Test
	public void test_UnionType_Valid_5() {
		util.exec("UnionType_Valid_5");
	}

	@Test
	public void test_UnionType_Valid_6() {
		util.exec("UnionType_Valid_6");
	}

	@Test
	public void test_UnionType_Valid_7() {
		util.exec("UnionType_Valid_7");
	}

	@Test
	public void test_UnionType_Valid_8() {
		util.exec("UnionType_Valid_8");
	}

	@Test
	public void test_UnionType_Valid_9() {
		util.exec("UnionType_Valid_9");
	}

}
