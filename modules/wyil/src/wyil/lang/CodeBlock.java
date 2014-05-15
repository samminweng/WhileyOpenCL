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

package wyil.lang;

import java.util.*;

import wycc.lang.Attribute;
import wycc.lang.SyntacticElement;
import wycc.util.Pair;
import wyil.util.*;

/**
 * <p>
 * Represents a complete sequence of bytecode instructions. For example, every
 * method body is a single Block. Likewise, the constraint for a give type is a
 * Block. Finally, a Block permits attributes to be attached to every bytecode
 * it contains. An example attribute is one for holding the location of the
 * source code which generated the bytecode.
 * </p>
 * 
 * <p>
 * Every Block has a number of dedicated set input variables, and an arbitrary
 * number of additional temporary variables. Each variable is allocated to a
 * slot number, starting from zero and with all inputs coming first. Slot zero
 * is reserved for the special variable "$". Likewise, slot one is reserved for
 * the special variable this for blocks which require it. For example, the body
 * of a normal method requires a receiver, whilst functions or headless methods
 * don't.
 * </p>
 * 
 * <p>
 * The main operations on a block are <i>append</i> and <i>append</i>. The
 * former is used in the process of constructing a block. In such case,
 * bytecodes are appended on to the block assuming an identical slot allocation
 * (called the <i>environment</i>). There are two considerations when importing
 * one block into another:
 * </p>
 * 
 * <ul>
 * <li>Firstly, we cannot assume identical slot allocations. For example, the
 * block representing a constraint on some type might have a single input mapped
 * to slot zero, and a temporary mapped to slot one. When this block is imported
 * into the pre-condition of some function, a collision would occur if e.g. that
 * function has multiple parameters. This is because the second parameter would
 * be mapped to the same register as the temporary in the constraint. We have to
 * <i>shift</i> the slot number of that temporary variable up in order to avoid
 * this collision.</li>
 * <li>
 * Secondly, we cannot all labels are distinct across both blocks. In otherwise,
 * both blocks may contain two identical labels. In such case, we need to
 * relabel one of the blocks in order to avoid this collision.</li>
 * </ul>
 * </p>
 * 
 * @author David J. Pearce
 * 
 */
public final class CodeBlock implements Iterable<CodeBlock.Entry> {
	private final ArrayList<Entry> stmts;
	private final int numInputs;
			
	public CodeBlock(int numInputs) {
		this.stmts = new ArrayList<Entry>();
		this.numInputs = numInputs;
	}
	
	public CodeBlock(int numInputs, Collection<Entry> stmts) {
		this.stmts = new ArrayList<Entry>();
		for(Entry s : stmts) {
			append(s.code,s.attributes());
		}
		this.numInputs = numInputs;
	}

	// ===================================================================
	// Accessor Methods
	// ===================================================================

	/**
	 * Return the number of bytecodes in this block.
	 */
	public int size() {
		return stmts.size();
	}

	/**
	 * Return the number of input variables for this block.
	 * 
	 * @return
	 */
	public int numInputs() {
		return numInputs;
	}
	
	/**
	 * Determine the number of slots used in this block.
	 * 
	 * @return
	 */
	public int numSlots() {		
		HashSet<Integer> slots = new HashSet<Integer>();
		for(Entry s : stmts) {
			s.code.registers(slots);
		}
		int r = 0;
		for(int i : slots) {
			r = Math.max(r,i+1);
		}		
		return Math.max(numInputs,r);
	}

	/**
	 * Determine the exact slots used in this block.
	 * 
	 * @return
	 */
	public Set<Integer> slots() {
		HashSet<Integer> slots = new HashSet<Integer>();
		for(Entry s : stmts) {
			s.code.registers(slots);
		}
		return slots;
	}
	
	/**
	 * Return block entry at the given position.
	 * 
	 * @param index --- position to return entry of.
	 * @return
	 */
	public Entry get(int index) {
		return stmts.get(index);
	}

	public Iterator<Entry> iterator() {
		return stmts.iterator();
	}		
	
