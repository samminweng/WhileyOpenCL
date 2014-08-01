package wyopcl.testing.testcase.E;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;

import wyopcl.testing.BaseUtil;

public class EnsuresTestCase {
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
	public void test_Ensures_Valid_1() {
		util.exec("Ensures_Valid_1");
	}

	@Test
	public void test_Ensures_Valid_2() {
		util.exec("Ensures_Valid_2");
	}

	@Test
	public void test_Ensures_Valid_3() {
		util.exec("Ensures_Valid_3");
	}

	@Test
	public void test_Ensures_Valid_4() {
		util.exec("Ensures_Valid_4");
	}

	@Test
	public void test_Ensures_Valid_5() {
		util.exec("Ensures_Valid_5");
	}

	@Ignore("???") @Test
	public void test_Ensures_Valid_6() {
		util.exec("Ensures_Valid_6");
	}
	
	@Test
	public void test_Ensures_Valid_7() {
		util.exec("Ensures_Valid_7");
	}

}
