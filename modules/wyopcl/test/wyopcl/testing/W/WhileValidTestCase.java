package wyopcl.testing.W;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestRule;
import org.junit.rules.Timeout;

import wyopcl.testing.BaseTestUtil;

public class WhileValidTestCase {
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
	public void test_While_Valid_1() {
		util.exec("While_Valid_1");
	}

	@Test
	public void test_While_Valid_10() {
		util.exec("While_Valid_10");
	}

	@Test
	public void test_While_Valid_11() {
		util.exec("While_Valid_11");
	}

	@Test
	public void test_While_Valid_12() {
		util.exec("While_Valid_12");
	}

	@Test
	public void test_While_Valid_14() {
		util.exec("While_Valid_14");
	}

	@Test
	public void test_While_Valid_15() {
		util.exec("While_Valid_15");
	}

	@Test
	public void test_While_Valid_16() {
		util.exec("While_Valid_16");
	}

	@Test
	public void test_While_Valid_17() {
		util.exec("While_Valid_17");
	}

	@Test
	public void test_While_Valid_18() {
		util.exec("While_Valid_18");
	}

	@Test
	public void test_While_Valid_19() {
		util.exec("While_Valid_19");
	}

	@Test
	public void test_While_Valid_2() {
		util.exec("While_Valid_2");
	}

	@Test
	public void test_While_Valid_20() {
		util.exec("While_Valid_20");
	}

	@Test
	public void test_While_Valid_21() {
		util.exec("While_Valid_21");
	}

	@Test
	public void test_While_Valid_22() {
		util.exec("While_Valid_22");
	}

	@Test
	public void test_While_Valid_23() {
		util.exec("While_Valid_23");
	}

	@Ignore("???")
	@Test
	public void test_While_Valid_24() {
		util.exec("While_Valid_24");
	}

	@Test
	public void test_While_Valid_25() {
		util.exec("While_Valid_25");
	}

	@Ignore("???")
	@Test
	public void test_While_Valid_26() {
		util.exec("While_Valid_26");
	}

	@Test
	public void test_While_Valid_27() {
		util.exec("While_Valid_27");
	}

	@Ignore("???")
	@Test
	public void test_While_Valid_28() {
		util.exec("While_Valid_28");
	}

	@Test
	public void test_While_Valid_29() {
		util.exec("While_Valid_29");
	}

	@Test
	public void test_While_Valid_30() {
		util.exec("While_Valid_30");
	}

	@Test
	public void test_While_Valid_31() {
		util.exec("While_Valid_31");
	}

	@Test
	public void test_While_Valid_32() {
		util.exec("While_Valid_32");
	}

	@Test
	public void test_While_Valid_33() {
		util.exec("While_Valid_33");
	}

	@Test
	@Ignore("No While_Valid_34.sysout")
	public void test_While_Valid_34() {
		util.exec("While_Valid_34");
	}

	@Test
	@Ignore("No While_Valid_35.sysout")
	public void test_While_Valid_35() {
		util.exec("While_Valid_35");
	}

	@Test
	@Ignore("No While_Valid_36.sysout")
	public void test_While_Valid_36() {
		util.exec("While_Valid_36");
	}

	@Test
	public void test_While_Valid_37() {
		util.exec("While_Valid_37");
	}

	@Test
	public void test_While_Valid_38() {
		util.exec("While_Valid_38");
	}

	@Test
	public void test_While_Valid_3() {
		util.exec("While_Valid_3");
	}

	public void test_While_Valid_5() {
		util.exec("While_Valid_5");
	}

	public void test_While_Valid_7() {
		util.exec("While_Valid_7");
	}

	@Test
	public void test_While_Valid_9() {
		util.exec("While_Valid_9");
	}

}
