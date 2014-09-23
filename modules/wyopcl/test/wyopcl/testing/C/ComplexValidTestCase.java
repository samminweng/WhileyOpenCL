package wyopcl.testing.C;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestRule;
import org.junit.rules.Timeout;

import wyopcl.testing.BaseTestUtil;

public class ComplexValidTestCase {
	@Rule
	public TestRule timeout = new Timeout(10000);
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
	public void test_Complex_Valid_1() {
		util.exec("Complex_Valid_1");
	}

	@Test
	public void test_Complex_Valid_2() {
		util.exec("Complex_Valid_2");
	}
	/**
	 * .\Complex_Valid_3.whiley:9: record required, got: X<null|{int item,X left,X right}>
    (tree != null && tree.left != null ==> tree.left.item < tree.item) &&
                                           ^^^^^^^^^^^^^^
wycc.lang.SyntaxError: record required, got: X<null|{int item,X left,X right}>
	at wycc.lang.SyntaxError.syntaxError(SyntaxError.java:238)
	at wyc.lang.WhileyFile.syntaxError(WhileyFile.java:620)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:2327)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:1674)
	at wyc.builder.FlowTypeChecker.resolveLeafCondition(FlowTypeChecker.java:1458)
	at wyc.builder.FlowTypeChecker.propagateCondition(FlowTypeChecker.java:1356)
	at wyc.builder.FlowTypeChecker.propagateCondition(FlowTypeChecker.java:1263)
	at wyc.builder.FlowTypeChecker.resolveNonLeafCondition(FlowTypeChecker.java:1422)
	at wyc.builder.FlowTypeChecker.propagateCondition(FlowTypeChecker.java:1345)
	at wyc.builder.FlowTypeChecker.propagateCondition(FlowTypeChecker.java:1263)
	at wyc.builder.FlowTypeChecker.resolveNonLeafCondition(FlowTypeChecker.java:1398)
	at wyc.builder.FlowTypeChecker.propagateCondition(FlowTypeChecker.java:1345)
	at wyc.builder.FlowTypeChecker.propagateCondition(FlowTypeChecker.java:1263)
	at wyc.builder.FlowTypeChecker.resolveNonLeafCondition(FlowTypeChecker.java:1396)
	at wyc.builder.FlowTypeChecker.propagateCondition(FlowTypeChecker.java:1345)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:1750)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:1660)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:196)
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
	@Test
	@Ignore("Issue ???\n"
			+ ".\\Complex_Valid_3.whiley:9: record required, got: X<null|{int item,X left,X right}>\r\n" + 
			"    (tree != null && tree.left != null ==> tree.left.item < tree.item) &&\r\n" + 
			"                                           ^^^^^^^^^^^^^^\r\n" + 
			"wycc.lang.SyntaxError: record required, got: X<null|{int item,X left,X right}>\r\n" + 
			"	at wycc.lang.SyntaxError.syntaxError(SyntaxError.java:238)\r\n" + 
			"	at wyc.lang.WhileyFile.syntaxError(WhileyFile.java:620)")
	public void test_Complex_Valid_3() {
		util.exec("Complex_Valid_3");
	}

	@Test
	public void test_Complex_Valid_4() {
		util.exec("Complex_Valid_4");
	}

	@Test
	public void test_Complex_Valid_5() {
		util.exec("Complex_Valid_5");
	}

	@Test
	public void test_Complex_Valid_6() {
		util.exec("Complex_Valid_6");
	}

}
