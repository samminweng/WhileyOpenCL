package wyopcl.translator;

import java.math.BigInteger;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

import wybs.lang.Builder;
import wyil.attributes.VariableDeclarations;
import wyil.attributes.VariableDeclarations.Declaration;
import wyil.lang.Code;
import wyil.lang.CodeBlock;
import wyil.lang.Type;
import wyil.lang.Codes.Assign;
import wyil.lang.Codes.Assume;
import wyil.lang.Codes.BinaryOperator;
import wyil.lang.Codes.Const;
import wyil.lang.Codes.Convert;
import wyil.lang.Codes.Fail;
import wyil.lang.Codes.FieldLoad;
import wyil.lang.Codes.Goto;
import wyil.lang.Codes.If;
import wyil.lang.Codes.IndexOf;
import wyil.lang.Codes.Invariant;
import wyil.lang.Codes.Invoke;
import wyil.lang.Codes.Label;
import wyil.lang.Codes.LengthOf;
import wyil.lang.Codes.ListOperator;
import wyil.lang.Codes.Loop;
import wyil.lang.Codes.NewList;
import wyil.lang.Codes.NewTuple;
import wyil.lang.Codes.Return;
import wyil.lang.Codes.SubList;
import wyil.lang.Codes.TupleLoad;
import wyil.lang.Codes.UnaryOperator;
import wyil.lang.Codes.Update;
import wyil.lang.WyilFile;
import wyil.lang.WyilFile.FunctionOrMethod;
import wyil.transforms.LiveVariablesAnalysis;
import wyil.transforms.LiveVariablesAnalysis.Env;
import wyopcl.translator.bound.BasicBlock;
import wyopcl.translator.bound.CFGraph;
import wyopcl.translator.bound.BasicBlock.BlockType;

/**
 * Analyze the alias in the WyIL code to find all the necessary array copies and
 * eliminate un-necessary copies.
 * 
 * @author Min-Hsien Weng
 *
 */
public class AliasAnalyzer extends Analyzer {
	private final String prefix = "%";

	private LiveVariablesAnalysis liveAnalyzer;
	private Analyzer analyer;


	/**
	 * Basic Constructor
	 */
	public AliasAnalyzer(Builder builder, Configuration config) {
		super(config);
		this.liveAnalyzer = new LiveVariablesAnalysis(builder);
		this.liveAnalyzer.setEnable(true);
		this.liveAnalyzer.setNops(true);		
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
	 * Apply live variable analysis on each block and display in/out set.
	 * 
	 * @param module
	 */
	private void applyLiveAnalysisOnBlock(VariableDeclarations vars, BasicBlock block) {


		List<Code> codes = block.getCodes();
		Env env = new Env();
		System.out.println("In" + "={" + getLiveVars(env, vars) + "}");
		for (int i = codes.size() - 1; i >= 0; i--) {
			Code code = codes.get(i);
			// Construct an Index object.
			CodeBlock.Index id = new CodeBlock.Index(null, i);
			Env out = (Env) env.clone();
			env = liveAnalyzer.propagate(id, code, env);
			if(config.isVerbose()){
				System.out.println("In[" + i + "]" + "={" + getLiveVars(env, vars) + "}\n"
						+ "L."+i+" = "+ code + "\n"
						+"Out[" + i + "]:{" + getLiveVars(out, vars) + "}\n");
			}
			out = null;			
		}
		System.out.println(block + "Out" + ":{" + getLiveVars(env, vars) + "}\n");

		env = null;
	}

	/**
	 * Apply live variable analysis on each basic block.
	 * @param module
	 */
	public void applyLiveAnalysis(WyilFile module) {
		// Iterate each function to build up CFG
		for (FunctionOrMethod function : module.functionOrMethods()) {
			String name = function.name();
			System.out.println("=== Before live analysis for " + name + " function. ===");
			//Build CFG for function.
			CFGraph graph = buildCFG(function);
			if(config.isVerbose()){
				//Print out CFGraph.
				this.printCFG(function);
			}


			//Get the blocks.
			for(BasicBlock block: graph.getBlockList()){
				//Perform live variable analysis on each block.
				//Get variable declaration.
				applyLiveAnalysisOnBlock(function.attribute(VariableDeclarations.class), block);
			}			
			System.out.println("=== After live analysis for " + name + " function. ===");
		}
	}




}
