// This file is part of the Whiley-to-Java Compiler (wyjc).
//
// The Whiley-to-Java Compiler is free software; you can redistribute
// it and/or modify it under the terms of the GNU General Public
// License as published by the Free Software Foundation; either
// version 3 of the License, or (at your option) any later version.
//
// The Whiley-to-Java Compiler is distributed in the hope that it
// will be useful, but WITHOUT ANY WARRANTY; without even the
// implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
// PURPOSE.  See the GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public
// License along with the Whiley-to-Java Compiler. If not, see
// <http://www.gnu.org/licenses/>
//
// Copyright 2010, David James Pearce.

package wyil.lang;

import java.io.IOException;
import java.util.*;

import wyautl_old.io.BinaryAutomataReader;
import wyautl_old.io.BinaryAutomataWriter;
import wyautl_old.lang.*;
import wyautl_old.lang.Automaton.State;
import wycc.lang.NameID;
import wyfs.io.BinaryInputStream;
import wyfs.io.BinaryOutputStream;
import wyfs.util.Trie;
import wyil.util.type.*;

/**
 * A structural type. See
 * http://whiley.org/2011/03/07/implementing-structural-types/ for more on how
 * this class works.
 *
 * @author David J. Pearce
 *
 */
public abstract class Type {
	// =============================================================
	// Debug Code
	// =============================================================

//	private static final HashSet<Type> distinctTypes = new HashSet<Type>();
//
	private static boolean canonicalisation = true;
//	private static int equalsCount = 0;
//	private static int normalisedCount = 0;
//	private static int unminimisedCount = 0;
//	private static int minimisedCount = 0;

//	static {
//		Thread _shutdownHook = new Thread(Type.class.getName()
//				+ ".shutdownHook") {
//			public void run() {
//				shutdown();
//			}
//		};
//		Runtime.getRuntime().addShutdownHook(_shutdownHook);
//	}

//	public static void shutdown() {
//		System.err.println("#TYPE EQUALITY TESTS: " + equalsCount);
//		System.err.println("#TYPE NORMALISATIONS: " + normalisedCount + " (" + unminimisedCount + " -> " + minimisedCount +")");
//		System.err.println("#DISTINCT TYPES: " + distinctTypes.size());
//	}

	// =============================================================
	// Type Constructors
	// =============================================================

	public static final Any T_ANY = new Any();
	public static final Void T_VOID = new Void();
	public static final Null T_NULL = new Null();
	public static final Bool T_BOOL = new Bool();
	public static final Byte T_BYTE = new Byte();
	public static final Int T_INT = new Int();
	public static final Real T_REAL = new Real();
	public static final Meta T_META = new Meta();

	// the following are strictly unnecessary, but since they occur very
	// commonly it is helpful to provide them as constants.

	public static final Reference T_REF_ANY = Reference(T_ANY);

	/**
	 * The type representing all possible list types.
	 */
	public static final Array T_ARRAY_ANY = Array(T_ANY,false);

	/**
	 * Construct a tuple type using the given element types.
	 *
	 * @param element
	 */
	public static final Type.Tuple Tuple(Type... elements) {
		Type r = construct(K_TUPLE, null, elements);
		if(r instanceof Type.Tuple) {
			return (Type.Tuple) r;
		} else {
			throw new IllegalArgumentException("invalid arguments for Type.Tuple()");
		}
	}

	/**
	 * Construct a tuple type using the given element types.
	 *
	 * @param element
	 */
	public static final Type.Tuple Tuple(java.util.List<Type> elements) {
		Type r = construct(K_TUPLE, null, elements);
		if(r instanceof Type.Tuple) {
			return (Type.Tuple) r;
		} else {
			throw new IllegalArgumentException("invalid arguments for Type.Tuple()");
		}
	}

	/**
	 * Construct a reference type using the given element type.
	 *
	 * @param element
	 */
	public static final Type.Reference Reference(Type element) {
		Type r = construct(K_REFERENCE, null, element);
		if (r instanceof Type.Reference) {
			return (Type.Reference) r;
		} else {
			throw new IllegalArgumentException(
					"invalid arguments for Type.Reference()");
		}
	}

	public static final Nominal Nominal(NameID name) {
		if (name == null) {
			throw new IllegalArgumentException(
					"nominal name cannot be null");
		}
		return new Nominal(name);
	}

	/**
	 * Construct a list type using the given element type.
	 *
	 * @param element
	 */
	public static final Type.Array Array(Type element, boolean nonEmpty) {
		return (Type.Array) construct(K_LIST, nonEmpty, element);
	}

	/**
	 * Construct a union type using the given type bounds
	 *
	 * @param element
	 */
	public static final Type Union(Collection<Type> bounds) {
		return construct(K_UNION,null,bounds);
	}

	/**
	 * Construct a union type using the given type bounds
	 *
	 * @param element
	 */
	public static final Type Union(Type... bounds) {
		return construct(K_UNION,null,bounds);
	}

	/**
	 * Construct a difference of two types.
	 *
	 * @param element
	 */
	public static final Type Negation(Type element) {
		return construct(K_NEGATION,null,element);
	}

	/**
	 * Construct a function type using the given return and parameter types.
	 *
	 * @param element
	 */
	public static final Type.Function Function(Type ret, Type throwsClause,
			Collection<Type> params) {
		Type[] rparams = new Type[params.size()+2];
		int i = 2;
		for (Type t : params) { rparams[i++] = t; }
		rparams[0] = ret;
		rparams[1] = throwsClause;
		Type r = construct(K_FUNCTION, null, rparams);
		if (r instanceof Type.Function) {
			return (Type.Function) r;
		} else {
			throw new IllegalArgumentException(
					"invalid arguments for Type.Function() - " + params);
		}
	}

	/**
	 * Construct a function type using the given return and parameter types.
	 *
	 * @param element
	 */
	public static final Type.Function Function(Type ret, Type throwsClause,
			Type... params) {
		Type[] rparams = new Type[params.length+2];
		System.arraycopy(params, 0, rparams, 2, params.length);
		rparams[0] = ret;
		rparams[1] = throwsClause;
		Type r = construct(K_FUNCTION, null, rparams);
		if (r instanceof Type.Function) {
			return (Type.Function) r;
		} else {
			throw new IllegalArgumentException(
					"invalid arguments for Type.Function()");
		}
	}

	/**
	 * Construct a method type using the given receiver, return and parameter types.
	 *
	 * @param element
	 */
	public static final Type.Method Method(Type ret, Type throwsClause,
			Collection<Type> params) {
		Type[] rparams = new Type[params.size()+2];
		int i = 2;
		for (Type t : params) { rparams[i++] = t; }
		rparams[0] = ret;
		rparams[1] = throwsClause;
		Type r = construct(K_METHOD, null, rparams);
		if (r instanceof Type.Method) {
			return (Type.Method) r;
		} else {
			throw new IllegalArgumentException(
					"invalid arguments for Type.Method()");
		}
	}

