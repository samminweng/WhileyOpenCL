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
	final Path sourceDir = Paths.get(System.getProperty("user.dir")+ File.separator + "tests" + File.separator + "pattern");
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
				{"appendarray", "f"},
				{"lz77_compress", "compress"},
		});
	}
	
	@Test
	public void testPattern(){		
		util.execPatternMatch(sourceDir, testcase, "-pattern", func_name);
	}
	
	@Test
	public void testPatternNaiveCCode(){
		System.out.print("Pattern: "+func_name+" function on naive C code \n");
		util.execCodeGeneration(sourceDir, testcase, "-pattern", func_name, "-code");	
	}

	@Test
	public void testPatternNaiveDeallocatedCCode(){
		System.out.print("Pattern: "+func_name+" function on naive + deallocated C code \n");
		util.execCodeGeneration(sourceDir, testcase, "-pattern", func_name, "-code", "-dealloc");	
	}
	
	@Test
	public void testPatternNoCopyCCode() {
		System.out.print("Pattern: "+func_name+" function on copy eliminated C code \n");
		util.execCodeGeneration(sourceDir, testcase, "-pattern", func_name, "-code", "-nocopy");
	}
	
	@Test
	public void testPatternNoCopyDeallocatedCCode() {
		System.out.print("Copy eliminated + deallocated C code \n");
		util.execCodeGeneration(sourceDir, testcase, "-pattern", func_name, "-code", "-nocopy", "-dealloc");
	}
	
}
