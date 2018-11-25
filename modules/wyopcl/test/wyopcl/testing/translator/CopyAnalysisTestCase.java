package wyopcl.testing.translator;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Arrays;
import java.util.Collection;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;

/**
 * Run copy analyzer combined with code generator to produce the copy optimized C code.
 * 
 * @author Min-Hsien Weng
 *
 */
@RunWith(Parameterized.class)
public class CopyAnalysisTestCase {

	final Path sourceDir = Paths
			.get(System.getProperty("user.dir") + File.separator + "tests" + File.separator + "copy");
	private String testcase;// A list of test cases

	@Before
	public void initialize() throws Exception {

	}

	@After
	public void tearDown() throws Exception {
		// util = null;
	}

	/**
	 * Pass the test case parameters as the arguments to the method
	 * 
	 * @param testcase
	 */
	public CopyAnalysisTestCase(String testcase) {
		this.testcase = testcase;
		System.out.print("=== " + testcase + " ===\n");
	}

	@Parameterized.Parameters(name = "{index}:{0}")
	public static Collection<String> testCases() {

		// Add a list of test cases
		return Arrays.asList(new String[] { "testcase1", "testcase2", "testcase3", "testcase4", "testcase5",
				"testcase6", "testcase7", "testcase8", "testcase9", "testcase10", "specialcase1", "specialcase2", });
	}

	/***
	 * Execute the copy analysis and compare the system output with output file.
	 * 
	 * 
	 * 
	 * @param baseDir
	 * @param testcase
	 * @param options
	 */
	public void execCopyAnalysis(Path baseDir, String testcase, String... options) {

		Process process;
		try {
			Path destDir = Paths.get(baseDir + File.separator + "sysout" + File.separator + testcase + File.separator);

			// Copy source.whiley to destDir folder
			Files.copy(Paths.get(baseDir + File.separator + "Whileyfiles" + File.separator + testcase + ".whiley"),
					Paths.get(destDir + File.separator + testcase + ".whiley"), StandardCopyOption.REPLACE_EXISTING);

			Path sysout = Paths.get(destDir + File.separator + testcase + ".sysout");
			// Make the command
			String cmd = BaseTestUtil.makeCmd(testcase, options);

			// Get the runtime.
			Runtime rt = Runtime.getRuntime();
			// Change the folder Run the command
			process = rt.exec(cmd, null, destDir.toFile());

			process.waitFor();

			// Start the process to analyse the bounds
			InputStream input = process.getInputStream();

			// Check the bound results against pre-stored results
			BaseTestUtil.assertOutput(new BufferedReader(new InputStreamReader(input, Charset.forName("UTF-8"))),
					Files.newBufferedReader(sysout, StandardCharsets.UTF_8));

			// Remove all generated WyIL files.
			Files.deleteIfExists(Paths.get(destDir + testcase + ".wyil"));
		} catch (Exception e) {
			throw new RuntimeException("Test file: " + testcase + ".whiley", e);
		}

		process.destroy();

	}

	@Test
	public void testCopyAndEnableAssertion() {
		// Perform copy analysis with assertion enabled
		execCopyAnalysis(sourceDir, testcase, "-verbose", "-nocopy", "-ea", "-code");
	}

}
