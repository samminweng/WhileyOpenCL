package wyopcl.testing.testcase.C;

import org.junit.Ignore;
import org.junit.Test;

import wyopcl.testing.BaseTestCase;

public class ComplexTestCase extends BaseTestCase {

	@Test
	public void test_Complex_Valid_1() {
		exec("Complex_Valid_1");
	}

	@Test
	public void test_Complex_Valid_2() {
		exec("Complex_Valid_2");
	}

	@Ignore("Issue ???") @Test
	public void test_Complex_Valid_3() {
		exec("Complex_Valid_3");
	}

	@Test
	public void test_Complex_Valid_4() {
		exec("Complex_Valid_4");
	}

	@Test
	public void test_Complex_Valid_5() {
		exec("Complex_Valid_5");
	}

	@Test
	public void test_Complex_Valid_6() {
		exec("Complex_Valid_6");
	}
	
	
}
