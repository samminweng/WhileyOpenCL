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

package wyil.util.dfa;

import static wycc.lang.SyntaxError.internalFailure;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import wycc.lang.SyntaxError;
import wycc.lang.Transform;
import wycc.util.Pair;
import wyfs.lang.Path;
import wyil.lang.*;
import wyil.lang.Code.Block.Entry;
import wyil.util.*;

public abstract class BackwardFlowAnalysis<T> {
	protected String filename;
	protected Code.Block block;
	protected WyilFile.FunctionOrMethodDeclaration method;
	protected WyilFile.Case methodCase;
	protected HashMap<String,T> stores;
	
	public void apply(WyilFile module) {	
		filename = module.filename();
		
		for(WyilFile.Block d : module.blocks()) {
			if(d instanceof WyilFile.ConstantDeclaration) {
				WyilFile.ConstantDeclaration cd = (WyilFile.ConstantDeclaration) d; 
				module.replace(cd,propagate((cd)));
			} else if(d instanceof WyilFile.TypeDeclaration) {
				WyilFile.TypeDeclaration td = (WyilFile.TypeDeclaration) d;
				module.replace(td,propagate(td));	
			} else if(d instanceof WyilFile.FunctionOrMethodDeclaration) {
				WyilFile.FunctionOrMethodDeclaration md = (WyilFile.FunctionOrMethodDeclaration) d;
				if(!md.hasModifier(Modifier.NATIVE)) {
					// native functions/methods don't have bodies
					module.replace(md,propagate(md));
				}
			}
		}				
	}
	
	protected WyilFile.ConstantDeclaration propagate(WyilFile.ConstantDeclaration constant) {
		return constant;
	}
	protected WyilFile.TypeDeclaration propagate(WyilFile.TypeDeclaration type) {
		return type;
	}
	
	protected WyilFile.FunctionOrMethodDeclaration propagate(WyilFile.FunctionOrMethodDeclaration method) {
		this.method = method;
		ArrayList<WyilFile.Case> cases = new ArrayList<WyilFile.Case>();
		for (WyilFile.Case c : method.cases()) {
			cases.add(propagate(c));
		}
		return new WyilFile.FunctionOrMethodDeclaration(method.modifiers(), method.name(), method.type(), cases);
	}
	
	protected WyilFile.Case propagate(WyilFile.Case mcase) {
		this.methodCase = mcase;
		this.stores = new HashMap<String,T>();
		this.block = mcase.body();
		T last = lastStore();						
		propagate(0, mcase.body().size(), last, Collections.EMPTY_LIST);		
		return mcase;
	}		
	
	protected T propagate(int start, int end, T store, List<Pair<Type,String>> handlers) {
		
		for(int i=end-1;i>=start;--i) {						
			Entry stmt = block.get(i);						
			try {				
				Code code = stmt.code;
				
				// First, check for a label which may have incoming information.
				if (code instanceof Codes.LoopEnd) {					
					Codes.Loop loop = null;
					String label = ((Codes.LoopEnd) code).label;
					// first, save the store since it might be needed for break
					// statements.
					stores.put(label,store);
					// now, identify the loop body.
					int loopEnd = i;
					while (--i >= 0) {						
						stmt = block.get(i);
						if (stmt.code instanceof Codes.Loop) {
							loop = (Codes.Loop) stmt.code;
							if (label.equals(loop.target)) {
								// start of loop body found
								break;
							}
						}						
					}			
					
					store = propagate(i, loopEnd, loop, stmt, store, handlers);															
					continue;
				} else if (code instanceof Codes.TryEnd) {					
					Codes.TryCatch tc = null;
					String label = ((Codes.TryEnd) code).label;
					stores.put(label,store);
					// now, identify the try-catch body.
					int tcEnd = i;
					while (--i >= 0) {						
						stmt = block.get(i);
						if (stmt.code instanceof Codes.TryCatch) {
							tc = (Codes.TryCatch) stmt.code;
							if (label.equals(tc.target)) {
								// start of loop body found
								break;
							}
						}						
					}			
					ArrayList<Pair<Type, String>> nhandlers = new ArrayList<Pair<Type, String>>(
							handlers);
					nhandlers.addAll(0, tc.catches);					
					store = propagate(i+1, tcEnd, store, nhandlers);															
					continue;
				} else if (code instanceof Codes.Label) {
					Codes.Label l = (Codes.Label) code;
					stores.put(l.label,store);
				} else if (code instanceof Codes.If) {
					Codes.If ifgoto = (Codes.If) code;
					T trueStore = stores.get(ifgoto.target);					
					store = propagate(i, ifgoto, stmt, trueStore,store);										
				} else if (code instanceof Codes.IfIs) {
					Codes.IfIs iftype = (Codes.IfIs) code;
					T trueStore = stores.get(iftype.target);					
					store = propagate(i, iftype, stmt, trueStore,store);										
				} else if (code instanceof Codes.Switch) {
					Codes.Switch sw = (Codes.Switch) code;
					
					ArrayList<T> swStores = new ArrayList<T>();
					for(int j=0;j!=sw.branches.size();++j){
						String target = sw.branches.get(j).second();
						swStores.add(stores.get(target));
					}
					T defStore = stores.get(sw.defaultTarget);
					
					store = propagate(i, sw, stmt, swStores, defStore);																				
				} else if (code instanceof Codes.Goto) {
					Codes.Goto gto = (Codes.Goto) stmt.code;
					store = stores.get(gto.target);					
				} else {
					// This indicates a sequential statement was encountered.
					if (code instanceof Codes.Return
						|| code instanceof Codes.Throw) {
						store = lastStore();
					}
					store = propagate(i, stmt, store);									
				}
				
				store = mergeHandlers(i,code,store,handlers,stores);
			} catch (SyntaxError se) {
				throw se;
			} catch (Throwable ex) {
				internalFailure("internal failure", filename, stmt, ex);
			}
		}
		
		return store;
	}

