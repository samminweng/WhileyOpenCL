package wyopcl.translator.generator;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 * Lists the common methods for code generation. 
 * @author Min-Hsien Weng
 *
 */
public final class Utility {
	private Utility(){
		
	}
	
	public static void generateHeader(PrintWriter write){
		//Include files
		write.println("#include <stdio.h>");
		System.out.println("#include <stdio.h>");
		write.println("#include <stdlib.h>");
		System.out.println("#include <stdlib.h>");
		write.println("#include <string.h>");
		System.out.println("#include <string.h>");
		write.println("#include <errno.h>");
		System.out.println("#include <errno.h>");
		//Boolean type
		write.println("#define false 0");
		System.out.println("#define false 0");
		write.println("#define true 1");
		System.out.println("#define true 1");
	}
	
	
	
	

}
