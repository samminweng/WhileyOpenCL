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
	public void test_swap_naive() {
		//Generate the naive C code  
		util.execCodeGeneration(codeDir, "swap");
	}
	
	
	@Test
	public void test_swap_naive_dealloc() {
		//Generate the naive C code  
		util.execCodeGeneration(codeDir, "swap", "dealloc");
	}

	@Test
	public void test_swap_copy() {
		//Generate the naive C code  
		util.execCodeGeneration(codeDir, "swap", "copy");
	}
	
	@Test
	public void test_swap_copy_dealloc() {
		//Generate the naive C code  
		util.execCodeGeneration(codeDir, "swap", "copy", "dealloc");
	}
	
	@Test
	public void test_reverse_naive() {
		//Generate the naive C code  
		util.execCodeGeneration(codeDir, "reverse");
	}
	
	@Test
	public void test_reverse_naive_dealloc() {
		//Generate the naive C code  
		util.execCodeGeneration(codeDir, "reverse", "dealloc");
	}
	
	@Test
	public void test_reverse_copy() {
		//Generate the naive C code  
		util.execCodeGeneration(codeDir, "reverse", "copy");
	}
	
	@Test
	public void test_reverse_copy_dealloc() {
		//Generate the naive C code  
		util.execCodeGeneration(codeDir, "reverse", "copy", "dealloc");
	}
	
	@Test
	public void test_mergesort_naive() {
		//Generate the naive C code  
		util.execCodeGeneration(codeDir, "mergesort");
	}
	
	@Test
	public void test_mergesort_naive_dealloc() {
		//Generate the naive C code  
		util.execCodeGeneration(codeDir, "mergesort", "dealloc");
	}
	
	
	@Test
	public void test_mergesort_copy() {
		//Generate the naive C code  
		util.execCodeGeneration(codeDir, "mergesort", "copy");
	}
	
	
	@Test
	public void test_mergesort_copy_dealloc() {
		//Generate the naive C code  
		util.execCodeGeneration(codeDir, "mergesort", "copy", "dealloc");
	}
	
	@Test
	public void test_TicTacToe_naive() {
		util.execCodeGeneration(codeDir, "TicTacToe");
	}
	
	@Test
	public void test_TicTacToe_naive_dealloc() {
		util.execCodeGeneration(codeDir, "TicTacToe", "dealloc");
	}
	
	@Test
	public void test_TicTacToe_copy() {
		util.execCodeGeneration(codeDir, "TicTacToe", "copy");
	}
	
	@Test
	public void test_TicTacToe_copy_dealloc() {
		util.execCodeGeneration(codeDir, "TicTacToe", "copy", "dealloc");
	}
	
	@Test
	public void test_newTicTacToe_naive() {
		util.execCodeGeneration(codeDir, "newTicTacToe");
	}
	
	@Test
	public void test_newTicTacToe_naive_dealloc() {
		util.execCodeGeneration(codeDir, "newTicTacToe", "dealloc");
	}
	
	@Test
	public void test_newTicTacToe_copy() {
		util.execCodeGeneration(codeDir, "newTicTacToe", "copy");
	}
	
	@Test
	public void test_newTicTacToe_copy_dealloc() {
		util.execCodeGeneration(codeDir, "newTicTacToe", "copy", "dealloc");
	}
	
	@Test
	public void test_MatrixMult_naive() {
		util.execCodeGeneration(codeDir, "MatrixMult");
	}
	
	@Test
	public void test_MatrixMult_naive_dealloc() {
		util.execCodeGeneration(codeDir, "MatrixMult", "dealloc");
	}
	
	
	@Test
	public void test_MatrixMult_copy() {
		util.execCodeGeneration(codeDir, "MatrixMult", "copy");
	}
	
	@Test
	public void test_MatrixMult_copy_dealloc() {
		util.execCodeGeneration(codeDir, "MatrixMult", "copy", "dealloc");
	}
	
}
