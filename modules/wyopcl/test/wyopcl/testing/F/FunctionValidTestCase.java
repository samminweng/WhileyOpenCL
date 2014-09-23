package wyopcl.testing.F;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestRule;
import org.junit.rules.Timeout;

import wyopcl.testing.BaseTestUtil;

public class FunctionValidTestCase {
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
	public void test_FunctionRef_Valid_1() {
		util.exec("FunctionRef_Valid_1");
	}

	/**
	 * Parsed 1 source file(s).
	 * ....................................................... [62ms+1mb]
	 * .\FunctionRef_Valid_2.whiley:4: incomparable operands: real and int
	 * return x + 1 ^^^^^ wycc.lang.SyntaxError: incomparable operands: real and
	 * int at wycc.lang.SyntaxError.syntaxError(SyntaxError.java:238) at
	 * wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:1889) at
	 * wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:1660) at
	 * wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:797) at
	 * wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:327) at
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
	 **/
	@Ignore("Issue ???\n"
			+ ".\\FunctionRef_Valid_2.whiley:4: incomparable operands: real and int\r\n" + 
			"	  return x + 1 ^^^^^ wycc.lang.SyntaxError: incomparable operands: real and\r\n" + 
			"	  int at wycc.lang.SyntaxError.syntaxError(SyntaxError.java:238) at")
	@Test
	public void test_FunctionRef_Valid_2() {
		util.exec("FunctionRef_Valid_2");
	}

	@Test
	public void test_FunctionRef_Valid_3() {
		util.exec("FunctionRef_Valid_3");
	}

	@Test
	public void test_FunctionRef_Valid_4() {
		util.exec("FunctionRef_Valid_4");
	}

	@Test
	public void test_FunctionRef_Valid_5() {
		util.exec("FunctionRef_Valid_5");
	}

	@Test
	public void test_FunctionRef_Valid_6() {
		util.exec("FunctionRef_Valid_6");
	}

	@Test
	public void test_FunctionRef_Valid_7() {
		util.exec("FunctionRef_Valid_7");
	}

	@Test
	public void test_FunctionRef_Valid_8() {
		util.exec("FunctionRef_Valid_8");
	}

	@Test
	public void test_FunctionRef_Valid_9() {
		util.exec("FunctionRef_Valid_9");
	}

	@Test
	public void test_Function_Valid_1() {
		util.exec("Function_Valid_1");
	}

	@Test
	public void test_Function_Valid_10() {
		util.exec("Function_Valid_10");
	}

	@Test
	public void test_Function_Valid_12() {
		util.exec("Function_Valid_12");
	}

	@Test
	public void test_Function_Valid_13() {
		util.exec("Function_Valid_13");
	}

	@Test
	public void test_Function_Valid_14() {
		util.exec("Function_Valid_14");
	}

	@Test
	public void test_Function_Valid_16() {
		util.exec("Function_Valid_16");
	}

	@Test
	public void test_Function_Valid_17() {
		util.exec("Function_Valid_17");
	}

	@Test
	public void test_Function_Valid_18() {
		util.exec("Function_Valid_18");
	}

	@Test
	public void test_Function_Valid_19() {
		util.exec("Function_Valid_19");
	}

	@Test
	public void test_Function_Valid_2() {
		util.exec("Function_Valid_2");
	}

	@Test
	public void test_Function_Valid_20() {
		util.exec("Function_Valid_20");
	}

	@Test
	public void test_Function_Valid_21() {
		util.exec("Function_Valid_21");
	}

	@Test
	public void test_Function_Valid_3() {
		util.exec("Function_Valid_3");
	}

	@Test
	public void test_Function_Valid_4() {
		util.exec("Function_Valid_4");
	}

	@Test
	public void test_Function_Valid_5() {
		util.exec("Function_Valid_5");
	}

	@Test
	public void test_Function_Valid_6() {
		util.exec("Function_Valid_6");
	}

	@Test
	public void test_Function_Valid_7() {
		util.exec("Function_Valid_7");
	}

	@Test
	public void test_Function_Valid_8() {
		util.exec("Function_Valid_8");
	}

	@Test
	public void test_Function_Valid_9() {
		util.exec("Function_Valid_9");
	}

}
