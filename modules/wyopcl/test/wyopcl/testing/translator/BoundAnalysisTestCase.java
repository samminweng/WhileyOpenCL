package wyopcl.testing.translator;

import java.io.File;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.Collection;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.Timeout;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;
@RunWith(Parameterized.class)
public class BoundAnalysisTestCase {
	private BaseTestUtil util;
	final Path sourceDir = Paths.get(System.getProperty("user.dir")+ File.separator + "tests" + File.separator + "bound");
	private static String testcase;// A list of test cases
	
    @Rule
    public Timeout globalTimeout = Timeout.seconds(10); // 10 seconds per test
	
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
	public BoundAnalysisTestCase(String testcase) {
		this.testcase = testcase;
		System.out.print("=== "+testcase+" ===\n");
	}
	
	@Parameterized.Parameters(name = "{index}:{0}")
	public static Collection<String> testCases() {
		
		// Add a list of test cases
		return Arrays.asList(new String[] { 
				"ifelse", 
				"whileloop",
				//"whileloop1",
				//"nestedwhileloop",
				//"bubblesort"
			});
	}
	
	@Test
	public void testNaiveBound() {
		// Run bound analysis and check analysis results 
		util.execBoundAnalysis(sourceDir, testcase, "-bound", "naive");
	}
	
	@Test
	public void testNaiveBoundNaiveCCode(){
		// Run bound analysis and Generate naive C code
		System.out.print("Bound Analysis: Naive Widen Strategy + Naive C code\n");
		util.execCodeGeneration(sourceDir, testcase, "-bound", "naive", "-code");
	}
	
	@Test
	public void testNaiveBoundNoCopyCCode(){
		// Run bound analysis and Generate naive C code
		System.out.print("Bound Analysis: Naive Widen Strategy + No Copy C code\n");
		util.execCodeGeneration(sourceDir, testcase, "-bound", "naive", "-code", "-nocopy");
	}
	
	@Test
	public void testNaiveBoundDeallocCCode(){
		// Run bound analysis and Generate naive C code
		System.out.print("Bound Analysis: Naive Widen Strategy + Deallocated C code\n");
		util.execCodeGeneration(sourceDir, testcase, "-bound", "naive", "-code", "-dealloc");
	}
	
	@Test
	public void testNaiveBoundNoCopyDeallocCCode(){
		// Run bound analysis and Generate naive C code
		System.out.print("Bound Analysis: Naive Widen Strategy + Deallocated C code\n");
		util.execCodeGeneration(sourceDir, testcase, "-bound", "naive", "-code", "-nocopy", "-dealloc");
	}
	
	@Test
	public void testGradualBound() {
		util.execBoundAnalysis(sourceDir, testcase, "-bound", "gradual");
	}
	
	@Test
	public void testGradualBoundNaiveCCode() {
		// Run bound analysis and Generate naive C code
		System.out.print("Bound Analysis: Gradual Widen Strategy + Naive C code\n");
		util.execCodeGeneration(sourceDir, testcase, "-bound", "gradual", "-code");
	}
	
	@Test
	public void testGradualBoundDeallocatedCCode() {
		// Run bound analysis and Generate naive C code
		System.out.print("Bound Analysis: Gradual Widen Strategy + Deallocated C code\n");
		util.execCodeGeneration(sourceDir, testcase, "-bound", "gradual", "-code", "-dealloc");
	}
	
	
	@Test
	public void testGradualBoundNoCopyCCode() {
		// Run bound analysis and Generate naive C code
		System.out.print("Bound Analysis: Gradual Widen Strategy + No Copy C code\n");
		util.execCodeGeneration(sourceDir, testcase, "-bound", "gradual", "-code", "-nocopy");
	}
	
	
	@Test
	public void testGradualBoundNoCopyDeallocatedCCode() {
		// Run bound analysis and Generate naive C code
		System.out.print("Bound Analysis: Gradual Widen Strategy + No Copy C code\n");
		util.execCodeGeneration(sourceDir, testcase, "-bound", "gradual", "-code", "-nocopy", "-dealloc");
	}
	
}
