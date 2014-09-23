package wyopcl.testing.R;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestRule;
import org.junit.rules.Timeout;

import wyopcl.testing.BaseTestUtil;

public class RecursiveInvalidTestCase {
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
	@Ignore("unclassified")
	@Test
	public void test_RecursiveType_Invalid_1() {
		util.exec("RecursiveType_Invalid_1");
	}
	@Ignore("unclassified")
	@Test
	public void test_RecursiveType_Invalid_10() {
		util.exec("RecursiveType_Invalid_10");
	}
	@Ignore("unclassified")
	@Test
	public void test_RecursiveType_Invalid_2() {
		util.exec("RecursiveType_Invalid_2");
	}

	@Test
	public void test_RecursiveType_Invalid_3() {
		util.exec("RecursiveType_Invalid_3");
	}
	@Ignore("unclassified")
	@Test
	public void test_RecursiveType_Invalid_4() {
		util.exec("RecursiveType_Invalid_4");
	}

	@Test
	public void test_RecursiveType_Invalid_5() {
		util.exec("RecursiveType_Invalid_5");
	}
	
	@Ignore("unclassified")
	@Test
	public void test_RecursiveType_Invalid_7() {
		util.exec("RecursiveType_Invalid_7");
	}
	@Ignore("unclassified")
	@Test
	public void test_RecursiveType_Invalid_8() {
		util.exec("RecursiveType_Invalid_8");
	}
	@Ignore("unclassified")
	@Test
	public void test_RecursiveType_Invalid_9() {
		util.exec("RecursiveType_Invalid_9");
	}

}
