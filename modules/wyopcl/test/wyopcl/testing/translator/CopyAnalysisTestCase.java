package wyopcl.testing.translator;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
/**
 * The tests of copy analysis is merged to tests of code generator. 
 * 
 * @author Min-Hsien Weng
 *
 */
@Deprecated 
public class CopyAnalysisTestCase {
	/*private BaseTestUtil util;
	final Path path = Paths.get(System.getProperty("user.dir")+ File.separator + "tests" + File.separator + "copy");

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
	public void test_mutate_return_live() {
		// 'b' is mutated and returned by 'f' and alive after the function call  
		util.execCopyAnalysis(path, "mutate_return_live");
	}
	
	@Test
	public void test_mutate_return_nolive() {
		// 'b' is mutated and returned by 'f', but NOT alive after the function call 
		util.execCopyAnalysis(path, "mutate_return_nolive");
	}
	
	@Test
	public void test_mutate_noreturn_live() {
		// 'b' is mutated but NOT returned by 'f', and alive after the function call   
		util.execCopyAnalysis(path, "mutate_noreturn_live");
	}
	
	@Test
	public void test_mutate_noreturn_nolive() {
		// 'b' is mutated but NOT returned by 'f', and NOT alive after the function call     
		util.execCopyAnalysis(path, "mutate_noreturn_nolive");
	}
	
	@Test
	public void test_nomutate_return_live() {
		// 'b' is NOT mutated, but returned by 'f' and alive after the function call   
		util.execCopyAnalysis(path, "nomutate_return_live");
	}
	
	@Test
	public void test_nomutate_return_nolive() {
		// 'b' is NOT mutated but returned by 'f', and NOT alive after the function call   
		util.execCopyAnalysis(path, "nomutate_return_nolive");
	}
	
	@Test
	public void test_nomutate_noreturn_live() {
		// 'b' is NOT mutated or NOT returned by 'f', or NOT alive after the function call  
		util.execCopyAnalysis(path, "nomutate_noreturn_live");
	}
	
	@Test
	public void test_nomutate_noreturn_nolive() {
		// 'b' is NOT mutated or NOT returned by 'f', or NOT alive after the function call    
		util.execCopyAnalysis(path, "nomutate_noreturn_nolive");
	}
	*/
}
