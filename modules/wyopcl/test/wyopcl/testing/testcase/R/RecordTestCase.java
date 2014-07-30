package wyopcl.testing.testcase.R;

import org.junit.Ignore;
import org.junit.Test;

import wyopcl.testing.BaseTestCase;

public class RecordTestCase extends BaseTestCase {

	@Test
	public void test_RecordAccess_Valid_1() {
		exec("RecordAccess_Valid_1");
	}

	@Test
	public void test_RecordAccess_Valid_2() {
		exec("RecordAccess_Valid_2");
	}

	@Test
	public void test_RecordAssign_Valid_1() {
		exec("RecordAssign_Valid_1");
	}

	@Test
	public void test_RecordAssign_Valid_10() {
		exec("RecordAssign_Valid_10");
	}

	@Test
	public void test_RecordAssign_Valid_2() {
		exec("RecordAssign_Valid_2");
	}

	@Test
	public void test_RecordAssign_Valid_3() {
		exec("RecordAssign_Valid_3");
	}

	@Test
	public void test_RecordAssign_Valid_4() {
		exec("RecordAssign_Valid_4");
	}

	@Test
	public void test_RecordAssign_Valid_5() {
		exec("RecordAssign_Valid_5");
	}

	@Test
	public void test_RecordAssign_Valid_6() {
		exec("RecordAssign_Valid_6");
	}

	@Test
	public void test_RecordAssign_Valid_7() {
		exec("RecordAssign_Valid_7");
	}

	@Test
	public void test_RecordAssign_Valid_8() {
		exec("RecordAssign_Valid_8");
	}

	@Test
	public void test_RecordAssign_Valid_9() {
		exec("RecordAssign_Valid_9");
	}

	@Test
	public void test_RecordCoercion_Valid_1() {
		exec("RecordCoercion_Valid_1");
	}

	@Test
	public void test_RecordConversion_Valid_1() {
		exec("RecordConversion_Valid_1");
	}

	@Test
	public void test_RecordDefine_Valid_1() {
		exec("RecordDefine_Valid_1");
	}

	@Test
	public void test_RecordDefine_Valid_2() {
		exec("RecordDefine_Valid_2");
	}

	@Ignore("Issue ???") @Test
	public void test_RecordSubtype_Valid_1() {
		exec("RecordSubtype_Valid_1");
	}

	@Ignore("Issue ???") @Test
	public void test_RecordSubtype_Valid_2() {
		exec("RecordSubtype_Valid_2");
	}

}
