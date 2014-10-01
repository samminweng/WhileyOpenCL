package wyopcl;

import wybs.lang.Builder;
import wycc.util.Logger;

/**
 * An evolving interface that extends wybs.lang.Builder interface
 * @author Min-Hsien Weng
 *
 */
public interface WyopclBuilder extends Builder{
	void setLogger(Logger logger);
	void setVerbose(boolean verbose);
	//void setVerify(boolean verification);
	void setArgs(String[] arguments);	
}
