package wyopcl.testing.C;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestRule;
import org.junit.rules.Timeout;

import wyopcl.testing.BaseTestUtil;

public class ContractiveValidTestCase {
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
	.\Contractive_Valid_1.whiley:5: contractive type encountered
function f(Contractive x) => Contractive:
           ^^^^^^^^^^^
wycc.lang.SyntaxError: contractive type encountered
	at wycc.lang.SyntaxError.syntaxError(SyntaxError.java:238)
	at wyc.builder.FlowTypeChecker.resolveAsType(FlowTypeChecker.java:2972)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:256)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:145)
	at wyc.builder.FlowTypeChecker.propagate(FlowTypeChecker.java:135)
	at wyc.builder.WhileyBuilder.build(WhileyBuilder.java:181)
	at wybs.util.StdBuildRule.apply(StdBuildRule.java:109)
	at wybs.util.StdProject.build(StdProject.java:256)
	at wyc.util.WycBuildTask.buildEntries(WycBuildTask.java:503)
	at wyc.util.WycBuildTask.build(WycBuildTask.java:471)
	at wyopcl.WyopclMain.run(WyopclMain.java:119)
	at wyopcl.WyopclMain.main(WyopclMain.java:148)
	 */
	@Ignore("Issue ???\n"
			+ ".\\Contractive_Valid_1.whiley:5: contractive type encountered\r\n" + 
			"function f(Contractive x) => Contractive:\r\n" + 
			"           ^^^^^^^^^^^\r\n" + 
			"wycc.lang.SyntaxError: contractive type encountered\r\n" + 
			"	at wycc.lang.SyntaxError.syntaxError(SyntaxError.java:238)")
	@Test
	public void test_Contractive_Valid_1() {
		util.exec("Contractive_Valid_1");
	}

	@Test
	public void test_Contractive_Valid_2() {
		util.exec("Contractive_Valid_2");
	}
}
