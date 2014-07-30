package wyopcl.testing.testcase.C;

import org.junit.Ignore;
import org.junit.Test;

import wyopcl.testing.BaseTestCase;

public class ContractiveTestCase extends BaseTestCase {

	@Ignore("Issue ???") @Test
	public void test_Contractive_Valid_1() {
		exec("Contractive_Valid_1");
	}

	@Test
	public void test_Contractive_Valid_2() {
		exec("Contractive_Valid_2");
	}
}
