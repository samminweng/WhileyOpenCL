package wyopcl.testing.testcase.C;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;

import wyopcl.testing.BaseUtil;

public class ComplexTestCase {
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
	public void test_Complex_Valid_1() {
		util.exec("Complex_Valid_1");
	}

	@Test
	public void test_Complex_Valid_2() {
		util.exec("Complex_Valid_2");
	}

	@Ignore("Issue ???")
	@Test
	public void test_Complex_Valid_3() {
		util.exec("Complex_Valid_3");
	}

	@Test
	public void test_Complex_Valid_4() {
		util.exec("Complex_Valid_4");
	}

	@Test
	public void test_Complex_Valid_5() {
		util.exec("Complex_Valid_5");
	}

	@Test
	public void test_Complex_Valid_6() {
		util.exec("Complex_Valid_6");
	}
	
	
}
