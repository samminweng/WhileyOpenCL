package wyil.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

import wyautl_old.lang.Automata;
import wyautl_old.lang.Automaton;
import wyautl_old.lang.Automaton.State;
import wybs.lang.Build;
import wycc.lang.NameID;
import wycc.util.ResolveError;
import wyil.lang.Type;
import wyil.lang.WyilFile;

/**
 * <p>
 * The type expander is responsible for managing the relationship between
 * nominal types and their underlying types. Every visible type has an
 * underlying type associated with it which, in some cases, will be the same.
 * For example, the underlying type associated with type <code>int</code> is
 * simply <code>int</code>. However, in many cases, there is a difference. For
 * example:
 * </p>
 * 
 * <pre>
 * type nat is (int x) where x >= 0
 * </pre>
 * 
 * <p>
 * In this case, the underlying type associated with the type <code>nat</code>
 * is <code>int</code>. This class provides a way to determine the underlying
 * type associated with a given type.
 * </p>
 * <p>
 * <b>NOTE:</b> in principle, this could cache expanded types for performance
 * reasons (though it currently does not).
 * </p>
 * 
 * @author David J. Pearce
 * 
 */
public class TypeExpander {
	private final Build.Project project;
	
	public TypeExpander(Build.Project project) {
		this.project = project;
	}
	
	/**
	 * Expand a given type by inlining all visible nominal information. For
	 * example:
	 * 
	 * <pre>
	 * type nat is (int x) where x >= 0
	 * type listnat is [nat]
	 * </pre>
	 * 
	 * Expanding the type <code>[nat]</code> will result in the type
	 * <code>[int]</code>. The key challenge here lies in handling nominal types
	 * when they are encountered. We need to determine where the type is
	 * located, and then incorporate the (expanded) body of that type into this
	 * type. In some cases, we're not permitted to inline the body because it's
	 * not visible to this file (e.g. it is marked as private).
	 * 
	 * @param type
	 * @return
	 */
	public Type getUnderlyingType(Type type) throws IOException, ResolveError {
		ArrayList<Automaton.State> states = new ArrayList<Automaton.State>();
		HashMap<NameID,Integer> roots = new HashMap<NameID,Integer>();
		getTypeHelper(type, false, states, roots);
		return Type.construct(new Automaton(states));		
	}
	
	/**
	 * Return the maximally consumed type of a given type. That is the maximal
	 * type for which all values of that type are in the given type. For
	 * example, the type <code>int</code> is maximally consumed by
	 * <code>int</code>. However, for constrained types, it's more involved. For
	 * example, consider:
	 * 
	 * <pre>
	 * type nat is (int n) where n >= 0
	 * 		
	 * function f(int|bool|null x) -> bool:
	 *     if x is nat|bool:
	 *         ... 
	 *     else:
	 *         ...
	 * </pre>
	 * 
	 * @param type
	 *            Type for which to determine its maximally consumed type.
	 * @return
	 */
	public Type getMaximallyConsumedType(Type type) throws ResolveError,
			IOException {
		ArrayList<Automaton.State> states = new ArrayList<Automaton.State>();
		HashMap<NameID, Integer> roots = new HashMap<NameID, Integer>();
		getTypeHelper(type, true, states, roots);
		return Type.construct(new Automaton(states));
	}

