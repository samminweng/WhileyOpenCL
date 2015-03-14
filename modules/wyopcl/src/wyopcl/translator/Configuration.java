package wyopcl.translator;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Properties;

import wycc.util.Logger;
/**
 * Provides a container for the configuration of the translator.
 * @author Min-Hsien Weng
 */
public class Configuration {
	protected Properties properties;
	public Configuration(){
		this.properties = new Properties();
		this.properties.put("logger",  Logger.NULL);
		this.properties.put("argument", Collections.emptyList());
		//Initial properties based on default properties
		this.properties.put("filename", "");
		this.properties.put("verbose", false);
		//Output the results to the physical file
		this.properties.put("output", false);
		//Initialize the list of modes.
		this.properties.put("modes", new ArrayList<String>());
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

	public boolean isOutputFile(){
		return (boolean) this.properties.get("output");
	}
	
	
	public void setMode(String mode, Object value) {
		//Get the mode 
		@SuppressWarnings("unchecked")
		List<String> modes = (List<String>) this.getProperty("modes");
		if(mode.equals("bound")||mode.equals("code")||mode.equals("pattern")){
			//Check if the value is not null.
			if(value!= null){
				if(value.toString().equals("gradual")){
					setProperty("widen", "gradual");
				}else{
					setProperty("widen", "naive");
				}
			}			
			modes.add(mode);
		}		
		setProperty("modes", modes);
	}
	
	/**
	 * Get the mode. If there are more than one mode, then return the first one. 
	 * @return the mode. If no mode is set, return null.
	 */
	public String getMode(){
		if(!this.properties.containsKey("modes")){
			return null;
		}		
		return ((List<String>) this.getProperty("modes")).get(0);
	}

	/**
	 * Check if the pattern mode is on.
	 * @return
	 */
	public boolean isPatternMatching(){
		if(this.properties.containsKey("modes")){
			for(String mode :(List<String>) this.properties.get("modes")){
				if(mode.equals("pattern")){
					return true;
				}				
			}
		}
		
		return false;
	}
	
	/**
	 * Check if setting the gradual widen strategy. 
	 * @return
	 */
	public boolean isGradualWiden() {
		if(this.properties.get("widen").equals("gradual")){
			return true;
		}		
		return false;
	}

}
