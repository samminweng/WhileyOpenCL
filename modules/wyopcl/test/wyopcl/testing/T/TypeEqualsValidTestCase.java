package wyopcl.testing.T;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestRule;
import org.junit.rules.Timeout;

import wyopcl.testing.BaseTestUtil;

public class TypeEqualsValidTestCase {
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
	public void test_TypeEquals_Valid_1() {
		util.exec("TypeEquals_Valid_1");
	}

	@Test
	public void test_TypeEquals_Valid_10() {
		util.exec("TypeEquals_Valid_10");
	}

	@Test
	public void test_TypeEquals_Valid_11() {
		util.exec("TypeEquals_Valid_11");
	}

	@Test
	public void test_TypeEquals_Valid_12() {
		util.exec("TypeEquals_Valid_12");
	}

	@Test
	public void test_TypeEquals_Valid_13() {
		util.exec("TypeEquals_Valid_13");
	}

	@Test
	public void test_TypeEquals_Valid_14() {
		util.exec("TypeEquals_Valid_14");
	}

	@Test
	public void test_TypeEquals_Valid_15() {
		util.exec("TypeEquals_Valid_15");
	}

	@Test
	public void test_TypeEquals_Valid_16() {
		util.exec("TypeEquals_Valid_16");
	}

	@Test
	public void test_TypeEquals_Valid_17() {
		util.exec("TypeEquals_Valid_17");
	}

	@Test
	public void test_TypeEquals_Valid_18() {
		util.exec("TypeEquals_Valid_18");
	}

	@Test
	public void test_TypeEquals_Valid_19() {
		util.exec("TypeEquals_Valid_19");
	}

	@Test
	public void test_TypeEquals_Valid_2() {
		util.exec("TypeEquals_Valid_2");
	}

	@Test
	public void test_TypeEquals_Valid_20() {
		util.exec("TypeEquals_Valid_20");
	}

	@Test
	public void test_TypeEquals_Valid_21() {
		util.exec("TypeEquals_Valid_21");
	}

	@Test
	public void test_TypeEquals_Valid_22() {
		util.exec("TypeEquals_Valid_22");
	}

