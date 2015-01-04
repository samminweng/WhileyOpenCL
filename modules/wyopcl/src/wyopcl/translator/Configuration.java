package wyopcl.translator;

import java.util.Collections;
import java.util.Properties;

import wybs.lang.Build;
import wycc.util.Logger;
/**
 * Provides a container for the configuration of the translator.
 * @author Min-Hsien Weng
 */
public class Configuration {
	protected Properties properties;
	/* The executing mode of translator*/
	public enum Mode{
		BoundAnalysis,
		CodeGeneration,
		TheoremProving
	}
	
	/* Determine the widen strategy. */
	public enum WidenStrategy{
		//Widen the bounds upto +/- infinity
		NAIVE,
		//Widen the bounds against a list of threshold values
		GRADUAL
	}
	
	public Configuration(Build.Project project){
		this.properties = new Properties();
		this.properties.put("project", project);
		this.properties.put("logger",  Logger.NULL);
		this.properties.put("argument", Collections.emptyList());
		//Initial properties based on default properties
		this.properties.put("filename", "");
		this.properties.put("verbose", false);		
	}	
	
	public void setProperty(String key, Object value){	
		this.properties.put(key, value);
	}
	
	public Object getProperty(String key){
		if(!this.properties.containsKey(key)){
			throw new RuntimeException("Unknown Properties");
		}
		return this.properties.get(key);
	}	
	
	public boolean isVerbose() {
		return (boolean) this.properties.get("verbose");
	}	

	public String getFilename() {
		return (String) this.properties.get("filename");
	}

	public Logger getLogger(){
		return (Logger) this.properties.get("logger");
	}
	
	public Mode getMode(){
		return (Mode) this.getProperty("mode");
	}
	
	/**
	 * Check if setting the gradual widen strategy. 
	 * @return
	 */
	public boolean isMultiWiden() {
		if(this.properties.get("widen").equals(WidenStrategy.GRADUAL)){
			return true;
		}		
		return false;
	}
	
}