	/**
	 * Construct a function type using the given return and parameter types.
	 *
	 * @param element
	 */
	public static final Type.Method Method(Type ret,
			Type throwsClause, Type... params) {
		Type[] rparams = new Type[params.length+2];
		System.arraycopy(params, 0, rparams, 2, params.length);
		rparams[0] = ret;
		rparams[1] = throwsClause;
		Type r = construct(K_METHOD, null, rparams);
		if (r instanceof Type.Method) {
			return (Type.Method) r;
		} else {
			throw new IllegalArgumentException(
					"invalid arguments for Type.Method()");
		}
	}

	/**
	 * Construct a record type using the given fields. The given record may be
	 * either "open" or "closed". A closed record indicates a type which must
	 * have exactly the given mapping of fields to types. An open record
	 * indicates a type which may have more fields than that listed. The notion
	 * of open records corresponds to "width subtyping" in type theory.
	 *
	 * @param element
	 */
	public static final Type.Record Record(boolean isOpen, java.util.Map<String,Type> fields) {
		java.util.Set<String> keySet = fields.keySet();
		Record.State keys = new Record.State(isOpen,keySet);
		Collections.sort(keys);
		Type[] types = new Type[keys.size()];
		for(int i=0;i!=types.length;++i) {
			types[i] = fields.get(keys.get(i));
		}
		Type r = construct(K_RECORD,keys,types);
		if (r instanceof Type.Record) {
			return (Type.Record) r;
		} else {
			throw new IllegalArgumentException(
					"invalid arguments for Type.Record()");
		}
	}

	/**
	 * Close a recursive type using a given label (i.e. nominal type).
	 * Essentially, this traverses the given type and routes each occurrence of
	 * the label to recursively point to the type's root. For example, we
	 * construct the recursive type <code>X<null|{X next}></code> as follows:
	 *
	 * <pre>
	 * HashMap<String,Type> fields = new HashMap<String,Type>();
	 * Type.Nominal label = T_NOMINAL("X");
	 * fields.put("next",label);
	 * Type tmp = T_UNION(T_NULL,T_RECORD(fields));
	 * Type type = T_RECURSIVE(label,tmp);
	 * </pre>
	 *
	 * <b>NOTE:</b> it is invalid to close a type which does not contain at
	 * least one instance of the given label. Doing this will cause an exception
	 * to be raised.
	 *
	 * @param label
	 *            --- label to be used for closing.
	 * @param type
	 *            --- type to be closed.
	 * @return
	 */
	public static final Type Recursive(NameID label, Type type) {
		// first stage, identify all matching labels
		if (type instanceof Leaf) {
			throw new IllegalArgumentException("cannot close a leaf type");
		}
		Compound compound = (Compound) type;
		Automaton automaton = compound.automaton;
		State[] nodes = automaton.states;
		int[] rmap = new int[nodes.length];
		for (int i = 0; i != nodes.length; ++i) {
			State c = nodes[i];
			if (c.kind == K_NOMINAL && c.data.equals(label)) {
				rmap[i] = 0;
			} else {
				rmap[i] = i;
			}
		}
		return construct(Automata.remap(automaton, rmap));
	}

	/**
	 * The following code converts a "type string" into an actual type. This is
	 * useful, amongst other things, for debugging.
	 *
	 * @param str
	 * @return
	 */
	public static Type fromString(String str) {
		return new TypeParser(str).parse();
	}

	/**
	 * This is a utility helper for constructing types. In particular, it's
	 * useful for determine whether or not a type needs to be closed. An open
	 * type is one which contains a "dangling" reference to some node which
	 * needs to be connected to back to form a cycle.
	 *
	 * @param label
	 * @param t
	 * @return
	 */
	public static boolean isOpen(NameID label, Type t) {
		if (t instanceof Leaf) {
			return false;
		}
		Compound graph = (Compound) t;
		for (State n : graph.automaton.states) {
			if (n.kind == K_NOMINAL && n.data.equals(label)) {
				return true;
			}
		}
		return false;
	}

	/**
	 * This is a utility helper for constructing types. In particular, it's
	 * useful for determine whether or not a type needs to be closed. An open
	 * type is one which contains a "dangling" reference to some node which
	 * needs to be connected to back to form a cycle.
	 *
	 * @param target
	 * @param t
	 * @return
	 */
	public static boolean isOpen(java.util.Set<NameID> labels, Type t) {
		if (t instanceof Leaf) {
			return false;
		}
		Compound graph = (Compound) t;
		for (State n : graph.automaton.states) {
			if (n.kind == K_NOMINAL && labels.contains(n.data)) {
				return true;
			}
		}
		return false;
	}

	// =============================================================
	// Readers / Writers
	// =============================================================

	/**
	 * <p>
	 * A <code>BinaryReader</code> will read types from a binary input stream.
	 * The types should be written to the stream using <code>BinaryWriter</code>
	 * .
	 * </p>
	 * <p>
	 * <b>NOTE:</b> Under-the-hood, this class is essentially a wrapper for
	 * <code>BinaryAutomataReader</code>.
	 * </p>
	 *
	 * @author David J. Pearce
	 *
	 */
	public static class BinaryReader extends BinaryAutomataReader {
		public BinaryReader(BinaryInputStream reader) {
			super(reader);
		}
		public Type readType() throws IOException {
			Type t = construct(read());
			return t;
		}
		public Automaton.State readState() throws IOException {
			Automaton.State state = super.readState();
			if (state.kind == Type.K_NOMINAL) {
				String module = readString();
				String name = readString();
				state.data = new NameID(Trie.fromString(module), name);
			} else if(state.kind == Type.K_RECORD) {
				boolean isOpen = reader.read_bit();
				int nfields = reader.read_uv();
				Record.State fields = new Record.State(isOpen);
				for(int i=0;i!=nfields;++i) {
					fields.add(readString());
				}
				state.data = fields;
			}  else if(state.kind == Type.K_LIST || state.kind == Type.K_SET) {
				boolean nonEmpty = reader.read_bit();
				state.data = nonEmpty;
			}
			return state;
		}

		private String readString() throws IOException {
			String r = "";
			int nchars = reader.read_uv();
			for(int i=0;i!=nchars;++i) {
				char c = (char) reader.read_u16();
				r = r + c;
			}
			return r;
		}
	}

