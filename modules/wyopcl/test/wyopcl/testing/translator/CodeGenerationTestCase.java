package wyopcl.testing.translator;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class CodeGenerationTestCase {
	private BaseTestUtil util;
	final Path codeDir = Paths.get(System.getProperty("user.dir")+ File.separator + "tests" + File.separator + "code");
	final Path validDir = Paths.get(System.getProperty("user.dir")+ File.separator + "tests" + File.separator + "valid");

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
	public void test_swap(){
		util.execCodeGeneration(codeDir, codeDir, "swap");
	}
	
	@Test 
	public void test_swap_copy(){
		util.execCodeGeneration(codeDir, codeDir,"swap", "-copy");
	}
	
	@Test
	public void test_IfElse_Valid_2() {
		util.execCodeGeneration(validDir, codeDir,"IfElse_Valid_2");
	}	
	
	@Test
	public void test_IfElse_Valid_2_copy() {
		util.execCodeGeneration(validDir, codeDir,"IfElse_Valid_2", "-copy");
	}
	
	@Test
	public void test_WhileLoop() {
		util.execCodeGeneration(codeDir, codeDir, "WhileLoop");
	}	
	
	@Test
	public void test_WhileLoop_copy() {
		util.execCodeGeneration(codeDir, codeDir, "WhileLoop", "-copy");
	}
	
	@Test
	public void test_BoolList_Valid_2(){
		util.execCodeGeneration(validDir, codeDir, "BoolList_Valid_2");
	}

	@Test
	public void test_BoolList_Valid_2_copy(){
		util.execCodeGeneration(validDir, codeDir, "BoolList_Valid_2", "-copy");
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
