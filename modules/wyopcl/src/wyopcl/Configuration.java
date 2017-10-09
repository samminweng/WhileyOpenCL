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
	public static final String DISABLED ="disabled";
	public static final String ENABLED = "enabled";
	public static final String MODULE = "module";
	
	// Runtime Options
	public static final String BOUND = "bound"; // bound analysis
	public static final String TRAVERSAL = "traversal"; // Tree traversal order
	public static final String PATTERN = "pattern"; // pattern analysis
	public static final String VERBOSE = "verbose"; // verbose option
	public static final String ENABLEASSERTION = "ea"; // Enable assertion check
	public static final String DISABLEASSERTION = "da"; // Disable assertion check
	public static final String NOCOPY = "nocopy"; // copy analysis
	public static final String DEALLOC = "dealloc"; // deallocation analysis
	public static final String CODE = "code"; // code generator

	public Configuration() {
		// Initial properties based on default properties
		this.options = new Properties();
		// Analysis the bound 
		this.options.put(BOUND, DISABLED);
		// Breath-first or Depth-first tree traversal
		this.options.put(TRAVERSAL, "DF"); 
		// Pattern matching option
		this.options.put(PATTERN, DISABLED);
		// Verbose option
		this.options.put(VERBOSE, DISABLED);
		// Code generator options
		this.options.put(ENABLEASSERTION, DISABLED); // Disable assertion by default
		this.options.put(NOCOPY, DISABLED);
		this.options.put(DEALLOC, DISABLED);
		this.options.put(CODE, DISABLED);
		
	}

	/**
	 * Check if the 'verbose' option is enabled/disabled.
	 * 
	 * @return
	 */
	public boolean isVerbose() {
		return (this.options.get(VERBOSE).equals(DISABLED))? false: true;
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
			// Skip the options and do nothing
			return;	
		}
		
		switch(option){
			case MODULE:
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
				break;
			case BOUND:
				// Enable the bound analysis and set the gradual widen strategy
				this.options.put(option, value.toString());
				break;
			case PATTERN:
				// Enable the pattern matcher
				// Set the function name, that is applied with pattern analysis
				this.options.put(option, value.toString()); 
				break;
			case TRAVERSAL:
				this.options.put(option, value.toString());
				break;
			case ENABLEASSERTION:
				this.options.put(ENABLEASSERTION, ENABLED);
				break;
			case DISABLEASSERTION:
				this.options.put(ENABLEASSERTION, DISABLED);
				break;
			default:
				//throw new RuntimeException("Not implemented");
				// Enabled all the other options
				this.options.put(option, ENABLED);
				break;
		}
	}

	/**
	 * Check if the given option is enabled or not
	 * 
	 * @return the mode. If no mode is set, return null.
	 */
	public boolean isEnabled(String option) {
		Object object = this.options.get(option);
		if(object instanceof String){
			String op =(String)object;
			if(op.equals(DISABLED)){
				return false;
			}
		}
		return true;
	}

	/**
	 * Return the value of an option 
	 * 
	 * 
	 * @param name
	 * @return
	 */
	public String getOption(String name){
		return (String)this.options.get(name);
	}
	
	/**
	 * Get the function name that will be applied with 
	 * pattern matching.
	 * 
	 * @return
	 */
	public String getFunctionName(){
		return (String)this.options.get(PATTERN);
	}
}
