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
	
	@Test
	public void test_sort(){
		util.execCodeGeneration(codeDir, codeDir, "sort");
	}

	@Test
	public void test_sort_copy(){
		util.execCodeGeneration(codeDir, codeDir, "sort", "-copy");
	}
	
	@Test
	public void test_sort_call_by_reference(){
		util.execCodeGeneration(codeDir, codeDir, "sort_call_by_reference");
	}

	@Test
	public void test_sort_call_by_reference_copy(){
		util.execCodeGeneration(codeDir, codeDir, "sort_call_by_reference", "-copy");
	}
	
	@Test
	public void test_reverse_slow() {
		//Generate the naive C code  
		util.execCodeGeneration(codeDir, codeDir, "reverse");
	}
	
	@Test
	public void test_reverse_fast() {
		//Generate the naive C code  
		util.execCodeGeneration(codeDir, codeDir, "reverse", "-copy");
	}
	
	@Test
	public void test_TicTacToe_slow() {
		util.execCodeGeneration(codeDir, codeDir, "TicTacToe");
	}
	
	@Test
	public void test_TicTacToe_fast() {
		util.execCodeGeneration(codeDir, codeDir, "TicTacToe", "-copy");
	}

}
