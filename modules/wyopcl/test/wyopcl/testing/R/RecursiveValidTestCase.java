package wyopcl.testing.R;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestRule;
import org.junit.rules.Timeout;

import wyopcl.testing.BaseTestUtil;

public class RecursiveValidTestCase {
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
	public void test_RecursiveType_Valid_1() {
		util.exec("RecursiveType_Valid_1");
	}

	@Test
	public void test_RecursiveType_Valid_10() {
		util.exec("RecursiveType_Valid_10");
	}

	@Test
	public void test_RecursiveType_Valid_11() {
		util.exec("RecursiveType_Valid_11");
	}

	@Test
	public void test_RecursiveType_Valid_12() {
		util.exec("RecursiveType_Valid_12");
	}

	@Test
	public void test_RecursiveType_Valid_13() {
		util.exec("RecursiveType_Valid_13");
	}

	@Test
	public void test_RecursiveType_Valid_14() {
		util.exec("RecursiveType_Valid_14");
	}

	@Test
	public void test_RecursiveType_Valid_15() {
		util.exec("RecursiveType_Valid_15");
	}

	@Test
	public void test_RecursiveType_Valid_16() {
		util.exec("RecursiveType_Valid_16");
	}

	@Test
	public void test_RecursiveType_Valid_17() {
		util.exec("RecursiveType_Valid_17");
	}

	@Test
	public void test_RecursiveType_Valid_18() {
		util.exec("RecursiveType_Valid_18");
	}

	@Test
	public void test_RecursiveType_Valid_19() {
		util.exec("RecursiveType_Valid_19");
	}

	@Test
	public void test_RecursiveType_Valid_2() {
		util.exec("RecursiveType_Valid_2");
	}

	@Test
	public void test_RecursiveType_Valid_20() {
		util.exec("RecursiveType_Valid_20");
	}

	@Test
	public void test_RecursiveType_Valid_21() {
		util.exec("RecursiveType_Valid_21");
	}

	
	@Test
	public void test_RecursiveType_Valid_22() {
		util.exec("RecursiveType_Valid_22");
	}

	@Test
	public void test_RecursiveType_Valid_23() {
		util.exec("RecursiveType_Valid_23");
	}

	@Test
	public void test_RecursiveType_Valid_24() {
		util.exec("RecursiveType_Valid_24");
	}

	@Test
	public void test_RecursiveType_Valid_25() {
		util.exec("RecursiveType_Valid_25");
	}

	@Test
	public void test_RecursiveType_Valid_26() {
		util.exec("RecursiveType_Valid_26");
	}

	@Test
	public void test_RecursiveType_Valid_27() {
		util.exec("RecursiveType_Valid_27");
	}

	/**
	 .\RecursiveType_Valid_28.whiley:27: unable to resolve name (no match for get(X<null|{int data,X next}>,int)
	found: RecursiveType_Valid_28:get : function(RecursiveType_Valid_28:Link,int) => int)
        return get(ls.next,i+1)
               ^^^^^^^^^^^^^^^^
wycc.lang.SyntaxError: unable to resolve name (no match for get(X<null|{int data,X next}>,int)
	found: RecursiveType_Valid_28:get : function(RecursiveType_Valid_28:Link,int) => int)
	at wycc.lang.SyntaxError.syntaxError(SyntaxError.java:253)
	at wyc.lang.WhileyFile.syntaxError(WhileyFile.java:625)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:1715)
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
Caused by: wycc.util.ResolveError: no match for get(X<null|{int data,X next}>,int)
	found: RecursiveType_Valid_28:get : function(RecursiveType_Valid_28:Link,int) => int
	at wyc.builder.FlowTypeChecker.selectCandidateFunctionOrMethod(FlowTypeChecker.java:2681)
	at wyc.builder.FlowTypeChecker.resolveAsFunctionOrMethod(FlowTypeChecker.java:2509)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:2126)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:1681)
	... 16 more
	 */
	@Test
	@Ignore("Issue #364\n"
			+ " .\\RecursiveType_Valid_28.whiley:27: unable to resolve name (no match for get(X<null|{int data,X next}>,int)\r\n" + 
			"	found: RecursiveType_Valid_28:get : function(RecursiveType_Valid_28:Link,int) => int)\r\n" + 
			"        return get(ls.next,i+1)\r\n" + 
			"               ^^^^^^^^^^^^^^^^\r\n" + 
			"wycc.lang.SyntaxError: unable to resolve name (no match for get(X<null|{int data,X next}>,int)\r\n" + 
			"	found: RecursiveType_Valid_28:get : function(RecursiveType_Valid_28:Link,int) => int)\r\n" + 
			"	at wycc.lang.SyntaxError.syntaxError(SyntaxError.java:253)\r\n" + 
			"	at wyc.lang.WhileyFile.syntaxError(WhileyFile.java:625)")
	public void test_RecursiveType_Valid_28() {
		util.exec("RecursiveType_Valid_28");
	}

