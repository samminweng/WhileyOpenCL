package wyopcl;

import java.util.Properties;

import wycc.lang.NameID;
import wyil.lang.WyilFile;
import wyil.lang.WyilFile.FunctionOrMethod;

/**
 * Provides a container for the configuration of the translator.
 * 
 * @author Min-Hsien Weng
 */
public class Configuration {
	private String filename;// The processing file name
	private Properties options;

	public Configuration() {
		// Initial properties based on default properties
		this.options = new Properties();
		this.options.put("copy", false);
		this.options.put("bound", false);
		//this.options.put("pattern", false);
		this.options.put("dealloc", false);
		this.options.put("code", false);
		this.options.put("verbose", false);
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
			//this.module = (WyilFile) value;
			this.filename = ((WyilFile) value).filename().split(".whiley")[0];
			// Remove the prefix of file name './' on Linux.
			// e.g. the file name of './While_Valid_1.whiley' is 'While_Valid_1.whiley'
			filename = filename.replace("./", "");
			// Remove the prefix of file name '.\While_Valid_1.whiley' on Windows.
			filename = filename.replace(".\\", "");
		}else if (option.equals("bound")){
			// Check if the value is not null.
			if (value != null) {
				if (value.toString().equals("gradual")) {
					this.options.put("widen", "gradual");
				} else {
					this.options.put("widen", "naive");
				}
			}
		}else{
			this.options.put(option, true);
		}
	}

	/**
	 * Get the value of the given option.
	 * 
	 * @return the mode. If no mode is set, return null.
	 */
	public boolean isEnabled(String option) {
		return (boolean) this.options.get(option);
	}

	/**
	 * Check if setting the gradual widen strategy.
	 * 
	 * @return
	 */
	public boolean isGradualWiden() {
		if (this.options.get("widen").equals("gradual")) {
			return true;
		}
		return false;
	}

}
