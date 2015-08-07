package wyopcl.translator;
/**
 * Analyze the alias in the WyIL code to find all the necessary array copies and eliminate un-necessary 
 * copies.
 * 
 * @author Min-Hsien Weng
 *
 */
public class AliasAnalyzer {
	private final String prefix = "%";
	private Configuration config;
	
	private static AliasAnalyzer instance = new AliasAnalyzer();
	/**
	 * Basic Constructor
	 */
	public AliasAnalyzer(){
		
	}
	
	public static AliasAnalyzer getInstance(){
		return instance;
	}
	
	
	
}
