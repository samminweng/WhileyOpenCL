package wyopcl.testing.testcase.I;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestRule;
import org.junit.rules.Timeout;

import wyopcl.testing.BaseUtil;

public class IntTestCase {
	@Rule public TestRule timeout = new Timeout(5000);
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
	public void test_IntConst_Valid_1() {
		util.exec("IntConst_Valid_1");
	}

	@Test
	public void test_IntDefine_Valid_1() {
		util.exec("IntDefine_Valid_1");
	}

	@Test
	public void test_IntDefine_Valid_2() {
		util.exec("IntDefine_Valid_2");
	}

	@Test
	public void test_IntDiv_Valid_1() {
		util.exec("IntDiv_Valid_1");
	}

	@Test
	public void test_IntDiv_Valid_3() {
		util.exec("IntDiv_Valid_3");
	}

	@Test
	public void test_IntDiv_Valid_4() {
		util.exec("IntDiv_Valid_4");
	}

	@Test
	public void test_IntDiv_Valid_5() {
		util.exec("IntDiv_Valid_5");
	}

	@Test
	public void test_IntEquals_Valid_1() {
		util.exec("IntEquals_Valid_1");
	}

	@Test
	public void test_IntMul_Valid_1() {
		util.exec("IntMul_Valid_1");
	}
	@Test
	public void test_IntMul_Valid_2() {
		util.exec("IntMul_Valid_2");
	}

	@Test
	public void test_IntOp_Valid_1() {
		util.exec("IntOp_Valid_1");
	}

}
