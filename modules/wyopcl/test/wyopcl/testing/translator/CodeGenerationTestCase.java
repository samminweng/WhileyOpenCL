package wyopcl.testing.translator;

import java.io.File;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class CodeGenerationTestCase {
	private BaseTestUtil util;
	final String codeDir = System.getProperty("user.dir")+ File.separator + "tests" + File.separator + "code"
						+ File.separator;
	final String validDir = System.getProperty("user.dir")+ File.separator + "tests" + File.separator + "valid"
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
	
	//@Test 
	public void test_swap(){
		util.execCodeGeneration(validDir, codeDir,"swap");
	}
	
	//@Test 
	public void test_swap_copy(){
		util.execCodeGeneration(validDir, codeDir,"swap", "copy");
	}
	
	@Test
	public void test_IfElse_Valid_2() {
		util.execCodeGeneration(validDir, codeDir,"IfElse_Valid_2");
	}	
	
	@Test
	public void test_IfElse_Valid_2_copy() {
		util.execCodeGeneration(validDir, codeDir,"IfElse_Valid_2", "copy");
	}
	
	//@Test
	public void test_WhileLoop() {
		util.execCodeGeneration(validDir, codeDir, "WhileLoop");
	}	
	
	//@Test
	public void test_WhileLoop_copy() {
		util.execCodeGeneration(validDir, codeDir, "WhileLoop", "copy");
	}
	
	@Test
	public void test_BoolList_Valid_2(){
		util.execCodeGeneration(validDir, codeDir, "BoolList_Valid_2");
	}

	@Test
	public void test_BoolList_Valid_2_copy(){
		util.execCodeGeneration(validDir, codeDir, "BoolList_Valid_2", "copy");
	}
	
	
	//@Test
	public void test_While_Valid_1_slow() {
		//Generate the naive C code  
		util.execCodeGeneration(validDir, codeDir, "While_Valid_1", "slow");
	}
	
	//@Test
	public void test_While_Valid_1_fast() {
		//Generate the naive C code  
		util.execCodeGeneration(validDir, codeDir, "While_Valid_1", "fast");
	}
	
	//@Test
	public void test_TicTacToe() {
		util.execCodeGeneration(validDir, codeDir, "TicTacToe");
	}
	

}
