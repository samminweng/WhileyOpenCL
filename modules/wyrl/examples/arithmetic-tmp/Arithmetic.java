import java.io.*;
import java.util.*;
import java.math.BigInteger;
import wyautl.util.BigRational;
import wyautl.io.*;
import wyautl.core.*;
import wyautl.rw.*;
import wyrl.core.*;
import wyrl.util.Runtime;
import wyrl.util.AbstractRewriteRule;
import wyrl.util.Pair;

public final class Arithmetic {
	// term Var(^string)
	public final static int K_Var = 0;
	public final static int Var(Automaton automaton, String r0) {
		int r1 = automaton.add(new Automaton.Strung(r0));
		return automaton.add(new Automaton.Term(K_Var, r1));
	}

	// term $12<Mul($10<^[^real,^{|$3<^AExpr>...|}[$3<^AExpr>...]]>)>
	public final static int K_Mul = 1;
	public final static int Mul(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_Mul, r1));
	}
	public final static int Mul(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_Mul, r1));
	}

	// term $8<Div(^[$2<^AExpr>,$2])>
	public final static int K_Div = 2;
	public final static int Div(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_Div, r1));
	}
	public final static int Div(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_Div, r1));
	}

	// term $12<Sum($10<^[^real,^{|$3<^AExpr>...|}[$3<^AExpr>...]]>)>
	public final static int K_Sum = 3;
	public final static int Sum(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_Sum, r1));
	}
	public final static int Sum(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_Sum, r1));
	}

	// Sum([real n, {||}])
	private final static class Reduction_0 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_0(Pattern pattern) { super(pattern,SCHEMA); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Sum) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.List l1 = (Automaton.List) s1;
				int r2 = l1.get(0);
				int r3 = l1.get(1);
				Automaton.State s3 = automaton.get(r3);
				Automaton.Collection c3 = (Automaton.Collection) s3;
				if(c3.size() == 0) {
					int[] state = {r0, r1, r2, r3};
					activations.add(new Activation(this,null,state));
				}
			}
		}

		public final boolean apply(Automaton automaton, Object _state) {
			int[] state = (int[]) _state;
			int r0 = state[0];
			int r2 = state[2]; // n
			Automaton.Term r4 = new Automaton.Term(K_Num, r2);
			int r5 = automaton.add(r4);
			if(r0 != r5) {
				automaton.rewrite(r0, r5);
				return true;
			}
			return false;
		}
	}
	// Sum([real x, {|Num(real y), $9<AExpr> rest...|}])
	private final static class Reduction_1 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_1(Pattern pattern) { super(pattern,SCHEMA); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Sum) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.List l1 = (Automaton.List) s1;
				int r2 = l1.get(0);
				int r3 = l1.get(1);
				Automaton.State s3 = automaton.get(r3);
				Automaton.Collection c3 = (Automaton.Collection) s3;
				if(c3.size() >= 1) {
					for(int i4=0;i4!=c3.size();++i4) {
						int r4 = c3.get(i4);
						Automaton.State s4 = automaton.get(r4);
						if(s4.kind == K_Num) {
							Automaton.Term t4 = (Automaton.Term) s4;
							int r5 = t4.contents;
							int[] state = {r0, r1, r2, r3, r4, r5, 0};
							activations.add(new Activation(this,null,state));
						}
					}
				}
			}
		}

		public final boolean apply(Automaton automaton, Object _state) {
			int[] state = (int[]) _state;
			int r0 = state[0];
			int r2 = state[2]; // x
			int r5 = state[5]; //y
			Automaton.Collection s3 = (Automaton.Collection) automaton.get(state[3]);
			int[] s3children = new int[s3.size() - 1];
			for(int s3i=0, s3j=0; s3i != s3.size();++s3i) {
				int s3t = s3.get(s3i);
				if(s3t == state[4]) { continue; }
				s3children[s3j++] = s3t;
			}
			Automaton.Bag r6 = new Automaton.Bag(s3children);
			Automaton.Real r7 = (Automaton.Real) automaton.get(r2);
			Automaton.Real r8 = (Automaton.Real) automaton.get(r5);
			Automaton.Real r9 = r7.add(r8); // x add y
			int r10 = automaton.add(r9);
			int r11 = automaton.add(r6);
			Automaton.List r12 = new Automaton.List(r10, r11); // [x add yrest]
			int r13 = automaton.add(r12);
			Automaton.Term r14 = new Automaton.Term(K_Sum, r13);
			int r15 = automaton.add(r14);
			if(r0 != r15) {
				automaton.rewrite(r0, r15);
				return true;
			}
			return false;
		}
	}
	// term True
	public final static int K_True = 4;
	public final static Automaton.Term True = new Automaton.Term(K_True);

	// term False
	public final static int K_False = 5;
	public final static Automaton.Term False = new Automaton.Term(K_False);

	// term $7<And($5<^{^BExpr...}>)>
	public final static int K_And = 6;
	public final static int And(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.Set(r0));
		return automaton.add(new Automaton.Term(K_And, r1));
	}
	public final static int And(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.Set(r0));
		return automaton.add(new Automaton.Term(K_And, r1));
	}

	// And({$9<BExpr> x})
	private final static class Reduction_2 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_2(Pattern pattern) { super(pattern,SCHEMA); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_And) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.Collection c1 = (Automaton.Collection) s1;
				if(c1.size() == 1) {
					for(int i2=0;i2!=c1.size();++i2) {
						int r2 = c1.get(i2);
						int[] state = {r0, r1, r2};
						activations.add(new Activation(this,null,state));
					}
				}
			}
		}

		public final boolean apply(Automaton automaton, Object _state) {
			int[] state = (int[]) _state;
			int r0 = state[0];
			int r2 = state[2]; // x
			if(r0 != r2) {
				automaton.rewrite(r0, r2);
				return true;
			}
			return false;
		}
	}
	// And({Bool b, $9<BExpr> xs...})
	private final static class Reduction_3 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_3(Pattern pattern) { super(pattern,SCHEMA); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_And) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.Collection c1 = (Automaton.Collection) s1;
				if(c1.size() >= 1) {
					for(int i2=0;i2!=c1.size();++i2) {
						int r2 = c1.get(i2);
						if(Runtime.accepts(type3,automaton,automaton.get(r2), SCHEMA)) {
							int[] state = {r0, r1, r2, 0};
							activations.add(new Activation(this,null,state));
						}
					}
				}
			}
		}

		public final boolean apply(Automaton automaton, Object _state) {
			int[] state = (int[]) _state;
			int r0 = state[0];
			int r2 = state[2]; // b
			Automaton.Collection s1 = (Automaton.Collection) automaton.get(state[1]);
			int[] s1children = new int[s1.size() - 1];
			for(int s1i=0, s1j=0; s1i != s1.size();++s1i) {
				int s1t = s1.get(s1i);
				if(s1t == state[2]) { continue; }
				s1children[s1j++] = s1t;
			}
			Automaton.Set r3 = new Automaton.Set(s1children);
			Automaton.Term r4 = False;
			Object r5 = (Object) automaton.get(r2);
			boolean r6 = r5.equals(r4);    // b eq False
			if(r6) {
				Automaton.Term r7 = False;
				int r8 = automaton.add(r7);
				if(r0 != r8) {
					automaton.rewrite(r0, r8);
					return true;
				}
			}
			Automaton.Int r9 = r3.lengthOf(); // |xs|
			Automaton.Int r10 = new Automaton.Int(0); // 0
			boolean r11 = r9.equals(r10);  // |xs| eq 0
			if(r11) {
				Automaton.Term r12 = True;
				int r13 = automaton.add(r12);
				if(r0 != r13) {
					automaton.rewrite(r0, r13);
					return true;
				}
			}
			int r14 = automaton.add(r3);
			Automaton.Term r15 = new Automaton.Term(K_And, r14);
			int r16 = automaton.add(r15);
			if(r0 != r16) {
				automaton.rewrite(r0, r16);
				return true;
			}
			return false;
		}
	}
	// term $7<Or($5<^{^BExpr...}>)>
	public final static int K_Or = 7;
	public final static int Or(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.Set(r0));
		return automaton.add(new Automaton.Term(K_Or, r1));
	}
	public final static int Or(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.Set(r0));
		return automaton.add(new Automaton.Term(K_Or, r1));
	}

	// term Inequality($2<^AExpr>)
	public final static int K_Inequality = 8;
	public final static int Inequality(Automaton automaton, int r0) {
		return automaton.add(new Automaton.Term(K_Inequality, r0));
	}

	// Inequality(Num(real v))
	private final static class Reduction_4 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_4(Pattern pattern) { super(pattern,SCHEMA); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Inequality) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				if(s1.kind == K_Num) {
					Automaton.Term t1 = (Automaton.Term) s1;
					int r2 = t1.contents;
					int[] state = {r0, r1, r2};
					activations.add(new Activation(this,null,state));
				}
			}
		}

		public final boolean apply(Automaton automaton, Object _state) {
			int[] state = (int[]) _state;
			int r0 = state[0];
			int r2 = state[2]; //v
			Automaton.Real r3 = new Automaton.Real(0); // 0.0
			Automaton.Real r4 = (Automaton.Real) automaton.get(r2);
			boolean r5 = r4.compareTo(r3)<0; // v lt 0.0
			if(r5) {
				Automaton.Term r6 = False;
				int r7 = automaton.add(r6);
				if(r0 != r7) {
					automaton.rewrite(r0, r7);
					return true;
				}
			}
			Automaton.Term r8 = True;
			int r9 = automaton.add(r8);
			if(r0 != r9) {
				automaton.rewrite(r0, r9);
				return true;
			}
			return false;
		}
	}
	// term Num(^real)
	public final static int K_Num = 9;
	public final static int Num(Automaton automaton, long r0) {
		int r1 = automaton.add(new Automaton.Real(r0));
		return automaton.add(new Automaton.Term(K_Num, r1));
	}
	public final static int Num(Automaton automaton, BigRational r0) {
		int r1 = automaton.add(new Automaton.Real(r0));
		return automaton.add(new Automaton.Term(K_Num, r1));
	}

	// =========================================================================
	// Schema
	// =========================================================================

	public static final Schema SCHEMA = new Schema(new Schema.Term[]{
		// Var(^string)
		Schema.Term("Var",Schema.String),
		// $12<Mul($10<^[^real,^{|$3<^AExpr>...|}[$3<^AExpr>...]]>)>
		Schema.Term("Mul",Schema.List(true,Schema.Real,Schema.Bag(true))),
		// $8<Div(^[$2<^AExpr>,$2])>
		Schema.Term("Div",Schema.List(true,Schema.Or(Schema.Any, Schema.Term("Num",Schema.Real), Schema.Term("Sum",Schema.List(true,Schema.Any,Schema.Bag(true))), Schema.Term("Mul",Schema.Any), Schema.Term("Var",Schema.String)),Schema.Any)),
		// $12<Sum($10<^[^real,^{|$3<^AExpr>...|}[$3<^AExpr>...]]>)>
		Schema.Term("Sum",Schema.List(true,Schema.Real,Schema.Bag(true))),
		// True
		Schema.Term("True"),
		// False
		Schema.Term("False"),
		// $7<And($5<^{^BExpr...}>)>
		Schema.Term("And",Schema.Set(true)),
		// $7<Or($5<^{^BExpr...}>)>
		Schema.Term("Or",Schema.Set(true)),
		// Inequality($2<^AExpr>)
		Schema.Term("Inequality",Schema.Or(Schema.Term("Num",Schema.Real), Schema.Term("Sum",Schema.List(true,Schema.Any,Schema.Bag(true))), Schema.Term("Mul",Schema.Any), Schema.Term("Div",Schema.List(true,Schema.Any,Schema.Any)), Schema.Term("Var",Schema.String))),
		// Num(^real)
		Schema.Term("Num",Schema.Real)
	});

	// =========================================================================
	// Types
	// =========================================================================

	// real
	private static Type type0 = Runtime.Type("Fc0");
	// $9<AExpr>
	private static Type type1 = Runtime.Type("9GKF4W6RmGYIpp5CIKMQooJSgG2GdO6CL4aRGt3PeWrTQVo7uZJA9dX5Yg2IgoZ9ACmIfV2LeZp7Bdp7SgKDRdHMYkYMgwp7xs4AdCmIECH6f_2Qeoq7ys5AjdH5YwITgcMgo2");
	// $9<BExpr>
	private static Type type2 = Runtime.Type("zG_F4W6RmGZFjx5QoNKNmGIFiG58E86dGHiKLRp45QdGMTGp4PiW6UQVo7uZJA9G3KmKMOIk3ACG_GWlqR_ClIgVK7D_p5PCmDQp1MeZl7ws4AUdmHYZq9jca9fCHEglHQYs2Qgw5K0K3Tk8b9B5YwYTgg6CDKMQoBKShGIIpl5C3_aSGWqY0eWe0il585YZbXGAA5ecl7xpNkXYl7uh1DN5eZOBHYWal7SgOZ2bW9S5Ysbb0AU5Ywbb0Ad5YcbTYoleGDg5eoPB1XWf0Aj5lHE");
	// Bool
	private static Type type3 = Runtime.Type("QFZFjx5Q3G_RpKq3vk1EJOJNgCMOIs2Az3HE7hGHYcYHhgJko2");

	// =========================================================================
	// Patterns
	// =========================================================================

	private final static Pattern pattern0 = new Pattern.Term("Sum",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type0), "n"), 
			new Pair(new Pattern.Bag(false, new Pair[]{}),null)}),
		null);
	private final static Pattern pattern1 = new Pattern.Term("Sum",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type0), "x"), 
			new Pair(new Pattern.Bag(true, new Pair[]{
				new Pair(new Pattern.Term("Num",
					new Pattern.Leaf(type0),
					"y"),null), 
				new Pair(new Pattern.Leaf(type1), "rest")}),null)}),
		null);
	private final static Pattern pattern2 = new Pattern.Term("And",
		new Pattern.Set(false, new Pair[]{
			new Pair(new Pattern.Leaf(type2), "x")}),
		null);
	private final static Pattern pattern3 = new Pattern.Term("And",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Leaf(type3), "b"), 
			new Pair(new Pattern.Leaf(type2), "xs")}),
		null);
	private final static Pattern pattern4 = new Pattern.Term("Inequality",
		new Pattern.Term("Num",
			new Pattern.Leaf(type0),
			"v"),
		null);
	// =========================================================================
	// rules
	// =========================================================================

	public static final InferenceRule[] inferences = new InferenceRule[]{

	};
	public static final ReductionRule[] reductions = new ReductionRule[]{
		new Reduction_0(pattern0)		,
new Reduction_1(pattern1)		,
new Reduction_2(pattern2)		,
new Reduction_3(pattern3)		,
new Reduction_4(pattern4)
	};


	// =========================================================================
	// Main Method
	// =========================================================================

	public static void main(String[] args) throws IOException {
		try {
			PrettyAutomataReader reader = new PrettyAutomataReader(System.in,SCHEMA);
			PrettyAutomataWriter writer = new PrettyAutomataWriter(System.out,SCHEMA);
			Automaton automaton = reader.read();
			System.out.print("PARSED: ");
			print(automaton);
			new SimpleRewriter(inferences,reductions,SCHEMA).apply(automaton);
			System.out.print("REWROTE: ");
			print(automaton);
		} catch(PrettyAutomataReader.SyntaxError ex) {
			System.err.println(ex.getMessage());
		}
	}
	
	static void print(Automaton automaton) {
		try {
			PrettyAutomataWriter writer = new PrettyAutomataWriter(System.out,SCHEMA);
			writer.write(automaton);
			writer.flush();
			System.out.println();
		} catch(IOException e) { System.err.println("I/O error printing automaton"); }
	}
}