	/**
	 * Generate a typing for this block, from which the type of every register
	 * at every point can be determined. Note that this typing is valid for the
	 * block as it currently is, and will become invalid if the block is changed
	 * in any way.
	 * 
	 * @param inputs
	 *            --- the types of all input parameters to this block.
	 * 
	 * @return
	 */
	public Typing typing(Type[] inputs) {
		return new Typing(inputs,stmts,numSlots());
	}
	
	// ===================================================================
	// Import Methods
	// ===================================================================

	/**
	 * <p>
	 * Import an external block into this one, using a given <i>binding</i>. The
	 * binding indicates how the input variables for the external block should
	 * be mapped into the variables of this block.
	 * </p>
	 * <p>
	 * <p>
	 * Every input variable in the block must be bound to something in the
	 * binding. Otherwise, an IllegalArgumentException is raised. In the case of
	 * an input bound to a slot >= numSlots(), then the number of slots is
	 * increased automatically.
	 * </p>
	 * <b>NOTE:</b> temporary variables used in the external block will be
	 * mapped automatically to unused slots in this environment to prevent
	 * collisions. Therefore, temporary variables should not be specified in the
	 * binding. </p>
	 */
	public void importExternal(CodeBlock block, Map<Integer,Integer> binding) {
		int freeSlot = numSlots();
		
		// First, sanity check that all input variables are bound
		HashMap<Integer,Integer> nbinding = new HashMap<Integer,Integer>();
		for(int i=0;i!=block.numInputs;++i) {
			Integer target = binding.get(i);
			if(target == null) {
				throw new IllegalArgumentException("Input not mapped by input");
			}
			nbinding.put(i,target);
			freeSlot = Math.max(target+1,freeSlot);
		}
		
		// Second, determine binding for temporary variables		
		for(int i=block.numInputs;i!=block.numSlots();++i) {
			nbinding.put(i,i+freeSlot);			
		}
		
		// Third, determine relabelling
		HashMap<String,String> labels = new HashMap<String,String>();
		
		for (Entry s : block) {
			if (s.code instanceof Code.Label) {
				Code.Label l = (Code.Label) s.code;
				labels.put(l.label, freshLabel());
			}
		}
		
		// Finally, apply the binding and relabel any labels as well.
		for(Entry s : block) {
			Code ncode = s.code.remap(nbinding).relabel(labels);
			append(ncode,s.attributes());
		}
	}

	public CodeBlock relabel() {
		HashMap<String,String> labels = new HashMap<String,String>();
		
		for (Entry s : this) {
			if (s.code instanceof Code.Label) {
				Code.Label l = (Code.Label) s.code;
				labels.put(l.label, freshLabel());
			}
		}
		
		CodeBlock block = new CodeBlock(numInputs);
		// Finally, apply the binding and relabel any labels as well.
		for(Entry s : this) {
			Code ncode = s.code.relabel(labels);
			block.append(ncode,s.attributes());
		}
		
		return block;
	}
	
	
	/**
	 * This method updates the source attributes for all statements in a block.
	 * This is typically done in conjunction with a substitution, when we're
	 * inlining constraints from e.g. pre- and post-conditions.
	 * 
	 * @param block
	 * @param nsrc
	 * @return
	 */
	public static CodeBlock resource(CodeBlock block, Attribute.Source nsrc) {
		if(block == null) {
			return null;
		}
		CodeBlock nblock = new CodeBlock(block.numInputs());
		for(Entry e : block) {
			nblock.append(e.code,nsrc);
		}
		return nblock;
	}
	
	// ===================================================================
	// Append Methods
	// ===================================================================
	
	public void append(CodeBlock.Entry entry) {
		stmts.add(new Entry(entry.code,entry.attributes()));
	}

	/**
	 * Append a bytecode onto the end of this block. It is assumed that the
	 * bytecode employs the same environment as this block.
	 * 
	 * @param code
	 *            --- bytecode to append
	 * @param attributes
	 *            --- attributes associated with bytecode.
	 */
	public void append(Code code, Attribute... attributes) {
		stmts.add(new Entry(code,attributes));
	}