	/**
	 * <p>
	 * A <code>BinaryWriter</code> will write types to a binary output stream.
	 * The types should be read back from the stream using
	 * <code>BinaryReader</code> .
	 * </p>
	 * <p>
	 * <b>NOTE:</b> Under-the-hood, this class is essentially a wrapper for
	 * <code>BinaryAutomataWriter</code>.
	 * </p>
	 *
	 * @author David J. Pearce
	 *
	 */
	public static class BinaryWriter extends BinaryAutomataWriter {
		public BinaryWriter(BinaryOutputStream writer) {
			super(writer);
		}
		public void write(Type t) throws IOException {
			write(destruct(t));
		}

		public void write(Automaton.State state) throws IOException {
			super.write(state);
			if (state.kind == Type.K_NOMINAL) {
				NameID name = (NameID) state.data;
				writeString(name.module().toString());
				writeString(name.name());
			} else if(state.kind == Type.K_RECORD) {
				Record.State fields = (Record.State) state.data;
				writer.write_bit(fields.isOpen);
				writer.write_uv(fields.size());
				for(String field : fields) {
					writeString(field);
				}
			} else if(state.kind == Type.K_LIST || state.kind == Type.K_SET) {
				writer.write_bit((Boolean) state.data);
			}
		}

		private void writeString(String str) throws IOException {
			writer.write_uv(str.length());
			for (int i = 0; i != str.length(); ++i) {
				writer.write_u16(str.charAt(i));
			}
		}
	}

	// =============================================================
	// Type operations
	// =============================================================

	/**
	 * Determine whether type <code>t2</code> is an <i>explicit coercive
	 * subtype</i> of type <code>t1</code>.
	 */
	public static boolean isExplicitCoerciveSubtype(Type t1, Type t2) {
		Automaton a1 = destruct(t1);
		Automaton a2 = destruct(t2);
		ExplicitCoercionOperator relation = new ExplicitCoercionOperator(a1,a2);
		return relation.isSubtype(0, 0);
	}

	/**
	 * Determine whether type <code>t2</code> is a <i>subtype</i> of type
	 * <code>t1</code> (written t1 :> t2). In other words, whether the set of
	 * all possible values described by the type <code>t2</code> is a subset of
	 * that described by <code>t1</code>.
	 */
	public static boolean isSubtype(Type t1, Type t2) {
		Automaton a1 = destruct(t1);
		Automaton a2 = destruct(t2);
		SubtypeOperator relation = new SubtypeOperator(a1,a2);
		return relation.isSubtype(0, 0);
	}

	/**
	 * <p>
	 * Contractive types are types which cannot accept value because they have
	 * an <i>unterminated cycle</i>. An unterminated cycle has no leaf nodes
	 * terminating it. For example, <code>X<{X field}></code> is contractive,
	 * where as <code>X<{null|X field}></code> is not.
	 * </p>
	 *
	 * <p>
	 * This method returns true if the type is contractive, or contains a
	 * contractive subcomponent. For example, <code>null|X<{X field}></code> is
	 * considered contracted.
	 * </p>
	 *
	 * @param type --- type to test for contractivity.
	 * @return
	 */
	public static boolean isContractive(Type type) {
		if(type instanceof Leaf) {
			return false;
		} else {
			Automaton automaton = ((Compound) type).automaton;
			return TypeAlgorithms.isContractive(automaton);
		}
	}

	/**
	 * Compute the intersection of two types. The resulting type will only
	 * accept values which are accepted by both types being intersected.. In
	 * many cases, the only valid intersection will be <code>void</code>.
	 *
	 * @param t1
	 * @param t2
	 * @return
	 */
	public static Type intersect(Type t1, Type t2) {
		return TypeAlgorithms.intersect(t1,t2);
	}

	public static Reference effectiveReference(Type t) {
		if(t instanceof Type.Reference) {
			return (Type.Reference) t;
		}
		return null;
	}

	public static FunctionOrMethod effectiveFunctionOrMethod(Type t) {
		if(t instanceof Type.FunctionOrMethod) {
			return (Type.FunctionOrMethod) t;
		}
		return null;
	}

	// =============================================================
	// Primitive Types
	// =============================================================

	/**
	 * A leaf type represents a type which has no component types. For example,
	 * primitive types like <code>int</code> and <code>real</code> are leaf
	 * types.
	 *
	 * @author David J. Pearce
	 *
	 */
	public static class Leaf extends Type {}

	/**
	 * A void type represents the type whose variables cannot exist! That is,
	 * they cannot hold any possible value. Void is used to represent the return
	 * type of a function which does not return anything. However, it is also
	 * used to represent the element type of an empty list of set. <b>NOTE:</b>
	 * the void type is a subtype of everything; that is, it is bottom in the
	 * type lattice.
	 *
	 * @author David J. Pearce
	 *
	 */
	public static final class Void extends Leaf {
		private Void() {}
		public boolean equals(Object o) {
			return this == o;
		}
		public int hashCode() {
			return 1;
		}
		public String toString() {
			return "void";
		}
	}

	/**
	 * The type any represents the type whose variables may hold any possible
	 * value. <b>NOTE:</b> the any type is top in the type lattice.
	 *
	 * @author David J. Pearce
	 *
	 */
	public static final class Any extends Leaf {
		private Any() {}
		public boolean equals(Object o) {
			return o == T_ANY;
		}
		public int hashCode() {
			return 1;
		}
		public String toString() {
			return "any";
		}
	}

	/**
	 * The null type is a special type which should be used to show the absence
	 * of something. It is distinct from void, since variables can hold the
	 * special <code>null</code> value (where as there is no special "void"
	 * value). With all of the problems surrounding <code>null</code> and
	 * <code>NullPointerException</code>s in languages like Java and C, it may
	 * seem that this type should be avoided. However, it remains a very useful
	 * abstraction to have around and, in Whiley, it is treated in a completely
	 * safe manner (unlike e.g. Java).
	 *
	 * @author David J. Pearce
	 *
	 */
	public static final class Null extends Leaf {
		private Null() {}
		public boolean equals(Object o) {
			return this == o;
		}
		public int hashCode() {
			return 2;
		}
		public String toString() {
			return "null";
		}
	}

	/**
	 * The type mets represents the type of types. That is, values of this type
	 * are themselves types. (think reflection, where we have
	 * <code>class Class {}</code>).
	 *
	 * @author David J. Pearce
	 *
	 */
	public static final class Meta extends Leaf {
		private Meta() {}
		public boolean equals(Object o) {
			return o == T_META;
		}
		public int hashCode() {
			return 1;
		}
		public String toString() {
			return "type";
		}
	}

	/**
	 * Represents the set of boolean values (i.e. true and false)
	 * @author David J. Pearce
	 *
	 */
	public static final class Bool extends Leaf {
		private Bool() {}
		public boolean equals(Object o) {
			return o == T_BOOL;
		}
		public int hashCode() {
			return 3;
		}
		public String toString() {
			return "bool";
		}
	}

