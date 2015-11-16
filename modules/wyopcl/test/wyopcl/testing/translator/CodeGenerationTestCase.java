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
	public void test_reverse_naive() {
		//Generate the naive C code  
		util.execCodeGeneration(codeDir, "reverse");
	}
	
	@Test
	public void test_mergesort_naive() {
		//Generate the naive C code  
		util.execCodeGeneration(codeDir, "mergesort");
	}
	
	/*@Test
	public void test_reverse_fast() {
		//Generate the naive C code  
		util.execCodeGeneration(codeDir, codeDir, "reverse", "-copy");
	}*/
	/*
	@Test
	public void test_TicTacToe_slow() {
		util.execCodeGeneration(codeDir, codeDir, "TicTacToe");
	}
	
	@Test
	public void test_TicTacToe_fast() {
		util.execCodeGeneration(codeDir, codeDir, "TicTacToe", "-copy");
	}
	*/
}
