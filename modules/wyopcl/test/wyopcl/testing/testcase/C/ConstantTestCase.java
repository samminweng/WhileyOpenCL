package wyopcl.testing.testcase.C;

import org.junit.Ignore;
import org.junit.Test;

import wyopcl.testing.BaseTestCase;

public class ConstantTestCase extends BaseTestCase {

	@Ignore("#311") @Test
	public void test_Constant_Valid_1() {
		exec("Constant_Valid_1");
	}

	@Ignore("#311") @Test
	public void test_Constant_Valid_2() {
		exec("Constant_Valid_2");
	}

	@Test
	public void test_Constant_Valid_3() {
		exec("Constant_Valid_3");
	}

}
