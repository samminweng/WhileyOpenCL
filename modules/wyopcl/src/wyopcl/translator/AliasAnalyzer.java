package wyopcl.translator;

import java.util.Iterator;
import java.util.List;

import wybs.lang.Builder;
import wyil.attributes.VariableDeclarations;
import wyil.attributes.VariableDeclarations.Declaration;
import wyil.lang.Code;
import wyil.lang.CodeBlock;
import wyil.lang.WyilFile;
import wyil.lang.WyilFile.FunctionOrMethod;
import wyil.transforms.LiveVariablesAnalysis;
import wyil.transforms.LiveVariablesAnalysis.Env;

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
	private LiveVariablesAnalysis liveAnalyzer;
	
	/**
	 * Basic Constructor
	 */
	public AliasAnalyzer(Builder builder){
		liveAnalyzer = new LiveVariablesAnalysis(builder);
	}

	/**
	 * Print out each function of the WyIL file.
	 * @param module
	 */
	private void printBytecode(FunctionOrMethod func){		
			int line = 0;
			String name = func.name();
			Iterator<Code> iterator = func.body().iterator();
			while(iterator.hasNext()){
				Code code = iterator.next();
				line = TranslatorHelper.printWyILCode(code, name, line);
			}
	}
	/**
	 * Output the live variables
	 * @param env
	 * @return
	 */
	private String getLiveVars(Env env, FunctionOrMethod func){
		VariableDeclarations vars = func.attribute(VariableDeclarations.class);		
		
		String str ="";
		Boolean isFirst = true;
		Iterator<Integer> iterator = env.iterator();
		while(iterator.hasNext()){
			int register = iterator.next();
			if(!isFirst){
				str += ", ";
			}else{
				isFirst = false;
			}
			
			//Get the variable name from register
			String var_name = vars.get(register).name();
			if(var_name==null){
				//If it is a temporary variable at byte-code, then print out the register 
				var_name = "%"+ register;
			}
			
			str += var_name;
						
		}
		return str;
	}
	
	
	
	/**
	 * Applies the live analysis of Whiley compiler on each function, and display the transformed bytecode
	 * @param module
	 */
	public void applyLiveAnalysis(WyilFile module){
		liveAnalyzer.setEnable(true);		
		liveAnalyzer.setNops(true);
		
		for(FunctionOrMethod func: module.functionOrMethods()){
			Env env = new Env();
			System.out.println("=== Before live analysis for "+func.name() +" function. ===");
			List<Code> codes = func.body().bytecodes(); 
			for(int i=codes.size()-1; i>0; i--){
				Code code = codes.get(i);
				CodeBlock.Index id = new CodeBlock.Index(null,i);
				System.out.println("In["+i+"]"+":{"+getLiveVars(env, func)+"}");
				env = liveAnalyzer.propagate(id, code, env);
				System.out.println(i+":{"+code+"}\nOut["+i+"]:{"+getLiveVars(env, func)+"}\n");
			}
			env = null;
			System.out.println("=== After live analysis for "+func.name()+ " function. ===");
		}
		
		
		
	}
	
	
	
		
	
}
