package wyopcl.testing.testcase.M;

import org.junit.Ignore;
import org.junit.Test;

import wyopcl.testing.BaseTestCase;

public class MethodTestCase extends BaseTestCase {

	@Test
	public void test_MethodCall_Valid_1() {
		exec("MethodCall_Valid_1");
	}

	@Test
	public void test_MethodCall_Valid_2() {
		exec("MethodCall_Valid_2");
	}

	@Test
	public void test_MethodCall_Valid_3() {
		exec("MethodCall_Valid_3");
	}

	@Ignore("???") @Test
	public void test_MethodCall_Valid_4() {
		exec("MethodCall_Valid_4");
	}

	@Test
	public void test_MethodRef_Valid_1() {
		exec("MethodRef_Valid_1");
	}

	@Test
	public void test_MethodRef_Valid_2() {
		exec("MethodRef_Valid_2");
	}

	@Test
	public void test_Method_Valid_1() {
		exec("Method_Valid_1");
	}

	@Test
	public void test_MultiLineComment_Valid_1() {
		exec("MultiLineComment_Valid_1");
	}

	@Test
	public void test_MultiLineComment_Valid_2() {
		exec("MultiLineComment_Valid_2");
	}
}
