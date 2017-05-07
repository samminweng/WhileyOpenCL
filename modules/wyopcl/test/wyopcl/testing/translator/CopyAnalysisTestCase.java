package wyopcl.testing.translator;

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
public class CopyAnalysisTestCase {
	private BaseTestUtil util;
	final Path sourceDir = Paths.get(System.getProperty("user.dir")+ File.separator + "tests" + File.separator + "copy");
	private String testcase;// A list of test cases
	
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
	public CopyAnalysisTestCase(String testcase) {
		this.testcase = testcase;
		System.out.print("=== "+testcase+" ===\n");
	}
	
	@Parameterized.Parameters(name = "{index}:{0}")
	public static Collection<String> testCases() {
		
		// Add a list of test cases
		return Arrays.asList(new String[] { 
				"reverse", 
			});
	}
	
	@Test
	public void testCopyAndDisableAssertion(){
		// Perform copy analysis with assertion disabled 
		util.execCopyAnalysis(sourceDir, testcase, "-nocopy", "-verbose");
	}
	
	@Test
	public void testCopyAndDisableAssertionAndGenerateCode(){
		// Generate C code with copy analysis enabled and assertion disabled 
		util.execCodeGeneration(sourceDir, testcase, "-nocopy", "-code");
	}
	
	
}
