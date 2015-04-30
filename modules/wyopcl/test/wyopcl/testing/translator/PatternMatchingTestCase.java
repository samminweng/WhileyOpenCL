package wyopcl.testing.translator;

import java.io.File;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class PatternMatchingTestCase {
	private BaseTestUtil util;
	final String path = System.getProperty("user.dir") + File.separator + "tests" + File.separator + "pattern"+ File.separator;

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
	public void test_Loop() {
		util.execPattern(path, "Loop", "pattern");
	}
	
	@Test
	public void test_While_Valid_1() {
		util.execPattern(path, "While_Valid_1", "pattern");
	}
	
}