	/**
	 * Represents a sequence of 8 bits. Note that, unlike many languages, there
	 * is no representation associated with a byte. For example, to extract an
	 * integer value from a byte, it must be explicitly decoded according to
	 * some representation (e.g. two's compliment) using an auxillary function
	 * (e.g. <code>Byte.toInt()</code>).
	 *
	 * @author David J. Pearce
	 *
	 */
	public static final class Byte extends Leaf {
		private Byte() {}
		public boolean equals(Object o) {
			return o == T_BYTE;
		}
		public int hashCode() {
			return 4;
		}
		public String toString() {
			return "byte";
		}
	}


	/**
	 * Represents the set of (unbound) integer values. Since integer types in
	 * Whiley are unbounded, there is no equivalent to Java's
	 * <code>MIN_VALUE</code> and <code>MAX_VALUE</code> for <code>int</code>
	 * types.
	 *
	 * @author David J. Pearce
	 *
	 */
	public static final class Int extends Leaf {
		private Int() {}
		public boolean equals(Object o) {
			return o == T_INT;
		}
		public int hashCode() {
			return 4;
		}
		public String toString() {
			return "int";
		}
	}

	/**
	 * Represents the set of (unbound) rational numbers.
	 *
	 * @author David J. Pearce
	 *
	 */
	public static final class Real extends Leaf {
		private Real() {}
		public boolean equals(Object o) {
			return o == T_REAL;
		}
		public int hashCode() {
			return 5;
		}
		public String toString() {
			return "real";
		}
	}

	/**
	 * The existential type represents the an unknown type, defined at a given
	 * position.
	 *
	 * @author David J. Pearce
	 *
	 */
	public static final class Nominal extends Leaf {
		private NameID nid;
		private Nominal(NameID name) {
			nid = name;
		}
		public boolean equals(Object o) {
			if(o instanceof Nominal) {
				Nominal e = (Nominal) o;
				return nid.equals(e.nid);
			}
			return false;
		}
		public NameID name() {
			return nid;
		}
		public int hashCode() {
			return nid.hashCode();
		}
		public String toString() {
			return nid.toString();
		}
	}

	// =============================================================
	// Compound Faces
	// =============================================================

	/*
	 * The compound faces are not technically necessary, as they simply provide
	 * interfaces to the underlying nodes of a compound type. However, they
	 * certainly make it more pleasant to use this library.
	 */

	public static class Compound extends Type {
		//protected Automaton automaton;
		public Automaton automaton;

		public Compound(Automaton automaton) {
			this.automaton = automaton;
		}

		public int hashCode() {
			return automaton.hashCode();
		}

		public boolean equals(Object o) {
			if (o instanceof Compound) {
				Compound c = (Compound) o;
				//equalsCount++;
				if(canonicalisation) {
					return automaton.equals(c.automaton);
				} else {
					return isSubtype(this, c) && isSubtype(c, this);
				}
			}
			return false;
		}

		public String toString() {
			// First, we need to find the headers of the computation. This is
			// necessary in order to mark the start of a recursive type.
			BitSet headers = new BitSet(automaton.size());
			BitSet visited = new BitSet(automaton.size());
			BitSet onStack = new BitSet(automaton.size());
			findHeaders(0,visited,onStack,headers,automaton);
			visited.clear();
			String[] titles = new String[automaton.size()];
			int count = 0;
			for(int i=0;i!=automaton.size();++i) {
				if(headers.get(i)) {
					titles[i] = headerTitle(count++);
				}
			}
			return Type.toString(0,visited,titles,automaton);
		}
	}

	/**
	 * A type which is either a tuple, or a union of tuples. An effective
	 * tuple gives access to a subset of the accessible elements
	 * guaranteed to be in the type. For example, consider this type:
	 *
	 * <pre>
	 * (int,int,int) | (int,[int])
	 * </pre>
	 *
	 * Here, we're guaranteed to have at least two elements. Therefore, the effective
	 * tuple type is <code>(int,int|[int])</code>.
	 *
	 * @return
	 */
	public interface EffectiveTuple {
		public Type element(int index);
		public java.util.List<Type> elements();
	}

	/**
	 * A tuple type describes a compound type made up of two or more
	 * subcomponents. It is similar to a record, except that fields are
	 * effectively anonymous.
	 *
	 * @author David J. Pearce
	 *
	 */
	public static final class Tuple extends Compound implements EffectiveTuple {
		private Tuple(Automaton automaton) {
			super(automaton);
		}
		public int size() {
			int[] values = (int[]) automaton.states[0].children;
			return values.length;
		}
		public Type element(int index) {
			int[] values = (int[]) automaton.states[0].children;
			return construct(Automata.extract(automaton,values[index]));
		}
		public java.util.List<Type> elements() {
			int[] values = (int[]) automaton.states[0].children;
			ArrayList<Type> elems = new ArrayList<Type>();
			for(Integer i : values) {
				elems.add(construct(Automata.extract(automaton,i)));
			}
			return elems;
		}
	}

	/**
	 * A type which is either a list, or a union of lists. An effective list
	 * gives access to an effective element type, which is the union of possible
	 * element types.
	 *
	 * <pre>
	 * [int] | [real]
	 * </pre>
	 *
	 * Here, the effective element type is int|real.
	 *
	 * @return
	 */
	public interface EffectiveArray {

		public Type element();

		public EffectiveArray update(Type key, Type Value);
	}

	/**
	 * A list type describes list values whose elements are subtypes of the
	 * element type. For example, <code>[1,2,3]</code> is an instance of list
	 * type <code>[int]</code>; however, <code>[1.345]</code> is not.
	 *
	 * @author David J. Pearce
	 *
	 */
	public static final class Array extends Compound implements EffectiveArray {
		private Array(Automaton automaton) {
			super(automaton);
		}

		public Type key() {
			return Type.T_INT;
		}

		public Type value() {
			return element();
		}

		public Type element() {
			int elemIdx = automaton.states[0].children[0];
			return construct(Automata.extract(automaton,elemIdx));
		}

		public boolean nonEmpty() {
			return (Boolean) automaton.states[0].data;
		}

		public EffectiveArray update(Type key, Type value) {
			return Type.Array(Type.Union(value, element()), nonEmpty());
		}
	}

	/**
	 * Represents a reference to an object in Whiley.
	 *
	 * @author David J. Pearce
	 *
	 */
	public static final class Reference extends Compound  {
		private Reference(Automaton automaton) {
			super(automaton);
		}
		public Type element() {
			int elemIdx = automaton.states[0].children[0];
			return construct(Automata.extract(automaton,elemIdx));
		}
	}

	/**
	 * A type which is either a record, or a union of records. An effective
	 * record gives access to a subset of the visible fields which are
	 * guaranteed to be in the type. For example, consider this type:
	 *
	 * <pre>
	 * {int op, int x} | {int op, [int] y}
	 * </pre>
	 *
	 * Here, the field op is guaranteed to be present. Therefore, the effective
	 * record type is just <code>{int op}</code>.
	 *
	 * @return
	 */
	public interface EffectiveRecord {

