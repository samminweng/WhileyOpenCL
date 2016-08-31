package wyopcl;

import java.io.*;
import wyc.util.WycAntTask;

/**
 * An AntTask is used to call our code generator to translate the compile WyIL code 
 * into c code with/without code optimization.
 *
 * 
 * @author Min-Hsien Weng
 * 
 */
public class WyopclAntTask extends WycAntTask {
	private final WyopclBuildTask myBuilder;	
	
	public WyopclAntTask() {
		super(new WyopclBuildTask());
		this.myBuilder = (WyopclBuildTask) builder;
	}		
}
