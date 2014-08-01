package wyopcl.testing.testcase.B;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import wyopcl.testing.BaseUtil;

public class ByteTestCase {
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
	public void test_Byte_Valid_1() {
		util.exec("Byte_Valid_1");
	}

	@Test
	public void test_Byte_Valid_2() {
		util.exec("Byte_Valid_2");
	}

	@Test
	public void test_Byte_Valid_3() {
		util.exec("Byte_Valid_3");
	}

	@Test
	public void test_Byte_Valid_4() {
		util.exec("Byte_Valid_4");
	}

	@Test
	public void test_Byte_Valid_5() {
		util.exec("Byte_Valid_5");
	}

	@Test
	public void test_Byte_Valid_6() {
		util.exec("Byte_Valid_6");
	}

	@Test
	public void test_Byte_Valid_7() {
		util.exec("Byte_Valid_7");
	}

	@Test
	public void test_Byte_Valid_8() {
		util.exec("Byte_Valid_8");
	}

	@Test
	public void test_Byte_Valid_9() {
		util.exec("Byte_Valid_9");
	}
}
