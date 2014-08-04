package wyopcl.testing;

import java.io.BufferedReader;
import java.io.File;
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
			System.getProperty("user.dir")+File.separator+"lib"+File.separator+"wyjc-"+version+".jar;"+
			System.getProperty("user.dir")+File.separator+"lib"+File.separator+"wyopcl-"+version+".jar;"+
			System.getProperty("user.dir")+File.separator+"lib"+File.separator+"wyrl-"+version+".jar;"+
			System.getProperty("user.dir")+File.separator+"lib"+File.separator+"wycs-"+version+".jar;"+
			System.getProperty("user.dir")+File.separator+"lib"+File.separator+"wybs-"+version+".jar;"+
			System.getProperty("user.dir")+File.separator+"lib"+File.separator+"wyil-"+version+".jar;"+
			System.getProperty("user.dir")+File.separator+"lib"+File.separator+"wyc-"+version+".jar;";
	final String runtime = System.getProperty("user.dir")+File.separator+"lib"+File.separator+"wyrt-"+version+".jar";
	final String valid_test_folder =  System.getProperty("user.dir")+File.separator+"tests"+File.separator+"valid"+File.separator;
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
			throw new RuntimeException("Test file: " + file_name, e);
		}
	}
}
