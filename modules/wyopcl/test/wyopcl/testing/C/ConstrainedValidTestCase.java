package wyopcl.testing.C;

import java.util.concurrent.ExecutorService;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestRule;
import org.junit.rules.Timeout;

import wyopcl.testing.BaseTestUtil;

public class ConstrainedValidTestCase {
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
	public void test_ConstrainedDictionary_Valid_1() {
		util.exec("ConstrainedDictionary_Valid_1");
	}

	@Test
	public void test_ConstrainedInt_Valid_1() {
		util.exec("ConstrainedInt_Valid_1");
	}

	@Test
	public void test_ConstrainedInt_Valid_10() {
		util.exec("ConstrainedInt_Valid_10");
	}

	@Test
	public void test_ConstrainedInt_Valid_12() {
		util.exec("ConstrainedInt_Valid_12");
	}

	@Test
	public void test_ConstrainedInt_Valid_13() {
		util.exec("ConstrainedInt_Valid_13");
	}

	@Test
	public void test_ConstrainedInt_Valid_14() {
		util.exec("ConstrainedInt_Valid_14");
	}

	@Test
	public void test_ConstrainedInt_Valid_15() {
		util.exec("ConstrainedInt_Valid_15");
	}

	@Test
	public void test_ConstrainedInt_Valid_16() {
		util.exec("ConstrainedInt_Valid_16");
	}

	@Test
	public void test_ConstrainedInt_Valid_17() {
		util.exec("ConstrainedInt_Valid_17");
	}

	@Test
	public void test_ConstrainedInt_Valid_18() {
		util.exec("ConstrainedInt_Valid_18");
	}

	@Test
	public void test_ConstrainedInt_Valid_19() {
		util.exec("ConstrainedInt_Valid_19");
	}

	@Test
	public void test_ConstrainedInt_Valid_2() {
		util.exec("ConstrainedInt_Valid_2");
	}

	@Test
	public void test_ConstrainedInt_Valid_20() {
		util.exec("ConstrainedInt_Valid_20");
	}

	@Test
	public void test_ConstrainedInt_Valid_21() {
		util.exec("ConstrainedInt_Valid_21");
	}

	@Test
	public void test_ConstrainedInt_Valid_22() {
		util.exec("ConstrainedInt_Valid_22");
	}

	@Test
	public void test_ConstrainedInt_Valid_23() {
		util.exec("ConstrainedInt_Valid_23");
	}

	@Test
	public void test_ConstrainedInt_Valid_3() {
		util.exec("ConstrainedInt_Valid_3");
	}

	@Test
	public void test_ConstrainedInt_Valid_4() {
		util.exec("ConstrainedInt_Valid_4");
	}

	@Test
	public void test_ConstrainedInt_Valid_5() {
		util.exec("ConstrainedInt_Valid_5");
	}

	@Test
	public void test_ConstrainedInt_Valid_6() {
		util.exec("ConstrainedInt_Valid_6");
	}

	@Test
	public void test_ConstrainedInt_Valid_8() {
		util.exec("ConstrainedInt_Valid_8");
	}

	@Test
	public void test_ConstrainedList_Valid_1() {
		util.exec("ConstrainedList_Valid_1");
	}

	@Test
	public void test_ConstrainedList_Valid_11() {
		util.exec("ConstrainedList_Valid_11");
	}

	@Test
	public void test_ConstrainedList_Valid_12() {
		util.exec("ConstrainedList_Valid_12");
	}

	@Test
	public void test_ConstrainedList_Valid_14() {
		util.exec("ConstrainedList_Valid_14");
	}

	@Test
	public void test_ConstrainedList_Valid_15() {
		util.exec("ConstrainedList_Valid_15");
	}

	@Test
	public void test_ConstrainedList_Valid_16() {
		util.exec("ConstrainedList_Valid_16");
	}

	@Test
	public void test_ConstrainedList_Valid_17() {
		util.exec("ConstrainedList_Valid_17");
	}

	@Test
	public void test_ConstrainedList_Valid_18() {
		util.exec("ConstrainedList_Valid_18");
	}

	@Test
	public void test_ConstrainedList_Valid_19() {
		util.exec("ConstrainedList_Valid_19");
	}

	@Test
	public void test_ConstrainedList_Valid_2() {
		util.exec("ConstrainedList_Valid_2");
	}

	@Test
	public void test_ConstrainedList_Valid_20() {
		util.exec("ConstrainedList_Valid_20");
	}

	@Test
	public void test_ConstrainedList_Valid_21() {
		util.exec("ConstrainedList_Valid_21");
	}

	@Test
	public void test_ConstrainedList_Valid_22() {
		util.exec("ConstrainedList_Valid_22");
	}
	
