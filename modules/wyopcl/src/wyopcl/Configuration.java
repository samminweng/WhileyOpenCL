package wyopcl;

import java.util.Properties;

import wycc.lang.NameID;
import wyfs.lang.Path;
import wyfs.lang.Path.ID;
import wyil.lang.WyilFile;
import wyil.lang.WyilFile.FunctionOrMethod;

/**
 * Provides a container for the configuration of the translator.
 * 
 * @author Min-Hsien Weng
 */
public class Configuration {
	private Path.ID pathid;
	private String filename;// The processing file name
	private Properties options;

	public Configuration() {
		// Initial properties based on default properties
		this.options = new Properties();
		this.options.put("nocopy", false);
		this.options.put("bound", false);
		this.options.put("dealloc", false);
		this.options.put("code", false);
		this.options.put("verbose", false);
		// Pattern matching option
		this.options.put("pattern", false);
	}

	/**
	 * Check if the 'verbose' option is enabled/disabled.
	 * 
	 * @return
	 */
	public boolean isVerbose() {
		return (boolean) this.options.get("verbose");
	}

	/**
	 * Get the filename
	 * 
	 * @return
	 */
	public String getFilename() {
		return this.filename;
	}

	/**
	 * Get the path id (used for nameID)
	 * @return
	 */
	public Path.ID getPathID(){
		return this.pathid;
	}
	
	/**
	 * Add the option and value.
	 * 
	 * @param option
	 * @param value
	 */
	public void setOption(String option, Object value) {
		if (option.equals("bootpath") || option.equals("whileypath") ||  option.equals("whileydir")) {
			return;	
		}
		if(option.equals("module")){
			WyilFile module = (WyilFile) value;
			// Get file name
			this.filename = module.filename().split(".whiley")[0];
			// Remove the prefix of file name './' on Linux.
			// e.g. the file name of './While_Valid_1.whiley' is 'While_Valid_1.whiley'
			this.filename = filename.replace("./", "");
			// Remove the prefix of file name '.\While_Valid_1.whiley' on Windows.
			this.filename = filename.replace(".\\", "");
			// Get path id
			this.pathid = module.id();			
		}else {
			this.options.put(option, true);
			if (option.equals("bound")){
				// Get the widen strategy (naive or gradual)
				if (value.toString().equals("gradual")) {
					this.options.put("widen", "gradual");
				} else {
					this.options.put("widen", "naive");
				}
			}else if(option.equals("pattern")){
				// Get the function name
				this.options.put("function_name", value.toString());				
			}
		}
	}

	/**
	 * Check if the given option is enabled or not
	 * 
	 * @return the mode. If no mode is set, return null.
	 */
	public boolean isEnabled(String option) {
		return (boolean)this.options.get(option);
	}

	/**
	 * Check if setting the gradual widen strategy.
	 * 
	 * @return
	 */
	public boolean isGradualWiden() {
		return this.options.get("widen").equals("gradual");
	}

	/**
	 * Get the function name that will be applied with 
	 * pattern matching.
	 * 
	 * @return
	 */
	public String getFunctionName(){
		return (String)this.options.get("function_name");
	}
}
