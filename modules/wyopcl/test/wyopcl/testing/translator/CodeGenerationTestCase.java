package wyopcl.testing.translator;

import static org.junit.Assert.*;

import java.io.File;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class CodeGenerationTestCase {
	private BaseTestUtil util;
	final String valid_path = System.getProperty("user.dir")+ File.separator + "tests" + File.separator + "code"
						+ File.separator+"valid"+ File.separator;

	@Before
	public void setUp() throws Exception {
		util = new BaseTestUtil();
	}

	@After
	public void tearDown() throws Exception {
		util.terminate();
		util = null;
	}	
	
	@Test
	public void test_Valid_While() {
		util.execCodeGeneration(valid_path+"While");
	}	
	
	@Test
	public void test_Valid_IfElse_Valid_2() {
		util.execCodeGeneration(valid_path+"IfElse_Valid_2");
	}	
	
	@Test
	public void test_Valid_For_Valid_1() {
		util.execCodeGeneration(valid_path+"For_Valid_1");
	}
	
	@Test
	public void test_Valid_BoolList_Valid_2() {
		util.execCodeGeneration(valid_path+"BoolList_Valid_2");
	}
	
}