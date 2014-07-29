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

package wyil.transforms;

import java.io.IOException;
import java.util.*;

import wybs.lang.Builder;
import wycc.lang.Transform;
import wycc.util.Pair;
import wyfs.lang.Path;
import wyil.*;
import wyil.lang.*;

/**
 * Removes dead-code from method and function bodies in a given bytecode.
 * Dead=code is defined as code which is unreachable from the entry point by
 * bytecodes sequentially, and traversing along all branches and exceptional
 * edges as appropriate.
 * 
 * @author David J. Pearce
 * 
 */
public class DeadCodeElimination implements Transform<WyilFile> {

	/**
	 * Determines whether constant propagation is enabled or not.
	 */
	private boolean enabled = getEnable();
	

	public static String describeEnable() {
		return "Enable/disable constant propagation";
	}
	
	public static boolean getEnable() {
		return true; // default value
	}
	
	public void setEnable(boolean flag) {
		this.enabled = flag;
	}
	
	public DeadCodeElimination(Builder builder) {
		
	}
	
	public void apply(WyilFile module) throws IOException {
		if(enabled) {
			for(WyilFile.TypeDeclaration type : module.types()) {
				transform(type);
			}		
			for(WyilFile.FunctionOrMethodDeclaration method : module.functionOrMethods()) {
				transform(method);
			}
		}
	}
	
	public void transform(WyilFile.TypeDeclaration type) {
		Code.Block invariant = type.invariant();
		
		if (invariant != null) {
			transform(invariant);
		}
	}

	public void transform(WyilFile.FunctionOrMethodDeclaration method) {		
		for(WyilFile.Case c : method.cases()) {
			transform(c,method);
		}
	}
	
	public void transform(WyilFile.Case mcase, WyilFile.FunctionOrMethodDeclaration method) {	
		Code.Block body = mcase.body();
		if(body != null) {
			transform(body);
		}
	}
	
	private void transform(Code.Block block) {
		HashMap<String,Integer> labelMap = buildLabelMap(block);
		BitSet visited = new BitSet(block.size());
		Stack<Integer> worklist = new Stack();
		worklist.push(0);
		visited.set(0);
		while(!worklist.isEmpty()) {
			int index = worklist.pop();
					
			Code code = block.get(index).code;
			
			if(code instanceof Codes.Goto) {
				Codes.Goto g = (Codes.Goto) code;				
				addTarget(labelMap.get(g.target),visited,worklist);
			} else if(code instanceof Codes.If) {								
				Codes.If ig = (Codes.If) code;				
				addTarget(index+1,visited,worklist);
				addTarget(labelMap.get(ig.target),visited,worklist);				
			} else if(code instanceof Codes.IfIs) {								
				Codes.IfIs ig = (Codes.IfIs) code;				
				addTarget(index+1,visited,worklist);
				addTarget(labelMap.get(ig.target),visited,worklist);				
			} else if(code instanceof Codes.Switch) {
				Codes.Switch sw = (Codes.Switch) code;
				for(Pair<Constant,String> p : sw.branches) {
					addTarget(labelMap.get(p.second()),visited,worklist);
				}
				addTarget(labelMap.get(sw.defaultTarget),visited,worklist);
			} else if(code instanceof Codes.TryCatch) {
				Codes.TryCatch tc = (Codes.TryCatch) code;
				for(Pair<Type,String> p : tc.catches) {
					addTarget(labelMap.get(p.second()),visited,worklist);
				}
				addTarget(index+1,visited,worklist);
			} else if(code instanceof Codes.Throw || code instanceof Codes.Return) {
				// terminating bytecode
			} else {
				// sequential bytecode	
				if((index+1) < block.size()) {
					addTarget(index+1,visited,worklist);
				}
			}
		}
		
		// Now, remove unvisited blocks!
		int index=0;
		int size = block.size();
		for(int i=0;i!=size;++i) {
			if(!visited.get(i)) {
				block.remove(index);
			} else {
				index = index + 1;
			}
		}
	}
	
	private static HashMap<String,Integer> buildLabelMap(Code.Block block) {
		HashMap<String,Integer> map = new HashMap<String,Integer>();
		for(int i=0;i!=block.size();++i) {
			Code c = block.get(i).code;
			if(c instanceof Codes.Label) {
				Codes.Label l = (Codes.Label) c;				
				map.put(l.label,i);
			}
		}
		return map;
	}
	
	private static void addTarget(int index, BitSet visited, Stack<Integer> worklist) {
		if(!visited.get(index)) {
			visited.set(index);			
			worklist.push(index);
		}
	}
}
