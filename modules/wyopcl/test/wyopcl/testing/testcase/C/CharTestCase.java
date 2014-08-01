package wyopcl.testing.testcase.C;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import wyopcl.testing.BaseUtil;

public class CharTestCase {
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
	public void test_Char_Valid_1() {
		util.exec("Char_Valid_1");
	}

	@Test
	public void test_Char_Valid_2() {
		util.exec("Char_Valid_2");
	}
	
	@Test
	public void test_Char_Valid_3() {
		util.exec("Char_Valid_3");
	}

	@Test
	public void test_Char_Valid_4() {
		util.exec("Char_Valid_4");
	}
	
	@Test
	public void test_Char_Valid_5() {
		util.exec("Char_Valid_5");
	}

	@Test
	public void test_Char_Valid_6() {
		util.exec("Char_Valid_6");
	}
	
	@Test
	public void test_Char_Valid_7() {
		util.exec("Char_Valid_7");
	}
}
