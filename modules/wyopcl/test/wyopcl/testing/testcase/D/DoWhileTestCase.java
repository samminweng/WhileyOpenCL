package wyopcl.testing.testcase.D;

import org.junit.Ignore;
import org.junit.Test;

import wyopcl.testing.BaseTestCase;

public class DoWhileTestCase extends BaseTestCase {

	@Test
	public void test_DoWhile_Valid_1() {
		exec("DoWhile_Valid_1");
	}

	@Test
	public void test_DoWhile_Valid_2() {
		exec("DoWhile_Valid_2");
	}

	@Test
	public void test_DoWhile_Valid_3() {
		exec("DoWhile_Valid_3");
	}

	@Ignore("???") @Test
	public void test_DoWhile_Valid_4() {
		exec("DoWhile_Valid_4");
	}

	@Test
	public void test_DoWhile_Valid_5() {
		exec("DoWhile_Valid_5");
	}

}
