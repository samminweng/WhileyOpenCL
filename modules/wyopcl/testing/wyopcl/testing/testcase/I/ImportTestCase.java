package wyopcl.testing.testcase.I;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;

import wyopcl.testing.BaseUtil;

public class ImportTestCase {
	
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
	public void test_Import_Valid_1() {
		util.exec("Import_Valid_1");
	}

	@Test
	public void test_Import_Valid_2() {
		util.exec("Import_Valid_2");
	}

	@Test
	public void test_Import_Valid_3() {
		util.exec("Import_Valid_3");
	}

	@Test
	public void test_Import_Valid_4() {
		util.exec("Import_Valid_4");
	}

	@Test
	public void test_Import_Valid_5() {
		util.exec("Import_Valid_5");
	}

	@Test
	public void test_Import_Valid_6() {
		util.exec("Import_Valid_6");
	}

	@Test
	public void test_Import_Valid_7() {
		util.exec("Import_Valid_7");
	}

	
}