	/**
	 * The expected result is different from executed one.
	 * Expected: :[[19, 43], [22, 50]]
	 * Actual: :[[19, [22], [43], 50]] 
	 */
	@Test
	public void test_ConstrainedList_Valid_23() {
		util.exec("ConstrainedList_Valid_23");
	}

	@Test
	public void test_ConstrainedList_Valid_24() {
		util.exec("ConstrainedList_Valid_24");
	}

	@Test
	public void test_ConstrainedList_Valid_25() {
		util.exec("ConstrainedList_Valid_25");
	}

	@Test
	public void test_ConstrainedList_Valid_26() {
		util.exec("ConstrainedList_Valid_26");
	}

	@Test
	public void test_ConstrainedList_Valid_3() {
		util.exec("ConstrainedList_Valid_3");
	}

	@Test
	public void test_ConstrainedList_Valid_4() {
		util.exec("ConstrainedList_Valid_4");
	}

	@Test
	public void test_ConstrainedList_Valid_5() {
		util.exec("ConstrainedList_Valid_5");
	}

	@Test
	public void test_ConstrainedList_Valid_6() {
		util.exec("ConstrainedList_Valid_6");
	}

	@Test
	public void test_ConstrainedList_Valid_7() {
		util.exec("ConstrainedList_Valid_7");
	}

	@Test
	public void test_ConstrainedList_Valid_8() {
		util.exec("ConstrainedList_Valid_8");
	}

	@Test
	public void test_ConstrainedList_Valid_9() {
		util.exec("ConstrainedList_Valid_9");
	}

	/**
	.\ConstrainedNegation_Valid_1.whiley:9: incomparable operands: !int and int
    if x is int:
       ^^^^^^^^
wycc.lang.SyntaxError: incomparable operands: !int and int
	at wycc.lang.SyntaxError.syntaxError(SyntaxError.java:238)
	at wyc.lang.WhileyFile.syntaxError(WhileyFile.java:620)
	at wyc.builder.FlowTypeChecker.resolveLeafCondition(FlowTypeChecker.java:1510)
	at wyc.builder.FlowTypeChecker.propagateCondition(FlowTypeChecker.java:1356)
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
	@Test
	@Ignore("SyntaxError")
	public void test_ConstrainedNegation_Valid_1() {
		util.exec("ConstrainedNegation_Valid_1");
	}

	@Test
	public void test_ConstrainedRecord_Valid_1() {
		util.exec("ConstrainedRecord_Valid_1");
	}

	@Test
	public void test_ConstrainedRecord_Valid_2() {
		util.exec("ConstrainedRecord_Valid_2");
	}

	@Test
	public void test_ConstrainedRecord_Valid_3() {
		util.exec("ConstrainedRecord_Valid_3");
	}

	@Test
	public void test_ConstrainedRecord_Valid_4() {
		util.exec("ConstrainedRecord_Valid_4");
	}

	@Test
	public void test_ConstrainedRecord_Valid_5() {
		util.exec("ConstrainedRecord_Valid_5");
	}

	@Test
	public void test_ConstrainedRecord_Valid_6() {
		util.exec("ConstrainedRecord_Valid_6");
	}

	@Test
	public void test_ConstrainedRecord_Valid_8() {
		util.exec("ConstrainedRecord_Valid_8");
	}

	@Test
	public void test_ConstrainedRecord_Valid_9() {
		util.exec("ConstrainedRecord_Valid_9");
	}

	@Test
	public void test_ConstrainedSet_Valid_1() {
		util.exec("ConstrainedSet_Valid_1");
	}

	@Test
	public void test_ConstrainedSet_Valid_2() {
		util.exec("ConstrainedSet_Valid_2");
	}

	@Test
	public void test_ConstrainedSet_Valid_3() {
		util.exec("ConstrainedSet_Valid_3");
	}

	@Test
	public void test_ConstrainedSet_Valid_4() {
		util.exec("ConstrainedSet_Valid_4");
	}

	@Test
	public void test_ConstrainedSet_Valid_5() {
		util.exec("ConstrainedSet_Valid_5");
	}

	@Test
	public void test_ConstrainedSet_Valid_6() {
		util.exec("ConstrainedSet_Valid_6");
	}

	@Test
	public void test_ConstrainedSet_Valid_7() {
		util.exec("ConstrainedSet_Valid_7");
	}

	@Test
	public void test_ConstrainedSet_Valid_8() {
		util.exec("ConstrainedSet_Valid_8");
	}

	@Test
	public void test_ConstrainedTuple_Valid_1() {
		util.exec("ConstrainedTuple_Valid_1");
	}

}
