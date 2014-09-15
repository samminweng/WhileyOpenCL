package wyopcl.testing.R;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestRule;
import org.junit.rules.Timeout;

import wyopcl.testing.BaseTestUtil;

public class RecordValidTestCase {
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
	public void test_RecordAccess_Valid_1() {
		util.exec("RecordAccess_Valid_1");
	}

	@Test
	public void test_RecordAccess_Valid_2() {
		util.exec("RecordAccess_Valid_2");
	}

	@Test
	public void test_RecordAssign_Valid_1() {
		util.exec("RecordAssign_Valid_1");
	}

	@Test
	public void test_RecordAssign_Valid_10() {
		util.exec("RecordAssign_Valid_10");
	}

	@Test
	public void test_RecordAssign_Valid_2() {
		util.exec("RecordAssign_Valid_2");
	}

	@Test
	public void test_RecordAssign_Valid_3() {
		util.exec("RecordAssign_Valid_3");
	}

	@Test
	public void test_RecordAssign_Valid_4() {
		util.exec("RecordAssign_Valid_4");
	}

	@Test
	public void test_RecordAssign_Valid_5() {
		util.exec("RecordAssign_Valid_5");
	}

	@Test
	public void test_RecordAssign_Valid_6() {
		util.exec("RecordAssign_Valid_6");
	}

	@Test
	public void test_RecordAssign_Valid_7() {
		util.exec("RecordAssign_Valid_7");
	}

	@Test
	public void test_RecordAssign_Valid_8() {
		util.exec("RecordAssign_Valid_8");
	}

	@Test
	public void test_RecordAssign_Valid_9() {
		util.exec("RecordAssign_Valid_9");
	}

	@Test
	public void test_RecordCoercion_Valid_1() {
		util.exec("RecordCoercion_Valid_1");
	}

	@Test
	public void test_RecordConversion_Valid_1() {
		util.exec("RecordConversion_Valid_1");
	}

	@Test
	public void test_RecordDefine_Valid_1() {
		util.exec("RecordDefine_Valid_1");
	}

	@Test
	public void test_RecordDefine_Valid_2() {
		util.exec("RecordDefine_Valid_2");
	}
	/**
	 * .\RecordSubtype_Valid_1.whiley:12: expected type {null x}|{int x}, found {null|int x}
    return x
           ^
wycc.lang.SyntaxError: expected type {null x}|{int x}, found {null|int x}
	at wycc.lang.SyntaxError.syntaxError(SyntaxError.java:238)
	at wyc.builder.FlowTypeChecker.checkIsSubtype(FlowTypeChecker.java:4060)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:799)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:327)
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
	@Ignore("SyntaxError")
	@Test
	public void test_RecordSubtype_Valid_1() {
		util.exec("RecordSubtype_Valid_1");
	}
	/**
	 * .\RecordSubtype_Valid_2.whiley:12: expected type {null data,X<null|{null|int data,X next}> next}|{int data,X<null|{null|int data,X next}> next}, found X<{null|int data,X|null next}>
    return r
           ^
wycc.lang.SyntaxError: expected type {null data,X<null|{null|int data,X next}> next}|{int data,X<null|{null|int data,X next}> next}, found X<{null|int data,X|null next}>
	at wycc.lang.SyntaxError.syntaxError(SyntaxError.java:238)
	at wyc.builder.FlowTypeChecker.checkIsSubtype(FlowTypeChecker.java:4060)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:799)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:327)
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
	@Ignore("SyntaxError")
	@Test
	public void test_RecordSubtype_Valid_2() {
		util.exec("RecordSubtype_Valid_2");
	}

}
