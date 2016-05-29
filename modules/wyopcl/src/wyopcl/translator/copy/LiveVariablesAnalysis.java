package wyopcl.translator.copy;

// Copyright (c) 2011, David J. Pearce (djp@ecs.vuw.ac.nz)
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//    * Redistributions of source code must retain the above copyright
//      notice, this list of conditions and the following disclaimer.
//    * Redistributions in binary form must reproduce the above copyright
//      notice, this list of conditions and the following disclaimer in the
//      documentation and/or other materials provided with the distribution.
//    * Neither the name of the <organization> nor the
//      names of its contributors may be used to endorse or promote products
//      derived from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL DAVID J. PEARCE BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

import java.util.*;

import static wycc.lang.SyntaxError.*;
import static wyil.util.ErrorMessages.*;
import wybs.lang.Builder;
import wycc.lang.Transform;
import wycc.util.Pair;
import wyfs.lang.Path;
import wyil.lang.WyilFile;
import wyil.lang.Bytecode;
import wyil.lang.BytecodeForest;
import wyil.lang.BytecodeForest.Block;
import wyil.lang.BytecodeForest.Index;
import wyil.lang.Bytecode.If;
import wyil.lang.Bytecode.IfIs;
import wyil.lang.Bytecode.IndirectInvoke;
import wyil.lang.Bytecode.Invoke;
import wyil.lang.Bytecode.Loop;
import wyil.lang.Bytecode.Quantify;
import wyil.lang.Bytecode.Switch;
import wyil.lang.Bytecode.Update;
import wyil.lang.Type;
//import wyil.util.AttributedCodeBlock;
import wyil.util.dfa.*;

/**
 * <p>
 * Implements a classic live variables analysis to enable efficient reference counting. Compound structures in Whiley
 * (e.g. lists, sets, records, etc) are <i>reference counted</i>. This means we count the number of aliases to them in
 * the heap and on the stack. Then, when a compound structure is updated, we can perform an <i>inplace update</i> if the
 * reference count is 1; otherwise, we have to clone the structure. Cloning is potentially expensive, and we want to
 * avoid it as much as possible. Therefore, as soon as a variable is no longer live, we should decrement its reference
 * count. This is signalled using the special <code>void</code> bytecode which, literally, "voids" a given register
 * thereby allowing us to release it.
 * </p>
 * <p>
 * The purpose of this class is to determine when a variable is live, and when it is not. The live variables analysis
 * operates as a backwards analysis, propagating information from variable uses (i.e. <code>load</code> bytecodes) back
 * to their definitions (i.e. <code>store</code> bytecodes). For more information on Live Variables Analysis, see
 * <a href="http://en.wikipedia.org/wiki/Live_variable_analysis">the Wikipedia page</a>.
 * </p>
 *
 * @author David J. Pearce, 2011
 *
 */