		public Type field(String field);

		public HashMap<String,Type> fields();

		public EffectiveRecord update(String field, Type type);
	}

	/**
	 * A record is made up of a number of fields, each of which has a unique
	 * name. Each field has a corresponding type. One can think of a record as a
	 * special kind of "fixed" map (i.e. where we know exactly which
	 * entries we have).
	 *
	 * @author David J. Pearce
	 *
	 */
	public static final class Record extends Compound implements EffectiveRecord {
		private Record(Automaton automaton) {
			super(automaton);
		}

		public boolean isOpen() {
			State state = (State) automaton.states[0].data;
			return state.isOpen;
		}

		/**
		 * Extract just the key set for this field. This is a cheaper operation
		 * than extracting the keys and their types (since types must be
		 * extracted).
		 *
		 * @return
		 */
		public HashSet<String> keys() {
			State fields = (State) automaton.states[0].data;
			HashSet<String> r = new HashSet<String>();
			for(String f : fields) {
				r.add(f);
			}
			return r;
		}

		public Type field(String field) {
			State fields = (State) automaton.states[0].data;
			int index = Collections.binarySearch(fields, field);
			if (index < 0) {
				return null; // not found
			} else {
				int[] children = automaton.states[0].children;
				return construct(Automata.extract(automaton, children[index]));
			}
		}

		/**
		 * Return a mapping from field names to their types.
		 *
		 * @return
		 */
		public HashMap<String, Type> fields() {
			State fields = (State) automaton.states[0].data;
			int[] children = automaton.states[0].children;
			HashMap<String, Type> r = new HashMap<String, Type>();
			for (int i = 0; i != children.length; ++i) {
				r.put(fields.get(i),
						construct(Automata.extract(automaton, children[i])));
			}
			return r;
		}

		public Record update(String field, Type type) {
			HashMap<String,Type> fields = fields();
			fields.put(field, type);
			return Type.Record(isOpen(),fields);
		}

		public static final class State extends ArrayList<String> {
			public final boolean isOpen;

			public State(boolean isOpen) {
				this.isOpen = isOpen;
			}

			public State(boolean isOpen, Collection<String> values) {
				super(values);
				this.isOpen = isOpen;
			}

			public boolean equals(Object o) {
				if (o instanceof State) {
					State s = (State) o;
					return isOpen == s.isOpen && super.equals(s);
				}
				return false;
			}
		}

	}

	/**
	 * A union type represents a type whose variables may hold values from any
	 * of its "bounds". For example, the union type null|int indicates a
	 * variable can either hold an integer value, or null. <b>NOTE:</b>There
	 * must be at least two bounds for a union type to make sense.
	 *
	 * @author David J. Pearce
	 *
	 */
	public static class Union extends Compound {
		private Union(Automaton automaton) {
			super(automaton);
		}

		/**
		 * Return the bounds of this union type.
		 *
		 * @return
		 */
		public HashSet<Type> bounds() {
			HashSet<Type> r = new HashSet<Type>();
			int[] fields = (int[]) automaton.states[0].children;
			for(int i : fields) {
				Type b = construct(Automata.extract(automaton,i));
				r.add(b);
			}
			return r;
		}
	}

	public static final class UnionOfArrays extends Union implements
			EffectiveArray {
		private UnionOfArrays(Automaton automaton) {
			super(automaton);
		}

		public Type key() {
			return T_INT;
		}

		public Type value() {
			return element();
		}

		public Type element() {
			Type r = null;
			HashSet<Type.Array> bounds = (HashSet) bounds();
			for(Type.Array bound : bounds) {
				Type t = bound.element();
				if(r == null || t == null) {
					r = t;
				} else {
					r = Type.Union(r,t);
				}
			}
			return r;
		}

		public EffectiveArray update(Type key, Type type) {
			HashSet<Type> nbounds = new HashSet<Type>();
			HashSet<Type.Array> bounds = (HashSet) bounds();
			for(Type.Array bound : bounds) {
				nbounds.add((Type) bound.update(key,type));
			}

			// we can only safely return an EffectiveList here since an update
			// can fold multiple lists into one.  For example:
			//
			// [int]|[real]
			//
			// assigning type any into this yields [any]

			return (EffectiveArray) Type.Union(nbounds);
		}
	}

	public static final class UnionOfTuples extends Union implements
	EffectiveTuple {
		private UnionOfTuples(Automaton automaton) {
			super(automaton);
		}

		public Type element(int index) {
			Type r = null;
			HashSet<Type.Tuple> bounds = (HashSet) bounds();
			for(Type.Tuple bound : bounds) {
				Type t = bound.element(index);
				if(r == null || t == null) {
					r = t;
				} else {
					r = Type.Union(r,t);
				}
			}
			return r;
		}

		public int size() {
			HashSet<Type.Tuple> bounds = (HashSet) bounds();
			int max = Integer.MAX_VALUE;
			// first, determine maximum number of elements in effective tuple.
			for(Type.Tuple bound : bounds) {
				max = Math.min(max,bound.size());
			}
			return max;
		}

		public ArrayList<Type> elements() {
			HashSet<Type.Tuple> bounds = (HashSet) bounds();
			int max = Integer.MAX_VALUE;
			// first, determine maximum number of elements in effective tuple.
			for(Type.Tuple bound : bounds) {
				max = Math.min(max,bound.size());
			}

			// now, create list of elements
			ArrayList<Type> elements = new ArrayList<Type>();
			for(int i=0;i!=max;++i) {
				Type element = Type.T_VOID;
				for(Type.Tuple bound : bounds) {
					element = Type.Union(bound.element(i),element);
				}
				elements.add(element);
			}
			return elements;
		}
	}

	public static final class UnionOfRecords extends Union implements
			EffectiveRecord {
		private UnionOfRecords(Automaton automaton) {
			super(automaton);
		}

		public Type field(String field) {
			Type r = null;
			HashSet<Type.Record> bounds = (HashSet) bounds();
			for(Type.Record bound : bounds) {
				Type t = bound.field(field);
				if(r == null || t == null) {
					r = t;
				} else {
					r = Type.Union(r,t);
				}
			}
			return r;
		}

		public HashMap<String,Type> fields() {
			// TODO: this method could be optimised to avoid creating so many
			// HashMaps.
			HashMap<String,Type> fields = null;
			HashSet<Type.Record> bounds = (HashSet) bounds();
			for(Type.Record bound : bounds) {
				fields = join(fields,bound.fields());
			}
			return fields;
		}

		private static HashMap<String, Type> join(HashMap<String, Type> m1,
				HashMap<String, Type> m2) {
			if (m1 == null) {
				return m2;
			}
			HashMap<String, Type> m3 = new HashMap<String, Type>();
			for (java.util.Map.Entry<String, Type> e : m1.entrySet()) {
				String field = e.getKey();
				Type t1 = e.getValue();
				Type t2 = m2.get(field);
				if (t2 != null) {
					m3.put(field, Type.Union(t1, t2));
				}
			}
			return m3;
		}

		public EffectiveRecord update(String field, Type type) {
			HashSet<Type> nbounds = new HashSet<Type>();
			HashSet<Type.Record> bounds = (HashSet) bounds();
			for(Type.Record bound : bounds) {
				nbounds.add(bound.update(field, type));
			}

			// we can only safely return an EffectiveRecord here since an update
			// can fold multiple records into one.  For example:
			//
			// {int x,string y}|{int x,real y}
			//
			// updating y to type int gives {int x,int y}

			return (EffectiveRecord) Type.Union(nbounds);
		}
	}

