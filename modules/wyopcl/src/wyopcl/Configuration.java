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
	private boolean isVerbose;// Enable/disable 'verbose' option
	private boolean enabledCodeGenerator;// Enable/disable 'code' option to generate the code.
	private String filename;// The processing file name
	private WyilFile module;// In-memory Wyil byte-code
	private Properties options;

	public Configuration() {
		this.isVerbose = false;
		this.enabledCodeGenerator = false;
		// Initial properties based on default properties
		this.options = new Properties();
		this.options.put("copy", false);
		this.options.put("bound", false);
		this.options.put("pattern", false);
	}

	/**
	 * Check if the 'verbose' option is enabled/disabled.
	 * 
	 * @return
	 */
	public boolean isVerbose() {
		return this.isVerbose;
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
	 * Get the in-memory wyil byte-code
	 * 
	 * @return
	 */
	public WyilFile getWyilFile() {
		return this.module;
	}

	/**
	 * Get the function or method by name.
	 * 
	 * @param name
	 * @return the called function. If not found, return null.
	 */
	public FunctionOrMethod getFunctionOrMethod(NameID nameId) {
		if (this.module.functionOrMethod(nameId.name()) != null
				&& !this.module.functionOrMethod(nameId.name()).isEmpty()) {
			return this.module.functionOrMethod(nameId.name()).get(0);
		}
		return null;
	}

	/**
	 * Add the option and value.
	 * 
	 * @param option
	 * @param value
	 */
	public void setOption(String option, Object value) {
		if (!option.equals("bootpath") && !option.equals("whileypath") && !option.equals("whileydir")) {
			// Check if option is a verbose
			switch (option) {
			case "module":
				this.module = (WyilFile) value;
				this.filename = module.filename().split(".whiley")[0];
				// Remove the prefix of file name './' on Linux.
				// e.g. the file name of './While_Valid_1.whiley' is 'While_Valid_1.whiley'
				filename = filename.replace("./", "");
				// Remove the prefix of file name '.\While_Valid_1.whiley' on Windows.
				filename = filename.replace(".\\", "");
				break;
			case "verbose":
				this.isVerbose = true;
				break;
			case "code":
				this.enabledCodeGenerator = true;
				break;
			case "bound":
				// Check if the value is not null.
				if (value != null) {
					if (value.toString().equals("gradual")) {
						this.options.put("widen", "gradual");
					} else {
						this.options.put("widen", "naive");
					}
				}
				break;
			default:
				this.options.put(option, true);
			}
		}
	}

	/**
	 * Get the value of the given option.
	 * 
	 * @return the mode. If no mode is set, return null.
	 */
	public boolean isEnabled(String option) {
		switch (option) {
		case "code":
			return this.enabledCodeGenerator;
		default:
			return (boolean) this.options.get(option);
		}
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