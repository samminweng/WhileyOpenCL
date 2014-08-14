import java.io.*;
import java.util.*;
import java.math.BigInteger;
import wyautl.util.BigRational;
import wyautl.io.*;
import wyautl.core.*;
import wyautl.rw.*;
import wyrl.core.*;
import wyrl.util.Runtime;
import wyrl.util.Pair;
import wyrl.util.AbstractRewriteRule;

public final class Closure {
	// term True
	public final static int K_True = 0;
	public final static Automaton.Term True = new Automaton.Term(K_True);

	// term False
	public final static int K_False = 1;
	public final static Automaton.Term False = new Automaton.Term(K_False);

	// term Num(^int)
	public final static int K_Num = 2;
	public final static int Num(Automaton automaton, long r0) {
		int r1 = automaton.add(new Automaton.Int(r0));
		return automaton.add(new Automaton.Term(K_Num, r1));
	}
	public final static int Num(Automaton automaton, BigInteger r0) {
		int r1 = automaton.add(new Automaton.Int(r0));
		return automaton.add(new Automaton.Term(K_Num, r1));
	}

	// term Var(^string)
	public final static int K_Var = 3;
	public final static int Var(Automaton automaton, String r0) {
		int r1 = automaton.add(new Automaton.Strung(r0));
		return automaton.add(new Automaton.Term(K_Var, r1));
	}

