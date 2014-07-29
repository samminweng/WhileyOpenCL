package wyopcl;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;

@RunWith(Suite.class)
@SuiteClasses({ 
	TestFor.class,
	TestAccess.class,
	TestAssume.class
})
public class AllTests {

}
