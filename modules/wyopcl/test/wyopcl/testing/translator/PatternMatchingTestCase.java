package wyopcl.testing.translator;

import static org.junit.Assert.*;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.Collection;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;
@RunWith(Parameterized.class)
public class PatternMatchingTestCase {

	private BaseTestUtil util;
	final Path codeDir = Paths.get(System.getProperty("user.dir")+ File.separator + "tests" + File.separator + "bounds");
	private String testcase;// A list of test cases
	private String func_name;// The function names that are used for testing pattern matching	
	
	@Before
	public void initialize() throws Exception {
		util = new BaseTestUtil();
	}

	@After
	public void tearDown() throws Exception {
		util = null;
	}
	
	/**
	 * Pass the test case parameters as the arguments to the method
	 * 
	 * @param testcase
	 */
	public PatternMatchingTestCase(String testcase, String func_name) {
		this.testcase = testcase;
		this.func_name = func_name;
		System.out.print("=== "+testcase+" ===\n");
	}
	
	@Parameterized.Parameters(name = "{index}:{0}")
	public static Collection<String[]> testCases() {
		
		// Add a list of test cases
		return Arrays.asList(new String[][] {
				{"AppendArrayPattern", "comp"},
				{"lz77", "compress"},
		});
	}
	
	@Test
	public void testPatternNaiveCCode(){
		System.out.print("Pattern: "+func_name+" function on naive C code \n");
		util.execCodeGeneration(codeDir, testcase, "pattern", func_name);	
	}

	@Test
	public void testPatternNaiveDeallocatedCCode(){
		System.out.print("Pattern: "+func_name+" function on naive + deallocated C code \n");
		util.execCodeGeneration(codeDir, testcase, "dealloc", "pattern", func_name);	
	}
	
	@Test
	public void testPatternNoCopyCCode() {
		System.out.print("Pattern: "+func_name+" function on copy reduced C code \n");
		util.execCodeGeneration(codeDir, testcase, "nocopy", "pattern", func_name);
	}
	
	@Test
	public void testPatternNoCopyDeallocatedCCode() {
		System.out.print("Copy reduced + deallocated C code \n");
		util.execCodeGeneration(codeDir, testcase, "nocopy", "dealloc", "pattern", func_name);
	}
	
}
