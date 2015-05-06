package wyopcl.testing.translator;

import java.io.File;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class CodeGenerationTestCase {
	private BaseTestUtil util;
	final String valid_path = System.getProperty("user.dir")+ File.separator + "tests" + File.separator + "code"
						+ File.separator;

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
	public void test_IfElse_Valid_2() {
		util.execCodeGeneration(valid_path,"IfElse_Valid_2");
	}	
	
	@Test
	public void test_WhileLoop() {
		util.execCodeGeneration(valid_path, "WhileLoop");
	}	
	
	@Test
	public void test_While_Valid_1_slow() {
		//Generate the naive C code  
		util.execCodeGeneration(valid_path, "While_Valid_1", "slow");
	}
	
	@Test
	public void test_While_Valid_1_fast() {
		//Generate the naive C code  
		util.execCodeGeneration(valid_path, "While_Valid_1", "fast");
	}
	/*
	
		
	
	@Test
	public void test_BoolList_Valid_2() {
		util.execCodeGeneration(valid_path+"BoolList_Valid_2");
	}
	
	
	
	
	@Test
	public void test_Reverse_List() {
		util.execCodeGeneration(valid_path+"Reverse_List");
	}*/
}
