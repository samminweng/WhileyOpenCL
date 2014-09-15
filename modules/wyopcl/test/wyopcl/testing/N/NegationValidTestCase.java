package wyopcl.testing.N;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestRule;
import org.junit.rules.Timeout;

import wyopcl.testing.BaseTestUtil;

public class NegationValidTestCase {
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
	public void test_NegationType_Valid_1() {
		util.exec("NegationType_Valid_1");
	}

	@Test
	public void test_NegationType_Valid_2() {
		util.exec("NegationType_Valid_2");
	}
	/**
	 * .\NegationType_Valid_3.whiley:3: internal failure, intersection types not supported yet
function f(string x) => !null & !int:
                         ^^^^^^^^^^^
wycc.lang.SyntaxError$InternalFailure: internal failure, intersection types not supported yet
	at wycc.lang.SyntaxError.internalFailure(SyntaxError.java:297)
	at wyc.lang.WhileyFile.internalFailure(WhileyFile.java:630)
	at wyc.builder.FlowTypeChecker.resolveAsType(FlowTypeChecker.java:3210)
	at wyc.builder.FlowTypeChecker.resolveAsType(FlowTypeChecker.java:3197)
	at wyc.builder.FlowTypeChecker.resolveAsType(FlowTypeChecker.java:3078)
	at wyc.builder.FlowTypeChecker.resolveAsType(FlowTypeChecker.java:3023)
	at wyc.builder.FlowTypeChecker.resolveAsType(FlowTypeChecker.java:2975)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:256)
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
	@Ignore("SyntaxError")
	@Test
	public void test_NegationType_Valid_3() {
		util.exec("NegationType_Valid_3");
	}

	@Test
	public void test_NegationType_Valid_4() {
		util.exec("NegationType_Valid_4");
	}

}