	/**
	 * Append a bytecode onto the end of this block. It is assumed that the
	 * bytecode employs the same environment as this block.
	 * 
	 * @param code
	 *            --- bytecode to append
	 * @param attributes
	 *            --- attributes associated with bytecode.
	 */
	public void append(Code code, Collection<Attribute> attributes) {
		stmts.add(new Entry(code,attributes));		
	}

	/**
	 * <p>
	 * Append another block onto the end of this block. It is assumed that the
	 * block in question employs the same environment.
	 * </p>
	 * 
	 * <p>
	 * <b>NOTE</b>In the case of the block being appended having more input
	 * variables, it is assumed those additional ones correspond to temporaries
	 * in this block.
	 * </p>
	 * 
	 * @param block --- block to append
	 */	
	public void append(CodeBlock block) {
		for(Entry s : block) {
			append(s.code,s.attributes());
		}
	}
	
	// ===================================================================
	// Insert Methods
	// ===================================================================
	
	/**
	 * <p>Insert a bytecode at a given position in this block. It is assumed that
	 * the bytecode employs the same environment as this block. The bytecode at
	 * the given position (and any after it) are shifted one position down.</p>
	 * 
	 * @param index --- position to insert at.
	 * @param code --- bytecode to insert at the given position.
	 * @param attributes
	 */
	public void insert(int index, Code code, Attribute... attributes) {
		stmts.add(index,new Entry(code,attributes));
	}
	
	/**
	 * <p>Insert a bytecode at a given position in this block. It is assumed that
	 * the bytecode employs the same environment as this block. The bytecode at
	 * the given position (and any after it) are shifted one position down.</p>
	 * 
	 * @param index --- position to insert at.
	 * @param code --- bytecode to insert at the given position.
	 * @param attributes
	 */
	public void insert(int index, Code code, Collection<Attribute> attributes) {
		stmts.add(index,new Entry(code,attributes));
	}

	/**
	 * <p>
	 * Insert a block at a given position in this block. It is assumed that the
	 * bytecode employs the same environment as this block. The bytecode at the
	 * given position (and any after it) are shifted one or more positions down.
	 * </p>
	 * 
	 * @param index
	 *            --- position to insert block at.
	 * @param block
	 *            --- block to insert.
	 */
	public void insert(int index, CodeBlock block) {
		for(Entry s : block) {
			insert(index++, s.code,s.attributes());
		}
	}

	// ===================================================================
	// Replace and Remove Methods
	// ===================================================================

	/**
	 * <p>
	 * Replace the bytecode at a given position in this block with another. It
	 * is assumed that the bytecode employs the same environment as this block.
	 * </p>
	 *
	 * @param index --- position of bytecode to replace.
	 * @param code --- bytecode to replace with.
	 * @param attributes
	 */
	public void replace(int index, Code code, Attribute... attributes) {
		stmts.set(index,new Entry(code,attributes));
	}
	
	/**
	 * <p>
	 * Replace the bytecode at a given position in this block with another. It
	 * is assumed that the bytecode employs the same environment as this block.
	 * </p>
	 * 
	 * @param index --- position of bytecode to replace.
	 * @param code --- bytecode to replace with.
	 * @param attributes
	 */
	public void replace(int index, Code code, Collection<Attribute> attributes) {
		stmts.set(index, new Entry(code, attributes));
	}

	/**
	 * <p>
	 * Remove the bytecode at a given position in this block. Those bytecodes
	 * after this position will then be shifted up one position in the block.
	 * </p>
	 * 
	 * @param index
	 *            --- index of bytecode to remove.
	 */
	public void remove(int index) {
		stmts.remove(index);
	}

	// ===================================================================
	// Miscellaneous
	// =================================================================== 
	
	public String toString() {
		String r = "[";
		
		boolean firstTime=true;
		for(Entry s : stmts) {
			if(!firstTime) {
				r += ", ";
			}
			firstTime=false;
			r += s.toString();
		}
		
		return r + "]";
	}

	private static int _idx=0;
	public static String freshLabel() {
		return "blklab" + _idx++;
	}

	/**
	 * Represents an individual bytecode and those attributes currently
	 * associated with it (if any) in the block.
	 * 
	 * @author David J. Pearce
	 * 
	 */
	public static final class Entry extends SyntacticElement.Impl {
		public final Code code;
		