	/**
	 .\RecursiveType_Valid_3.whiley:19: record required, got: X<[Y<X|{Y index,Z<{Z index,Z src}|int|real|[Z]> src}|{Z<{Z index,Z src}|int|real|[Z]> index,Y src}>+]>|{Z<{Z index,Z src}|int|real|[Z]> index,Z<{Z index,Z src}|int|real|[Z]> src}
            Value src = evaluate(e.src)
                                 ^^^^^
wycc.lang.SyntaxError: record required, got: X<[Y<X|{Y index,Z<{Z index,Z src}|int|real|[Z]> src}|{Z<{Z index,Z src}|int|real|[Z]> index,Y src}>+]>|{Z<{Z index,Z src}|int|real|[Z]> index,Z<{Z index,Z src}|int|real|[Z]> src}
	at wycc.lang.SyntaxError.syntaxError(SyntaxError.java:238)
	at wyc.lang.WhileyFile.syntaxError(WhileyFile.java:620)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:2327)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:1674)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:2108)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:1681)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:428)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:323)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:298)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:767)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:329)
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
	@Test
	@Ignore("Issue #406\n"
			+ ".\\RecursiveType_Valid_3.whiley:19: record required, got: X<[Y<X|{Y index,Z<{Z index,Z src}|int|real|[Z]> src}|{Z<{Z index,Z src}|int|real|[Z]> index,Y src}>+]>|{Z<{Z index,Z src}|int|real|[Z]> index,Z<{Z index,Z src}|int|real|[Z]> src}\r\n" + 
			"            Value src = evaluate(e.src)\r\n" + 
			"                                 ^^^^^\r\n" + 
			"wycc.lang.SyntaxError: record required, got: X<[Y<X|{Y index,Z<{Z index,Z src}|int|real|[Z]> src}|{Z<{Z index,Z src}|int|real|[Z]> index,Y src}>+]>|{Z<{Z index,Z src}|int|real|[Z]> index,Z<{Z index,Z src}|int|real|[Z]> src}\r\n" + 
			"	at wycc.lang.SyntaxError.syntaxError(SyntaxError.java:238)\r\n" + 
			"	at wyc.lang.WhileyFile.syntaxError(WhileyFile.java:620)")
	public void test_RecursiveType_Valid_3() {
		util.exec("RecursiveType_Valid_3");
	}

	/**
	 .\RecursiveType_Valid_4.whiley:23: record required, got: X<[Y<X|{Y index,Z<{Z index,Z src}|int|real|[Z]> src}|{Z<{Z index,Z src}|int|real|[Z]> index,Y src}>+]>|{Z<{Z index,Z src}|int|real|[Z]> index,Z<{Z index,Z src}|int|real|[Z]> src}
            null|Value src = evaluate(e.src)
                                      ^^^^^
wycc.lang.SyntaxError: record required, got: X<[Y<X|{Y index,Z<{Z index,Z src}|int|real|[Z]> src}|{Z<{Z index,Z src}|int|real|[Z]> index,Y src}>+]>|{Z<{Z index,Z src}|int|real|[Z]> index,Z<{Z index,Z src}|int|real|[Z]> src}
	at wycc.lang.SyntaxError.syntaxError(SyntaxError.java:238)
	at wyc.lang.WhileyFile.syntaxError(WhileyFile.java:620)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:2327)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:1674)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:2108)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:1681)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:428)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:323)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:298)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:767)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:329)
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
	@Test
	@Ignore("Issue #406\n"
			+ ".\\RecursiveType_Valid_4.whiley:23: record required, got: X<[Y<X|{Y index,Z<{Z index,Z src}|int|real|[Z]> src}|{Z<{Z index,Z src}|int|real|[Z]> index,Y src}>+]>|{Z<{Z index,Z src}|int|real|[Z]> index,Z<{Z index,Z src}|int|real|[Z]> src}\r\n" + 
			"            null|Value src = evaluate(e.src)\r\n" + 
			"                                      ^^^^^\r\n" + 
			"wycc.lang.SyntaxError: record required, got: X<[Y<X|{Y index,Z<{Z index,Z src}|int|real|[Z]> src}|{Z<{Z index,Z src}|int|real|[Z]> index,Y src}>+]>|{Z<{Z index,Z src}|int|real|[Z]> index,Z<{Z index,Z src}|int|real|[Z]> src}\r\n" + 
			"	at wycc.lang.SyntaxError.syntaxError(SyntaxError.java:238)\r\n" + 
			"	at wyc.lang.WhileyFile.syntaxError(WhileyFile.java:620)")
	public void test_RecursiveType_Valid_4() {
		util.exec("RecursiveType_Valid_4");
	}
	/**
	 * .\RecursiveType_Valid_5.whiley:6: expected type X<{[int] items,X|null next}>, found null
    Link start = null
                 ^^^^
wycc.lang.SyntaxError: expected type X<{[int] items,X|null next}>, found null
	at wycc.lang.SyntaxError.syntaxError(SyntaxError.java:238)
	at wyc.builder.FlowTypeChecker.checkIsSubtype(FlowTypeChecker.java:4070)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:429)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:323)
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
	@Ignore("Issue #18\n"
			+ " .\\RecursiveType_Valid_5.whiley:6: expected type X<{[int] items,X|null next}>, found null\r\n" + 
			"    Link start = null\r\n" + 
			"                 ^^^^\r\n" + 
			"wycc.lang.SyntaxError: expected type X<{[int] items,X|null next}>, found null\r\n" + 
			"	at wycc.lang.SyntaxError.syntaxError(SyntaxError.java:238)\r\n" + 
			"	at wyc.builder.FlowTypeChecker.checkIsSubtype(FlowTypeChecker.java:4070)")
	@Test
	public void test_RecursiveType_Valid_5() {
		util.exec("RecursiveType_Valid_5");
	}

	@Test
	public void test_RecursiveType_Valid_6() {
		util.exec("RecursiveType_Valid_6");
	}

	@Test
	public void test_RecursiveType_Valid_7() {
		util.exec("RecursiveType_Valid_7");
	}

	@Test
	public void test_RecursiveType_Valid_8() {
		util.exec("RecursiveType_Valid_8");
	}

	@Test
	public void test_RecursiveType_Valid_9() {
		util.exec("RecursiveType_Valid_9");
	}

}
