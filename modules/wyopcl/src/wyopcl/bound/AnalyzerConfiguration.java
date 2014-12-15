package wyopcl.bound;

import java.util.Collections;
import java.util.Properties;

import wybs.lang.Build;
import wycc.util.Logger;

/**
 * Provides a container to store the configuration of an analyzer.
 * @author Min-Hsien Weng
 *
 */
public final class AnalyzerConfiguration {
	//private final Build.Project project;
	private Properties properties;
	
	/* Determine the widen strategy. */
	public enum WidenStrategy{
		//Widen the bounds upto +/- infinity
		NAIVE,
		//Widen the bounds against a list of threshold values
		GRADUAL
	}

	public AnalyzerConfiguration(Build.Project project){
		this.properties = new Properties();
		this.properties.put("project", project);
		this.properties.put("logger",  Logger.NULL);
		this.properties.put("argument", Collections.emptyList());
		//Initial properties based on default properties
		this.properties.put("filename", "");
		this.properties.put("widen", WidenStrategy.NAIVE);
		this.properties.put("invoked", "functioncall");
		this.properties.put("verbose", false);		
		
	}
	
	public void setProperty(String key, Object value){
		if(!this.properties.containsKey(key)){
			throw new RuntimeException("Unknown Properties");
		}
		this.properties.put(key, value);
	}
	
	public Object getProperty(String key){
		if(!this.properties.containsKey(key)){
			throw new RuntimeException("Unknown Properties");
		}
		return this.properties.get(key);
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

	public boolean isVerbose() {
		return (boolean) this.properties.get("verbose");
	}	

	public String getFilename() {
		return (String) this.properties.get("filename");
	}

	public Logger getLogger(){
		return (Logger) this.properties.get("logger");
	}
	
}
