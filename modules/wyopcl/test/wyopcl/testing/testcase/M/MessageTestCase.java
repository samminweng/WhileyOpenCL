package wyopcl.testing.testcase.M;

import org.junit.Ignore;
import org.junit.Test;

import wyopcl.testing.BaseTestCase;

public class MessageTestCase extends BaseTestCase {

	@Test
	public void test_MessageRef_Valid_1() {
		exec("MessageRef_Valid_1");
	}

	@Ignore("???") @Test
	public void test_MessageRef_Valid_2() {
		exec("MessageRef_Valid_2");
	}

	@Test
	public void test_MessageSend_Valid_1() {
		exec("MessageSend_Valid_1");
	}

	@Test
	public void test_MessageSend_Valid_2() {
		exec("MessageSend_Valid_2");
	}

	@Test
	public void test_MessageSend_Valid_3() {
		exec("MessageSend_Valid_3");
	}

	@Test
	public void test_MessageSend_Valid_4() {
		exec("MessageSend_Valid_4");
	}

	@Test
	public void test_MessageSend_Valid_5() {
		exec("MessageSend_Valid_5");
	}

}