	protected T mergeHandlers(int index, Code code, T store, List<Pair<Type, String>> handlers,
			Map<String, T> stores) {
		if(code instanceof Codes.Throw) {
			Codes.Throw t = (Codes.Throw) code;	
			return mergeHandler(t.type,store,handlers,stores);
		} else if(code instanceof Codes.IndirectInvoke) {
			Codes.IndirectInvoke i = (Codes.IndirectInvoke) code;			
			return mergeHandler(i.type().throwsClause(),store,handlers,stores);
		} else if(code instanceof Codes.Invoke) {
			Codes.Invoke i = (Codes.Invoke) code;	
			return mergeHandler(i.type().throwsClause(),store,handlers,stores);
		} 
		return store;
	}
	
	protected T mergeHandler(Type type, T store, List<Pair<Type, String>> handlers,
			Map<String, T> stores) {
		for(Pair<Type,String> p : handlers) {
			Type handler = p.first();			
			T exceptionStore = stores.get(p.second());
			if(exceptionStore == null) {
				continue;
			} else if(Type.isSubtype(handler,type)) {
				return propagate(handler,store,exceptionStore);				
			} else if(Type.isSubtype(type, handler)) {
				store = propagate(handler,store,exceptionStore);				
				// not completely subsumed
				type = Type.intersect(type,Type.Negation(handler));
			} 
		}
		
		return store;
	}
	
	/**
	 * <p>
	 * Propagate back from a conditional branch. This produces a potentially
	 * updated store representing the state before the branch. The method
	 * accepts two stores --- one originating from the true branch, and the
	 * other from the false branch.
	 * </p>
	 * 
	 * @param index
	 *            --- the index of this bytecode in the method's block
	 * @param ifgoto
	 *            --- the code of this statement
	 * @param stmt
	 *            --- this statement
	 * @param trueStore
	 *            --- abstract store which holds true immediately after this
	 *            statement on the true branch.
	 * @param falseStore
	 *            --- abstract store which holds true immediately after this
	 *            statement on the false branch.
	 * @return
	 */
	protected abstract T propagate(int index, Codes.If ifgoto, Entry stmt,
			T trueStore, T falseStore);

	/**
	 * <p>
	 * Propagate back from a type test. This produces a store representing the
	 * state before the branch. The method accepts two stores --- one
	 * originating from the true branch, and the other from the false branch.
	 * </p>
	 * 
	 * @param index
	 *            --- the index of this bytecode in the method's block
	 * @param iftype
	 *            --- the code of this statement
	 * @param stmt
	 *            --- this statement
	 * @param trueStore
	 *            --- abstract store which holds true immediately after this
	 *            statement on the true branch.
	 * @param falseStore
	 *            --- abstract store which holds true immediately after this
	 *            statement on the false branch.
	 * @return
	 */
	protected abstract T propagate(int index, Codes.IfIs iftype, Entry stmt,
			T trueStore, T falseStore);

	/**
	 * <p>
	 * Propagate back from a multi-way branch. This accepts multiple stores ---
	 * one for each of the various branches.
	 * </p>
	 * 
	 * @param index
	 *            --- the index of this bytecode in the method's block
	 * @param sw
	 *            --- the code of this statement
	 * @param entry
	 *            --- block entry for this bytecode
	 * @param stores
	 *            --- abstract stores coming from the various branches.
	 *            statement.
	 * @param defStore
	 *            --- abstract store coming from default branch
	 * @return
	 */
	protected abstract T propagate(int index, Codes.Switch sw, Entry entry,
			List<T> stores, T defStore);

	/**
	 * <p>
	 * Propagate back from a loop statement, producing a store which holds true
	 * immediately before the statement
	 * </p>
	 * 
	 * @param index
	 *            --- the index of this bytecode in the method's block
	 * @param loop
	 *            --- the code of the block
	 * @param body
	 *            --- the body of the block
	 * @param stmt
	 *            --- the statement being propagated through
	 * @param store
	 *            --- abstract store which holds true immediately before this
	 *            statement.
	 * @return
	 */
	protected abstract T propagate(int start, int end, Codes.Loop code, Entry stmt,
			T store, List<Pair<Type,String>> handlers);

	/**
	 * <p>
	 * Propagate back from a sequential statement, producing a store which holds
	 * true immediately after the statement
	 * </p>
	 * 
	 * @param index
	 *            --- the index of this bytecode in the method's block
	 * @param stmt
	 *            --- the statement being propagated through
	 * @param store
	 *            --- abstract store which holds true immediately before this
	 *            statement.
	 * @return
	 */
	protected abstract T propagate(int index, Entry stmt, T store);

	/**
	 * Propagate from an exception handler.
	 * 
	 * @param handler
	 *            --- type of handler catching exception
	 * @param normalStore
	 *            --- store from non-exception flow
	 * @param exceptionStore
	 *            --- store from exception flow
	 * @return
	 */
	protected abstract T propagate(Type handler, T normalStore, T exceptionStore);
	
	/**
	 * Generate the store which holds true immediately after the last statement
	 * of the method-case body.  By default, this is null and the first return
	 * statement encountered during the backwards propagation initialises things.
	 * 
	 * @return
	 */
	protected T lastStore() {
		return null;
	}	
}
