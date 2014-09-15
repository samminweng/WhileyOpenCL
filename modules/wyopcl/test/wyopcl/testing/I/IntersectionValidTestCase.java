package wyopcl.testing.I;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestRule;
import org.junit.rules.Timeout;

import wyopcl.testing.BaseTestUtil;

public class IntersectionValidTestCase {
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

	/**
	 * .\Intersection_Valid_1.whiley:3: internal failure, intersection types not supported yet
type EmptyList is [int] & [real]
                 ^^^^^^^^^^^^^^^
wycc.lang.SyntaxError$InternalFailure: internal failure, intersection types not supported yet
	at wycc.lang.SyntaxError.internalFailure(SyntaxError.java:297)
	at wyc.lang.WhileyFile.internalFailure(WhileyFile.java:630)
	at wyc.builder.FlowTypeChecker.resolveAsType(FlowTypeChecker.java:3210)
	at wyc.builder.FlowTypeChecker.resolveAsType(FlowTypeChecker.java:3078)
	at wyc.builder.FlowTypeChecker.resolveAsType(FlowTypeChecker.java:3023)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:179)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:147)
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
	public void test_Intersection_Valid_1() {
		util.exec("Intersection_Valid_1");
	}
	/**
	 * .\Intersection_Valid_2.whiley:7: internal failure, intersection types not supported yet
type InterList is UnitList & LinkedList
                 ^^^^^^^^^^^^^^^^^^^^^^
wycc.lang.SyntaxError$InternalFailure: internal failure, intersection types not supported yet
	at wycc.lang.SyntaxError.internalFailure(SyntaxError.java:297)
	at wyc.lang.WhileyFile.internalFailure(WhileyFile.java:630)
	at wyc.builder.FlowTypeChecker.resolveAsType(FlowTypeChecker.java:3210)
	at wyc.builder.FlowTypeChecker.resolveAsType(FlowTypeChecker.java:3078)
	at wyc.builder.FlowTypeChecker.resolveAsType(FlowTypeChecker.java:3023)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:179)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:147)
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
	public void test_Intersection_Valid_2() {
		util.exec("Intersection_Valid_2");
	}

}