public class LiveVariablesAnalysis extends BackwardFlowAnalysis<LiveVariablesAnalysis.Env>
		implements Transform<WyilFile> {
	private static final HashMap<BytecodeForest.Index, Bytecode> rewrites = new HashMap<BytecodeForest.Index, Bytecode>();

	/**
	 * Determines whether constant propagation is enabled or not.
	 */
	private boolean enabled = getEnable();

	public LiveVariablesAnalysis(Builder builder) {

	}

	@Override
	public void apply(WyilFile module) {
		if (enabled) {
			super.apply(module);
		}
	}

	public static String describeEnable() {
		return "Enable/disable live variables analysis";
	}

	public static boolean getEnable() {
		return true; // default value
	}

	public void setEnable(boolean flag) {
		this.enabled = flag;
	}

	

	/**
	 * Last store for the live variables analysis is empty, because all variables are considered to be dead at the end
	 * of a method/function.
	 *
	 * @return
	 */
	@Override
	public Env lastStore() {
		return EMPTY_ENV;
	}

	@Override
	public Env propagate(BytecodeForest.Index index, Bytecode code, Env environment) {
		rewrites.put(index, null);
		boolean isLive = true;
		environment = (Env) environment.clone();

		if (code instanceof Update) {
			Update cu = (Update) code;
			// In the normal case, this bytecode is considered live if the
			// assigned register is live. However, in the case of an
			// indirect assignment, then it is always considered live.
			if (!(cu.type(0) instanceof Type.Reference)) {
				// No, this is not an indirect assignment through a
				// reference
				isLive = environment.contains(cu.target(0));
			}
		} else {
			for (int target : code.targets()) {
				isLive = environment.remove(target);
			}
		}

		if (isLive || (code instanceof Invoke && ((Invoke) code).type(0) instanceof Type.Method)
				|| (code instanceof IndirectInvoke && ((IndirectInvoke) code).type(0) instanceof Type.Method)) {
			// FIXME: this seems to be a problem if there are no assigned variables!
			for (int operand : code.operands()) {
				environment.add(operand);
			}
		} else {
			// const
		}

		return environment;
	}

	@Override
	public Env propagate(BytecodeForest.Index index, If code, Env trueEnv, Env falseEnv) {
		Env r = join(trueEnv, falseEnv);

		r.add(code.operand(0));
		r.add(code.operand(1));

		return r;
	}

	@Override
	protected Env propagate(Type handler, Env normalEnv, Env exceptionEnv) {
		return join(normalEnv, exceptionEnv);
	}

	@Override
	public Env propagate(BytecodeForest.Index index, IfIs code, Env trueEnv, Env falseEnv) {
		Env r = join(trueEnv, falseEnv);

		r.add(code.operand(0));

		return r;
	}

	@Override
	public Env propagate(BytecodeForest.Index index, Switch code, List<Env> environments, Env defEnv) {
		Env environment = defEnv;

		for (int i = 0; i != code.branches().size(); ++i) {
			environment = join(environment, environments.get(i));
		}

		environment.add(code.operand(0));

		return environment;
	}

	public Env propagate(BytecodeForest.Index index, Loop loop, Env environment, List<Pair<Type, String>> handlers) {
		rewrites.put(index, null); // to overrule any earlier rewrites

		Env oldEnv = null;
		Env newEnv = null;

		if (loop instanceof Quantify) {
			Quantify fall = (Quantify) loop;
			environment = new Env(environment);
			environment.add(fall.startOperand());
			environment.add(fall.endOperand());
		} else {
			environment = EMPTY_ENV;
		}

		do {
			// iterate until a fixed point reached
			oldEnv = newEnv != null ? newEnv : environment;
			newEnv = propagate(index.block(), oldEnv, handlers);
			newEnv = join(environment, newEnv);
		} while (!newEnv.equals(oldEnv));

		environment = newEnv;

		// Now, check whether any of the modified operands are no longer live.
		int nInvalidatedOperands = 0;
		for (int mo : loop.operands()) {
			if (!environment.contains(mo)) {
				nInvalidatedOperands++;
			}
		}
		if (nInvalidatedOperands > 0) {
			// ok, yes, at least one is not live
			int[] nModifiedOperands = new int[loop.operands().length - nInvalidatedOperands];
			int j = 0;
			for (int mo : loop.operands()) {
				if (environment.contains(mo)) {
					nModifiedOperands[j++] = mo;
				}
			}
		}

		return environment;
	}

	private Env propagate(Index index, Block block, Env oldEnv, List<Pair<Type, String>> handlers) {
		// TODO Auto-generated method stub
		return null;
	}

	private Env join(Env env1, Env env2) {
		// implements set union
		Env r = new Env(env1);
		r.addAll(env2);
		return r;
	}

	private static final Env EMPTY_ENV = new Env();

	public static final class Env extends HashSet<Integer> {
		public Env() {
			super();
		}

		public Env(Env env) {
			super(env);
		}

	}
}
