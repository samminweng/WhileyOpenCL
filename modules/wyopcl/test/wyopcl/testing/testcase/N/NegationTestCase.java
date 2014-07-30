package wyopcl.testing.testcase.N;

import org.junit.Ignore;
import org.junit.Test;

import wyopcl.testing.BaseTestCase;

public class NegationTestCase extends BaseTestCase {

	@Test
	public void test_NegationType_Valid_1() {
		exec("NegationType_Valid_1");
	}

	@Test
	public void test_NegationType_Valid_2() {
		exec("NegationType_Valid_2");
	}

	@Ignore("Issue ???") @Test
	public void test_NegationType_Valid_3() {
		exec("NegationType_Valid_3");
	}

	@Test
	public void test_NegationType_Valid_4() {
		exec("NegationType_Valid_4");
	}

	

}