	// term And(^{^BExpr<Bool<True|False>|LessThan(^[^Expr<Var(^string)|Num(^int)>,^Expr<Var(^string)|Num(^int)>])>...})
	public final static int K_And = 4;
	public final static int And(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.Set(r0));
		return automaton.add(new Automaton.Term(K_And, r1));
	}
	public final static int And(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.Set(r0));
		return automaton.add(new Automaton.Term(K_And, r1));
	}

	// And({BExpr<Bool<True|False>|LessThan(^[^Expr<Var(^string)|Num(^int)>,^Expr<Var(^string)|Num(^int)>])> x})
	private final static class Reduction_0 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_0(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_And) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.Collection c1 = (Automaton.Collection) s1;
				if(c1.size() == 1) {
					for(int r3=0;r3!=c1.size();++r3) {
						int r2 = c1.get(r3);
						int[] state = {r0, r1, r2, r3};
						activations.add(new Activation(this,null,state));
					}
				}
			}
		}

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
			int r0 = state[0];
			int r2 = state[2]; // x
			int r3 = state[3];
			if(r0 != r2) {
				automaton.rewrite(r0, r2);
				return true;
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 2; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// And({Bool<True|False> b, BExpr<Bool<True|False>|LessThan(^[^Expr<Var(^string)|Num(^int)>,^Expr<Var(^string)|Num(^int)>])> xs...})
	private final static class Reduction_1 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_1(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_And) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.Collection c1 = (Automaton.Collection) s1;
				if(c1.size() >= 1) {
					for(int r3=0;r3!=c1.size();++r3) {
						int r2 = c1.get(r3);
						if(Runtime.accepts(type1,automaton,automaton.get(r2), SCHEMA)) {
							int[] state = {r0, r1, r2, r3, 0};
							activations.add(new Activation(this,null,state));
						}
					}
				}
			}
		}

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
			int r0 = state[0];
			int r2 = state[2]; // b
			int r3 = state[3];
			Automaton.Collection s1 = (Automaton.Collection) automaton.get(state[1]);
			int[] s1children = new int[s1.size() - 1];
			for(int s1i=0, s1j=0; s1i != s1.size();++s1i) {
				if(s1i == r3) { continue; }
				s1children[s1j++] = s1.get(s1i);
			}
			Automaton.Set r4 = new Automaton.Set(s1children);
			Automaton.Term r5 = False;
			Object r6 = (Object) automaton.get(r2);
			boolean r7 = r6.equals(r5);    // b eq False
			if(r7) {
				Automaton.Term r8 = False;
				int r9 = automaton.add(r8);
				if(r0 != r9) {
					automaton.rewrite(r0, r9);
					return true;
				}
			}
			Automaton.Int r10 = r4.lengthOf(); // |xs|
			Automaton.Int r11 = new Automaton.Int(0); // 0
			boolean r12 = r10.equals(r11); // |xs| eq 0
			if(r12) {
				Automaton.Term r13 = True;
				int r14 = automaton.add(r13);
				if(r0 != r14) {
					automaton.rewrite(r0, r14);
					return true;
				}
			}
			int r15 = automaton.add(r4);
			Automaton.Term r16 = new Automaton.Term(K_And, r15);
			int r17 = automaton.add(r16);
			if(r0 != r17) {
				automaton.rewrite(r0, r17);
				return true;
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 2; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// And({And({BExpr<Bool<True|False>|LessThan(^[^Expr<Var(^string)|Num(^int)>,^Expr<Var(^string)|Num(^int)>])> xs...}), BExpr<Bool<True|False>|LessThan(^[^Expr<Var(^string)|Num(^int)>,^Expr<Var(^string)|Num(^int)>])> ys...})
	private final static class Reduction_2 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_2(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_And) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.Collection c1 = (Automaton.Collection) s1;
				if(c1.size() >= 1) {
					for(int r3=0;r3!=c1.size();++r3) {
						int r2 = c1.get(r3);
						Automaton.State s2 = automaton.get(r2);
						if(s2.kind == K_And) {
							Automaton.Term t2 = (Automaton.Term) s2;
							int r4 = t2.contents;
							Automaton.State s4 = automaton.get(r4);
							Automaton.Collection c4 = (Automaton.Collection) s4;
							int[] state = {r0, r1, r2, r3, r4, 0, 0};
							activations.add(new Activation(this,null,state));
						}
					}
				}
			}
		}

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
			int r0 = state[0];
			int r3 = state[3];
			Automaton.Collection s4 = (Automaton.Collection) automaton.get(state[4]);
			int[] s4children = new int[s4.size() - 0];
			for(int s4i=0, s4j=0; s4i != s4.size();++s4i) {
				s4children[s4j++] = s4.get(s4i);
			}
			Automaton.Set r5 = new Automaton.Set(s4children);
			Automaton.Collection s1 = (Automaton.Collection) automaton.get(state[1]);
			int[] s1children = new int[s1.size() - 1];
			for(int s1i=0, s1j=0; s1i != s1.size();++s1i) {
				if(s1i == r3) { continue; }
				s1children[s1j++] = s1.get(s1i);
			}
			Automaton.Set r6 = new Automaton.Set(s1children);
			Automaton.Set r7 = r5.append(r6); // xs append ys
			int r8 = automaton.add(r7);
			Automaton.Term r9 = new Automaton.Term(K_And, r8);
			int r10 = automaton.add(r9);
			if(r0 != r10) {
				automaton.rewrite(r0, r10);
				return true;
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 3; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// term LessThan(^[^Expr<Var(^string)|Num(^int)>,^Expr<Var(^string)|Num(^int)>])
	public final static int K_LessThan = 5;
	public final static int LessThan(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_LessThan, r1));
	}
	public final static int LessThan(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_LessThan, r1));
	}

	// LessThan([Num(int x), Num(int y)])
	private final static class Reduction_3 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_3(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_LessThan) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.List l1 = (Automaton.List) s1;
				int r2 = l1.get(0);
				Automaton.State s2 = automaton.get(r2);
				if(s2.kind == K_Num) {
					Automaton.Term t2 = (Automaton.Term) s2;
					int r3 = t2.contents;
					int r4 = l1.get(1);
					Automaton.State s4 = automaton.get(r4);
					if(s4.kind == K_Num) {
						Automaton.Term t4 = (Automaton.Term) s4;
						int r5 = t4.contents;
						int[] state = {r0, r1, r2, r3, r4, r5};
						activations.add(new Activation(this,null,state));
					}
				}
			}
		}

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
			int r0 = state[0];
			int r3 = state[3]; // x
			int r5 = state[5]; // y
			Automaton.Int r6 = (Automaton.Int) automaton.get(r3);
			Automaton.Int r7 = (Automaton.Int) automaton.get(r5);
			boolean r8 = r6.compareTo(r7)<0; // x lt y
			if(r8) {
				Automaton.Term r9 = True;
				int r10 = automaton.add(r9);
				if(r0 != r10) {
					automaton.rewrite(r0, r10);
					return true;
				}
			}
			Automaton.Term r11 = False;
			int r12 = automaton.add(r11);
			if(r0 != r12) {
				automaton.rewrite(r0, r12);
				return true;
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 5; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// LessThan([Expr<Var(^string)|Num(^int)> e1, Expr<Var(^string)|Num(^int)> e2])
	private final static class Reduction_4 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_4(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_LessThan) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.List l1 = (Automaton.List) s1;
				int r2 = l1.get(0);
				int r3 = l1.get(1);
				int[] state = {r0, r1, r2, r3};
				activations.add(new Activation(this,null,state));
			}
		}

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
			int r0 = state[0];
			int r2 = state[2]; // e1
			int r3 = state[3]; // e2
			boolean r4 = r2 == r3;         // e1 eq e2
			if(r4) {
				Automaton.Term r5 = False;
				int r6 = automaton.add(r5);
				if(r0 != r6) {
					automaton.rewrite(r0, r6);
					return true;
				}
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// And({LessThan([Expr<Var(^string)|Num(^int)> e1, Expr<Var(^string)|Num(^int)> e2]) l1, LessThan([Expr<Var(^string)|Num(^int)> e3, Expr<Var(^string)|Num(^int)> e4]) l2, BExpr<Bool<True|False>|LessThan(^[^Expr<Var(^string)|Num(^int)>,^Expr<Var(^string)|Num(^int)>])> bs...})
	private final static class Inference_0 extends AbstractRewriteRule implements InferenceRule {

		public Inference_0(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_And) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.Collection c1 = (Automaton.Collection) s1;
				if(c1.size() >= 2) {
					for(int r3=0;r3!=c1.size();++r3) {
						int r2 = c1.get(r3);
						Automaton.State s2 = automaton.get(r2);
						if(s2.kind == K_LessThan) {
							Automaton.Term t2 = (Automaton.Term) s2;
							int r4 = t2.contents;
							Automaton.State s4 = automaton.get(r4);
							Automaton.List l4 = (Automaton.List) s4;
							int r5 = l4.get(0);
							int r6 = l4.get(1);
							for(int r8=0;r8!=c1.size();++r8) {
								if(r8 == r3) { continue; }
								int r7 = c1.get(r8);
								Automaton.State s7 = automaton.get(r7);
								if(s7.kind == K_LessThan) {
									Automaton.Term t7 = (Automaton.Term) s7;
									int r9 = t7.contents;
									Automaton.State s9 = automaton.get(r9);
									Automaton.List l9 = (Automaton.List) s9;
									int r10 = l9.get(0);
									int r11 = l9.get(1);
									int[] state = {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, 0};
									activations.add(new Activation(this,null,state));
								}
							}
						}
					}
				}
			}
		}

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
			int r0 = state[0];
			int r2 = state[2]; // l1
			int r3 = state[3];
			int r5 = state[5]; // e1
			int r6 = state[6]; // e2
			int r7 = state[7]; // l2
			int r8 = state[8];
			int r10 = state[10]; // e3
			int r11 = state[11]; // e4
			Automaton.Collection s1 = (Automaton.Collection) automaton.get(state[1]);
			int[] s1children = new int[s1.size() - 2];
			for(int s1i=0, s1j=0; s1i != s1.size();++s1i) {
				if(s1i == r3 || s1i == r8) { continue; }
				s1children[s1j++] = s1.get(s1i);
			}
			Automaton.Set r12 = new Automaton.Set(s1children);
			boolean r13 = r6 == r10;       // e2 eq e3
			if(r13) {
				Automaton.Set r14 = new Automaton.Set(r2, r7); // {l1l2}
				Automaton.List r15 = new Automaton.List(r5, r11); // [e1e4]
				int r16 = automaton.add(r15);
				Automaton.Term r17 = new Automaton.Term(K_LessThan, r16);
				int r18 = automaton.add(r17);
				Automaton.Set r19 = r14.append(r18); // {l1l2} append LessThan([e1e4])
				Automaton.Set r20 = r12.append(r19); // bs append {l1l2} append LessThan([e1e4])
				int r21 = automaton.add(r20);
				Automaton.Term r22 = new Automaton.Term(K_And, r21);
				int r23 = automaton.add(r22);
				if(r0 != r23) {
					automaton.rewrite(r0, r23);
					return true;
				}
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// =========================================================================
	// Schema
	// =========================================================================

	public static final Schema SCHEMA = new Schema(new Schema.Term[]{
		// True
		Schema.Term("True"),
		// False
		Schema.Term("False"),
		// Num(^int)
		Schema.Term("Num",Schema.Int),
		// Var(^string)
		Schema.Term("Var",Schema.String),
		// And(^{^BExpr<Bool<True|False>|LessThan(^[^Expr<Var(^string)|Num(^int)>,^Expr<Var(^string)|Num(^int)>])>...})
		Schema.Term("And",Schema.Set(true)),
		// LessThan(^[^Expr<Var(^string)|Num(^int)>,^Expr<Var(^string)|Num(^int)>])
		Schema.Term("LessThan",Schema.List(true,Schema.Or(Schema.Term("Var",Schema.String), Schema.Term("Num",Schema.Int)),Schema.Any))
	});

	// =========================================================================
	// Types
	// =========================================================================

	// BExpr<Bool<True|False>|LessThan(^[^Expr<Var(^string)|Num(^int)>,^Expr<Var(^string)|Num(^int)>])>
	private static Type type0 = Runtime.Type("CG_F4W6RmGZFjx5Q35BKqRnG4PWtL7Pdq5xBXDyomE3G_RpKq38lXHJOJNgCMOIk3AC4mHDhlIYg2LhZ4G4W6Rmd1TYk4MYoGMts_9UC1EclHPoNKNmGYIppL7vtr5hCmLipmQeZl7f_6Audm5Yk5UgoMV3");
	// Bool<True|False>
	private static Type type1 = Runtime.Type("QFZFjx5Q3G_RpKq3vk1EJOJNgCMOIs2Az3HE7hGHYcYHhgJko2");
	// int
	private static Type type2 = Runtime.Type("Fg0");
	// Expr<Var(^string)|Num(^int)>
	private static Type type3 = Runtime.Type("SFJGs0bRoNKNmGYIppL7Ato5xBXDyomEeZl7vZ3A9dm5Yk2IgoJVo2");

	// =========================================================================
	// Patterns
	// =========================================================================

	private final static Pattern.Term pattern0 = new Pattern.Term("And",
		new Pattern.Set(false, new Pair[]{
			new Pair(new Pattern.Leaf(type0), "x")}),
		null);
	private final static Pattern.Term pattern1 = new Pattern.Term("And",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Leaf(type1), "b"), 
			new Pair(new Pattern.Leaf(type0), "xs")}),
		null);
	private final static Pattern.Term pattern2 = new Pattern.Term("And",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("And",
				new Pattern.Set(true, new Pair[]{
					new Pair(new Pattern.Leaf(type0), "xs")}),
				null),null), 
			new Pair(new Pattern.Leaf(type0), "ys")}),
		null);
	private final static Pattern.Term pattern3 = new Pattern.Term("LessThan",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Term("Num",
				new Pattern.Leaf(type2),
				"x"),null), 
			new Pair(new Pattern.Term("Num",
				new Pattern.Leaf(type2),
				"y"),null)}),
		null);
	private final static Pattern.Term pattern4 = new Pattern.Term("LessThan",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type3), "e1"), 
			new Pair(new Pattern.Leaf(type3), "e2")}),
		null);
	private final static Pattern.Term pattern5 = new Pattern.Term("And",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("LessThan",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type3), "e1"), 
					new Pair(new Pattern.Leaf(type3), "e2")}),
				null), "l1"), 
			new Pair(new Pattern.Term("LessThan",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type3), "e3"), 
					new Pair(new Pattern.Leaf(type3), "e4")}),
				null), "l2"), 
			new Pair(new Pattern.Leaf(type0), "bs")}),
		null);
	// =========================================================================
	// rules
	// =========================================================================

	public static final InferenceRule[] inferences = new InferenceRule[]{
		new Inference_0(pattern5)
	};
	public static final ReductionRule[] reductions = new ReductionRule[]{
		new Reduction_0(pattern0),
		new Reduction_1(pattern1),
		new Reduction_2(pattern2),
		new Reduction_3(pattern3),
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
			StrategyRewriter.Strategy<InferenceRule> inferenceStrategy = new SimpleRewriteStrategy<InferenceRule>(automaton, inferences);
			StrategyRewriter.Strategy<ReductionRule> reductionStrategy = new SimpleRewriteStrategy<ReductionRule>(automaton, reductions);
			StrategyRewriter rw = new StrategyRewriter(automaton,inferenceStrategy, reductionStrategy, SCHEMA);
			rw.apply(10000);
			System.out.print("REWROTE: ");
			print(automaton);
			System.out.println("\n\n=> (" + rw.getStats() + ")\n");
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
