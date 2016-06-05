package wyopcl.translator.copy;

import java.util.HashSet;
import java.util.List;

import wybs.lang.Builder;
import wycc.util.Pair;
import wyil.lang.Code;
import wyil.lang.CodeBlock;
import wyil.lang.CodeBlock.Index;
import wyil.lang.Codes;
import wyil.lang.Codes.If;
import wyil.lang.Codes.IfIs;
import wyil.lang.Codes.Loop;
import wyil.lang.Codes.Switch;
import wyil.lang.Type;
import wyil.util.dfa.BackwardFlowAnalysis;
/**
 * <p>
 * Implements a classic live variables analysis to enable efficient reference
 * counting. Compound structures in Whiley (e.g. lists, sets, records, etc) are
 * <i>reference counted</i>. This means we count the number of aliases to them
 * in the heap and on the stack. Then, when a compound structure is updated, we
 * can perform an <i>inplace update</i> if the reference count is 1; otherwise,
 * we have to clone the structure. Cloning is potentially expensive, and we want
 * to avoid it as much as possible. Therefore, as soon as a variable is no
 * longer live, we should decrement its reference count. This is signalled using
 * the special <code>void</code> bytecode which, literally, "voids" a given
 * register thereby allowing us to release it.
 * </p>
 * <p>
 * The purpose of this class is to determine when a variable is live, and when
 * it is not. The live variables analysis operates as a backwards analysis,
 * propagating information from variable uses (i.e. <code>load</code> bytecodes)
 * back to their definitions (i.e. <code>store</code> bytecodes). For more
 * information on Live Variables Analysis, see <a
 * href="http://en.wikipedia.org/wiki/Live_variable_analysis">the Wikipedia
 * page</a>.
 * </p>
 *
 * @author David J. Pearce, 2011
 *
 */
public class LiveVariablesAnalysis extends BackwardFlowAnalysis<HashSet<Integer>>{

	public LiveVariablesAnalysis(Builder builder) {

	}
	
	@Override
	public HashSet<Integer> propagate(CodeBlock.Index index, Code code, HashSet<Integer> environment) {
		//rewrites.put(index,null);
		boolean isLive = true;
		environment = (HashSet<Integer>) environment.clone();

		if (code instanceof Code.AbstractBytecode) {
			Code.AbstractBytecode aa = (Code.AbstractBytecode) code;
			if(code instanceof Codes.Update) {
				Codes.Update cu = (Codes.Update) aa;
				// In the normal case, this bytecode is considered live if the
				// assigned register is live. However, in the case of an
				// indirect assignment, then it is always considered live.
				if(!(cu.type(0) instanceof Type.Reference)) {
					// No, this is not an indirect assignment through a
					// reference
					isLive = environment.contains(cu.target(0));
				}
			} else {
				for(int target : aa.targets()) {
					isLive = environment.remove(target);
				}
			}
		}

		if ((isLive && code instanceof Code.AbstractBytecode)
				|| (code instanceof Codes.Invoke && ((Codes.Invoke) code).type(0) instanceof Type.Method)
				|| (code instanceof Codes.IndirectInvoke
						&& ((Codes.IndirectInvoke) code).type(0) instanceof Type.Method)) {
			// FIXME: this seems to be a problem if there are no assigned variables!
			Code.AbstractBytecode c = (Code.AbstractBytecode) code;
			for (int operand : c.operands()) {
				environment.add(operand);
			}
		} else if(!isLive) {
			//rewrites.put(index, Codes.Nop);
		} else {
			// const
		}

		return environment;
	}

	@Override
	protected HashSet<Integer> propagate(Index index, If ifgoto, HashSet<Integer> trueStore,
			HashSet<Integer> falseStore) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected HashSet<Integer> propagate(Index index, IfIs iftype, HashSet<Integer> trueStore,
			HashSet<Integer> falseStore) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected HashSet<Integer> propagate(Index index, Switch sw, List<HashSet<Integer>> stores,
			HashSet<Integer> defStore) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected HashSet<Integer> propagate(Index index, Loop code, HashSet<Integer> store,
			List<Pair<Type, String>> handlers) {
		// TODO Auto-generated method stub
		return null;
	}

	

	@Override
	protected HashSet<Integer> propagate(Type handler, HashSet<Integer> normalStore, HashSet<Integer> exceptionStore) {
		// TODO Auto-generated method stub
		return null;
	}

}
