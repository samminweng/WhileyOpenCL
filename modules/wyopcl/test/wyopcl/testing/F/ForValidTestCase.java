package wyopcl.testing.F;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestRule;
import org.junit.rules.Timeout;

import wyopcl.testing.BaseTestUtil;

public class ForValidTestCase {
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
	public void test_For_Valid_1() {
		util.exec("For_Valid_1");
	}

	@Test
	public void test_For_Valid_10() {
		util.exec("For_Valid_10");
	}

	@Test
	public void test_For_Valid_11() {
		util.exec("For_Valid_11");
	}

	@Test
	public void test_For_Valid_12() {
		util.exec("For_Valid_12");
	}

	@Test
	public void test_For_Valid_13() {
		util.exec("For_Valid_13");
	}

	@Test
	public void test_For_Valid_14() {
		util.exec("For_Valid_14");
	}

	@Test
	public void test_For_Valid_15() {
		util.exec("For_Valid_15");
	}

	@Test
	public void test_For_Valid_16() {
		util.exec("For_Valid_16");
	}

	@Test
	public void test_For_Valid_17() {
		util.exec("For_Valid_17");
	}

	@Test
	public void test_For_Valid_18() {
		util.exec("For_Valid_18");
	}

	@Test
	public void test_For_Valid_2() {
		util.exec("For_Valid_2");
	}

	@Test
	public void test_For_Valid_3() {
		util.exec("For_Valid_3");
	}

	@Test
	public void test_For_Valid_4() {
		util.exec("For_Valid_4");
	}

	/**
	 * .\For_Valid_5.whiley:4: variable may be uninitialised for i, r in xs:
	 * ^^^^^^^^^^^^^^^ wycc.lang.SyntaxError: variable may be uninitialised at
	 * wycc.lang.SyntaxError.syntaxError(SyntaxError.java:238) at
	 * wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:675) at
	 * wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:333) at
	 * wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:298) at
	 * wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:264) at
	 * wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:145) at
	 * wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:135) at
	 * wyc.builder.WhileyBuilder.build(WhileyBuilder.java:181) at
	 * wybs.util.StdBuildRule.apply(StdBuildRule.java:109) at
	 * wybs.util.StdProject.build(StdProject.java:256) at
	 * wyc.util.WycBuildTask.buildEntries(WycBuildTask.java:503) at
	 * wyc.util.WycBuildTask.build(WycBuildTask.java:471) at
	 * wyopcl.WyopclMain.run(WyopclMain.java:119) at
	 * wyopcl.WyopclMain.main(WyopclMain.java:148)
	 */
	@Ignore("SyntaxError")
	@Test
	public void test_For_Valid_5() {
		util.exec("For_Valid_5");
	}

	@Ignore("SyntaxError")
	@Test
	public void test_For_Valid_6() {
		util.exec("For_Valid_6");
	}

	@Test
	public void test_For_Valid_7() {
		util.exec("For_Valid_7");
	}

	@Test
	public void test_For_Valid_8() {
		util.exec("For_Valid_8");
	}

	@Test
	public void test_For_Valid_9() {
		util.exec("For_Valid_9");
	}

}
