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
import wyopcl.translator.bound.BasicBlock;
import wyopcl.translator.bound.CFGraph;

/**
 * Analyze the alias in the WyIL code to find all the necessary array copies and
 * eliminate un-necessary copies.
 * 
 * @author Min-Hsien Weng
 *
 */
public class AliasAnalyzer {
	private final String prefix = "%";
	private Configuration config;
	private int line;
	private LiveVariablesAnalysis liveAnalyzer;

	/**
	 * Basic Constructor
	 */
	public AliasAnalyzer(Builder builder, Configuration config) {
		liveAnalyzer = new LiveVariablesAnalysis(builder);
		liveAnalyzer.setEnable(true);
		liveAnalyzer.setNops(true);
		this.config = config;
	}

	/**
	 * Output the live variables, that are stored in In/Out set.
	 * 
	 * @param env
	 *            In/Out set of live variables
	 * @param vars
	 *            the hash map, which maps register to the variable name.
	 * @return
	 */
	private String getLiveVars(Env env, VariableDeclarations vars) {
		String str = "";
		Boolean isFirst = true;
		Iterator<Integer> iterator = env.iterator();
		while (iterator.hasNext()) {
			int register = iterator.next();
			if (!isFirst) {
				str += ", ";
			} else {
				isFirst = false;
			}
			// Get the variable name from register
			String var_name = vars.get(register).name();
			if (var_name == null) {
				// If it is a temporary variable at byte-code, then print out
				// the register
				var_name = "%" + register;
			}
			str += var_name;
		}
		return str;
	}

	/**
	 * Applies the live analysis of Whiley compiler on each line of code for a
	 * function, and display the transformed bytecode
	 * 
	 * @param module
	 */
	private void applyLiveAnalysisOnEachCode(String name, VariableDeclarations vars, BasicBlock block) {
		List<Code> codes = block.getCodes();
		Env env = new Env();		
		for (int i = codes.size() - 1; i > 0; i--) {
			Code code = codes.get(i);
			// Construct an Index object.
			CodeBlock.Index id = new CodeBlock.Index(null, i);
			System.out.println("In[" + i + "]" + ":{" + getLiveVars(env, vars) + "}");
			env = liveAnalyzer.propagate(id, code, env);
			System.out.println(i + ":{" + code + "}\nOut[" + i + "]:{" + getLiveVars(env, vars) + "}\n");
		}
		env = null;
	}

	public void applyLiveAnalysis(WyilFile module) {
		// Iterate each function to build up CFG
		for (FunctionOrMethod func : module.functionOrMethods()) {
			line = 0;
			VariableDeclarations vars = func.attribute(VariableDeclarations.class);
			String name = func.name();
			System.out.println("=== Before live analysis for " + name + " function. ===");
			iterateBytecode(func.name(), func.body().bytecodes());
			//Print out each basic block.
			CFGraph graph = AnalyzerHelper.getCFGraph(name);
			if(config.isVerbose()){
				//Print out CFGraph
				AnalyzerHelper.printCFG(config, name);
			}

			for(BasicBlock blk : graph.getBlockList()){
				applyLiveAnalysisOnEachCode(name, vars, blk);
			}
			System.out.println("=== After live analysis for " + name + " function. ===");
		}
	}

	/**
	 * Iterate each byte-code to build up CFG.
	 * 
	 * @param name
	 * @param code_blk
	 */
	private void iterateBytecode(String name, List<Code> code_blk) {
		// Parse each byte-code and add the constraints accordingly.
		for (Code code : code_blk) {
			if (config.isVerbose()) {
				// Get the Block.Entry and print out each byte-code
				line = TranslatorHelper.printWyILCode(code, name, line);
			}
			AnalyzerHelper.addByteCodeToBlock(name, code);
		}

	}

}