	/**
	 * .\TypeEquals_Valid_23.whiley:11: expecting int or real or char, found TypeEquals_Valid_23:expr
        return e + 1
               ^
wycc.lang.SyntaxError: expecting int or real or char, found TypeEquals_Valid_23:expr
	at wycc.lang.SyntaxError.syntaxError(SyntaxError.java:238)
	at wyc.lang.WhileyFile.syntaxError(WhileyFile.java:620)
	at wyc.builder.FlowTypeChecker.checkSuptypes(FlowTypeChecker.java:4133)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:1883)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:1660)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:797)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:327)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:298)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:767)
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
	@Ignore("Issue ???\n"
			+ ".\\TypeEquals_Valid_23.whiley:11: expecting int or real or char, found TypeEquals_Valid_23:expr\r\n" + 
			"        return e + 1\r\n" + 
			"               ^\r\n" + 
			"wycc.lang.SyntaxError: expecting int or real or char, found TypeEquals_Valid_23:expr\r\n" + 
			"	at wycc.lang.SyntaxError.syntaxError(SyntaxError.java:238)\r\n" + 
			"	at wyc.lang.WhileyFile.syntaxError(WhileyFile.java:620)\r\n" + 
			"	at wyc.builder.FlowTypeChecker.checkSuptypes(FlowTypeChecker.java:4133)")
	@Test
	public void test_TypeEquals_Valid_23() {
		util.exec("TypeEquals_Valid_23");
	}

	@Test
	public void test_TypeEquals_Valid_24() {
		util.exec("TypeEquals_Valid_24");
	}

	@Test
	public void test_TypeEquals_Valid_25() {
		util.exec("TypeEquals_Valid_25");
	}

	@Test
	public void test_TypeEquals_Valid_26() {
		util.exec("TypeEquals_Valid_26");
	}

	@Test
	public void test_TypeEquals_Valid_27() {
		util.exec("TypeEquals_Valid_27");
	}

	@Test
	public void test_TypeEquals_Valid_28() {
		util.exec("TypeEquals_Valid_28");
	}

	@Test
	public void test_TypeEquals_Valid_29() {
		util.exec("TypeEquals_Valid_29");
	}
/**
 * .\TypeEquals_Valid_3.whiley:6: unknown variable
    r = []
    ^
wycc.lang.SyntaxError: unknown variable
	at wycc.lang.SyntaxError.syntaxError(SyntaxError.java:238)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:1021)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:462)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:325)
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
			+ ".\\TypeEquals_Valid_3.whiley:6: unknown variable\r\n" + 
			"    r = []\r\n" + 
			"    ^\r\n" + 
			"wycc.lang.SyntaxError: unknown variable\r\n" + 
			"	at wycc.lang.SyntaxError.syntaxError(SyntaxError.java:238)")
	@Test
	public void test_TypeEquals_Valid_3() {
		util.exec("TypeEquals_Valid_3");
	}

	@Test
	public void test_TypeEquals_Valid_30() {
		util.exec("TypeEquals_Valid_30");
	}

	@Test
	public void test_TypeEquals_Valid_31() {
		util.exec("TypeEquals_Valid_31");
	}

	@Test
	public void test_TypeEquals_Valid_32() {
		util.exec("TypeEquals_Valid_32");
	}

	@Test
	public void test_TypeEquals_Valid_33() {
		util.exec("TypeEquals_Valid_33");
	}

	@Test
	public void test_TypeEquals_Valid_34() {
		util.exec("TypeEquals_Valid_34");
	}

	@Test
	public void test_TypeEquals_Valid_35() {
		util.exec("TypeEquals_Valid_35");
	}
/**
 * .\TypeEquals_Valid_36.whiley:10: found int|[int], expected string, set, list or dictionary.
    if (t.lhs is plist) && ((|t.lhs| > 0) && (t.lhs[0] == 0)):
                              ^^^^^
wycc.lang.SyntaxError: found int|[int], expected string, set, list or dictionary.
	at wycc.lang.SyntaxError.syntaxError(SyntaxError.java:238)
	at wyc.lang.WhileyFile.syntaxError(WhileyFile.java:620)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:2173)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:1691)
	at wyc.builder.FlowTypeChecker.resolveLeafCondition(FlowTypeChecker.java:1458)
	at wyc.builder.FlowTypeChecker.propagateCondition(FlowTypeChecker.java:1356)
	at wyc.builder.FlowTypeChecker.propagateCondition(FlowTypeChecker.java:1263)
	at wyc.builder.FlowTypeChecker.resolveNonLeafCondition(FlowTypeChecker.java:1396)
	at wyc.builder.FlowTypeChecker.propagateCondition(FlowTypeChecker.java:1345)
	at wyc.builder.FlowTypeChecker.propagateCondition(FlowTypeChecker.java:1263)
	at wyc.builder.FlowTypeChecker.resolveNonLeafCondition(FlowTypeChecker.java:1398)
	at wyc.builder.FlowTypeChecker.propagateCondition(FlowTypeChecker.java:1345)
	at wyc.builder.FlowTypeChecker.propagateCondition(FlowTypeChecker.java:1263)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:755)
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
	@Ignore("Issue ???\n"
			+ ".\\TypeEquals_Valid_36.whiley:10: found int|[int], expected string, set, list or dictionary.\r\n" + 
			"    if (t.lhs is plist) && ((|t.lhs| > 0) && (t.lhs[0] == 0)):\r\n" + 
			"                              ^^^^^\r\n" + 
			"wycc.lang.SyntaxError: found int|[int], expected string, set, list or dictionary.\r\n" + 
			"	at wycc.lang.SyntaxError.syntaxError(SyntaxError.java:238)\r\n" + 
			"	at wyc.lang.WhileyFile.syntaxError(WhileyFile.java:620)")
	@Test
	public void test_TypeEquals_Valid_36() {
		util.exec("TypeEquals_Valid_36");
	}
/**
 * .\TypeEquals_Valid_37.whiley:10: found int|[int], expected string, set, list or dictionary.
    if (t.lhs is plist) && ((|t.lhs| > 0) && (t.lhs[0] == 0)):
                              ^^^^^
wycc.lang.SyntaxError: found int|[int], expected string, set, list or dictionary.
	at wycc.lang.SyntaxError.syntaxError(SyntaxError.java:238)
	at wyc.lang.WhileyFile.syntaxError(WhileyFile.java:620)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:2173)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:1691)
	at wyc.builder.FlowTypeChecker.resolveLeafCondition(FlowTypeChecker.java:1458)
	at wyc.builder.FlowTypeChecker.propagateCondition(FlowTypeChecker.java:1356)
	at wyc.builder.FlowTypeChecker.propagateCondition(FlowTypeChecker.java:1263)
	at wyc.builder.FlowTypeChecker.resolveNonLeafCondition(FlowTypeChecker.java:1396)
	at wyc.builder.FlowTypeChecker.propagateCondition(FlowTypeChecker.java:1345)
	at wyc.builder.FlowTypeChecker.propagateCondition(FlowTypeChecker.java:1263)
	at wyc.builder.FlowTypeChecker.resolveNonLeafCondition(FlowTypeChecker.java:1398)
	at wyc.builder.FlowTypeChecker.propagateCondition(FlowTypeChecker.java:1345)
	at wyc.builder.FlowTypeChecker.propagateCondition(FlowTypeChecker.java:1263)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:755)
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
	@Ignore("Issue ???\n"
			+ ".\\TypeEquals_Valid_37.whiley:10: found int|[int], expected string, set, list or dictionary.\r\n" + 
			"    if (t.lhs is plist) && ((|t.lhs| > 0) && (t.lhs[0] == 0)):\r\n" + 
			"                              ^^^^^\r\n" + 
			"wycc.lang.SyntaxError: found int|[int], expected string, set, list or dictionary.\r\n" + 
			"	at wycc.lang.SyntaxError.syntaxError(SyntaxError.java:238)\r\n" + 
			"	at wyc.lang.WhileyFile.syntaxError(WhileyFile.java:620)")
	@Test
	public void test_TypeEquals_Valid_37() {
		util.exec("TypeEquals_Valid_37");
	}

	/***
	 * .\TypeEquals_Valid_38.whiley:8: found int|[int], expected string, set, list or dictionary.
    if (t.lhs is [int]) && ((|t.lhs| > 0) && (t.lhs[0] == 0)):
                              ^^^^^
wycc.lang.SyntaxError: found int|[int], expected string, set, list or dictionary.
	at wycc.lang.SyntaxError.syntaxError(SyntaxError.java:238)
	at wyc.lang.WhileyFile.syntaxError(WhileyFile.java:620)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:2173)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:1691)
	at wyc.builder.FlowTypeChecker.resolveLeafCondition(FlowTypeChecker.java:1458)
	at wyc.builder.FlowTypeChecker.propagateCondition(FlowTypeChecker.java:1356)
	at wyc.builder.FlowTypeChecker.propagateCondition(FlowTypeChecker.java:1263)
	at wyc.builder.FlowTypeChecker.resolveNonLeafCondition(FlowTypeChecker.java:1396)
	at wyc.builder.FlowTypeChecker.propagateCondition(FlowTypeChecker.java:1345)
	at wyc.builder.FlowTypeChecker.propagateCondition(FlowTypeChecker.java:1263)
	at wyc.builder.FlowTypeChecker.resolveNonLeafCondition(FlowTypeChecker.java:1398)
	at wyc.builder.FlowTypeChecker.propagateCondition(FlowTypeChecker.java:1345)
	at wyc.builder.FlowTypeChecker.propagateCondition(FlowTypeChecker.java:1263)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:755)
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
	@Ignore("Issue ???\n"
			+ ".\\TypeEquals_Valid_38.whiley:8: found int|[int], expected string, set, list or dictionary.\r\n" + 
			"    if (t.lhs is [int]) && ((|t.lhs| > 0) && (t.lhs[0] == 0)):\r\n" + 
			"                              ^^^^^\r\n" + 
			"wycc.lang.SyntaxError: found int|[int], expected string, set, list or dictionary.\r\n" + 
			"	at wycc.lang.SyntaxError.syntaxError(SyntaxError.java:238)\r\n" + 
			"	at wyc.lang.WhileyFile.syntaxError(WhileyFile.java:620)")
	@Test
	public void test_TypeEquals_Valid_38() {
		util.exec("TypeEquals_Valid_38");
	}

	@Test
	public void test_TypeEquals_Valid_39() {
		util.exec("TypeEquals_Valid_39");
	}

	@Test
	public void test_TypeEquals_Valid_40() {
		util.exec("TypeEquals_Valid_40");
	}
/**
 * .\TypeEquals_Valid_41.whiley:11: expected type int, found TypeEquals_Valid_41:expr
        return e
               ^
wycc.lang.SyntaxError: expected type int, found TypeEquals_Valid_41:expr
	at wycc.lang.SyntaxError.syntaxError(SyntaxError.java:238)
	at wyc.builder.FlowTypeChecker.checkIsSubtype(FlowTypeChecker.java:4060)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:799)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:327)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:298)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:767)
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
	@Ignore("Issue ???\n"
			+ ".\\TypeEquals_Valid_41.whiley:11: expected type int, found TypeEquals_Valid_41:expr\r\n" + 
			"        return e\r\n" + 
			"               ^\r\n" + 
			"wycc.lang.SyntaxError: expected type int, found TypeEquals_Valid_41:expr\r\n" + 
			"	at wycc.lang.SyntaxError.syntaxError(SyntaxError.java:238)\r\n" + 
			"	at wyc.builder.FlowTypeChecker.checkIsSubtype(FlowTypeChecker.java:4060)")
	@Test
	public void test_TypeEquals_Valid_41() {
		util.exec("TypeEquals_Valid_41");
	}

	@Test
	public void test_TypeEquals_Valid_42() {
		util.exec("TypeEquals_Valid_42");
	}

	@Test
	public void test_TypeEquals_Valid_43() {
		util.exec("TypeEquals_Valid_43");
	}

	@Test
	public void test_TypeEquals_Valid_44() {
		util.exec("TypeEquals_Valid_44");
	}

	@Test
	public void test_TypeEquals_Valid_45() {
		util.exec("TypeEquals_Valid_45");
	}

	@Test
	public void test_TypeEquals_Valid_46() {
		util.exec("TypeEquals_Valid_46");
	}

	@Test
	public void test_TypeEquals_Valid_47() {
		util.exec("TypeEquals_Valid_47");
	}

	@Test
	public void test_TypeEquals_Valid_5() {
		util.exec("TypeEquals_Valid_5");
	}

	@Test
	public void test_TypeEquals_Valid_6() {
		util.exec("TypeEquals_Valid_6");
	}

	@Test
	public void test_TypeEquals_Valid_7() {
		util.exec("TypeEquals_Valid_7");
	}

	@Test
	public void test_TypeEquals_Valid_8() {
		util.exec("TypeEquals_Valid_8");
	}

	@Test
	public void test_TypeEquals_Valid_9() {
		util.exec("TypeEquals_Valid_9");
	}

}