	/**
	 * A difference type represents a type which accepts values in the
	 * difference between its bounds.
	 *
	 * @author David J. Pearce
	 *
	 */
	public static final class Negation extends Compound {
		private Negation(Automaton automaton) {
			super(automaton);
		}

		public Type element() {
			int[] fields = automaton.states[0].children;
			return construct(Automata.extract(automaton,fields[0]));
		}
	}

	public abstract static class FunctionOrMethod extends Compound {
		FunctionOrMethod(Automaton automaton) {
			super(automaton);
		}

		/**
		 * Get the return type of this function or method type.
		 *
		 * @return
		 */
		public Type ret() {
			int[] fields = automaton.states[0].children;
			return construct(Automata.extract(automaton, fields[0]));
		}

		/**
		 * Get the throws clause of this function or method type.
		 *
		 * @return
		 */
		public Type throwsClause() {
			int[] fields = automaton.states[0].children;
			return construct(Automata.extract(automaton, fields[1]));
		}

		/**
		 * Get the parameter types of this function or method type.
		 *
		 * @return
		 */
		public ArrayList<Type> params() {
			int[] fields = automaton.states[0].children;
			ArrayList<Type> r = new ArrayList<Type>();
			for(int i=2;i<fields.length;++i) {
				r.add(construct(Automata.extract(automaton, fields[i])));
			}
			return r;
		}
	}

	/**
	 * A function type, consisting of a list of zero or more parameters and a
	 * return type.
	 *
	 * @author David J. Pearce
	 *
	 */
	public static class Function extends FunctionOrMethod  {
		Function(Automaton automaton) {
			super(automaton);
		}
	}

	public static final class Method extends FunctionOrMethod {
		Method(Automaton automaton) {
			super(automaton);
		}
	}

	/**
	 * The following method constructs a string representation of the underlying
	 * automaton. This representation may be an expanded version of the underling
	 * graph, since one cannot easily represent aliasing in the type graph in a
	 * textual manner.
	 *
	 * @param automaton
	 *            --- the automaton being turned into a string.
	 * @return --- string representation of automaton.
	 */
	public final static String toString(Automaton automaton) {
		// First, we need to find the headers of the computation. This is
		// necessary in order to mark the start of a recursive type.
		BitSet headers = new BitSet(automaton.size());
		BitSet visited = new BitSet(automaton.size());
		BitSet onStack = new BitSet(automaton.size());
		findHeaders(0, visited, onStack, headers, automaton);
		visited.clear();
		String[] titles = new String[automaton.size()];
		int count = 0;
		for (int i = 0; i != automaton.size(); ++i) {
			if (headers.get(i)) {
				titles[i] = headerTitle(count++);
			}
		}
		return Type.toString(0, visited, titles, automaton);
	}

	/**
	 * The following method constructs a string representation of the underlying
	 * automaton. This representation may be an expanded version of the underling
	 * graph, since one cannot easily represent aliasing in the type graph in a
	 * textual manner.
	 *
	 * @param index
	 *            --- the index to start from
	 * @param visited
	 *            --- the set of vertices already visited.
	 * @param headers
	 *            --- an array of strings which identify the name to be given to
	 *            each header.
	 * @param automaton
	 *            --- the automaton being turned into a string.
	 * @return --- string representation of automaton.
	 */
	private final static String toString(int index, BitSet visited,
			String[] headers, Automaton automaton) {
		if (visited.get(index)) {
			// node already visited
			return headers[index];
		} else if(headers[index] != null) {
			visited.set(index);
		}
		State state = automaton.states[index];
		String middle;
		switch (state.kind) {
		case K_VOID:
			return "void";
		case K_ANY:
			return "any";
		case K_NULL:
			return "null";
		case K_BOOL:
			return "bool";
		case K_BYTE:
			return "byte";
		case K_CHAR:
			return "char";
		case K_INT:
			return "int";
		case K_RATIONAL:
			return "real";
		case K_STRING:
			return "string";
		case K_SET: {
			boolean nonEmpty = (Boolean) state.data;
			if (nonEmpty) {
				middle = "{"
						+ toString(state.children[0], visited, headers,
								automaton) + "+}";
			} else {
				middle = "{"
						+ toString(state.children[0], visited, headers,
								automaton) + "}";
			}
			break;
		}
		case K_LIST: {
			middle = toString(state.children[0], visited, headers, automaton)
					+ "[]";
			break;
		}
		case K_NOMINAL:
			middle = state.data.toString();
			break;
		case K_REFERENCE:
			middle = "&" + toString(state.children[0], visited, headers, automaton);
			break;
		case K_NEGATION: {
			middle = "!" + toBracesString(state.children[0], visited, headers, automaton);
			break;
		}
		case K_MAP: {
			// binary node
			String k = toString(state.children[0], visited, headers, automaton);
			String v = toString(state.children[1], visited, headers, automaton);
			middle = "{" + k + "->" + v + "}";
			break;
		}
		case K_UNION: {
			int[] children = state.children;
			middle = "";
			for (int i = 0; i != children.length; ++i) {
				if(i != 0 || children.length == 1) {
					middle += "|";
				}
				middle += toBracesString(children[i], visited, headers, automaton);
			}
			break;
		}
		case K_TUPLE: {
			middle = "";
			int[] children = state.children;
			for (int i = 0; i != children.length; ++i) {
				if (i != 0) {
					middle += ",";
				}
				middle += toString(children[i], visited, headers, automaton);
			}
			middle = "(" + middle + ")";
			break;
		}
		case K_RECORD: {
			// labeled nary node
			middle = "{";
			int[] children = state.children;
			Record.State fields = (Record.State) state.data;
			for (int i = 0; i != fields.size(); ++i) {
				if (i != 0) {
					middle += ",";
				}
				middle += toString(children[i], visited, headers, automaton) + " " + fields.get(i);
			}
			if(fields.isOpen) {
				if(children.length > 0) {
					middle = middle + ",...}";
				} else {
					middle = middle + "...}";
				}
			} else {
				middle = middle + "}";
			}
			break;
		}
		case K_METHOD:
		case K_FUNCTION: {
			middle = "";
			int[] children = state.children;
			int start = 0;
			String ret = toString(children[start], visited, headers, automaton);
			String thros = toString(children[start+1], visited, headers, automaton);
			boolean firstTime=true;
			for (int i = start+2; i != children.length; ++i) {
				if (!firstTime) {
					middle += ",";
				}
				firstTime=false;
				middle += toString(children[i], visited, headers, automaton);
			}
			if(state.kind == K_FUNCTION) {
				middle = "function(" + middle + ") -> " + ret;
			} else {
				middle = "method(" + middle + ") -> " + ret;
			}
			if(!thros.equals("void")) {
				middle = middle + " throws " + thros;
			}
			break;
		}
		default:
			throw new IllegalArgumentException("Invalid type encountered (kind: " + state.kind +")");
		}

		// Finally, check whether this is a header node, or not. If it is a
		// header then we need to insert the recursive type.
		String header = headers[index];
		if(header != null) {
			// The following case is interesting. Basically, we'll never revisit
			// a header. Therefore, if we have multiple edges landing on a
			// header we must update the header string to represent the full
			// type reachable from the header.
			String r = header + "<" + middle + ">";
			headers[index] = r;
			return r;
		} else {
			return middle;
		}
	}

