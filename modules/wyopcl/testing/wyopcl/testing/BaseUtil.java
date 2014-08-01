package wyopcl.testing;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Iterator;
import java.util.List;
import static org.junit.Assert.*;


public class BaseUtil{
	final String version = "v0.3.26";
	//user.dir is the current directory.
	final String classpath = 			
			System.getProperty("user.dir")+"\\lib\\wyjc-"+version+".jar;"+
			System.getProperty("user.dir")+"\\lib\\wyopcl-"+version+".jar;"+
			System.getProperty("user.dir")+	"\\lib\\wyrl-"+version+".jar;"+
			System.getProperty("user.dir")+"\\lib\\wycs-"+version+".jar;"+
			System.getProperty("user.dir")+"\\lib\\wybs-"+version+".jar;"+
			System.getProperty("user.dir")+"\\lib\\wyil-"+version+".jar;"+
			System.getProperty("user.dir")+"\\lib\\wyc-"+version+".jar;";
	final String runtime = System.getProperty("user.dir")+"\\lib\\wyrt-"+version+".jar";
	final String valid_test_folder =  System.getProperty("user.dir")+"\\tests\\valid\\";
	final String cmd = "java -cp "+classpath+" wyopcl.WyopclMain -bp "+runtime+" ";
	
	
	public BaseUtil(){
		
	}
	
	
	public void exec(String file_name){
		try {
			//Load the output file (*.sysout).
			String path_sysout = valid_test_folder+file_name+".sysout";
			List<String> expected = Files.readAllLines(Paths.get(path_sysout),
					Charset.defaultCharset());
			Iterator<String> iterator = expected.iterator();
			//Run the whiley program with interpreter.
			String path_whiley = valid_test_folder+file_name+".whiley";
			Process p = Runtime.getRuntime().exec(cmd+path_whiley);
			try (BufferedReader reader = new BufferedReader(new InputStreamReader(p.getInputStream(), Charset.forName("UTF-8")))) {
	            String line;   
	            while ((line = reader.readLine()) != null) {
	                String out = iterator.next();
	                System.out.println(line);
	                assertEquals(line, out);
	            }
	        }
			//Ensure no records is left in the list. 
			assertFalse(iterator.hasNext());
			
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