		public Entry(Code code, Attribute... attributes) {
			super(attributes);
			this.code = code;
		}
		
		public Entry(Code code, Collection<Attribute> attributes) {
			super(attributes);
			this.code = code;
		}
				
		public String toString() {
			String r = code.toString();
			if(attributes().size() > 0) {
				r += " # ";
				boolean firstTime=true;
				for(Attribute a : attributes()) {
					if(!firstTime) {
						r += ", ";
					}
					firstTime=false;
					r += a;
				}
			}
			return r;
		}
	}	
	
	/**
	 * Represents complete typing information for a block. The calculation is
	 * done lazily to avoid unnecessary recomputation.
	 * 
	 * @author djp
	 * 
	 */
	public static final class Typing {
		private final ArrayList<Entry> stmts;
		private final HashMap<String,Type[]> cache;
		private final int numSlots;
		private int position;
		private Type[][] environments;
		
		public Typing(Type[] inputs, List<Entry> stmts, int numSlots) {
			this.stmts = new ArrayList<Entry>(stmts);
			this.cache = new HashMap<String,Type[]>();
			this.environments = new Type[stmts.size()][];
			this.environments[0] = Arrays.copyOf(inputs,numSlots);
			this.numSlots = numSlots;
		}
		
		/**
		 * Return the type of a given register immediately before the given
		 * index position.
		 * 
		 * @param index
		 * @return
		 */
		public Type getTypeBefore(int index, int register) {
			if(position <= index) {
				determineTypesUpto(index+1);
			}
			return environments[index][register];			
		}
		
		private void determineTypesUpto(int end) {
			Type[] environment = environments[0];
			
			for(int i=position;i<end;++i) {
				Code code = stmts.get(i).code;
				if(code instanceof Code.Label) {
					Code.Label label = (Code.Label) code;
					Type[] nEnv = cache.get(label.label);
					environment = join(environment,nEnv);
				} else if(code instanceof Code.AbstractAssignable) {
					Code.AbstractAssignable c = (Code.AbstractAssignable) code;
					environment = Arrays.copyOf(environment, environment.length);
					environment[c.target] = c.assignedType(); 
				} else if(code instanceof Code.Goto) {
					Code.Goto gto = (Code.Goto) code;
					cache.put(gto.target, environment);
					environment = null;
				} else if(code instanceof Code.If) {
					Code.If gto = (Code.If) code;
					cache.put(gto.target, environment);
				} else if(code instanceof Code.IfIs) {
					Code.IfIs gto = (Code.IfIs) code;
					Type[] trueEnv = Arrays.copyOf(environment, environment.length);
					trueEnv[gto.operand] = Type.intersect(trueEnv[gto.operand],
							gto.rightOperand);
					cache.put(gto.target, trueEnv);
					environment[gto.operand] = Type.intersect(
							trueEnv[gto.operand],
							Type.Negation(gto.rightOperand));					
				} else if(code instanceof Code.Switch) {
					Code.Switch sw = (Code.Switch) code;
					for(Pair<Constant,String> c : sw.branches) {
						cache.put(c.second(), environment);
					}
					cache.put(sw.defaultTarget, environment);
				} else if(code instanceof Code.ForAll) {
					// FIXME: what this need to do is update the type for the
					// index variable, and then invalidate it afterwards.
					throw new RuntimeException("need to implement for-all loop!");
				} else if (code instanceof Code.Return
						|| code instanceof Code.Throw) {
					environment = null;
				}
				
				environments[i] = environment; 
			}
		}
		
		private static Type[] join(Type[] env1, Type[] env2) {
			if(env1 == null) {
				return env2;
			} else if(env2 == null) {
				return env1;
			} 
			Type[] result = new Type[env1.length];
			for(int i=0;i!=env1.length;++i) {
				Type t1 = env1[i];
				Type t2 = env2[i];
				if(t1 == null && t2 == null) {
					result[i] = null;	
				} else if(t1 == null) {
					result[i] = t2;
				} else if(t2 == null) {
					result[i] = t1;
				} else {				
					result[i] = Type.Union(t1,t2);
				}				
			}
			return result;
		}
	}
}
