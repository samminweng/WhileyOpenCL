package wyopcl.testing.testcase.C;

import java.util.concurrent.ExecutorService;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestRule;
import org.junit.rules.Timeout;

import wyopcl.testing.BaseUtil;

public class ConstrainedTestCase {
	@Rule 
	public TestRule timeout = new Timeout(10000);
	
	
	private BaseUtil util;
	@Before
	public void setUp() throws Exception {
		util = new BaseUtil();
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

	@Ignore("???") @Test
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
	@Ignore("Timout")
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
	@Ignore("Timout")
	public void test_ConstrainedList_Valid_21() {
		util.exec("ConstrainedList_Valid_21");
	}

	@Test
	public void test_ConstrainedList_Valid_22() {
		util.exec("ConstrainedList_Valid_22");
	}

	@Ignore("???") @Test
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
	@Ignore("Timout")
	public void test_ConstrainedList_Valid_6() {
		util.exec("ConstrainedList_Valid_6");
	}

	@Test
	public void test_ConstrainedList_Valid_7() {
		util.exec("ConstrainedList_Valid_7");
	}

	@Test
	@Ignore("Timout")
	public void test_ConstrainedList_Valid_8() {
		util.exec("ConstrainedList_Valid_8");
	}

	@Test
	@Ignore("Timout")
	public void test_ConstrainedList_Valid_9() {
		util.exec("ConstrainedList_Valid_9");
	}

	@Ignore("Issue ???") @Test
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
	@Ignore("Timout")
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