	private final static String toBracesString(int index, BitSet visited,
			String[] headers, Automaton automaton) {
		if (visited.get(index)) {
			// node already visited
			return headers[index];
		}
		String middle = toString(index,visited,headers,automaton);
		State state = automaton.states[index];
		switch(state.kind) {
			case K_UNION:
			case K_FUNCTION:
			case K_METHOD:
				return "(" + middle + ")";
			default:
				return middle;
		}
	}

	/**
	 * The following method traverses the graph using a depth-first
	 * search to identify nodes which are "loop headers". That is, they are the
	 * target of one or more recursive edges in the graph.
	 *
	 * @param index
	 *            --- the index to search from.
	 * @param visited
	 *            --- the set of vertices already visited.
	 * @param onStack
	 *            --- the set of nodes currently on the DFS path from the root.
	 * @param headers
	 *            --- header nodes discovered during this search are set to true
	 *            in this bitset.
	 * @param automaton
	 *            --- the automaton we're traversing.
	 */
	private final static void findHeaders(int index, BitSet visited,
			BitSet onStack, BitSet headers, Automaton automaton) {
		if(visited.get(index)) {
			// node already visited
			if(onStack.get(index)) {
				headers.set(index);
			}
			return;
		}
		onStack.set(index);
		visited.set(index);
		State state = automaton.states[index];
		for(int child : state.children) {
			findHeaders(child,visited,onStack,headers,automaton);
		}
		onStack.set(index,false);
	}

	private static final char[] headers = { 'X','Y','Z','U','V','W','L','M','N','O','P','Q','R','S','T'};
	private static String headerTitle(int count) {
		String r = Character.toString(headers[count%headers.length]);
		int n = count / headers.length;
		if(n > 0) {
			return r + n;
		} else {
			return r;
		}
	}

	/**
	 * Determine the node kind of a Type.Leafs
	 * @param leaf
	 * @return
	 */
	public static final byte leafKind(Type.Leaf leaf) {
		if(leaf instanceof Type.Void) {
			return K_VOID;
		} else if(leaf instanceof Type.Any) {
			return K_ANY;
		} else if(leaf instanceof Type.Null) {
			return K_NULL;
		} else if(leaf instanceof Type.Bool) {
			return K_BOOL;
		} else if(leaf instanceof Type.Byte) {
			return K_BYTE;
		} else if(leaf instanceof Type.Int) {
			return K_INT;
		} else if(leaf instanceof Type.Real) {
			return K_RATIONAL;
		} else if(leaf instanceof Type.Meta) {
			return K_META;
		} else if(leaf instanceof Type.Nominal) {
			return K_NOMINAL;
		} else {
			// should be dead code
			throw new IllegalArgumentException("Invalid leaf node: " + leaf);
		}
	}

	/**
	 * Determine the node data of a Type.Leaf.
	 * @param leaf
	 * @return
	 */
	public static final Object leafData(Type.Leaf leaf) {
		if(leaf instanceof Type.Nominal) {
			return ((Type.Nominal)leaf).nid;
		} else {
			return null;
		}
	}

	/**
	 * The construct methods constructs a Type from an automaton.
	 *
	 * @param nodes
	 * @return
	 */
	public final static Type construct(Automaton automaton) {
		automaton = normalise(automaton);
		// second, construc the appropriate face
		State root = automaton.states[0];
		Type type;

		switch(root.kind) {
		case K_VOID:
			type = T_VOID;
			break;
		case K_ANY:
			type = T_ANY;
			break;
		case K_META:
			type = T_META;
			break;
		case K_NULL:
			type = T_NULL;
			break;
		case K_BOOL:
			type = T_BOOL;
			break;
		case K_BYTE:
			type = T_BYTE;
			break;
		case K_INT:
			type = T_INT;
			break;
		case K_RATIONAL:
			type = T_REAL;
			break;
		case K_NOMINAL:
			type = new Nominal((NameID) root.data);
			break;
		case K_TUPLE:
			type = new Tuple(automaton);
			break;
		case K_LIST:
			type = new Array(automaton);
			break;
		case K_REFERENCE:
			type = new Reference(automaton);
			break;
		case K_RECORD:
			type = new Record(automaton);
			break;
		case K_UNION: {
			boolean allRecords = true;
			boolean allLists = true;
			boolean allTuples = true;
			Type.Union union = new Union(automaton);
			for(Type bound : union.bounds()) {
				boolean isSet = bound instanceof Set;
				boolean isList = bound instanceof Array;
				boolean isMap = bound instanceof Map;
				allRecords &= bound instanceof Record;
				allLists &= isList;
				allTuples &= bound instanceof Tuple;
			}
			if(allLists) {
				type = new UnionOfArrays(automaton);
			} else if(allTuples) {
				type = new UnionOfTuples(automaton);
			} else if(allRecords) {
				type = new UnionOfRecords(automaton);
			} else {
				type = union;
			}
			break;
		}
		case K_NEGATION:
			type = new Negation(automaton);
			break;
		case K_METHOD:
			type = new Method(automaton);
			break;
		case K_FUNCTION:
			type = new Function(automaton);
			break;
		default:
			throw new IllegalArgumentException("invalid node kind: " + root.kind);
		}

		//distinctTypes.add(type);

		return type;
	}

