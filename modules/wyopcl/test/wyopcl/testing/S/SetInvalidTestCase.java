package wyopcl.testing.S;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestRule;
import org.junit.rules.Timeout;

import wyopcl.testing.BaseTestUtil;

public class SetInvalidTestCase {
	@Rule public TestRule timeout = new Timeout(5000);
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
	public void test_SetAssign_Invalid_1() {
		util.exec("SetAssign_Invalid_1");
	}
	
	@Test
	public void test_SetComprehension_Invalid_1() {
		util.exec("SetComprehension_Invalid_1");
	}	

	@Test
	public void test_SetComprehension_Invalid_2() {
		util.exec("SetComprehension_Invalid_2");
	}

	@Test
	public void test_SetComprehension_Invalid_3() {
		util.exec("SetComprehension_Invalid_3");
	}

	@Test
	public void test_SetComprehension_Invalid_4() {
		util.exec("SetComprehension_Invalid_4");
	}

	@Test
	public void test_SetComprehension_Invalid_5() {
		util.exec("SetComprehension_Invalid_5");
	}
	
	@Test	
	public void test_SetComprehension_Invalid_6() {
		util.exec("SetComprehension_Invalid_6");
	}	

	@Test
	public void test_SetConversion_Invalid_1() {
		util.exec("SetConversion_Invalid_1");
	}
	

	@Test
	public void test_SetDefine_Invalid_1() {
		util.exec("SetDefine_Invalid_1");
	}

	@Test
	public void test_SetDefine_Invalid_2() {
		util.exec("SetDefine_Invalid_2");
	}

	@Test
	public void test_SetElemOf_Invalid_1() {
		util.exec("SetElemOf_Invalid_1");
	}

	@Test
	public void test_SetEmpty_Invalid_1() {
		util.exec("SetEmpty_Invalid_1");
	}
	
	@Test
	public void test_SetEmpty_Invalid_2() {
		util.exec("SetEmpty_Invalid_2");
	}

	@Test
	public void test_SetIntersect_Invalid_1() {
		util.exec("SetIntersect_Invalid_1");
	}
	@Ignore("Missing SetIntersect_Invalid_2.sysout")
	@Test
	public void test_SetIntersect_Invalid_2() {
		util.exec("SetIntersect_Invalid_2");
	}
	@Ignore("Missing SetIntersection_Invalid_1.sysout")
	@Test
	public void test_SetIntersection_Invalid_1() {
		util.exec("SetIntersection_Invalid_1");
	}

	@Test
	public void test_SetIntersection_Invalid_2() {
		util.exec("SetIntersection_Invalid_2");
	}
	
	@Test
	public void test_SetSubset_Invalid_1() {
		util.exec("SetSubset_Invalid_1");
	}
	@Ignore("Missing SetSubset_Invalid_10.sysout")
	@Test
	public void test_SetSubset_Invalid_10() {
		util.exec("SetSubset_Invalid_10");
	}
	@Ignore("Missing SetSubset_Invalid_11.sysout")
	@Test
	public void test_SetSubset_Invalid_11() {
		util.exec("SetSubset_Invalid_11");
	}
	@Ignore("Missing SetSubset_Invalid_2.sysout")
	@Test
	public void test_SetSubset_Invalid_2() {
		util.exec("SetSubset_Invalid_2");
	}

	@Test
	public void test_SetSubset_Invalid_3() {
		util.exec("SetSubset_Invalid_3");
	}
	@Ignore("Missing SetSubset_Invalid_4.sysout")
	@Test
	public void test_SetSubset_Invalid_4() {
		util.exec("SetSubset_Invalid_4");
	}

	@Test
	public void test_SetSubset_Invalid_5() {
		util.exec("SetSubset_Invalid_5");
	}

	@Test
	public void test_SetSubset_Invalid_6() {
		util.exec("SetSubset_Invalid_6");
	}

	@Test
	public void test_SetSubset_Invalid_7() {
		util.exec("SetSubset_Invalid_7");
	}

	@Test
	public void test_SetSubset_Invalid_8() {
		util.exec("SetSubset_Invalid_8");
	}

	@Test
	public void test_SetSubset_Invalid_9() {
		util.exec("SetSubset_Invalid_9");
	}

	@Test
	public void test_SetUnion_Invalid_1() {
		util.exec("SetUnion_Invalid_1");
	}	

	@Test
	public void test_SetUnion_Invalid_2() {
		util.exec("SetUnion_Invalid_2");
	}

	@Test
	public void test_SetUnion_Invalid_3() {
		util.exec("SetUnion_Invalid_3");
	}

	@Test
	public void test_SetUnion_Invalid_4() {
		util.exec("SetUnion_Invalid_4");
	}	

}
