package wyopcl.testing.C;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestRule;
import org.junit.rules.Timeout;

import wyopcl.testing.BaseTestUtil;

public class CoercionValidTestCase {
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
	public void test_Coercion_Valid_1() {
		util.exec("Coercion_Valid_1");
	}

	@Test
	public void test_Coercion_Valid_2() {
		util.exec("Coercion_Valid_2");
	}

	@Test
	public void test_Coercion_Valid_3() {
		util.exec("Coercion_Valid_3");
	}

	@Test
	public void test_Coercion_Valid_4() {
		util.exec("Coercion_Valid_4");
	}

	@Test
	@Ignore("No such a file.")
	public void test_Coercion_Valid_5() {
		util.exec("Coercion_Valid_5");
	}

	@Test
	public void test_Coercion_Valid_6() {
		util.exec("Coercion_Valid_6");
	}

	@Test
	public void test_Coercion_Valid_7() {
		util.exec("Coercion_Valid_7");
	}

	/**
	.\Coercion_Valid_8.whiley:7: expected type real, found int
        return |x|
               ^^^
wycc.lang.SyntaxError: expected type real, found int
	at wycc.lang.SyntaxError.syntaxError(SyntaxError.java:238)
	at wyc.builder.FlowTypeChecker.checkIsSubtype(FlowTypeChecker.java:4060)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:799)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:327)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:298)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:766)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:329)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:298)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:264)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:145)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:135)
	at wyc.builder.WhileyBuilder.build(WhileyBuilder.java:181)
	at wybs.util.StdBuildRule.apply(StdBuildRule.java:109)
	at wybs.util.StdProject.build(StdProject.java:256)
	at wyc.util.WycBuildTask.buildEntries(WycBuildTask.java:503)
	at wyc.util.WycBuildTask.build(WycBuildTask.java:471)
	at wyopcl.WyopclMain.run(WyopclMain.java:119)
	at wyopcl.WyopclMain.main(WyopclMain.java:148)
	 */
	@Test
	@Ignore("SyntaxError")
	public void test_Coercion_Valid_8() {
		util.exec("Coercion_Valid_8");
	}
}