	/**
	 * This method constructs a Node array from an array of types which will
	 * form children.
	 *
	 * @param kind
	 * @param elements
	 * @return
	 */
	private static Type construct(byte kind, Object data, Type... children) {
		int[] nchildren = new int[children.length];
		boolean deterministic = kind != K_UNION;
		Automaton automaton = new Automaton(new State(kind, data, deterministic, nchildren));
		int start = 1;
		int i=0;
		for(Type element : children) {
			nchildren[i] = start;
			Automaton child = destruct(element);
			automaton = Automata.append(automaton,child);
			start += child.size();
			i = i + 1;
		}
		return construct(automaton);
	}

	/**
	 * This method constructs a State array from a collection of types which will
	 * form children.
	 *
	 * @param kind
	 * @param children
	 * @return
	 */
	private static Type construct(byte kind, Object data, Collection<Type> children) {
		int[] nchildren = new int[children.size()];
		boolean deterministic = kind != K_UNION;
		Automaton automaton = new Automaton(new State(kind, data, deterministic, nchildren));
		int start = 1;
		int i=0;
		for(Type element : children) {
			nchildren[i] = start;
			Automaton child = destruct(element);
			automaton = Automata.append(automaton,child);
			start += child.size();
			i = i + 1;
		}

		return construct(automaton);
	}

	/**
	 * Destruct is the opposite of construct. It converts a type into an
	 * automaton.
	 *
	 * @param t --- type to be converted.
	 * @return
	 */
	public static final Automaton destruct(Type t) {
		if (t instanceof Leaf) {
			int kind = leafKind((Leaf) t);
			Object data = null;
			if (t instanceof Nominal) {
				Nominal x = (Nominal) t;
				data = x.nid;
			}
			State state = new State(kind, data, true, Automaton.NOCHILDREN);
			return new Automaton(new State[] { state });
		} else {
			// compound type
			return ((Compound) t).automaton;
		}
	}

	/**
	 * <p>
	 * The following algorithm simplifies a type. For example:
	 * </p>
	 *
	 * <pre>
	 * define InnerList as null|{int data, OuterList next}
	 * define OuterList as null|{int data, InnerList next}
	 * </pre>
	 * <p>
	 * This type is simplified into the following (equivalent) form:
	 * </p>
	 *
	 * <pre>
	 * define LinkedList as null|{int data, LinkedList next}
	 * </pre>
	 * <p>
	 * The simplification algorithm is made up of several different procedures
	 * which operate on the underlying <i>automaton</i> representing the type:
	 * </p>
	 * <ol>
	 * <li><b>Extraction.</b> Here, sub-components unreachable from the root are
	 * eliminated.</li>
	 * <li><b>Simplification.</b> Here, basic simplifications are applied. For
	 * example, eliminating unions of unions.</li>
	 * <li><b>Minimisation.</b>Here, equivalent states are merged together.</li>
	 * <li><b>Canonicalisation.</b> A canonical form of the type is computed</li>
	 * </ol>
	 *
	 * is based on the well-known algorithm for minimising a DFA (see e.g. <a
	 * href="http://en.wikipedia.org/wiki/DFA_minimization">[1]</a>). </p>
	 * <p>
	 * The algorithm operates by performing a subtype test of each node against
	 * all others. From this, we can identify nodes which are equivalent under
	 * the subtype operator. Using this information, the type is reconstructed
	 * such that for each equivalence class only a single node is created.
	 * </p>
	 * <p>
	 * <b>NOTE:</b> this algorithm does not put the type into a canonical form.
	 * Additional work is necessary to do this.
	 * </p>
	 *
	 * @param afterType
	 * @return
	 */
	private static Automaton normalise(Automaton automaton) {
		//normalisedCount++;
		//unminimisedCount += automaton.size();
		TypeAlgorithms.simplify(automaton);
		// TODO: extract in place to avoid allocating data unless necessary
		automaton = Automata.extract(automaton, 0);
		// TODO: minimise in place to avoid allocating data unless necessary
		automaton = Automata.minimise(automaton);
		if(canonicalisation) {
			Automata.canonicalise(automaton, TypeAlgorithms.DATA_COMPARATOR);
		}
		//minimisedCount += automaton.size();
		return automaton;
	}

	public static final byte K_VOID = 0;
	public static final byte K_ANY = 1;
	public static final byte K_META = 2;
	public static final byte K_NULL = 3;
	public static final byte K_BOOL = 4;
	public static final byte K_BYTE = 5;
	public static final byte K_CHAR = 6;
	public static final byte K_INT = 7;
	public static final byte K_RATIONAL = 8;
	public static final byte K_STRING = 9;
	public static final byte K_TUPLE = 10;
	public static final byte K_SET = 11;
	public static final byte K_LIST = 12;
	public static final byte K_MAP = 13;
	public static final byte K_REFERENCE = 14;
	public static final byte K_RECORD = 15;
	public static final byte K_UNION = 16;
	public static final byte K_NEGATION = 17;
	public static final byte K_FUNCTION = 18;
	public static final byte K_METHOD = 20;
	public static final byte K_NOMINAL = 21;

	private static final ArrayList<Automaton> values = new ArrayList<Automaton>();
	private static final HashMap<Automaton,Integer> cache = new HashMap<Automaton,Integer>();

	/**
	 * The following method is for implementing the fly-weight pattern.
	 */
	private static <T extends Automaton> T get(T type) {
		Integer idx = cache.get(type);
		if(idx != null) {
			return (T) values.get(idx);
		} else {
			cache.put(type, values.size());
			values.add(type);
			return type;
		}
	}

	public static void main(String[] args) {
		//Type from = fromString("(null,null)");
		//Type to = fromString("X<[X]>");
		Type from = fromString("!(!{int x,int z} | !{int x,int y})");
		Type to = fromString("{string name,...}");
		System.out.println(from + " :> " + to + " = " + isSubtype(from, to));
		System.out.println(from + " & " + to + " = " + intersect(from,to));
		//System.out.println(from + " - " + to + " = " + intersect(from,Type.Negation(to)));
		//System.out.println(to + " - " + from + " = " + intersect(to,Type.Negation(from)));
		//System.out.println("!" + from + " & !" + to + " = "
		//		+ intersect(Type.Negation(from), Type.Negation(to)));
	}

	public static Type linkedList(int n) {
		NameID label = new NameID(Trie.fromString(""),"X");
		return Recursive(label,innerLinkedList(n));
	}

	public static Type innerLinkedList(int n) {
		if(n == 0) {
			return Nominal(new NameID(Trie.fromString(""),"X"));
		} else {
			Type leaf = Reference(innerLinkedList(n-1));
			HashMap<String,Type> fields = new HashMap<String,Type>();
			fields.put("next", Union(T_NULL,leaf));
			fields.put("data", T_BOOL);
			return Record(false,fields);
		}
	}
}