	/**
	 * <p>
	 * Expand the given type by loading it's contents into the list of states.
	 * The location of nominal types, when encountered, are cached as "roots" in
	 * order to prevent infinite expansion and, instead, to construct a
	 * recursive cycle.
	 * </p>
	 * 
	 * <p>
	 * Expansion proceeds by exploring every compound type until either a leaf
	 * or nominal type is encountered. In the case of a leaf type being
	 * encoutered, we can just add this directly as it cannot be further
	 * expanded. In the case of a nominal type, we then try to inline its body
	 * if permitted. Thus, for a type which contains no nominal types, this
	 * function will return an identical type.
	 * </p>
	 * 
	 * @param type
	 *            The type currently being expanded.
	 * @param maximallyConsumed
	 *            Flag indicating whether to calculate maximally consumed type
	 *            or not.
	 * @param states
	 *            The list of states being accumulated which will eventually
	 *            form the original type being exapnded.
	 * @param roots
	 *            The cache of previously inline nominal types which is
	 *            necessary to break recursive cycles.
	 * @return
	 * @throws IOException
	 */
	public int getTypeHelper(Type type, boolean maximallyConsumed,
			ArrayList<Automaton.State> states, HashMap<NameID, Integer> roots)
			throws IOException, ResolveError {
		// First, handle nominals (which are challenging) and primitive types
		// (which are simple).		
		if(type instanceof Type.Nominal) {
			Type.Nominal tt = (Type.Nominal) type;
			NameID nid = tt.name();
			// First, check whether or not we have already expanded this type.
			// If so, then we form a recursive cycle.
			if(roots.containsKey(nid)) {
				// Yes. we have already expanded it. Therefore we simply need to
				// return the cached index to form the recursive cycle.
				return roots.get(nid);
			} else {
				// At this point, need to find the corresponding declatation.
				WyilFile mi = project.get(nid.module(),WyilFile.ContentType).read();
				WyilFile.Type td = mi.type(nid.name());
				if(maximallyConsumed && td.invariant() != null) {
					// In this specially case, we have a constrained type
					// and we are attempting to compute the maximally
					// consumed type. This type is not fully consumed as it
					// is constrained and, hence, void is its maximally
					// constrained type. 						
					states.add(new State(Type.K_VOID, null, true,
							Automaton.NOCHILDREN));
					return states.size()-1;
				} else {
					// Now, store the root of this expansion so that it can be used
					// subsequently to form a recursive cycle.											
					roots.put(nid, states.size());
					return getTypeHelper(td.type(),maximallyConsumed,states,roots);
				}				
			}
		} else if(type instanceof Type.Leaf) {
			// In ther case of a leaf node we simply copy over its states into
			// the list of states being accumulated.
			return append(type,states);
		}  
			
		// Now handle all non-primitive types which need to be expanded in some
		// way,		
		int myIndex = states.size();
		int myKind;
		int[] myChildren;
		Object myData = null;
		boolean myDeterministic = true;
		
		states.add(null); // reserve space for me!
		
		if (type instanceof Type.Set) {			
			Type.Set tt = (Type.Set) type;
			myChildren = new int[1];
			myChildren[0] = getTypeHelper(tt.element(),maximallyConsumed,states,roots);
			myKind = Type.K_SET;			
			myData = tt.nonEmpty();
		} else if (type instanceof Type.List) {			
			Type.List tt = (Type.List) type;
			myChildren = new int[1];
			myChildren[0] = getTypeHelper(tt.element(),maximallyConsumed,states,roots);
			myKind = Type.K_LIST;			
			myData = tt.nonEmpty();
		} else if (type instanceof Type.Map) {			
			Type.Map tt = (Type.Map) type;
			myChildren = new int[2];
			myChildren[0] = getTypeHelper(tt.key(),maximallyConsumed,states,roots);
			myChildren[1] = getTypeHelper(tt.value(),maximallyConsumed,states,roots);
			myKind = Type.K_MAP;			
		} else if(type instanceof Type.Tuple) {
			Type.Tuple tt = (Type.Tuple) type;
			myChildren = new int[tt.size()];
			for(int i=0;i!=tt.size();++i) {
				myChildren[i] = getTypeHelper(tt.element(i),maximallyConsumed,states,roots);
			}
			myKind = Type.K_TUPLE;			
		} else if(type instanceof Type.Record) {
			Type.Record tt = (Type.Record) type;
			HashMap<String, Type> ttTypes = tt.fields();
			Type.Record.State fields = new Type.Record.State(tt.isOpen(),
					ttTypes.keySet());
			Collections.sort(fields);
			myKind = Type.K_RECORD;
			myChildren = new int[fields.size()];
			for (int i = 0; i != myChildren.length; ++i) {
				String field = fields.get(i);
				myChildren[i] = getTypeHelper(ttTypes.get(field), maximallyConsumed,states, roots);
			}
			myData = fields;
		} else if(type instanceof Type.Reference) {
			Type.Reference tt = (Type.Reference) type;
			myChildren = new int[1];
			myChildren[0] = getTypeHelper(tt.element(),maximallyConsumed,states,roots);
			myKind = Type.K_REFERENCE;
		} else if(type instanceof Type.Negation) {
			Type.Negation tt = (Type.Negation) type;
			myChildren = new int[1];
			myChildren[0] = getTypeHelper(tt.element(),maximallyConsumed,states,roots);
			myKind = Type.K_NEGATION;
		} else if(type instanceof Type.Union) {
			Type.Union tt = (Type.Union) type;
			Set<Type> bounds = tt.bounds();
			myChildren = new int[bounds.size()];
			int i = 0;
			for(Type b : bounds) {
				myChildren[i++] = getTypeHelper(b,maximallyConsumed,states,roots);
			}
			myKind = Type.K_UNION;	
		} else if(type instanceof Type.FunctionOrMethod) {
			Type.FunctionOrMethod tt = (Type.FunctionOrMethod) type;
			List<Type> tt_params = tt.params();
			myChildren = new int[2 + tt_params.size()];
			myChildren[0] = getTypeHelper(tt.ret(),maximallyConsumed,states,roots);
			myChildren[1] = getTypeHelper(tt.throwsClause(),maximallyConsumed,states,roots);
			for(int i=0;i!=tt_params.size();++i) {
				myChildren[i+2] = getTypeHelper(tt_params.get(i),maximallyConsumed,states,roots);
			}
			myKind = tt instanceof Type.Function ? Type.K_FUNCTION
					: Type.K_METHOD;			
		}else {
			// FIXME: Probably need to handle function and method types here
			throw new ResolveError("unknown type encountered: " + type);
		}
		
		states.set(myIndex, new Automaton.State(myKind, myData,
				myDeterministic, myChildren));
				
		return myIndex;
	}
	
	private static int append(Type type, ArrayList<Automaton.State> states) {
		int myIndex = states.size();
		Automaton automaton = Type.destruct(type);
		Automaton.State[] tStates = automaton.states;
		int[] rmap = new int[tStates.length];
		for (int i = 0, j = myIndex; i != rmap.length; ++i, ++j) {
			rmap[i] = j;
		}
		for (Automaton.State state : tStates) {
			states.add(Automata.remap(state, rmap));
		}
		return myIndex;
	}
}
