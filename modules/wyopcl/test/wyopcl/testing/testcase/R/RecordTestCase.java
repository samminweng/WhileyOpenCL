package wyopcl.testing.testcase.R;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;

import wyopcl.testing.BaseUtil;

public class RecordTestCase {
	
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
	public void test_RecordAccess_Valid_1() {
		util.exec("RecordAccess_Valid_1");
	}

	@Test
	public void test_RecordAccess_Valid_2() {
		util.exec("RecordAccess_Valid_2");
	}

	@Test
	public void test_RecordAssign_Valid_1() {
		util.exec("RecordAssign_Valid_1");
	}

	@Test
	public void test_RecordAssign_Valid_10() {
		util.exec("RecordAssign_Valid_10");
	}

	@Test
	public void test_RecordAssign_Valid_2() {
		util.exec("RecordAssign_Valid_2");
	}

	@Test
	public void test_RecordAssign_Valid_3() {
		util.exec("RecordAssign_Valid_3");
	}

	@Test
	public void test_RecordAssign_Valid_4() {
		util.exec("RecordAssign_Valid_4");
	}

	@Test
	public void test_RecordAssign_Valid_5() {
		util.exec("RecordAssign_Valid_5");
	}

	@Test
	public void test_RecordAssign_Valid_6() {
		util.exec("RecordAssign_Valid_6");
	}

	@Test
	public void test_RecordAssign_Valid_7() {
		util.exec("RecordAssign_Valid_7");
	}

	@Test
	public void test_RecordAssign_Valid_8() {
		util.exec("RecordAssign_Valid_8");
	}

	@Test
	public void test_RecordAssign_Valid_9() {
		util.exec("RecordAssign_Valid_9");
	}

	@Test
	public void test_RecordCoercion_Valid_1() {
		util.exec("RecordCoercion_Valid_1");
	}

	@Test
	public void test_RecordConversion_Valid_1() {
		util.exec("RecordConversion_Valid_1");
	}

	@Test
	public void test_RecordDefine_Valid_1() {
		util.exec("RecordDefine_Valid_1");
	}

	@Test
	public void test_RecordDefine_Valid_2() {
		util.exec("RecordDefine_Valid_2");
	}

	@Ignore("Issue ???") @Test
	public void test_RecordSubtype_Valid_1() {
		util.exec("RecordSubtype_Valid_1");
	}

	@Ignore("Issue ???") @Test
	public void test_RecordSubtype_Valid_2() {
		util.exec("RecordSubtype_Valid_2");
	}

}
