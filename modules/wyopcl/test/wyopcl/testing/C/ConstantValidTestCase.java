package wyopcl.testing.C;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestRule;
import org.junit.rules.Timeout;

import wyopcl.testing.BaseTestUtil;

public class ConstantValidTestCase {
	@Rule
	public TestRule timeout = new Timeout(5000);
	private BaseTestUtil util;

	@Before
	public void setUp() throws Exception {
		util = new BaseTestUtil();
	}

	@After
	public void tearDown() throws Exception {
		util.terminate();
		util = null;
	}

	/**
	Parsed 1 source file(s). ....................................................... [60ms+1mb]
.\Constant_Valid_1.whiley:5: internal failure
constant CONSTANT is {V1 is TYPE, V2 is TYPE}
                            ^^^^
wycc.lang.SyntaxError$InternalFailure: internal failure
	at wycc.lang.SyntaxError.internalFailure(SyntaxError.java:312)
	at wyc.lang.WhileyFile.internalFailure(WhileyFile.java:635)
	at wyc.builder.FlowTypeChecker.resolveAsType(FlowTypeChecker.java:3190)
	at wyc.builder.FlowTypeChecker.resolveAsType(FlowTypeChecker.java:3078)
	at wyc.builder.FlowTypeChecker.resolveAsType(FlowTypeChecker.java:3023)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:2382)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:1712)
	at wyc.builder.FlowTypeChecker.resolveLeafCondition(FlowTypeChecker.java:1459)
	at wyc.builder.FlowTypeChecker.propagateCondition(FlowTypeChecker.java:1356)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:1750)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:1660)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:2199)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:1698)
	at wyc.builder.FlowTypeChecker.resolveAsConstant(FlowTypeChecker.java:3469)
	at wyc.builder.FlowTypeChecker.resolveAsConstant(FlowTypeChecker.java:3407)
	at wyc.builder.FlowTypeChecker.resolveAsType(FlowTypeChecker.java:3282)
	at wyc.builder.FlowTypeChecker.resolveAsType(FlowTypeChecker.java:3182)
	at wyc.builder.FlowTypeChecker.resolveAsType(FlowTypeChecker.java:3116)
	at wyc.builder.FlowTypeChecker.resolveAsType(FlowTypeChecker.java:3325)
	at wyc.builder.FlowTypeChecker.resolveAsType(FlowTypeChecker.java:3182)
	at wyc.builder.FlowTypeChecker.resolveAsType(FlowTypeChecker.java:3078)
	at wyc.builder.FlowTypeChecker.resolveAsType(FlowTypeChecker.java:3024)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:2382)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:1712)
	at wyc.builder.FlowTypeChecker.resolveLeafCondition(FlowTypeChecker.java:1459)
	at wyc.builder.FlowTypeChecker.propagateCondition(FlowTypeChecker.java:1356)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:1750)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:1660)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:2199)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:1698)
	at wyc.builder.FlowTypeChecker.resolveAsConstant(FlowTypeChecker.java:3469)
	at wyc.builder.FlowTypeChecker.resolveAsConstant(FlowTypeChecker.java:3407)
	at wyc.builder.FlowTypeChecker.resolveAsType(FlowTypeChecker.java:3282)
	at wyc.builder.FlowTypeChecker.resolveAsType(FlowTypeChecker.java:3182)
	at wyc.builder.FlowTypeChecker.resolveAsType(FlowTypeChecker.java:3116)
	at wyc.builder.FlowTypeChecker.resolveAsType(FlowTypeChecker.java:3325)
	at wyc.builder.FlowTypeC
	*/
	@Ignore("Issue #311\n"
			+ ".\\Constant_Valid_1.whiley:5: internal failure\r\n" + 
			"constant CONSTANT is {V1 is TYPE, V2 is TYPE}\r\n" + 
			"                            ^^^^\r\n" + 
			"wycc.lang.SyntaxError$InternalFailure: internal failure\r\n" + 
			"	at wycc.lang.SyntaxError.internalFailure(SyntaxError.java:312)\r\n" + 
			"	at wyc.lang.WhileyFile.internalFailure(WhileyFile.java:635)")
	@Test
	public void test_Constant_Valid_1() {
		util.exec("Constant_Valid_1");
	}

	/**
	 .\Constant_Valid_2.whiley:4: type not found: Constant_Valid_2:ZLIB
type CompressionMethod is {ZLIB}
                           ^^^^
wycc.lang.SyntaxError: type not found: Constant_Valid_2:ZLIB
	at wycc.lang.SyntaxError.syntaxError(SyntaxError.java:253)
	at wyc.lang.WhileyFile.syntaxError(WhileyFile.java:625)
	at wyc.builder.FlowTypeChecker.resolveAsType(FlowTypeChecker.java:3185)
	at wyc.builder.FlowTypeChecker.resolveAsType(FlowTypeChecker.java:3123)
	at wyc.builder.FlowTypeChecker.resolveAsType(FlowTypeChecker.java:3078)
	at wyc.builder.FlowTypeChecker.resolveAsType(FlowTypeChecker.java:3024)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:179)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:147)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:135)
	at wyc.builder.WhileyBuilder.build(WhileyBuilder.java:181)
	at wybs.util.StdBuildRule.apply(StdBuildRule.java:109)
	at wybs.util.StdProject.build(StdProject.java:256)
	at wyc.util.WycBuildTask.buildEntries(WycBuildTask.java:503)
	at wyc.util.WycBuildTask.build(WycBuildTask.java:471)
	at wyopcl.WyopclMain.run(WyopclMain.java:119)
	at wyopcl.WyopclMain.main(WyopclMain.java:148)
Caused by: wycc.util.ResolveError: type not found: Constant_Valid_2:ZLIB
	at wyc.builder.FlowTypeChecker.resolveAsType(FlowTypeChecker.java:3296)
	at wyc.builder.FlowTypeChecker.resolveAsType(FlowTypeChecker.java:3182)
	... 13 more

	 */
	@Ignore("Issue #311\n"
			+ ".\\Constant_Valid_2.whiley:4: type not found: Constant_Valid_2:ZLIB\r\n" + 
			"type CompressionMethod is {ZLIB}\r\n" + 
			"                           ^^^^\r\n" + 
			"wycc.lang.SyntaxError: type not found: Constant_Valid_2:ZLIB\r\n" + 
			"	at wycc.lang.SyntaxError.syntaxError(SyntaxError.java:253)\r\n" + 
			"	at wyc.lang.WhileyFile.syntaxError(WhileyFile.java:625)")
	@Test
	public void test_Constant_Valid_2() {
		util.exec("Constant_Valid_2");
	}

	@Test
	public void test_Constant_Valid_3() {
		util.exec("Constant_Valid_3");
	}

}
