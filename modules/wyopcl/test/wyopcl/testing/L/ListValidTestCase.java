package wyopcl.testing.L;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestRule;
import org.junit.rules.Timeout;

import wyopcl.testing.BaseTestUtil;

public class ListValidTestCase {
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
	public void test_ListAccess_Valid_1() {
		util.exec("ListAccess_Valid_1");
	}

	@Test
	public void test_ListAccess_Valid_3() {
		util.exec("ListAccess_Valid_3");
	}

	@Test
	public void test_ListAccess_Valid_5() {
		util.exec("ListAccess_Valid_5");
	}
	/**
	 * .\ListAccess_Valid_6.whiley:9: invalid set or list expression
            r = r ++ [r[0]]
                      ^
wycc.lang.SyntaxError: invalid set or list expression
	at wycc.lang.SyntaxError.syntaxError(SyntaxError.java:238)
	at wyc.lang.WhileyFile.syntaxError(WhileyFile.java:620)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:2149)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:1687)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:2216)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:1696)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:1754)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:1660)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:463)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:325)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:298)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:767)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:329)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:298)
	at wyc.builder.FlowTypeChecker.computeFixedPoint(FlowTypeChecker.java:2471)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:692)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:333)
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
	@Ignore("Issue ???\n"
			+ ".\\ListAccess_Valid_6.whiley:9: invalid set or list expression\r\n" + 
			"            r = r ++ [r[0]]\r\n" + 
			"                      ^\r\n" + 
			"wycc.lang.SyntaxError: invalid set or list expression\r\n" + 
			"	at wycc.lang.SyntaxError.syntaxError(SyntaxError.java:238)\r\n" + 
			"	at wyc.lang.WhileyFile.syntaxError(WhileyFile.java:620)")
	@Test
	public void test_ListAccess_Valid_6() {
		util.exec("ListAccess_Valid_6");
	}
	/**
	 * .\ListAccess_Valid_7.whiley:6: incomparable operands: [void] and null
        if r == null:
           ^^^^^^^^^
wycc.lang.SyntaxError: incomparable operands: [void] and null
	at wycc.lang.SyntaxError.syntaxError(SyntaxError.java:238)
	at wyc.lang.WhileyFile.syntaxError(WhileyFile.java:620)
	at wyc.builder.FlowTypeChecker.resolveLeafCondition(FlowTypeChecker.java:1606)
	at wyc.builder.FlowTypeChecker.propagateCondition(FlowTypeChecker.java:1356)
	at wyc.builder.FlowTypeChecker.propagateCondition(FlowTypeChecker.java:1263)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:755)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:329)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:298)
	at wyc.builder.FlowTypeChecker.computeFixedPoint(FlowTypeChecker.java:2471)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:692)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:333)
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
	@Ignore("Issue ???\n"
			+ ".\\ListAccess_Valid_7.whiley:6: incomparable operands: [void] and null\r\n" + 
			"        if r == null:\r\n" + 
			"           ^^^^^^^^^\r\n" + 
			"wycc.lang.SyntaxError: incomparable operands: [void] and null\r\n" + 
			"	at wycc.lang.SyntaxError.syntaxError(SyntaxError.java:238)\r\n" + 
			"	at wyc.lang.WhileyFile.syntaxError(WhileyFile.java:620)")
	@Test
	public void test_ListAccess_Valid_7() {
		util.exec("ListAccess_Valid_7");
	}

	@Test
	public void test_ListAccess_Valid_8() {
		util.exec("ListAccess_Valid_8");
	}

	@Test
	public void test_ListAppend_Valid_1() {
		util.exec("ListAppend_Valid_1");
	}

	@Test
	public void test_ListAppend_Valid_11() {
		util.exec("ListAppend_Valid_11");
	}

	@Test
	public void test_ListAppend_Valid_13() {
		util.exec("ListAppend_Valid_13");
	}

	@Test
	public void test_ListAppend_Valid_14() {
		util.exec("ListAppend_Valid_14");
	}

	@Test
	public void test_ListAppend_Valid_2() {
		util.exec("ListAppend_Valid_2");
	}

	@Test
	public void test_ListAppend_Valid_3() {
		util.exec("ListAppend_Valid_3");
	}

	@Test
	public void test_ListAppend_Valid_4() {
		util.exec("ListAppend_Valid_4");
	}

	@Test
	public void test_ListAppend_Valid_5() {
		util.exec("ListAppend_Valid_5");
	}

	@Test
	public void test_ListAppend_Valid_6() {
		util.exec("ListAppend_Valid_6");
	}

	@Test
	public void test_ListAppend_Valid_7() {
		util.exec("ListAppend_Valid_7");
	}

	@Test
	public void test_ListAppend_Valid_8() {
		util.exec("ListAppend_Valid_8");
	}

	@Test
	public void test_ListAppend_Valid_9() {
		util.exec("ListAppend_Valid_9");
	}

	@Test
	public void test_ListAssign_Valid_1() {
		util.exec("ListAssign_Valid_1");
	}

	@Test
	public void test_ListAssign_Valid_11() {
		util.exec("ListAssign_Valid_11");
	}

	@Test
	public void test_ListAssign_Valid_2() {
		util.exec("ListAssign_Valid_2");
	}

	@Test
	public void test_ListAssign_Valid_3() {
		util.exec("ListAssign_Valid_3");
	}

	@Test
	public void test_ListAssign_Valid_4() {
		util.exec("ListAssign_Valid_4");
	}

	@Test
	public void test_ListAssign_Valid_5() {
		util.exec("ListAssign_Valid_5");
	}

	@Test
	public void test_ListAssign_Valid_6() {
		util.exec("ListAssign_Valid_6");
	}

	@Test
	public void test_ListAssign_Valid_7() {
		util.exec("ListAssign_Valid_7");
	}

	@Test
	public void test_ListAssign_Valid_8() {
		util.exec("ListAssign_Valid_8");
	}

	@Test
	public void test_ListAssign_Valid_9() {
		util.exec("ListAssign_Valid_9");
	}

	@Test
	public void test_ListConversion_Valid_1() {
		util.exec("ListConversion_Valid_1");
	}

	@Test
	public void test_ListElemOf_Valid_1() {
		util.exec("ListElemOf_Valid_1");
	}

	@Test
	public void test_ListEmpty_Valid_1() {
		util.exec("ListEmpty_Valid_1");
	}

	@Test
	public void test_ListEquals_Valid_1() {
		util.exec("ListEquals_Valid_1");
	}

	@Test
	public void test_ListGenerator_Valid_1() {
		util.exec("ListGenerator_Valid_1");
	}

	@Test
	public void test_ListGenerator_Valid_2() {
		util.exec("ListGenerator_Valid_2");
	}

	@Test
	public void test_ListGenerator_Valid_3() {
		util.exec("ListGenerator_Valid_3");
	}

	@Test
	public void test_ListGenerator_Valid_5() {
		util.exec("ListGenerator_Valid_5");
	}

	@Test
	public void test_ListLength_Valid_1() {
		util.exec("ListLength_Valid_1");
	}

	@Test
	public void test_ListLength_Valid_2() {
		util.exec("ListLength_Valid_2");
	}

	@Test
	public void test_ListLength_Valid_3() {
		util.exec("ListLength_Valid_3");
	}

	@Test
	public void test_ListRange_Valid_1() {
		util.exec("ListRange_Valid_1");
	}

	@Test
	public void test_ListSublist_Valid_1() {
		util.exec("ListSublist_Valid_1");
	}

	@Test
	public void test_ListSublist_Valid_2() {
		util.exec("ListSublist_Valid_2");
	}

	@Test
	public void test_ListSublist_Valid_3() {
		util.exec("ListSublist_Valid_3");
	}

	@Test
	public void test_ListSublist_Valid_4() {
		util.exec("ListSublist_Valid_4");
	}

	@Test
	public void test_ListSublist_Valid_5() {
		util.exec("ListSublist_Valid_5");
	}

}
