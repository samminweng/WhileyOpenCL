package wyopcl.testing.testcase.M;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;

import wyopcl.testing.BaseUtil;

public class MessageTestCase {
	private BaseUtil util;	
	@Before
	public void setUp() throws Exception {
		util = new BaseUtil();
	}
	@After
	public void tearDown() throws Exception {
		util = null;
	}
	
	

	@Test
	public void test_MessageRef_Valid_1() {
		util.exec("MessageRef_Valid_1");
	}

	@Ignore("???") @Test
	public void test_MessageRef_Valid_2() {
		util.exec("MessageRef_Valid_2");
	}

	@Test
	public void test_MessageSend_Valid_1() {
		util.exec("MessageSend_Valid_1");
	}

	@Test
	public void test_MessageSend_Valid_2() {
		util.exec("MessageSend_Valid_2");
	}

	@Test
	public void test_MessageSend_Valid_3() {
		util.exec("MessageSend_Valid_3");
	}

	@Test
	public void test_MessageSend_Valid_4() {
		util.exec("MessageSend_Valid_4");
	}

	@Test
	public void test_MessageSend_Valid_5() {
		util.exec("MessageSend_Valid_5");
	}

}
