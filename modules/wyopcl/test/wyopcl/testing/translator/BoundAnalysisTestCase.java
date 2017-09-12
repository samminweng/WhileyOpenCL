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
	final Path baseDir = Paths
			.get(System.getProperty("user.dir") + File.separator + "tests" + File.separator + "bound");
	private static String testcase;// A list of test cases

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
		System.out.print("=== " + testcase + " ===\n");
	}

	@Parameterized.Parameters(name = "{index}:{0}")
	public static Collection<String> testCases() {

		// Add a list of test cases
		return Arrays.asList(new String[] {
				"ifelse",
				"whileloop",
				"whileloop_break",
				"nestedwhileloop",
				"ResetMacro3"
		});
	}

	/***
	 * Test outputs of bound analysis without generating code.
	 */
	// Depth-first traversal + Naive widen
	@Test
	public void testDF_NaiveWiden_NoOpt() { // Run bound analysis and check analysis results
		util.execBoundAnalysis(baseDir, testcase, "-traversal", "DF", "-bound", "naive");

	}

	// Depth-first traversal + Naive widen + NoCopy
	@Test
	public void testDF_NaiveWiden_NoCopyOpt() { // Run bound analysis and check analysis results
		util.execBoundAnalysis(baseDir, testcase, "-traversal", "DF", "-bound", "naive", "-nocopy");

	}

	// Depth-first traversal + Naive widen + NoCopy + deallocated
	@Test
	public void testDF_NaiveWiden_NoCopyDeallocOpt() { // Run bound analysis and check analysis results
		util.execBoundAnalysis(baseDir, testcase, "-traversal", "DF", "-bound", "naive", "-nocopy",
				"-dealloc");

	}

	// Depth-first traversal + Gradual widen
	@Test
	public void testDF_GradualWiden_NoOpt() { // Run bound analysis and check analysis results
		util.execBoundAnalysis(baseDir, testcase, "-traversal", "DF", "-bound", "gradual");

	}

	// Depth-first traversal + Gradual widen + + NoCopy
	@Test
	public void testDF_GradualWiden_NoCopyOpt() { // Run bound analysis and check analysis results
		util.execBoundAnalysis(baseDir, testcase, "-traversal", "DF", "-bound", "gradual", "-nocopy");

	}

	// Depth-first traversal + Gradual widen + NoCopy + deallocated
	@Test
	public void testDF_GradualWiden_NoCopyDeallocOpt() { // Run bound analysis and check analysis results
		util.execBoundAnalysis(baseDir, testcase, "-traversal", "DF", "-bound", "gradual", "-nocopy",
				"-dealloc");

	}

	// Breath-first traversal + Naive widen
	@Test
	public void testBF_NaiveWiden_NoOpt() { // Run bound analysis and check analysis results
		util.execBoundAnalysis(baseDir, testcase, "-traversal", "BF", "-bound", "naive");

	}

	// Breath-first traversal + Naive widen + NoCopy
	@Test
	public void testBF_NaiveWiden_NoCopyOpt() { // Run bound analysis and check analysis results
		util.execBoundAnalysis(baseDir, testcase, "-traversal", "BF", "-bound", "naive", "-nocopy");

	}

	// Breath-first traversal + Naive widen + NoCopy + deallocated
	@Test
	public void testBF_NaiveWiden_NoCopyDeallocOpt() { // Run bound analysis and check analysis results
		util.execBoundAnalysis(baseDir, testcase, "-traversal", "BF", "-bound", "naive", "-nocopy",
				"-dealloc");

	}

	// Breath-first traversal + Gradual widen
	@Test
	public void testBF_GradualWiden_NoOpt() { // Run bound analysis and check analysis results
		util.execBoundAnalysis(baseDir, testcase, "-traversal", "BF", "-bound", "gradual");

	}

	// Breath-first traversal + Gradual widen + NoCopy
	@Test
	public void testBF_GradualWiden_NoCopyOpt() { // Run bound analysis and check analysis results
		util.execBoundAnalysis(baseDir, testcase, "-traversal", "BF", "-bound", "gradual", "-nocopy");

	}

	// Breath-first traversal + Gradual widen + NoCopy + deallocated
	@Test
	public void testBF_GradualWiden_NoCopyDeallocOpt() { // Run bound analysis and check analysis results
		util.execBoundAnalysis(baseDir, testcase, "-traversal", "BF", "-bound", "gradual", "-nocopy",
				"-dealloc");

	}
	
	/***
	 * Test outputs of bound analysis with code generator
	 */
	
	// Depth-first traversal + Naive widen + naive code
	@Test
	public void testDF_NaiveWiden_NoOpt_CodeGenerator() {
		// Run bound analysis and check analysis results
		util.execCodeGeneration(baseDir, testcase, "-traversal", "DF", "-bound", "naive", "-code");

	}
	
	// Depth-first traversal + Naive widen + NoCopy
	@Test
	public void testDF_NaiveWiden_NoCopyOpt_CodeGenerator() {
		// Run bound analysis and check analysis results
		util.execCodeGeneration(baseDir, testcase, "-traversal", "DF", "-bound", "naive", "-code", "-nocopy");

	}
	
	// Depth-first traversal + Naive widen + NoCopy + deallocated
	@Test
	public void testDF_NaiveWiden_NoCopyDeallocOpt_CodeGenerator() {
		// Run bound analysis and check analysis results
		util.execCodeGeneration(baseDir, testcase, "-traversal", "DF", "-bound", "naive", "-code",
				"-nocopy", "-dealloc");

	}
	
	// Depth-first traversal + Gradual widen
	@Test
	public void testDF_GradualWiden_NoOpt_CodeGenerator() {
		// Run bound analysis and check analysis results
		util.execCodeGeneration(baseDir, testcase, "-traversal", "DF", "-bound", "gradual", "-code");

	}

	// Depth-first traversal + Gradual widen + + NoCopy
	@Test
	public void testDF_GradualWiden_NoCopyOpt_CodeGenerator() {
		// Run bound analysis and check analysis results
		util.execCodeGeneration(baseDir, testcase, "-traversal", "DF", "-bound", "gradual", "-code",
				"-nocopy");

	}

	// Depth-first traversal + Gradual widen + NoCopy + deallocated
	@Test
	public void testDF_GradualWiden_NoCopyDeallocOpt_CodeGenerator() {
		// Run bound analysis and check analysis results
		util.execCodeGeneration(baseDir, testcase, "-traversal", "DF", "-bound", "gradual", "-code",
				"-nocopy", "-dealloc");

	}

	// Breath-first traversal + Naive widen
	@Test
	public void testBF_NaiveWiden_NoOpt_CodeGenerator() {
		// Run bound analysis and check analysis results
		util.execCodeGeneration(baseDir, testcase, "-traversal", "BF", "-bound", "naive", "-code");

	}

	// Breath-first traversal + Naive widen + NoCopy
	@Test
	public void testBF_NaiveWiden_NoCopyOpt_CodeGenerator() {
		// Run bound analysis and check analysis results
		util.execCodeGeneration(baseDir, testcase, "-traversal", "BF", "-bound", "naive", "-code",
				"-nocopy");

	}

	// Breath-first traversal + Naive widen + NoCopy + deallocated
	@Test
	public void testBF_NaiveWiden_NoCopyDeallocOpt_CodeGenerator() {
		// Run bound analysis and check analysis results
		util.execCodeGeneration(baseDir, testcase, "-traversal", "BF", "-bound", "naive", "-code",
				"-nocopy", "-dealloc");

	}

	// Breath-first traversal + Gradual widen
	@Test
	public void testBF_GradualWiden_NoOpt_CodeGenerator() {
		// Run bound analysis and check analysis results
		util.execCodeGeneration(baseDir, testcase, "-traversal", "BF", "-bound", "gradual", "-code");

	}

	// Breath-first traversal + Gradual widen + NoCopy
	@Test
	public void testBF_GradualWiden_NoCopyOpt_CodeGenerator() {
		// Run bound analysis and check analysis results
		util.execCodeGeneration(baseDir, testcase, "-traversal", "BF", "-bound", "gradual", "-code",
				"-nocopy");

	}

	// Breath-first traversal + Gradual widen + NoCopy + deallocated
	@Test
	public void testBF_GradualWiden_NoCopyDeallocOpt_CodeGenerator() {
		// Run bound analysis and check analysis results
		util.execCodeGeneration(baseDir, testcase, "-traversal", "BF", "-bound", "gradual", "-code",
				"-nocopy", "-dealloc");

	}
	
}
