package wyopcl.testing.S;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestRule;
import org.junit.rules.Timeout;

import wyopcl.testing.BaseTestUtil;

public class SetValidTestCase {
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
	public void test_SetAssign_Valid_1() {
		util.exec("SetAssign_Valid_1");
	}

	@Test
	public void test_SetAssign_Valid_2() {
		util.exec("SetAssign_Valid_2");
	}

	@Test
	public void test_SetAssign_Valid_3() {
		util.exec("SetAssign_Valid_3");
	}

	@Test
	public void test_SetComprehension_Valid_1() {
		util.exec("SetComprehension_Valid_1");
	}

	@Test
	public void test_SetComprehension_Valid_10() {
		util.exec("SetComprehension_Valid_10");
	}

	@Test
	public void test_SetComprehension_Valid_11() {
		util.exec("SetComprehension_Valid_11");
	}

	@Test
	public void test_SetComprehension_Valid_12() {
		util.exec("SetComprehension_Valid_12");
	}

	@Test
	public void test_SetComprehension_Valid_2() {
		util.exec("SetComprehension_Valid_2");
	}

	@Test
	public void test_SetComprehension_Valid_3() {
		util.exec("SetComprehension_Valid_3");
	}

	@Test
	public void test_SetComprehension_Valid_4() {
		util.exec("SetComprehension_Valid_4");
	}

	@Test
	public void test_SetComprehension_Valid_5() {
		util.exec("SetComprehension_Valid_5");
	}

	@Test
	public void test_SetComprehension_Valid_6() {
		util.exec("SetComprehension_Valid_6");
	}

	@Test
	public void test_SetComprehension_Valid_7() {
		util.exec("SetComprehension_Valid_7");
	}

	@Test
	public void test_SetComprehension_Valid_8() {
		util.exec("SetComprehension_Valid_8");
	}

	@Test
	public void test_SetComprehension_Valid_9() {
		util.exec("SetComprehension_Valid_9");
	}

	@Test
	public void test_SetConversion_Valid_1() {
		util.exec("SetConversion_Valid_1");
	}

	@Test
	public void test_SetDefine_Valid_1() {
		util.exec("SetDefine_Valid_1");
	}

	@Test
	public void test_SetDefine_Valid_2() {
		util.exec("SetDefine_Valid_2");
	}

	@Test
	public void test_SetDefine_Valid_3() {
		util.exec("SetDefine_Valid_3");
	}

	@Test
	public void test_SetDifference_Valid_1() {
		util.exec("SetDifference_Valid_1");
	}

	@Test
	public void test_SetElemOf_Valid_1() {
		util.exec("SetElemOf_Valid_1");
	}

	@Test
	public void test_SetEmpty_Valid_1() {
		util.exec("SetEmpty_Valid_1");
	}

	@Test
	public void test_SetEquals_Valid_1() {
		util.exec("SetEquals_Valid_1");
	}

	@Test
	public void test_SetGenerator_Valid_1() {
		util.exec("SetGenerator_Valid_1");
	}

	@Test
	public void test_SetIntersect_Valid_1() {
		util.exec("SetIntersect_Valid_1");
	}

	@Test
	public void test_SetIntersect_Valid_2() {
		util.exec("SetIntersect_Valid_2");
	}

	@Test
	public void test_SetIntersection_Valid_1() {
		util.exec("SetIntersection_Valid_1");
	}

	@Test
	public void test_SetIntersection_Valid_2() {
		util.exec("SetIntersection_Valid_2");
	}

	@Test
	public void test_SetIntersection_Valid_3() {
		util.exec("SetIntersection_Valid_3");
	}

	@Test
	public void test_SetIntersection_Valid_4() {
		util.exec("SetIntersection_Valid_4");
	}

	@Test
	public void test_SetIntersection_Valid_5() {
		util.exec("SetIntersection_Valid_5");
	}

	@Test
	public void test_SetIntersection_Valid_6() {
		util.exec("SetIntersection_Valid_6");
	}

	@Test
	public void test_SetIntersection_Valid_7() {
		util.exec("SetIntersection_Valid_7");
	}

	@Test
	public void test_SetLength_Valid_1() {
		util.exec("SetLength_Valid_1");
	}

	@Test
	public void test_SetNull_Valid_1() {
		util.exec("SetNull_Valid_1");
	}

	@Test
	public void test_SetSubset_Valid_1() {
		util.exec("SetSubset_Valid_1");
	}

	@Test
	public void test_SetSubset_Valid_10() {
		util.exec("SetSubset_Valid_10");
	}

	@Test
	public void test_SetSubset_Valid_11() {
		util.exec("SetSubset_Valid_11");
	}

	@Test
	public void test_SetSubset_Valid_12() {
		util.exec("SetSubset_Valid_12");
	}

	@Test
	public void test_SetSubset_Valid_2() {
		util.exec("SetSubset_Valid_2");
	}

	@Test
	public void test_SetSubset_Valid_3() {
		util.exec("SetSubset_Valid_3");
	}

	@Test
	public void test_SetSubset_Valid_4() {
		util.exec("SetSubset_Valid_4");
	}

	@Test
	public void test_SetSubset_Valid_5() {
		util.exec("SetSubset_Valid_5");
	}

	@Test
	public void test_SetSubset_Valid_6() {
		util.exec("SetSubset_Valid_6");
	}

	@Test
	public void test_SetSubset_Valid_7() {
		util.exec("SetSubset_Valid_7");
	}

	@Test
	public void test_SetSubset_Valid_8() {
		util.exec("SetSubset_Valid_8");
	}

	@Test
	public void test_SetSubset_Valid_9() {
		util.exec("SetSubset_Valid_9");
	}

	@Test
	public void test_SetUnion_Valid_1() {
		util.exec("SetUnion_Valid_1");
	}

	@Test
	public void test_SetUnion_Valid_10() {
		util.exec("SetUnion_Valid_10");
	}

	@Test
	public void test_SetUnion_Valid_11() {
		util.exec("SetUnion_Valid_11");
	}

	@Test
	public void test_SetUnion_Valid_2() {
		util.exec("SetUnion_Valid_2");
	}

	@Test
	public void test_SetUnion_Valid_3() {
		util.exec("SetUnion_Valid_3");
	}

	@Test
	public void test_SetUnion_Valid_4() {
		util.exec("SetUnion_Valid_4");
	}

	@Test
	public void test_SetUnion_Valid_5() {
		util.exec("SetUnion_Valid_5");
	}

	@Test
	public void test_SetUnion_Valid_6() {
		util.exec("SetUnion_Valid_6");
	}

	@Test
	public void test_SetUnion_Valid_7() {
		util.exec("SetUnion_Valid_7");
	}

	@Test
	public void test_SetUnion_Valid_8() {
		util.exec("SetUnion_Valid_8");
	}

	@Test
	public void test_SetUnion_Valid_9() {
		util.exec("SetUnion_Valid_9");
	}

}
