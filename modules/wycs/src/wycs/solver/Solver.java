package wycs.solver;

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

public final class Solver {
	// term $4<NotT($2<^Type<$4|Atom<NotT($16<^Proton<TupleT(^[$16...])|SetT(^[^bool,$16])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$16...])|SetT(^[^bool,$16])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|OrT(^{$2...})|AndT(^{$2...})|SetT(^[^bool,$2])|TupleT(^[$2...])|FunctionT(^[$2,$2,$2...])>>)>
	public final static int K_NotT = 0;
	public final static int NotT(Automaton automaton, int r0) {
		return automaton.add(new Automaton.Term(K_NotT, r0));
	}

	// Not_1
	private final static class Reduction_0 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_0(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_NotT) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				if(Runtime.accepts(type0,automaton,automaton.get(r1), SCHEMA)) {
					int[] state = {r0, r1};
					activations.add(new Activation(this,null,state));
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			Automaton.Term r2 = VoidT;
			int r3 = automaton.add(r2);
			if(r0 != r3) {
				return automaton.rewrite(r0, r3);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Not_1"; }
		public final int rank() { return 0; }

		public final int minimum() { return 1; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Not_2
	private final static class Reduction_1 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_1(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_NotT) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				if(Runtime.accepts(type1,automaton,automaton.get(r1), SCHEMA)) {
					int[] state = {r0, r1};
					activations.add(new Activation(this,null,state));
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			Automaton.Term r2 = AnyT;
			int r3 = automaton.add(r2);
			if(r0 != r3) {
				return automaton.rewrite(r0, r3);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Not_2"; }
		public final int rank() { return 0; }

		public final int minimum() { return 1; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Not_3
	private final static class Reduction_2 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_2(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_NotT) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				if(s1.kind == K_NotT) {
					Automaton.Term t1 = (Automaton.Term) s1;
					int r2 = t1.contents;
					int[] state = {r0, r1, r2};
					activations.add(new Activation(this,null,state));
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r2 = state[2]; // t
			if(r0 != r2) {
				return automaton.rewrite(r0, r2);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Not_3"; }
		public final int rank() { return 0; }

		public final int minimum() { return 1; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Not_4
	private final static class Reduction_3 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_3(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_NotT) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				if(s1.kind == K_OrT) {
					Automaton.Term t1 = (Automaton.Term) s1;
					int r2 = t1.contents;
					Automaton.State s2 = automaton.get(r2);
					Automaton.Collection c2 = (Automaton.Collection) s2;
					int[] state = {r0, r1, r2, 0};
					activations.add(new Activation(this,null,state));
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			Automaton.Collection s2 = (Automaton.Collection) automaton.get(state[2]);
			int[] s2children = new int[s2.size() - 0];
			for(int s2i=0, s2j=0; s2i != s2.size();++s2i) {
				s2children[s2j++] = s2.get(s2i);
			}
			Automaton.Set r3 = new Automaton.Set(s2children);
			Automaton.List t4 = new Automaton.List();
			for(int i5=0;i5<r3.size();i5++) {
				int r5 = (int) r3.get(i5);
				Automaton.Term r6 = new Automaton.Term(K_NotT, r5);
				int r7 = automaton.add(r6);
				t4.add(r7);
			}
			Automaton.Set r4 = new Automaton.Set(t4.toArray());
			int r8 = automaton.add(r4);
			Automaton.Term r9 = new Automaton.Term(K_AndT, r8);
			int r10 = automaton.add(r9);
			if(r0 != r10) {
				return automaton.rewrite(r0, r10);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Not_4"; }
		public final int rank() { return 1; }

		public final int minimum() { return 2; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Not_5
	private final static class Reduction_4 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_4(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_NotT) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				if(s1.kind == K_AndT) {
					Automaton.Term t1 = (Automaton.Term) s1;
					int r2 = t1.contents;
					Automaton.State s2 = automaton.get(r2);
					Automaton.Collection c2 = (Automaton.Collection) s2;
					int[] state = {r0, r1, r2, 0};
					activations.add(new Activation(this,null,state));
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			Automaton.Collection s2 = (Automaton.Collection) automaton.get(state[2]);
			int[] s2children = new int[s2.size() - 0];
			for(int s2i=0, s2j=0; s2i != s2.size();++s2i) {
				s2children[s2j++] = s2.get(s2i);
			}
			Automaton.Set r3 = new Automaton.Set(s2children);
			Automaton.List t4 = new Automaton.List();
			for(int i5=0;i5<r3.size();i5++) {
				int r5 = (int) r3.get(i5);
				Automaton.Term r6 = new Automaton.Term(K_NotT, r5);
				int r7 = automaton.add(r6);
				t4.add(r7);
			}
			Automaton.Set r4 = new Automaton.Set(t4.toArray());
			int r8 = automaton.add(r4);
			Automaton.Term r9 = new Automaton.Term(K_OrT, r8);
			int r10 = automaton.add(r9);
			if(r0 != r10) {
				return automaton.rewrite(r0, r10);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Not_5"; }
		public final int rank() { return 2; }

		public final int minimum() { return 2; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// term $7<AndT($5<^{$2<^Type<$7|Atom<NotT($19<^Proton<TupleT(^[$19...])|SetT(^[^bool,$19])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$19...])|SetT(^[^bool,$19])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($2)|OrT($5)|SetT(^[^bool,$2])|TupleT(^[$2...])|FunctionT(^[$2,$2,$2...])>>...}>)>
	public final static int K_AndT = 1;
	public final static int AndT(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.Set(r0));
		return automaton.add(new Automaton.Term(K_AndT, r1));
	}
	public final static int AndT(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.Set(r0));
		return automaton.add(new Automaton.Term(K_AndT, r1));
	}

	// AndType_1
	private final static class Reduction_5 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_5(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_AndT) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.Collection c1 = (Automaton.Collection) s1;
				if(c1.size() == 0) {
					int[] state = {r0, r1};
					activations.add(new Activation(this,null,state));
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			Automaton.Term r2 = VoidT;
			int r3 = automaton.add(r2);
			if(r0 != r3) {
				return automaton.rewrite(r0, r3);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "AndType_1"; }
		public final int rank() { return 0; }

		public final int minimum() { return 1; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// AndType_2
	private final static class Reduction_6 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_6(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_AndT) {
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

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r2 = state[2]; // t
			int r3 = state[3];
			if(r0 != r2) {
				return automaton.rewrite(r0, r2);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "AndType_2"; }
		public final int rank() { return 0; }

		public final int minimum() { return 2; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// AndType_3
	private final static class Reduction_7 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_7(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_AndT) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.Collection c1 = (Automaton.Collection) s1;
				if(c1.size() >= 1) {
					for(int r3=0;r3!=c1.size();++r3) {
						int r2 = c1.get(r3);
						Automaton.State s2 = automaton.get(r2);
						if(s2.kind == K_AndT) {
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

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
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
			Automaton.Term r9 = new Automaton.Term(K_AndT, r8);
			int r10 = automaton.add(r9);
			if(r0 != r10) {
				return automaton.rewrite(r0, r10);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "AndType_3"; }
		public final int rank() { return 1; }

		public final int minimum() { return 3; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// AndType_4
	private final static class Reduction_8 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_8(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_AndT) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.Collection c1 = (Automaton.Collection) s1;
				if(c1.size() >= 1) {
					for(int r3=0;r3!=c1.size();++r3) {
						int r2 = c1.get(r3);
						Automaton.State s2 = automaton.get(r2);
						if(s2.kind == K_OrT) {
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

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
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
			Automaton.List t7 = new Automaton.List();
			for(int i8=0;i8<r5.size();i8++) {
				int r8 = (int) r5.get(i8);
				Automaton.Set r9 = r6.appendFront(r8); // x append ys
				int r10 = automaton.add(r9);
				Automaton.Term r11 = new Automaton.Term(K_AndT, r10);
				int r12 = automaton.add(r11);
				t7.add(r12);
			}
			Automaton.Set r7 = new Automaton.Set(t7.toArray());
			int r13 = automaton.add(r7);
			Automaton.Term r14 = new Automaton.Term(K_OrT, r13);
			int r15 = automaton.add(r14);
			if(r0 != r15) {
				return automaton.rewrite(r0, r15);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "AndType_4"; }
		public final int rank() { return 3; }

		public final int minimum() { return 3; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// term $7<OrT($5<^{$2<^Type<$7|Atom<NotT($19<^Proton<TupleT(^[$19...])|SetT(^[^bool,$19])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$19...])|SetT(^[^bool,$19])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($2)|AndT($5)|SetT(^[^bool,$2])|TupleT(^[$2...])|FunctionT(^[$2,$2,$2...])>>...}>)>
	public final static int K_OrT = 2;
	public final static int OrT(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.Set(r0));
		return automaton.add(new Automaton.Term(K_OrT, r1));
	}
	public final static int OrT(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.Set(r0));
		return automaton.add(new Automaton.Term(K_OrT, r1));
	}

	// OrType_1
	private final static class Reduction_9 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_9(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_OrT) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.Collection c1 = (Automaton.Collection) s1;
				if(c1.size() == 0) {
					int[] state = {r0, r1};
					activations.add(new Activation(this,null,state));
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			Automaton.Term r2 = VoidT;
			int r3 = automaton.add(r2);
			if(r0 != r3) {
				return automaton.rewrite(r0, r3);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "OrType_1"; }
		public final int rank() { return 0; }

		public final int minimum() { return 1; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// OrType_2
	private final static class Reduction_10 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_10(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_OrT) {
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

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r2 = state[2]; // t
			int r3 = state[3];
			if(r0 != r2) {
				return automaton.rewrite(r0, r2);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "OrType_2"; }
		public final int rank() { return 0; }

		public final int minimum() { return 2; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// OrType_3
	private final static class Reduction_11 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_11(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_OrT) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.Collection c1 = (Automaton.Collection) s1;
				if(c1.size() >= 1) {
					for(int r3=0;r3!=c1.size();++r3) {
						int r2 = c1.get(r3);
						Automaton.State s2 = automaton.get(r2);
						if(s2.kind == K_OrT) {
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

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
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
			Automaton.Term r9 = new Automaton.Term(K_OrT, r8);
			int r10 = automaton.add(r9);
			if(r0 != r10) {
				return automaton.rewrite(r0, r10);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "OrType_3"; }
		public final int rank() { return 1; }

		public final int minimum() { return 3; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// term $7<TupleT(^[$2<^Type<$7|Atom<NotT($19<^Proton<TupleT(^[$19...])|SetT(^[^bool,$19])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$19...])|SetT(^[^bool,$19])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($2)|OrT(^{$2...})|AndT(^{$2...})|SetT(^[^bool,$2])|FunctionT(^[$2,$2,$2...])>>...])>
	public final static int K_TupleT = 3;
	public final static int TupleT(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_TupleT, r1));
	}
	public final static int TupleT(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_TupleT, r1));
	}

	// TupleType_1
	private final static class Reduction_12 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_12(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_TupleT) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.List l1 = (Automaton.List) s1;
				int[] state = {r0, r1, 0};
				activations.add(new Activation(this,null,state));
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			Automaton.List r2 = ((Automaton.List) automaton.get(state[1])).sublist(0);
			Automaton.Term r3 = VoidT;
			int r4 = automaton.add(r3);
			boolean r5 = r2.contains(r4);  // VoidT in ts
			if(r5) {
				Automaton.Term r6 = VoidT;
				int r7 = automaton.add(r6);
				if(r0 != r7) {
					return automaton.rewrite(r0, r7);
				}
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "TupleType_1"; }
		public final int rank() { return 0; }

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// TupleType_1b
	private final static class Reduction_13 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_13(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_TupleT) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.List l1 = (Automaton.List) s1;
				int[] state = {r0, r1, 0};
				activations.add(new Activation(this,null,state));
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			Automaton.List r2 = ((Automaton.List) automaton.get(state[1])).sublist(0);
			Automaton.Int r3 = r2.lengthOf(); // |ts|
			Automaton.Int r4 = new Automaton.Int(0); // 0
			boolean r5 = r3.equals(r4);    // |ts| eq 0
			if(r5) {
				Automaton.Term r6 = VoidT;
				int r7 = automaton.add(r6);
				if(r0 != r7) {
					return automaton.rewrite(r0, r7);
				}
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "TupleType_1b"; }
		public final int rank() { return 0; }

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// TupleType_1c
	private final static class Reduction_14 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_14(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_TupleT) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.List l1 = (Automaton.List) s1;
				if(l1.size() == 1) {
					int r2 = l1.get(0);
					int[] state = {r0, r1, r2};
					activations.add(new Activation(this,null,state));
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r2 = state[2]; // t
			if(r0 != r2) {
				return automaton.rewrite(r0, r2);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "TupleType_1c"; }
		public final int rank() { return 0; }

		public final int minimum() { return 2; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// TupleType_2
	private final static class Reduction_15 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_15(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_AndT) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.Collection c1 = (Automaton.Collection) s1;
				if(c1.size() >= 2) {
					for(int r3=0;r3!=c1.size();++r3) {
						int r2 = c1.get(r3);
						Automaton.State s2 = automaton.get(r2);
						if(s2.kind == K_TupleT) {
							Automaton.Term t2 = (Automaton.Term) s2;
							int r4 = t2.contents;
							Automaton.State s4 = automaton.get(r4);
							Automaton.List l4 = (Automaton.List) s4;
							for(int r7=0;r7!=c1.size();++r7) {
								if(r7 == r3) { continue; }
								int r6 = c1.get(r7);
								Automaton.State s6 = automaton.get(r6);
								if(s6.kind == K_TupleT) {
									Automaton.Term t6 = (Automaton.Term) s6;
									int r8 = t6.contents;
									Automaton.State s8 = automaton.get(r8);
									Automaton.List l8 = (Automaton.List) s8;
									int[] state = {r0, r1, r2, r3, r4, 0, r6, r7, r8, 0, 0};
									activations.add(new Activation(this,null,state));
								}
							}
						}
					}
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r3 = state[3];
			Automaton.List r5 = ((Automaton.List) automaton.get(state[4])).sublist(0);
			int r7 = state[7];
			Automaton.List r9 = ((Automaton.List) automaton.get(state[8])).sublist(0);
			Automaton.Collection s1 = (Automaton.Collection) automaton.get(state[1]);
			int[] s1children = new int[s1.size() - 2];
			for(int s1i=0, s1j=0; s1i != s1.size();++s1i) {
				if(s1i == r3 || s1i == r7) { continue; }
				s1children[s1j++] = s1.get(s1i);
			}
			Automaton.Set r10 = new Automaton.Set(s1children);
			Automaton.Int r11 = r5.lengthOf(); // |t1s|
			Automaton.Int r12 = r9.lengthOf(); // |t2s|
			boolean r13 = !r11.equals(r12); // |t1s| neq |t2s|
			if(r13) {
				Automaton.Term r14 = VoidT;
				int r15 = automaton.add(r14);
				if(r0 != r15) {
					return automaton.rewrite(r0, r15);
				}
			}
			Automaton.Int r17 = new Automaton.Int(0); // 0
			Automaton.Int r18 = r5.lengthOf(); // |t1s|
			Automaton.List r19 = Runtime.rangeOf(automaton,r17,r18); // 0 range |t1s|
			Automaton.List t16 = new Automaton.List();
			for(int i20=0;i20<r19.size();i20++) {
				Automaton.Int r20 = (Automaton.Int) automaton.get(r19.get(i20));;
				int r21 = r5.indexOf(r20);     // t1s[i]
				int r22 = r9.indexOf(r20);     // t2s[i]
				Automaton.Set r23 = new Automaton.Set(r21, r22); // {t1s[i]t2s[i]}
				int r24 = automaton.add(r23);
				Automaton.Term r25 = new Automaton.Term(K_AndT, r24);
				int r26 = automaton.add(r25);
				t16.add(r26);
			}
			Automaton.List r16 = t16;
			int r27 = automaton.add(r16);
			Automaton.Term r28 = new Automaton.Term(K_TupleT, r27);
			int r29 = automaton.add(r28);
			Automaton.Set r30 = r10.appendFront(r29); // TupleT(r) append ts
			int r31 = automaton.add(r30);
			Automaton.Term r32 = new Automaton.Term(K_AndT, r31);
			int r33 = automaton.add(r32);
			if(r0 != r33) {
				return automaton.rewrite(r0, r33);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "TupleType_2"; }
		public final int rank() { return 2; }

		public final int minimum() { return 5; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// TupleType_3
	private final static class Reduction_16 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_16(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_AndT) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.Collection c1 = (Automaton.Collection) s1;
				if(c1.size() >= 2) {
					for(int r3=0;r3!=c1.size();++r3) {
						int r2 = c1.get(r3);
						Automaton.State s2 = automaton.get(r2);
						if(s2.kind == K_TupleT) {
							Automaton.Term t2 = (Automaton.Term) s2;
							int r4 = t2.contents;
							Automaton.State s4 = automaton.get(r4);
							Automaton.List l4 = (Automaton.List) s4;
							for(int r7=0;r7!=c1.size();++r7) {
								if(r7 == r3) { continue; }
								int r6 = c1.get(r7);
								Automaton.State s6 = automaton.get(r6);
								if(s6.kind == K_NotT) {
									Automaton.Term t6 = (Automaton.Term) s6;
									int r8 = t6.contents;
									Automaton.State s8 = automaton.get(r8);
									if(s8.kind == K_TupleT) {
										Automaton.Term t8 = (Automaton.Term) s8;
										int r9 = t8.contents;
										Automaton.State s9 = automaton.get(r9);
										Automaton.List l9 = (Automaton.List) s9;
										int[] state = {r0, r1, r2, r3, r4, 0, r6, r7, r8, r9, 0, 0};
										activations.add(new Activation(this,null,state));
									}
								}
							}
						}
					}
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r2 = state[2]; // t1
			int r3 = state[3];
			Automaton.List r5 = ((Automaton.List) automaton.get(state[4])).sublist(0);
			int r7 = state[7];
			Automaton.List r10 = ((Automaton.List) automaton.get(state[9])).sublist(0);
			Automaton.Collection s1 = (Automaton.Collection) automaton.get(state[1]);
			int[] s1children = new int[s1.size() - 2];
			for(int s1i=0, s1j=0; s1i != s1.size();++s1i) {
				if(s1i == r3 || s1i == r7) { continue; }
				s1children[s1j++] = s1.get(s1i);
			}
			Automaton.Set r11 = new Automaton.Set(s1children);
			Automaton.Int r12 = r5.lengthOf(); // |t1s|
			Automaton.Int r13 = r10.lengthOf(); // |t2s|
			boolean r14 = !r12.equals(r13); // |t1s| neq |t2s|
			if(r14) {
				Automaton.Set r15 = r11.appendFront(r2); // t1 append ts
				int r16 = automaton.add(r15);
				Automaton.Term r17 = new Automaton.Term(K_AndT, r16);
				int r18 = automaton.add(r17);
				if(r0 != r18) {
					return automaton.rewrite(r0, r18);
				}
			}
			Automaton.Int r19 = r5.lengthOf(); // |t1s|
			Automaton.Int r20 = new Automaton.Int(0); // 0
			boolean r21 = r19.equals(r20); // |t1s| eq 0
			if(r21) {
				Automaton.Term r22 = VoidT;
				int r23 = automaton.add(r22);
				if(r0 != r23) {
					return automaton.rewrite(r0, r23);
				}
			}
			Automaton.Int r25 = new Automaton.Int(0); // 0
			Automaton.Int r26 = r5.lengthOf(); // |t1s|
			Automaton.List r27 = Runtime.rangeOf(automaton,r25,r26); // 0 range |t1s|
			Automaton.List t24 = new Automaton.List();
			for(int i28=0;i28<r27.size();i28++) {
				Automaton.Int r28 = (Automaton.Int) automaton.get(r27.get(i28));;
				int r29 = r5.indexOf(r28);     // t1s[i]
				int r30 = r10.indexOf(r28);    // t2s[i]
				Automaton.Term r31 = new Automaton.Term(K_NotT, r30);
				int r32 = automaton.add(r31);
				Automaton.Set r33 = new Automaton.Set(r29, r32); // {t1s[i]NotT(t2s[i])}
				int r34 = automaton.add(r33);
				Automaton.Term r35 = new Automaton.Term(K_AndT, r34);
				int r36 = automaton.add(r35);
				t24.add(r36);
			}
			Automaton.List r24 = t24;
			int r37 = automaton.add(r24);
			Automaton.Term r38 = new Automaton.Term(K_TupleT, r37);
			int r39 = automaton.add(r38);
			Automaton.Set r40 = r11.appendFront(r39); // TupleT(r) append ts
			int r41 = automaton.add(r40);
			Automaton.Term r42 = new Automaton.Term(K_AndT, r41);
			int r43 = automaton.add(r42);
			if(r0 != r43) {
				return automaton.rewrite(r0, r43);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "TupleType_3"; }
		public final int rank() { return 2; }

		public final int minimum() { return 6; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// term $9<SetT(^[^bool,$3<^Type<$9|Atom<NotT($21<^Proton<TupleT(^[$21...])|SetT(^[^bool,$21])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$21...])|SetT(^[^bool,$21])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($3)|OrT(^{$3...})|AndT(^{$3...})|TupleT(^[$3...])|FunctionT(^[$3,$3,$3...])>>])>
	public final static int K_SetT = 4;
	public final static int SetT(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_SetT, r1));
	}
	public final static int SetT(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_SetT, r1));
	}

	// SetType_1
	private final static class Reduction_17 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_17(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_SetT) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.List l1 = (Automaton.List) s1;
				int r2 = l1.get(0);
				int r3 = l1.get(1);
				if(Runtime.accepts(type1,automaton,automaton.get(r3), SCHEMA)) {
					int[] state = {r0, r1, r2, r3};
					activations.add(new Activation(this,null,state));
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r2 = state[2]; // b
			boolean r4 = ((Automaton.Bool)automaton.get(r2)).value;
			boolean r5 = !r4;              // !b
			if(r5) {
				Automaton.Term r6 = VoidT;
				int r7 = automaton.add(r6);
				if(r0 != r7) {
					return automaton.rewrite(r0, r7);
				}
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "SetType_1"; }
		public final int rank() { return 0; }

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// SetType_2
	private final static class Reduction_18 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_18(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_AndT) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.Collection c1 = (Automaton.Collection) s1;
				if(c1.size() >= 2) {
					for(int r3=0;r3!=c1.size();++r3) {
						int r2 = c1.get(r3);
						Automaton.State s2 = automaton.get(r2);
						if(s2.kind == K_SetT) {
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
								if(s7.kind == K_SetT) {
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

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r3 = state[3];
			int r5 = state[5]; // b1
			int r6 = state[6]; // t1
			int r8 = state[8];
			int r10 = state[10]; // b2
			int r11 = state[11]; // t2
			Automaton.Collection s1 = (Automaton.Collection) automaton.get(state[1]);
			int[] s1children = new int[s1.size() - 2];
			for(int s1i=0, s1j=0; s1i != s1.size();++s1i) {
				if(s1i == r3 || s1i == r8) { continue; }
				s1children[s1j++] = s1.get(s1i);
			}
			Automaton.Set r12 = new Automaton.Set(s1children);
			boolean r13 = ((Automaton.Bool)automaton.get(r5)).value;
			boolean r14 = false;           // b1 && b2
			if(r13) {
				boolean r15 = ((Automaton.Bool)automaton.get(r10)).value;
				r14 = r15;
			}
			int r16 = automaton.add(r14 ? Automaton.TRUE : Automaton.FALSE);
			Automaton.Set r17 = new Automaton.Set(r6, r11); // {t1t2}
			int r18 = automaton.add(r17);
			Automaton.Term r19 = new Automaton.Term(K_AndT, r18);
			int r20 = automaton.add(r19);
			Automaton.List r21 = new Automaton.List(r16, r20); // [b1 && b2AndT({t1t2})]
			int r22 = automaton.add(r21);
			Automaton.Term r23 = new Automaton.Term(K_SetT, r22);
			int r24 = automaton.add(r23);
			Automaton.Set r25 = r12.appendFront(r24); // SetT([b1 && b2AndT({t1t2})]) append ts
			int r26 = automaton.add(r25);
			Automaton.Term r27 = new Automaton.Term(K_AndT, r26);
			int r28 = automaton.add(r27);
			if(r0 != r28) {
				return automaton.rewrite(r0, r28);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "SetType_2"; }
		public final int rank() { return 2; }

		public final int minimum() { return 9; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// SetType_3
	private final static class Reduction_19 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_19(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_AndT) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.Collection c1 = (Automaton.Collection) s1;
				if(c1.size() >= 2) {
					for(int r3=0;r3!=c1.size();++r3) {
						int r2 = c1.get(r3);
						Automaton.State s2 = automaton.get(r2);
						if(s2.kind == K_SetT) {
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
								if(s7.kind == K_NotT) {
									Automaton.Term t7 = (Automaton.Term) s7;
									int r9 = t7.contents;
									Automaton.State s9 = automaton.get(r9);
									if(s9.kind == K_SetT) {
										Automaton.Term t9 = (Automaton.Term) s9;
										int r10 = t9.contents;
										Automaton.State s10 = automaton.get(r10);
										Automaton.List l10 = (Automaton.List) s10;
										int r11 = l10.get(0);
										int r12 = l10.get(1);
										int[] state = {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, 0};
										activations.add(new Activation(this,null,state));
									}
								}
							}
						}
					}
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r3 = state[3];
			int r5 = state[5]; // b1
			int r6 = state[6]; // t1
			int r8 = state[8];
			int r11 = state[11]; // b2
			int r12 = state[12]; // t2
			Automaton.Collection s1 = (Automaton.Collection) automaton.get(state[1]);
			int[] s1children = new int[s1.size() - 2];
			for(int s1i=0, s1j=0; s1i != s1.size();++s1i) {
				if(s1i == r3 || s1i == r8) { continue; }
				s1children[s1j++] = s1.get(s1i);
			}
			Automaton.Set r13 = new Automaton.Set(s1children);
			boolean r14 = ((Automaton.Bool)automaton.get(r5)).value;
			boolean r15 = false;           // b1 && !b2
			if(r14) {
				boolean r16 = ((Automaton.Bool)automaton.get(r11)).value;
				boolean r17 = !r16;            // !b2
				r15 = r17;
			}
			int r18 = automaton.add(r15 ? Automaton.TRUE : Automaton.FALSE);
			Automaton.Term r19 = new Automaton.Term(K_NotT, r12);
			int r20 = automaton.add(r19);
			Automaton.Set r21 = new Automaton.Set(r6, r20); // {t1NotT(t2)}
			int r22 = automaton.add(r21);
			Automaton.Term r23 = new Automaton.Term(K_AndT, r22);
			int r24 = automaton.add(r23);
			Automaton.List r25 = new Automaton.List(r18, r24); // [b1 && !b2AndT({t1NotT(t2)})]
			int r26 = automaton.add(r25);
			Automaton.Term r27 = new Automaton.Term(K_SetT, r26);
			int r28 = automaton.add(r27);
			Automaton.Set r29 = r13.appendFront(r28); // SetT([b1 && !b2AndT({t1NotT(t2)})]) append ts
			int r30 = automaton.add(r29);
			Automaton.Term r31 = new Automaton.Term(K_AndT, r30);
			int r32 = automaton.add(r31);
			if(r0 != r32) {
				return automaton.rewrite(r0, r32);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "SetType_3"; }
		public final int rank() { return 2; }

		public final int minimum() { return 10; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// SetType_4
	private final static class Reduction_20 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_20(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_AndT) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.Collection c1 = (Automaton.Collection) s1;
				if(c1.size() >= 2) {
					for(int r3=0;r3!=c1.size();++r3) {
						int r2 = c1.get(r3);
						Automaton.State s2 = automaton.get(r2);
						if(s2.kind == K_SetT) {
							Automaton.Term t2 = (Automaton.Term) s2;
							int r4 = t2.contents;
							Automaton.State s4 = automaton.get(r4);
							Automaton.List l4 = (Automaton.List) s4;
							int r5 = l4.get(0);
							int r6 = l4.get(1);
							for(int r8=0;r8!=c1.size();++r8) {
								if(r8 == r3) { continue; }
								int r7 = c1.get(r8);
								if(Runtime.accepts(type4,automaton,automaton.get(r7), SCHEMA)) {
									int[] state = {r0, r1, r2, r3, r4, r5, r6, r7, r8, 0};
									activations.add(new Activation(this,null,state));
								}
							}
						}
					}
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r2 = state[2]; // s
			int r3 = state[3];
			int r7 = state[7]; // p
			int r8 = state[8];
			Automaton.Collection s1 = (Automaton.Collection) automaton.get(state[1]);
			int[] s1children = new int[s1.size() - 2];
			for(int s1i=0, s1j=0; s1i != s1.size();++s1i) {
				if(s1i == r3 || s1i == r8) { continue; }
				s1children[s1j++] = s1.get(s1i);
			}
			Automaton.Set r9 = new Automaton.Set(s1children);
			boolean r10 = Runtime.accepts(type5, automaton, r7, SCHEMA); // p is ^AnyT
			boolean r11 = !r10;            // !p is ^AnyT
			if(r11) {
				Automaton.Term r12 = VoidT;
				int r13 = automaton.add(r12);
				if(r0 != r13) {
					return automaton.rewrite(r0, r13);
				}
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "SetType_4"; }
		public final int rank() { return 1; }

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// SetType_5
	private final static class Reduction_21 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_21(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_OrT) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.Collection c1 = (Automaton.Collection) s1;
				if(c1.size() >= 2) {
					for(int r3=0;r3!=c1.size();++r3) {
						int r2 = c1.get(r3);
						Automaton.State s2 = automaton.get(r2);
						if(s2.kind == K_SetT) {
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
								if(s7.kind == K_SetT) {
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

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r2 = state[2]; // s1
			int r3 = state[3];
			int r5 = state[5]; // b1
			int r6 = state[6]; // t1
			int r7 = state[7]; // s2
			int r8 = state[8];
			int r10 = state[10]; // b2
			int r11 = state[11]; // t2
			Automaton.Collection s1 = (Automaton.Collection) automaton.get(state[1]);
			int[] s1children = new int[s1.size() - 2];
			for(int s1i=0, s1j=0; s1i != s1.size();++s1i) {
				if(s1i == r3 || s1i == r8) { continue; }
				s1children[s1j++] = s1.get(s1i);
			}
			Automaton.Set r12 = new Automaton.Set(s1children);
			boolean r13 = r6 == r11;       // t1 eq t2
			boolean r14 = false;           // t1 eq t2 && b1 && !b2
			if(r13) {
				boolean r15 = ((Automaton.Bool)automaton.get(r5)).value;
				boolean r16 = false;           // b1 && !b2
				if(r15) {
					boolean r17 = ((Automaton.Bool)automaton.get(r10)).value;
					boolean r18 = !r17;            // !b2
					r16 = r18;
				}
				r14 = r16;
			}
			if(r14) {
				Automaton.Set r19 = new Automaton.Set(r2); // {s1}
				Automaton.Set r20 = r19.append(r12); // {s1} append ts
				int r21 = automaton.add(r20);
				Automaton.Term r22 = new Automaton.Term(K_OrT, r21);
				int r23 = automaton.add(r22);
				if(r0 != r23) {
					return automaton.rewrite(r0, r23);
				}
			}
			Automaton.Term r24 = VoidT;
			Object r25 = (Object) automaton.get(r11);
			boolean r26 = r25.equals(r24); // t2 eq VoidT
			boolean r27 = false;           // t2 eq VoidT && b2
			if(r26) {
				boolean r28 = ((Automaton.Bool)automaton.get(r10)).value;
				r27 = r28;
			}
			if(r27) {
				boolean r29 = ((Automaton.Bool)automaton.get(r5)).value;
				boolean r30 = ((Automaton.Bool)automaton.get(r10)).value;
				boolean r31 = r29 || r30;      // b1 || b2
				int r32 = automaton.add(r31 ? Automaton.TRUE : Automaton.FALSE);
				Automaton.List r33 = new Automaton.List(r32, r6); // [b1 || b2t1]
				int r34 = automaton.add(r33);
				Automaton.Term r35 = new Automaton.Term(K_SetT, r34);
				int r36 = automaton.add(r35);
				Automaton.Set r37 = new Automaton.Set(r36); // {SetT([b1 || b2t1])}
				Automaton.Set r38 = r37.append(r12); // {SetT([b1 || b2t1])} append ts
				int r39 = automaton.add(r38);
				Automaton.Term r40 = new Automaton.Term(K_OrT, r39);
				int r41 = automaton.add(r40);
				if(r0 != r41) {
					return automaton.rewrite(r0, r41);
				}
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "SetType_5"; }
		public final int rank() { return 2; }

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// term AnyT
	public final static int K_AnyT = 5;
	public final static Automaton.Term AnyT = new Automaton.Term(K_AnyT);

	// term VoidT
	public final static int K_VoidT = 6;
	public final static Automaton.Term VoidT = new Automaton.Term(K_VoidT);

	// term NullT
	public final static int K_NullT = 7;
	public final static Automaton.Term NullT = new Automaton.Term(K_NullT);

	// term BoolT
	public final static int K_BoolT = 8;
	public final static Automaton.Term BoolT = new Automaton.Term(K_BoolT);

	// term IntT
	public final static int K_IntT = 9;
	public final static Automaton.Term IntT = new Automaton.Term(K_IntT);

	// term RealT
	public final static int K_RealT = 10;
	public final static Automaton.Term RealT = new Automaton.Term(K_RealT);

	// term StringT
	public final static int K_StringT = 11;
	public final static Automaton.Term StringT = new Automaton.Term(K_StringT);

	// term VarT(^string)
	public final static int K_VarT = 12;
	public final static int VarT(Automaton automaton, String r0) {
		int r1 = automaton.add(new Automaton.Strung(r0));
		return automaton.add(new Automaton.Term(K_VarT, r1));
	}

	// term NominalT(^string)
	public final static int K_NominalT = 13;
	public final static int NominalT(Automaton automaton, String r0) {
		int r1 = automaton.add(new Automaton.Strung(r0));
		return automaton.add(new Automaton.Term(K_NominalT, r1));
	}

	// AtomType_1
	private final static class Reduction_22 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_22(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_AndT) {
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

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r3 = state[3];
			Automaton.Collection s1 = (Automaton.Collection) automaton.get(state[1]);
			int[] s1children = new int[s1.size() - 1];
			for(int s1i=0, s1j=0; s1i != s1.size();++s1i) {
				if(s1i == r3) { continue; }
				s1children[s1j++] = s1.get(s1i);
			}
			Automaton.Set r4 = new Automaton.Set(s1children);
			Automaton.Term r5 = VoidT;
			int r6 = automaton.add(r5);
			if(r0 != r6) {
				return automaton.rewrite(r0, r6);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "AtomType_1"; }
		public final int rank() { return 0; }

		public final int minimum() { return 2; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// AtomType_2
	private final static class Reduction_23 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_23(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_AndT) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.Collection c1 = (Automaton.Collection) s1;
				if(c1.size() >= 1) {
					for(int r3=0;r3!=c1.size();++r3) {
						int r2 = c1.get(r3);
						if(Runtime.accepts(type0,automaton,automaton.get(r2), SCHEMA)) {
							int[] state = {r0, r1, r2, r3, 0};
							activations.add(new Activation(this,null,state));
						}
					}
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r3 = state[3];
			Automaton.Collection s1 = (Automaton.Collection) automaton.get(state[1]);
			int[] s1children = new int[s1.size() - 1];
			for(int s1i=0, s1j=0; s1i != s1.size();++s1i) {
				if(s1i == r3) { continue; }
				s1children[s1j++] = s1.get(s1i);
			}
			Automaton.Set r4 = new Automaton.Set(s1children);
			int r5 = automaton.add(r4);
			Automaton.Term r6 = new Automaton.Term(K_AndT, r5);
			int r7 = automaton.add(r6);
			if(r0 != r7) {
				return automaton.rewrite(r0, r7);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "AtomType_2"; }
		public final int rank() { return 0; }

		public final int minimum() { return 2; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// AtomType_3
	private final static class Reduction_24 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_24(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_AndT) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.Collection c1 = (Automaton.Collection) s1;
				if(c1.size() >= 2) {
					for(int r3=0;r3!=c1.size();++r3) {
						int r2 = c1.get(r3);
						if(Runtime.accepts(type6,automaton,automaton.get(r2), SCHEMA)) {
							for(int r5=0;r5!=c1.size();++r5) {
								if(r5 == r3) { continue; }
								int r4 = c1.get(r5);
								if(Runtime.accepts(type4,automaton,automaton.get(r4), SCHEMA)) {
									int[] state = {r0, r1, r2, r3, r4, r5, 0};
									activations.add(new Activation(this,null,state));
								}
							}
						}
					}
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r2 = state[2]; // a1
			int r3 = state[3];
			int r4 = state[4]; // a2
			int r5 = state[5];
			Automaton.Collection s1 = (Automaton.Collection) automaton.get(state[1]);
			int[] s1children = new int[s1.size() - 2];
			for(int s1i=0, s1j=0; s1i != s1.size();++s1i) {
				if(s1i == r3 || s1i == r5) { continue; }
				s1children[s1j++] = s1.get(s1i);
			}
			Automaton.Set r6 = new Automaton.Set(s1children);
			boolean r7 = r2 != r4;         // a1 neq a2
			boolean r8 = false;            // a1 neq a2 && a1 neq AnyT && a2 neq AnyT
			if(r7) {
				Automaton.Term r9 = AnyT;
				Object r10 = (Object) automaton.get(r2);
				boolean r11 = !r10.equals(r9); // a1 neq AnyT
				boolean r12 = false;           // a1 neq AnyT && a2 neq AnyT
				if(r11) {
					Automaton.Term r13 = AnyT;
					Object r14 = (Object) automaton.get(r4);
					boolean r15 = !r14.equals(r13); // a2 neq AnyT
					r12 = r15;
				}
				r8 = r12;
			}
			if(r8) {
				Automaton.Term r16 = VoidT;
				int r17 = automaton.add(r16);
				if(r0 != r17) {
					return automaton.rewrite(r0, r17);
				}
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "AtomType_3"; }
		public final int rank() { return 1; }

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// AtomType_4
	private final static class Reduction_25 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_25(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_AndT) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.Collection c1 = (Automaton.Collection) s1;
				if(c1.size() >= 2) {
					for(int r3=0;r3!=c1.size();++r3) {
						int r2 = c1.get(r3);
						if(Runtime.accepts(type6,automaton,automaton.get(r2), SCHEMA)) {
							for(int r5=0;r5!=c1.size();++r5) {
								if(r5 == r3) { continue; }
								int r4 = c1.get(r5);
								Automaton.State s4 = automaton.get(r4);
								if(s4.kind == K_NotT) {
									Automaton.Term t4 = (Automaton.Term) s4;
									int r6 = t4.contents;
									if(Runtime.accepts(type4,automaton,automaton.get(r6), SCHEMA)) {
										int[] state = {r0, r1, r2, r3, r4, r5, r6, 0};
										activations.add(new Activation(this,null,state));
									}
								}
							}
						}
					}
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r2 = state[2]; // a1
			int r3 = state[3];
			int r5 = state[5];
			int r6 = state[6]; // a2
			Automaton.Collection s1 = (Automaton.Collection) automaton.get(state[1]);
			int[] s1children = new int[s1.size() - 2];
			for(int s1i=0, s1j=0; s1i != s1.size();++s1i) {
				if(s1i == r3 || s1i == r5) { continue; }
				s1children[s1j++] = s1.get(s1i);
			}
			Automaton.Set r7 = new Automaton.Set(s1children);
			boolean r8 = r2 == r6;         // a1 eq a2
			if(r8) {
				Automaton.Term r9 = VoidT;
				int r10 = automaton.add(r9);
				if(r0 != r10) {
					return automaton.rewrite(r0, r10);
				}
			}
			Automaton.Term r11 = AnyT;
			Object r12 = (Object) automaton.get(r6);
			boolean r13 = !r12.equals(r11); // a2 neq AnyT
			if(r13) {
				Automaton.Set r14 = r7.appendFront(r2); // a1 append ts
				int r15 = automaton.add(r14);
				Automaton.Term r16 = new Automaton.Term(K_AndT, r15);
				int r17 = automaton.add(r16);
				if(r0 != r17) {
					return automaton.rewrite(r0, r17);
				}
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "AtomType_4"; }
		public final int rank() { return 1; }

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// AtomType_5
	private final static class Reduction_26 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_26(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_OrT) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.Collection c1 = (Automaton.Collection) s1;
				if(c1.size() >= 1) {
					for(int r3=0;r3!=c1.size();++r3) {
						int r2 = c1.get(r3);
						if(Runtime.accepts(type0,automaton,automaton.get(r2), SCHEMA)) {
							int[] state = {r0, r1, r2, r3, 0};
							activations.add(new Activation(this,null,state));
						}
					}
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r3 = state[3];
			Automaton.Collection s1 = (Automaton.Collection) automaton.get(state[1]);
			int[] s1children = new int[s1.size() - 1];
			for(int s1i=0, s1j=0; s1i != s1.size();++s1i) {
				if(s1i == r3) { continue; }
				s1children[s1j++] = s1.get(s1i);
			}
			Automaton.Set r4 = new Automaton.Set(s1children);
			Automaton.Term r5 = AnyT;
			int r6 = automaton.add(r5);
			if(r0 != r6) {
				return automaton.rewrite(r0, r6);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "AtomType_5"; }
		public final int rank() { return 0; }

		public final int minimum() { return 2; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// AtomType_5
	private final static class Reduction_27 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_27(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_OrT) {
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

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r3 = state[3];
			Automaton.Collection s1 = (Automaton.Collection) automaton.get(state[1]);
			int[] s1children = new int[s1.size() - 1];
			for(int s1i=0, s1j=0; s1i != s1.size();++s1i) {
				if(s1i == r3) { continue; }
				s1children[s1j++] = s1.get(s1i);
			}
			Automaton.Set r4 = new Automaton.Set(s1children);
			int r5 = automaton.add(r4);
			Automaton.Term r6 = new Automaton.Term(K_OrT, r5);
			int r7 = automaton.add(r6);
			if(r0 != r7) {
				return automaton.rewrite(r0, r7);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "AtomType_5"; }
		public final int rank() { return 0; }

		public final int minimum() { return 2; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// term $8<FunctionT(^[$2<^Type<$8|Atom<NotT($20<^Proton<TupleT(^[$20...])|SetT(^[^bool,$20])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$20...])|SetT(^[^bool,$20])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($2)|OrT(^{$2...})|AndT(^{$2...})|SetT(^[^bool,$2])|TupleT(^[$2...])>>,$2,$2...])>
	public final static int K_FunctionT = 14;
	public final static int FunctionT(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_FunctionT, r1));
	}
	public final static int FunctionT(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_FunctionT, r1));
	}

	// term Null
	public final static int K_Null = 15;
	public final static Automaton.Term Null = new Automaton.Term(K_Null);

	// term True
	public final static int K_True = 16;
	public final static Automaton.Term True = new Automaton.Term(K_True);

	// term False
	public final static int K_False = 17;
	public final static Automaton.Term False = new Automaton.Term(K_False);

	// term Num(^real)
	public final static int K_Num = 18;
	public final static int Num(Automaton automaton, long r0) {
		int r1 = automaton.add(new Automaton.Real(r0));
		return automaton.add(new Automaton.Term(K_Num, r1));
	}
	public final static int Num(Automaton automaton, BigRational r0) {
		int r1 = automaton.add(new Automaton.Real(r0));
		return automaton.add(new Automaton.Term(K_Num, r1));
	}

	// term Var(^string)
	public final static int K_Var = 19;
	public final static int Var(Automaton automaton, String r0) {
		int r1 = automaton.add(new Automaton.Strung(r0));
		return automaton.add(new Automaton.Term(K_Var, r1));
	}

	// term $7<Tuple(^[$2<^Expr<$7|$44<Value<Null|Tuple(^[^$44...])|Bool<True|False>|Num(^real)|String(^string)|Set(^{^$44...})>>|Fn(^[^string,$2...])|$90<BExpr<Bool<True|False>|VExpr<Fn(^[^string,$2...])|Var(^string)|Load(^[$2,^int])|LengthOf($2)>|And(^{^$90...})|Or(^{^$90...})|Not(^$90)|Equals(^[$122<^Type<Atom<NotT($145<^Proton<TupleT(^[$145...])|SetT(^[^bool,$145])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$145...])|SetT(^[^bool,$145])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($122)|OrT(^{$122...})|AndT(^{$122...})|SetT(^[^bool,$122])|TupleT(^[$122...])|FunctionT(^[$122,$122,$122...])>>,^{|$2,$2|}[$2,$2]])|Inequality(^[^AType<IntT|RealT>,$228<^AExpr<Num(^real)|VExpr<Fn(^[^string,$2...])|Var(^string)|Load(^[$2,^int])|LengthOf($2)>|Sum(^[^real,^{|$228...|}[$228...]])|Mul(^[^real,^{|$228...|}[$228...]])|Div(^[$228,$228])>>])|Equation(^[^AType<IntT|RealT>,$228])|SubsetEq(^[^SetT(^[^bool,$122]),^SExpr<VExpr<Fn(^[^string,$2...])|Var(^string)|Load(^[$2,^int])|LengthOf($2)>|Set(^{$2...})>,^SExpr<VExpr<Fn(^[^string,$2...])|Var(^string)|Load(^[$2,^int])|LengthOf($2)>|Set(^{$2...})>])|ForAll(^[^{^[^Var(^string),$122]...},^$90])|Exists(^[^{^[^Var(^string),$122]...},^$90])>>|AExpr<Num(^real)|VExpr<Fn(^[^string,$2...])|Var(^string)|Load(^[$2,^int])|LengthOf($2)>|Sum(^[^real,^{|$228...|}[$228...]])|Mul(^[^real,^{|$228...|}[$228...]])|Div(^[$228,$228])>|SExpr<VExpr<Fn(^[^string,$2...])|Var(^string)|Load(^[$2,^int])|LengthOf($2)>|Set(^{$2...})>>>...])>
	public final static int K_Tuple = 20;
	public final static int Tuple(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_Tuple, r1));
	}
	public final static int Tuple(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_Tuple, r1));
	}

	// term $9<Load(^[$2<^Expr<$47<Value<Null|Tuple(^[^$47...])|Bool<True|False>|Num(^real)|String(^string)|Set(^{^$47...})>>|Tuple(^[$2...])|Fn(^[^string,$2...])|$98<BExpr<Bool<True|False>|VExpr<$9|Fn(^[^string,$2...])|Var(^string)|LengthOf($2)>|And(^{^$98...})|Or(^{^$98...})|Not(^$98)|Equals(^[$122<^Type<Atom<NotT($145<^Proton<TupleT(^[$145...])|SetT(^[^bool,$145])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$145...])|SetT(^[^bool,$145])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($122)|OrT(^{$122...})|AndT(^{$122...})|SetT(^[^bool,$122])|TupleT(^[$122...])|FunctionT(^[$122,$122,$122...])>>,^{|$2,$2|}[$2,$2]])|Inequality(^[^AType<IntT|RealT>,$228<^AExpr<Num(^real)|VExpr<$9|Fn(^[^string,$2...])|Var(^string)|LengthOf($2)>|Sum(^[^real,^{|$228...|}[$228...]])|Mul(^[^real,^{|$228...|}[$228...]])|Div(^[$228,$228])>>])|Equation(^[^AType<IntT|RealT>,$228])|SubsetEq(^[^SetT(^[^bool,$122]),^SExpr<VExpr<$9|Fn(^[^string,$2...])|Var(^string)|LengthOf($2)>|Set(^{$2...})>,^SExpr<VExpr<$9|Fn(^[^string,$2...])|Var(^string)|LengthOf($2)>|Set(^{$2...})>])|ForAll(^[^{^[^Var(^string),$122]...},^$98])|Exists(^[^{^[^Var(^string),$122]...},^$98])>>|AExpr<Num(^real)|VExpr<$9|Fn(^[^string,$2...])|Var(^string)|LengthOf($2)>|Sum(^[^real,^{|$228...|}[$228...]])|Mul(^[^real,^{|$228...|}[$228...]])|Div(^[$228,$228])>|SExpr<VExpr<$9|Fn(^[^string,$2...])|Var(^string)|LengthOf($2)>|Set(^{$2...})>>>,^int])>
	public final static int K_Load = 21;
	public final static int Load(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_Load, r1));
	}
	public final static int Load(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_Load, r1));
	}

	// Load_1
	private final static class Reduction_28 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_28(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Load) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.List l1 = (Automaton.List) s1;
				int r2 = l1.get(0);
				Automaton.State s2 = automaton.get(r2);
				if(s2.kind == K_Tuple) {
					Automaton.Term t2 = (Automaton.Term) s2;
					int r3 = t2.contents;
					Automaton.State s3 = automaton.get(r3);
					Automaton.List l3 = (Automaton.List) s3;
					int r5 = l1.get(1);
					int[] state = {r0, r1, r2, r3, 0, r5};
					activations.add(new Activation(this,null,state));
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			Automaton.List r4 = ((Automaton.List) automaton.get(state[3])).sublist(0);
			int r5 = state[5]; // idx
			Automaton.Int r6 = new Automaton.Int(0); // 0
			Automaton.Int r7 = (Automaton.Int) automaton.get(r5);
			boolean r8 = r7.compareTo(r6)>=0; // idx ge 0
			boolean r9 = false;            // idx ge 0 && idx lt |ls|
			if(r8) {
				Automaton.Int r10 = r4.lengthOf(); // |ls|
				Automaton.Int r11 = (Automaton.Int) automaton.get(r5);
				boolean r12 = r11.compareTo(r10)<0; // idx lt |ls|
				r9 = r12;
			}
			if(r9) {
				Automaton.Int r13 = (Automaton.Int) automaton.get(r5);
				int r14 = r4.indexOf(r13);     // ls[idx]
				if(r0 != r14) {
					return automaton.rewrite(r0, r14);
				}
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Load_1"; }
		public final int rank() { return 1; }

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// term $4<LengthOf($2<^Expr<$42<Value<Null|Tuple(^[^$42...])|Bool<True|False>|Num(^real)|String(^string)|Set(^{^$42...})>>|Tuple(^[$2...])|Fn(^[^string,$2...])|$93<BExpr<Bool<True|False>|VExpr<$4|Fn(^[^string,$2...])|Var(^string)|Load(^[$2,^int])>|And(^{^$93...})|Or(^{^$93...})|Not(^$93)|Equals(^[$122<^Type<Atom<NotT($145<^Proton<TupleT(^[$145...])|SetT(^[^bool,$145])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$145...])|SetT(^[^bool,$145])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($122)|OrT(^{$122...})|AndT(^{$122...})|SetT(^[^bool,$122])|TupleT(^[$122...])|FunctionT(^[$122,$122,$122...])>>,^{|$2,$2|}[$2,$2]])|Inequality(^[^AType<IntT|RealT>,$228<^AExpr<Num(^real)|VExpr<$4|Fn(^[^string,$2...])|Var(^string)|Load(^[$2,^int])>|Sum(^[^real,^{|$228...|}[$228...]])|Mul(^[^real,^{|$228...|}[$228...]])|Div(^[$228,$228])>>])|Equation(^[^AType<IntT|RealT>,$228])|SubsetEq(^[^SetT(^[^bool,$122]),^SExpr<VExpr<$4|Fn(^[^string,$2...])|Var(^string)|Load(^[$2,^int])>|Set(^{$2...})>,^SExpr<VExpr<$4|Fn(^[^string,$2...])|Var(^string)|Load(^[$2,^int])>|Set(^{$2...})>])|ForAll(^[^{^[^Var(^string),$122]...},^$93])|Exists(^[^{^[^Var(^string),$122]...},^$93])>>|AExpr<Num(^real)|VExpr<$4|Fn(^[^string,$2...])|Var(^string)|Load(^[$2,^int])>|Sum(^[^real,^{|$228...|}[$228...]])|Mul(^[^real,^{|$228...|}[$228...]])|Div(^[$228,$228])>|SExpr<VExpr<$4|Fn(^[^string,$2...])|Var(^string)|Load(^[$2,^int])>|Set(^{$2...})>>>)>
	public final static int K_LengthOf = 22;
	public final static int LengthOf(Automaton automaton, int r0) {
		return automaton.add(new Automaton.Term(K_LengthOf, r0));
	}

	// LengthOf_1
	private final static class Reduction_29 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_29(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_LengthOf) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				if(s1.kind == K_Tuple) {
					Automaton.Term t1 = (Automaton.Term) s1;
					int r2 = t1.contents;
					Automaton.State s2 = automaton.get(r2);
					Automaton.List l2 = (Automaton.List) s2;
					int[] state = {r0, r1, r2, 0};
					activations.add(new Activation(this,null,state));
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			Automaton.List r3 = ((Automaton.List) automaton.get(state[2])).sublist(0);
			Automaton.Int r4 = r3.lengthOf(); // |xs|
			Automaton.Real r5 = new Automaton.Real(r4.value);
			int r6 = automaton.add(r5);
			Automaton.Term r7 = new Automaton.Term(K_Num, r6);
			int r8 = automaton.add(r7);
			if(r0 != r8) {
				return automaton.rewrite(r0, r8);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "LengthOf_1"; }
		public final int rank() { return 0; }

		public final int minimum() { return 2; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// EqualsTuple_1
	private final static class Reduction_30 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_30(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Equals) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.List l1 = (Automaton.List) s1;
				int r2 = l1.get(0);
				Automaton.State s2 = automaton.get(r2);
				if(s2.kind == K_TupleT) {
					Automaton.Term t2 = (Automaton.Term) s2;
					int r3 = t2.contents;
					Automaton.State s3 = automaton.get(r3);
					Automaton.List l3 = (Automaton.List) s3;
					int r5 = l1.get(1);
					Automaton.State s5 = automaton.get(r5);
					Automaton.Collection c5 = (Automaton.Collection) s5;
					for(int r7=0;r7!=c5.size();++r7) {
						int r6 = c5.get(r7);
						Automaton.State s6 = automaton.get(r6);
						if(s6.kind == K_Tuple) {
							Automaton.Term t6 = (Automaton.Term) s6;
							int r8 = t6.contents;
							Automaton.State s8 = automaton.get(r8);
							Automaton.List l8 = (Automaton.List) s8;
							for(int r11=0;r11!=c5.size();++r11) {
								if(r11 == r7) { continue; }
								int r10 = c5.get(r11);
								Automaton.State s10 = automaton.get(r10);
								if(s10.kind == K_Tuple) {
									Automaton.Term t10 = (Automaton.Term) s10;
									int r12 = t10.contents;
									Automaton.State s12 = automaton.get(r12);
									Automaton.List l12 = (Automaton.List) s12;
									int[] state = {r0, r1, r2, r3, 0, r5, r6, r7, r8, 0, r10, r11, r12, 0};
									activations.add(new Activation(this,null,state));
								}
							}
						}
					}
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			Automaton.List r4 = ((Automaton.List) automaton.get(state[3])).sublist(0);
			int r7 = state[7];
			Automaton.List r9 = ((Automaton.List) automaton.get(state[8])).sublist(0);
			int r11 = state[11];
			Automaton.List r13 = ((Automaton.List) automaton.get(state[12])).sublist(0);
			Automaton.Int r14 = r9.lengthOf(); // |xs|
			Automaton.Int r15 = r13.lengthOf(); // |ys|
			boolean r16 = !r14.equals(r15); // |xs| neq |ys|
			if(r16) {
				Automaton.Term r17 = False;
				int r18 = automaton.add(r17);
				if(r0 != r18) {
					return automaton.rewrite(r0, r18);
				}
			}
			Automaton.Int r20 = new Automaton.Int(0); // 0
			Automaton.Int r21 = r9.lengthOf(); // |xs|
			Automaton.List r22 = Runtime.rangeOf(automaton,r20,r21); // 0 range |xs|
			Automaton.List t19 = new Automaton.List();
			for(int i23=0;i23<r22.size();i23++) {
				Automaton.Int r23 = (Automaton.Int) automaton.get(r22.get(i23));;
				int r24 = r4.indexOf(r23);     // ts[i]
				int r25 = r9.indexOf(r23);     // xs[i]
				int r26 = r13.indexOf(r23);    // ys[i]
				Automaton.Bag r27 = new Automaton.Bag(r25, r26); // {|xs[i]ys[i]|}
				int r28 = automaton.add(r27);
				Automaton.List r29 = new Automaton.List(r24, r28); // [ts[i]{|xs[i]ys[i]|}]
				int r30 = automaton.add(r29);
				Automaton.Term r31 = new Automaton.Term(K_Equals, r30);
				int r32 = automaton.add(r31);
				t19.add(r32);
			}
			Automaton.Set r19 = new Automaton.Set(t19.toArray());
			int r33 = automaton.add(r19);
			Automaton.Term r34 = new Automaton.Term(K_And, r33);
			int r35 = automaton.add(r34);
			if(r0 != r35) {
				return automaton.rewrite(r0, r35);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "EqualsTuple_1"; }
		public final int rank() { return 2; }

		public final int minimum() { return 8; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// EqualsTuple_2
	private final static class Reduction_31 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_31(Pattern.Term pattern) { super(pattern); }

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
						if(s2.kind == K_Equals) {
							Automaton.Term t2 = (Automaton.Term) s2;
							int r4 = t2.contents;
							Automaton.State s4 = automaton.get(r4);
							Automaton.List l4 = (Automaton.List) s4;
							int r5 = l4.get(0);
							int r6 = l4.get(1);
							Automaton.State s6 = automaton.get(r6);
							Automaton.Collection c6 = (Automaton.Collection) s6;
							for(int r8=0;r8!=c6.size();++r8) {
								int r7 = c6.get(r8);
								if(Runtime.accepts(type9,automaton,automaton.get(r7), SCHEMA)) {
									for(int r10=0;r10!=c6.size();++r10) {
										if(r10 == r8) { continue; }
										int r9 = c6.get(r10);
										if(Runtime.accepts(type10,automaton,automaton.get(r9), SCHEMA)) {
											int[] state = {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, 0};
											activations.add(new Activation(this,null,state));
										}
									}
								}
							}
						}
					}
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r2 = state[2]; // eq
			int r3 = state[3];
			int r5 = state[5]; // t
			int r7 = state[7]; // x
			int r8 = state[8];
			int r9 = state[9]; // y
			int r10 = state[10];
			Automaton.Collection s1 = (Automaton.Collection) automaton.get(state[1]);
			int[] s1children = new int[s1.size() - 1];
			for(int s1i=0, s1j=0; s1i != s1.size();++s1i) {
				if(s1i == r3) { continue; }
				s1children[s1j++] = s1.get(s1i);
			}
			Automaton.Set r11 = new Automaton.Set(s1children);
			Automaton.List t12 = new Automaton.List();
			for(int i13=0;i13<r11.size();i13++) {
				int r13 = (int) r11.get(i13);
				int r14 = automaton.substitute(r13, r7, r9);
				t12.add(r14);
			}
			Automaton.Set r12 = new Automaton.Set(t12.toArray());
			Automaton.Set r15 = r12.appendFront(r2); // eq append cs
			int r16 = automaton.add(r15);
			Automaton.Term r17 = new Automaton.Term(K_And, r16);
			int r18 = automaton.add(r17);
			if(r0 != r18) {
				return automaton.rewrite(r0, r18);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "EqualsTuple_2"; }
		public final int rank() { return 2; }

		public final int minimum() { return 8; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// term $9<Fn(^[^string,$3<^Expr<$9|$46<Value<Null|Tuple(^[^$46...])|Bool<True|False>|Num(^real)|String(^string)|Set(^{^$46...})>>|Tuple(^[$3...])|$90<BExpr<Bool<True|False>|VExpr<$9|Var(^string)|Load(^[$3,^int])|LengthOf($3)>|And(^{^$90...})|Or(^{^$90...})|Not(^$90)|Equals(^[$122<^Type<Atom<NotT($145<^Proton<TupleT(^[$145...])|SetT(^[^bool,$145])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$145...])|SetT(^[^bool,$145])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($122)|OrT(^{$122...})|AndT(^{$122...})|SetT(^[^bool,$122])|TupleT(^[$122...])|FunctionT(^[$122,$122,$122...])>>,^{|$3,$3|}[$3,$3]])|Inequality(^[^AType<IntT|RealT>,$228<^AExpr<Num(^real)|VExpr<$9|Var(^string)|Load(^[$3,^int])|LengthOf($3)>|Sum(^[^real,^{|$228...|}[$228...]])|Mul(^[^real,^{|$228...|}[$228...]])|Div(^[$228,$228])>>])|Equation(^[^AType<IntT|RealT>,$228])|SubsetEq(^[^SetT(^[^bool,$122]),^SExpr<VExpr<$9|Var(^string)|Load(^[$3,^int])|LengthOf($3)>|Set(^{$3...})>,^SExpr<VExpr<$9|Var(^string)|Load(^[$3,^int])|LengthOf($3)>|Set(^{$3...})>])|ForAll(^[^{^[^Var(^string),$122]...},^$90])|Exists(^[^{^[^Var(^string),$122]...},^$90])>>|AExpr<Num(^real)|VExpr<$9|Var(^string)|Load(^[$3,^int])|LengthOf($3)>|Sum(^[^real,^{|$228...|}[$228...]])|Mul(^[^real,^{|$228...|}[$228...]])|Div(^[$228,$228])>|SExpr<VExpr<$9|Var(^string)|Load(^[$3,^int])|LengthOf($3)>|Set(^{$3...})>>>...])>
	public final static int K_Fn = 23;
	public final static int Fn(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_Fn, r1));
	}
	public final static int Fn(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_Fn, r1));
	}

	// term String(^string)
	public final static int K_String = 24;
	public final static int String(Automaton automaton, String r0) {
		int r1 = automaton.add(new Automaton.Strung(r0));
		return automaton.add(new Automaton.Term(K_String, r1));
	}

	// term $4<Not($2<^$28<BExpr<$4|$38<VExpr<Var(^string)|$49<Fn(^[^string,$43<^Expr<$28|$49|$84<Value<Null|Tuple(^[^$84...])|Bool<True|False>|Num(^real)|String(^string)|Set(^{^$84...})>>|Tuple(^[$43...])|$111<AExpr<$38|Num(^real)|Sum(^[^real,^{|^$111...|}[^$111...]])|Mul(^[^real,^{|^$111...|}[^$111...]])|Div(^[^$111,^$111])>>|SExpr<$38|Set(^{$43...})>>>...])>|Load(^[$43,^int])|LengthOf($43)>>|Bool<True|False>|And(^{$2...})|Or(^{$2...})|Equals(^[$156<^Type<Atom<NotT($179<^Proton<TupleT(^[$179...])|SetT(^[^bool,$179])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$179...])|SetT(^[^bool,$179])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($156)|OrT(^{$156...})|AndT(^{$156...})|SetT(^[^bool,$156])|TupleT(^[$156...])|FunctionT(^[$156,$156,$156...])>>,^{|$43,$43|}[$43,$43]])|Inequality(^[^AType<IntT|RealT>,^$111])|Equation(^[^AType<IntT|RealT>,^$111])|SubsetEq(^[^SetT(^[^bool,$156]),^SExpr<$38|Set(^{$43...})>,^SExpr<$38|Set(^{$43...})>])|ForAll(^[^{^[^Var(^string),$156]...},$2])|Exists(^[^{^[^Var(^string),$156]...},$2])>>>)>
	public final static int K_Not = 25;
	public final static int Not(Automaton automaton, int r0) {
		return automaton.add(new Automaton.Term(K_Not, r0));
	}

	// Not_1
	private final static class Reduction_32 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_32(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Not) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				if(Runtime.accepts(type12,automaton,automaton.get(r1), SCHEMA)) {
					int[] state = {r0, r1};
					activations.add(new Activation(this,null,state));
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r1 = state[1]; // b
			Automaton.Term r2 = True;
			Object r3 = (Object) automaton.get(r1);
			boolean r4 = r3.equals(r2);    // b eq True
			if(r4) {
				Automaton.Term r5 = False;
				int r6 = automaton.add(r5);
				if(r0 != r6) {
					return automaton.rewrite(r0, r6);
				}
			}
			Automaton.Term r7 = True;
			int r8 = automaton.add(r7);
			if(r0 != r8) {
				return automaton.rewrite(r0, r8);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Not_1"; }
		public final int rank() { return 0; }

		public final int minimum() { return 1; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Not_2
	private final static class Reduction_33 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_33(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Not) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				if(s1.kind == K_Not) {
					Automaton.Term t1 = (Automaton.Term) s1;
					int r2 = t1.contents;
					int[] state = {r0, r1, r2};
					activations.add(new Activation(this,null,state));
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r2 = state[2]; // x
			if(r0 != r2) {
				return automaton.rewrite(r0, r2);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Not_2"; }
		public final int rank() { return 0; }

		public final int minimum() { return 1; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Not_3
	private final static class Reduction_34 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_34(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Not) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				if(s1.kind == K_And) {
					Automaton.Term t1 = (Automaton.Term) s1;
					int r2 = t1.contents;
					Automaton.State s2 = automaton.get(r2);
					Automaton.Collection c2 = (Automaton.Collection) s2;
					int[] state = {r0, r1, r2, 0};
					activations.add(new Activation(this,null,state));
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			Automaton.Collection s2 = (Automaton.Collection) automaton.get(state[2]);
			int[] s2children = new int[s2.size() - 0];
			for(int s2i=0, s2j=0; s2i != s2.size();++s2i) {
				s2children[s2j++] = s2.get(s2i);
			}
			Automaton.Set r3 = new Automaton.Set(s2children);
			Automaton.List t4 = new Automaton.List();
			for(int i5=0;i5<r3.size();i5++) {
				int r5 = (int) r3.get(i5);
				Automaton.Term r6 = new Automaton.Term(K_Not, r5);
				int r7 = automaton.add(r6);
				t4.add(r7);
			}
			Automaton.Set r4 = new Automaton.Set(t4.toArray());
			int r8 = automaton.add(r4);
			Automaton.Term r9 = new Automaton.Term(K_Or, r8);
			int r10 = automaton.add(r9);
			if(r0 != r10) {
				return automaton.rewrite(r0, r10);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Not_3"; }
		public final int rank() { return 2; }

		public final int minimum() { return 2; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Not_4
	private final static class Reduction_35 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_35(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Not) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				if(s1.kind == K_Or) {
					Automaton.Term t1 = (Automaton.Term) s1;
					int r2 = t1.contents;
					Automaton.State s2 = automaton.get(r2);
					Automaton.Collection c2 = (Automaton.Collection) s2;
					int[] state = {r0, r1, r2, 0};
					activations.add(new Activation(this,null,state));
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			Automaton.Collection s2 = (Automaton.Collection) automaton.get(state[2]);
			int[] s2children = new int[s2.size() - 0];
			for(int s2i=0, s2j=0; s2i != s2.size();++s2i) {
				s2children[s2j++] = s2.get(s2i);
			}
			Automaton.Set r3 = new Automaton.Set(s2children);
			Automaton.List t4 = new Automaton.List();
			for(int i5=0;i5<r3.size();i5++) {
				int r5 = (int) r3.get(i5);
				Automaton.Term r6 = new Automaton.Term(K_Not, r5);
				int r7 = automaton.add(r6);
				t4.add(r7);
			}
			Automaton.Set r4 = new Automaton.Set(t4.toArray());
			int r8 = automaton.add(r4);
			Automaton.Term r9 = new Automaton.Term(K_And, r8);
			int r10 = automaton.add(r9);
			if(r0 != r10) {
				return automaton.rewrite(r0, r10);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Not_4"; }
		public final int rank() { return 1; }

		public final int minimum() { return 2; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// term $7<And($5<^{$2<^$31<BExpr<$7|$41<VExpr<Var(^string)|$52<Fn(^[^string,$46<^Expr<$31|$52|$87<Value<Null|Tuple(^[^$87...])|Bool<True|False>|Num(^real)|String(^string)|Set(^{^$87...})>>|Tuple(^[$46...])|$114<AExpr<$41|Num(^real)|Sum(^[^real,^{|^$114...|}[^$114...]])|Mul(^[^real,^{|^$114...|}[^$114...]])|Div(^[^$114,^$114])>>|SExpr<$41|Set(^{$46...})>>>...])>|Load(^[$46,^int])|LengthOf($46)>>|Bool<True|False>|Or($5)|Not($2)|Equals(^[$156<^Type<Atom<NotT($179<^Proton<TupleT(^[$179...])|SetT(^[^bool,$179])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$179...])|SetT(^[^bool,$179])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($156)|OrT(^{$156...})|AndT(^{$156...})|SetT(^[^bool,$156])|TupleT(^[$156...])|FunctionT(^[$156,$156,$156...])>>,^{|$46,$46|}[$46,$46]])|Inequality(^[^AType<IntT|RealT>,^$114])|Equation(^[^AType<IntT|RealT>,^$114])|SubsetEq(^[^SetT(^[^bool,$156]),^SExpr<$41|Set(^{$46...})>,^SExpr<$41|Set(^{$46...})>])|ForAll(^[^{^[^Var(^string),$156]...},$2])|Exists(^[^{^[^Var(^string),$156]...},$2])>>>...}>)>
	public final static int K_And = 26;
	public final static int And(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.Set(r0));
		return automaton.add(new Automaton.Term(K_And, r1));
	}
	public final static int And(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.Set(r0));
		return automaton.add(new Automaton.Term(K_And, r1));
	}

	// And_1
	private final static class Reduction_36 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_36(Pattern.Term pattern) { super(pattern); }

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

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r2 = state[2]; // x
			int r3 = state[3];
			if(r0 != r2) {
				return automaton.rewrite(r0, r2);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "And_1"; }
		public final int rank() { return 1; }

		public final int minimum() { return 2; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// And_2
	private final static class Reduction_37 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_37(Pattern.Term pattern) { super(pattern); }

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
						if(Runtime.accepts(type14,automaton,automaton.get(r2), SCHEMA)) {
							int[] state = {r0, r1, r2, r3, 0};
							activations.add(new Activation(this,null,state));
						}
					}
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r3 = state[3];
			Automaton.Collection s1 = (Automaton.Collection) automaton.get(state[1]);
			int[] s1children = new int[s1.size() - 1];
			for(int s1i=0, s1j=0; s1i != s1.size();++s1i) {
				if(s1i == r3) { continue; }
				s1children[s1j++] = s1.get(s1i);
			}
			Automaton.Set r4 = new Automaton.Set(s1children);
			Automaton.Term r5 = False;
			int r6 = automaton.add(r5);
			if(r0 != r6) {
				return automaton.rewrite(r0, r6);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "And_2"; }
		public final int rank() { return 1; }

		public final int minimum() { return 2; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// And_3
	private final static class Reduction_38 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_38(Pattern.Term pattern) { super(pattern); }

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
						if(Runtime.accepts(type15,automaton,automaton.get(r2), SCHEMA)) {
							int[] state = {r0, r1, r2, r3, 0};
							activations.add(new Activation(this,null,state));
						}
					}
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r3 = state[3];
			Automaton.Collection s1 = (Automaton.Collection) automaton.get(state[1]);
			int[] s1children = new int[s1.size() - 1];
			for(int s1i=0, s1j=0; s1i != s1.size();++s1i) {
				if(s1i == r3) { continue; }
				s1children[s1j++] = s1.get(s1i);
			}
			Automaton.Set r4 = new Automaton.Set(s1children);
			Automaton.Int r5 = r4.lengthOf(); // |xs|
			Automaton.Int r6 = new Automaton.Int(0); // 0
			boolean r7 = r5.compareTo(r6)>0; // |xs| gt 0
			if(r7) {
				int r8 = automaton.add(r4);
				Automaton.Term r9 = new Automaton.Term(K_And, r8);
				int r10 = automaton.add(r9);
				if(r0 != r10) {
					return automaton.rewrite(r0, r10);
				}
			}
			Automaton.Term r11 = True;
			int r12 = automaton.add(r11);
			if(r0 != r12) {
				return automaton.rewrite(r0, r12);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "And_3"; }
		public final int rank() { return 1; }

		public final int minimum() { return 2; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// And_4
	private final static class Reduction_39 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_39(Pattern.Term pattern) { super(pattern); }

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

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
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
				return automaton.rewrite(r0, r10);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "And_4"; }
		public final int rank() { return 1; }

		public final int minimum() { return 3; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// And_5
	private final static class Reduction_40 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_40(Pattern.Term pattern) { super(pattern); }

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
						if(s2.kind == K_Not) {
							Automaton.Term t2 = (Automaton.Term) s2;
							int r4 = t2.contents;
							for(int r6=0;r6!=c1.size();++r6) {
								if(r6 == r3) { continue; }
								int r5 = c1.get(r6);
								int[] state = {r0, r1, r2, r3, r4, r5, r6, 0};
								activations.add(new Activation(this,null,state));
							}
						}
					}
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r3 = state[3];
			int r4 = state[4]; // x
			int r5 = state[5]; // y
			int r6 = state[6];
			Automaton.Collection s1 = (Automaton.Collection) automaton.get(state[1]);
			int[] s1children = new int[s1.size() - 2];
			for(int s1i=0, s1j=0; s1i != s1.size();++s1i) {
				if(s1i == r3 || s1i == r6) { continue; }
				s1children[s1j++] = s1.get(s1i);
			}
			Automaton.Set r7 = new Automaton.Set(s1children);
			boolean r8 = r4 == r5;         // x eq y
			if(r8) {
				Automaton.Term r9 = False;
				int r10 = automaton.add(r9);
				if(r0 != r10) {
					return automaton.rewrite(r0, r10);
				}
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "And_5"; }
		public final int rank() { return 2; }

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// And_6
	private final static class Reduction_41 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_41(Pattern.Term pattern) { super(pattern); }

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
						if(s2.kind == K_Or) {
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

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
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
			Automaton.List t7 = new Automaton.List();
			for(int i8=0;i8<r5.size();i8++) {
				int r8 = (int) r5.get(i8);
				Automaton.Set r9 = r6.appendFront(r8); // x append ys
				int r10 = automaton.add(r9);
				Automaton.Term r11 = new Automaton.Term(K_And, r10);
				int r12 = automaton.add(r11);
				t7.add(r12);
			}
			Automaton.Set r7 = new Automaton.Set(t7.toArray());
			int r13 = automaton.add(r7);
			Automaton.Term r14 = new Automaton.Term(K_Or, r13);
			int r15 = automaton.add(r14);
			if(r0 != r15) {
				return automaton.rewrite(r0, r15);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "And_6"; }
		public final int rank() { return 3; }

		public final int minimum() { return 3; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// term $7<Or($5<^{$2<^$31<BExpr<$7|$41<VExpr<Var(^string)|$52<Fn(^[^string,$46<^Expr<$31|$52|$87<Value<Null|Tuple(^[^$87...])|Bool<True|False>|Num(^real)|String(^string)|Set(^{^$87...})>>|Tuple(^[$46...])|$114<AExpr<$41|Num(^real)|Sum(^[^real,^{|^$114...|}[^$114...]])|Mul(^[^real,^{|^$114...|}[^$114...]])|Div(^[^$114,^$114])>>|SExpr<$41|Set(^{$46...})>>>...])>|Load(^[$46,^int])|LengthOf($46)>>|Bool<True|False>|And($5)|Not($2)|Equals(^[$156<^Type<Atom<NotT($179<^Proton<TupleT(^[$179...])|SetT(^[^bool,$179])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$179...])|SetT(^[^bool,$179])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($156)|OrT(^{$156...})|AndT(^{$156...})|SetT(^[^bool,$156])|TupleT(^[$156...])|FunctionT(^[$156,$156,$156...])>>,^{|$46,$46|}[$46,$46]])|Inequality(^[^AType<IntT|RealT>,^$114])|Equation(^[^AType<IntT|RealT>,^$114])|SubsetEq(^[^SetT(^[^bool,$156]),^SExpr<$41|Set(^{$46...})>,^SExpr<$41|Set(^{$46...})>])|ForAll(^[^{^[^Var(^string),$156]...},$2])|Exists(^[^{^[^Var(^string),$156]...},$2])>>>...}>)>
	public final static int K_Or = 27;
	public final static int Or(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.Set(r0));
		return automaton.add(new Automaton.Term(K_Or, r1));
	}
	public final static int Or(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.Set(r0));
		return automaton.add(new Automaton.Term(K_Or, r1));
	}

	// Or_1
	private final static class Reduction_42 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_42(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Or) {
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

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r2 = state[2]; // x
			int r3 = state[3];
			if(r0 != r2) {
				return automaton.rewrite(r0, r2);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Or_1"; }
		public final int rank() { return 0; }

		public final int minimum() { return 2; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Or_2
	private final static class Reduction_43 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_43(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Or) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.Collection c1 = (Automaton.Collection) s1;
				if(c1.size() >= 1) {
					for(int r3=0;r3!=c1.size();++r3) {
						int r2 = c1.get(r3);
						if(Runtime.accepts(type15,automaton,automaton.get(r2), SCHEMA)) {
							int[] state = {r0, r1, r2, r3, 0};
							activations.add(new Activation(this,null,state));
						}
					}
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r3 = state[3];
			Automaton.Collection s1 = (Automaton.Collection) automaton.get(state[1]);
			int[] s1children = new int[s1.size() - 1];
			for(int s1i=0, s1j=0; s1i != s1.size();++s1i) {
				if(s1i == r3) { continue; }
				s1children[s1j++] = s1.get(s1i);
			}
			Automaton.Set r4 = new Automaton.Set(s1children);
			Automaton.Term r5 = True;
			int r6 = automaton.add(r5);
			if(r0 != r6) {
				return automaton.rewrite(r0, r6);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Or_2"; }
		public final int rank() { return 1; }

		public final int minimum() { return 2; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Or_3
	private final static class Reduction_44 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_44(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Or) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.Collection c1 = (Automaton.Collection) s1;
				if(c1.size() >= 1) {
					for(int r3=0;r3!=c1.size();++r3) {
						int r2 = c1.get(r3);
						if(Runtime.accepts(type14,automaton,automaton.get(r2), SCHEMA)) {
							int[] state = {r0, r1, r2, r3, 0};
							activations.add(new Activation(this,null,state));
						}
					}
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r3 = state[3];
			Automaton.Collection s1 = (Automaton.Collection) automaton.get(state[1]);
			int[] s1children = new int[s1.size() - 1];
			for(int s1i=0, s1j=0; s1i != s1.size();++s1i) {
				if(s1i == r3) { continue; }
				s1children[s1j++] = s1.get(s1i);
			}
			Automaton.Set r4 = new Automaton.Set(s1children);
			Automaton.Int r5 = r4.lengthOf(); // |xs|
			Automaton.Int r6 = new Automaton.Int(0); // 0
			boolean r7 = r5.compareTo(r6)>0; // |xs| gt 0
			if(r7) {
				int r8 = automaton.add(r4);
				Automaton.Term r9 = new Automaton.Term(K_Or, r8);
				int r10 = automaton.add(r9);
				if(r0 != r10) {
					return automaton.rewrite(r0, r10);
				}
			}
			Automaton.Term r11 = False;
			int r12 = automaton.add(r11);
			if(r0 != r12) {
				return automaton.rewrite(r0, r12);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Or_3"; }
		public final int rank() { return 1; }

		public final int minimum() { return 2; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Or_4
	private final static class Reduction_45 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_45(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Or) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.Collection c1 = (Automaton.Collection) s1;
				if(c1.size() >= 2) {
					for(int r3=0;r3!=c1.size();++r3) {
						int r2 = c1.get(r3);
						Automaton.State s2 = automaton.get(r2);
						if(s2.kind == K_Not) {
							Automaton.Term t2 = (Automaton.Term) s2;
							int r4 = t2.contents;
							for(int r6=0;r6!=c1.size();++r6) {
								if(r6 == r3) { continue; }
								int r5 = c1.get(r6);
								int[] state = {r0, r1, r2, r3, r4, r5, r6, 0};
								activations.add(new Activation(this,null,state));
							}
						}
					}
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r3 = state[3];
			int r4 = state[4]; // x
			int r5 = state[5]; // y
			int r6 = state[6];
			Automaton.Collection s1 = (Automaton.Collection) automaton.get(state[1]);
			int[] s1children = new int[s1.size() - 2];
			for(int s1i=0, s1j=0; s1i != s1.size();++s1i) {
				if(s1i == r3 || s1i == r6) { continue; }
				s1children[s1j++] = s1.get(s1i);
			}
			Automaton.Set r7 = new Automaton.Set(s1children);
			boolean r8 = r4 == r5;         // x eq y
			if(r8) {
				Automaton.Term r9 = True;
				int r10 = automaton.add(r9);
				if(r0 != r10) {
					return automaton.rewrite(r0, r10);
				}
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Or_4"; }
		public final int rank() { return 2; }

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Or_5
	private final static class Reduction_46 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_46(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Or) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.Collection c1 = (Automaton.Collection) s1;
				if(c1.size() >= 1) {
					for(int r3=0;r3!=c1.size();++r3) {
						int r2 = c1.get(r3);
						Automaton.State s2 = automaton.get(r2);
						if(s2.kind == K_Or) {
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

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
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
			Automaton.Term r9 = new Automaton.Term(K_Or, r8);
			int r10 = automaton.add(r9);
			if(r0 != r10) {
				return automaton.rewrite(r0, r10);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Or_5"; }
		public final int rank() { return 1; }

		public final int minimum() { return 3; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// term $14<Equals(^[$2<^Type<Atom<NotT($27<^Proton<TupleT(^[$27...])|SetT(^[^bool,$27])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$27...])|SetT(^[^bool,$27])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($2)|OrT(^{$2...})|AndT(^{$2...})|SetT(^[^bool,$2])|TupleT(^[$2...])|FunctionT(^[$2,$2,$2...])>>,^{|$4<^Expr<$146<Value<Null|Tuple(^[^$146...])|Bool<True|False>|Num(^real)|String(^string)|Set(^{^$146...})>>|Tuple(^[$4...])|Fn(^[^string,$4...])|$195<BExpr<$14|Bool<True|False>|VExpr<Fn(^[^string,$4...])|Var(^string)|Load(^[$4,^int])|LengthOf($4)>|And(^{^$195...})|Or(^{^$195...})|Not(^$195)|Inequality(^[^AType<IntT|RealT>,$228<^AExpr<Num(^real)|VExpr<Fn(^[^string,$4...])|Var(^string)|Load(^[$4,^int])|LengthOf($4)>|Sum(^[^real,^{|$228...|}[$228...]])|Mul(^[^real,^{|$228...|}[$228...]])|Div(^[$228,$228])>>])|Equation(^[^AType<IntT|RealT>,$228])|SubsetEq(^[^SetT(^[^bool,$2]),^SExpr<VExpr<Fn(^[^string,$4...])|Var(^string)|Load(^[$4,^int])|LengthOf($4)>|Set(^{$4...})>,^SExpr<VExpr<Fn(^[^string,$4...])|Var(^string)|Load(^[$4,^int])|LengthOf($4)>|Set(^{$4...})>])|ForAll(^[^{^[^Var(^string),$2]...},^$195])|Exists(^[^{^[^Var(^string),$2]...},^$195])>>|AExpr<Num(^real)|VExpr<Fn(^[^string,$4...])|Var(^string)|Load(^[$4,^int])|LengthOf($4)>|Sum(^[^real,^{|$228...|}[$228...]])|Mul(^[^real,^{|$228...|}[$228...]])|Div(^[$228,$228])>|SExpr<VExpr<Fn(^[^string,$4...])|Var(^string)|Load(^[$4,^int])|LengthOf($4)>|Set(^{$4...})>>>,$4|}[$4<^Expr<$146<Value<Null|Tuple(^[^$146...])|Bool<True|False>|Num(^real)|String(^string)|Set(^{^$146...})>>|Tuple(^[$4...])|Fn(^[^string,$4...])|$195<BExpr<$14|Bool<True|False>|VExpr<Fn(^[^string,$4...])|Var(^string)|Load(^[$4,^int])|LengthOf($4)>|And(^{^$195...})|Or(^{^$195...})|Not(^$195)|Inequality(^[^AType<IntT|RealT>,$228<^AExpr<Num(^real)|VExpr<Fn(^[^string,$4...])|Var(^string)|Load(^[$4,^int])|LengthOf($4)>|Sum(^[^real,^{|$228...|}[$228...]])|Mul(^[^real,^{|$228...|}[$228...]])|Div(^[$228,$228])>>])|Equation(^[^AType<IntT|RealT>,$228])|SubsetEq(^[^SetT(^[^bool,$2]),^SExpr<VExpr<Fn(^[^string,$4...])|Var(^string)|Load(^[$4,^int])|LengthOf($4)>|Set(^{$4...})>,^SExpr<VExpr<Fn(^[^string,$4...])|Var(^string)|Load(^[$4,^int])|LengthOf($4)>|Set(^{$4...})>])|ForAll(^[^{^[^Var(^string),$2]...},^$195])|Exists(^[^{^[^Var(^string),$2]...},^$195])>>|AExpr<Num(^real)|VExpr<Fn(^[^string,$4...])|Var(^string)|Load(^[$4,^int])|LengthOf($4)>|Sum(^[^real,^{|$228...|}[$228...]])|Mul(^[^real,^{|$228...|}[$228...]])|Div(^[$228,$228])>|SExpr<VExpr<Fn(^[^string,$4...])|Var(^string)|Load(^[$4,^int])|LengthOf($4)>|Set(^{$4...})>>>,$4]])>
	public final static int K_Equals = 28;
	public final static int Equals(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_Equals, r1));
	}
	public final static int Equals(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_Equals, r1));
	}

	// Equals_1
	private final static class Reduction_47 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_47(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Equals) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.List l1 = (Automaton.List) s1;
				int r2 = l1.get(0);
				int r3 = l1.get(1);
				Automaton.State s3 = automaton.get(r3);
				Automaton.Collection c3 = (Automaton.Collection) s3;
				for(int r5=0;r5!=c3.size();++r5) {
					int r4 = c3.get(r5);
					for(int r7=0;r7!=c3.size();++r7) {
						if(r7 == r5) { continue; }
						int r6 = c3.get(r7);
						int[] state = {r0, r1, r2, r3, r4, r5, r6, r7};
						activations.add(new Activation(this,null,state));
					}
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r2 = state[2]; // t
			int r4 = state[4]; // x
			int r5 = state[5];
			int r6 = state[6]; // y
			int r7 = state[7];
			boolean r8 = r4 == r6;         // x eq y
			if(r8) {
				Automaton.Term r9 = True;
				int r10 = automaton.add(r9);
				if(r0 != r10) {
					return automaton.rewrite(r0, r10);
				}
			}
			boolean r11 = r4 != r6;        // x neq y
			boolean r12 = false;           // x neq y && x is $1<^Value<Null|Tuple(^[$1...])|Bool<True|False>|Num(^real)|String(^string)|Set(^{$1...})>> && y is $1<^Value<Null|Tuple(^[$1...])|Bool<True|False>|Num(^real)|String(^string)|Set(^{$1...})>>
			if(r11) {
				boolean r13 = Runtime.accepts(type16, automaton, r4, SCHEMA); // x is $1<^Value<Null|Tuple(^[$1...])|Bool<True|False>|Num(^real)|String(^string)|Set(^{$1...})>>
				boolean r14 = false;           // x is $1<^Value<Null|Tuple(^[$1...])|Bool<True|False>|Num(^real)|String(^string)|Set(^{$1...})>> && y is $1<^Value<Null|Tuple(^[$1...])|Bool<True|False>|Num(^real)|String(^string)|Set(^{$1...})>>
				if(r13) {
					boolean r15 = Runtime.accepts(type16, automaton, r6, SCHEMA); // y is $1<^Value<Null|Tuple(^[$1...])|Bool<True|False>|Num(^real)|String(^string)|Set(^{$1...})>>
					r14 = r15;
				}
				r12 = r14;
			}
			if(r12) {
				Automaton.Term r16 = False;
				int r17 = automaton.add(r16);
				if(r0 != r17) {
					return automaton.rewrite(r0, r17);
				}
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Equals_1"; }
		public final int rank() { return 1; }

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Equals_2
	private final static class Reduction_48 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_48(Pattern.Term pattern) { super(pattern); }

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
						if(s2.kind == K_Equals) {
							Automaton.Term t2 = (Automaton.Term) s2;
							int r4 = t2.contents;
							Automaton.State s4 = automaton.get(r4);
							Automaton.List l4 = (Automaton.List) s4;
							int r5 = l4.get(0);
							int r6 = l4.get(1);
							Automaton.State s6 = automaton.get(r6);
							Automaton.Collection c6 = (Automaton.Collection) s6;
							for(int r8=0;r8!=c6.size();++r8) {
								int r7 = c6.get(r8);
								if(Runtime.accepts(type9,automaton,automaton.get(r7), SCHEMA)) {
									for(int r10=0;r10!=c6.size();++r10) {
										if(r10 == r8) { continue; }
										int r9 = c6.get(r10);
										if(Runtime.accepts(type17,automaton,automaton.get(r9), SCHEMA)) {
											int[] state = {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, 0};
											activations.add(new Activation(this,null,state));
										}
									}
								}
							}
						}
					}
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r2 = state[2]; // eq
			int r3 = state[3];
			int r5 = state[5]; // t
			int r7 = state[7]; // x
			int r8 = state[8];
			int r9 = state[9]; // y
			int r10 = state[10];
			Automaton.Collection s1 = (Automaton.Collection) automaton.get(state[1]);
			int[] s1children = new int[s1.size() - 1];
			for(int s1i=0, s1j=0; s1i != s1.size();++s1i) {
				if(s1i == r3) { continue; }
				s1children[s1j++] = s1.get(s1i);
			}
			Automaton.Set r11 = new Automaton.Set(s1children);
			Automaton.List t12 = new Automaton.List();
			for(int i13=0;i13<r11.size();i13++) {
				int r13 = (int) r11.get(i13);
				int r14 = automaton.substitute(r13, r7, r9);
				t12.add(r14);
			}
			Automaton.Set r12 = new Automaton.Set(t12.toArray());
			Automaton.Set r15 = r12.appendFront(r2); // eq append cs
			int r16 = automaton.add(r15);
			Automaton.Term r17 = new Automaton.Term(K_And, r16);
			int r18 = automaton.add(r17);
			if(r0 != r18) {
				return automaton.rewrite(r0, r18);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Equals_2"; }
		public final int rank() { return 2; }

		public final int minimum() { return 8; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Equals_3
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
				if(c1.size() >= 1) {
					for(int r3=0;r3!=c1.size();++r3) {
						int r2 = c1.get(r3);
						Automaton.State s2 = automaton.get(r2);
						if(s2.kind == K_Equals) {
							Automaton.Term t2 = (Automaton.Term) s2;
							int r4 = t2.contents;
							Automaton.State s4 = automaton.get(r4);
							Automaton.List l4 = (Automaton.List) s4;
							int r5 = l4.get(0);
							int r6 = l4.get(1);
							Automaton.State s6 = automaton.get(r6);
							Automaton.Collection c6 = (Automaton.Collection) s6;
							for(int r8=0;r8!=c6.size();++r8) {
								int r7 = c6.get(r8);
								if(Runtime.accepts(type9,automaton,automaton.get(r7), SCHEMA)) {
									for(int r10=0;r10!=c6.size();++r10) {
										if(r10 == r8) { continue; }
										int r9 = c6.get(r10);
										if(Runtime.accepts(type9,automaton,automaton.get(r9), SCHEMA)) {
											int[] state = {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, 0};
											activations.add(new Activation(this,null,state));
										}
									}
								}
							}
						}
					}
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r2 = state[2]; // eq
			int r3 = state[3];
			int r5 = state[5]; // t
			int r6 = state[6]; // vs
			int r8 = state[8];
			int r10 = state[10];
			Automaton.Collection s1 = (Automaton.Collection) automaton.get(state[1]);
			int[] s1children = new int[s1.size() - 1];
			for(int s1i=0, s1j=0; s1i != s1.size();++s1i) {
				if(s1i == r3) { continue; }
				s1children[s1j++] = s1.get(s1i);
			}
			Automaton.Set r11 = new Automaton.Set(s1children);
			Automaton.Term r12 = Solver$native.max(automaton, r6);
			Automaton.Term r13 = Solver$native.min(automaton, r6);
			boolean r14 = !r12.equals(r13); // x neq y
			if(r14) {
				Automaton.List t15 = new Automaton.List();
				for(int i16=0;i16<r11.size();i16++) {
					int r16 = (int) r11.get(i16);
					int r17 = automaton.add(r12);
					int r18 = automaton.add(r13);
					int r19 = automaton.substitute(r16, r17, r18);
					t15.add(r19);
				}
				Automaton.Set r15 = new Automaton.Set(t15.toArray());
				Automaton.Set r20 = r15.appendFront(r2); // eq append cs
				int r21 = automaton.add(r20);
				Automaton.Term r22 = new Automaton.Term(K_And, r21);
				int r23 = automaton.add(r22);
				if(r0 != r23) {
					return automaton.rewrite(r0, r23);
				}
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Equals_3"; }
		public final int rank() { return 0; }

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// term $12<Mul($10<^[^real,^{|$3<^$20<AExpr<$12|Num(^real)|Sum($10)|Div(^[$3,$3])|$40<VExpr<Var(^string)|$51<Fn(^[^string,$45<^Expr<$20|$51|$86<Value<Num(^real)|Null|Tuple(^[^$86...])|Bool<True|False>|String(^string)|Set(^{^$86...})>>|Tuple(^[$45...])|$126<BExpr<$40|Bool<True|False>|And(^{^$126...})|Or(^{^$126...})|Not(^$126)|Equals(^[$138<^Type<Atom<NotT($161<^Proton<TupleT(^[$161...])|SetT(^[^bool,$161])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$161...])|SetT(^[^bool,$161])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($138)|OrT(^{$138...})|AndT(^{$138...})|SetT(^[^bool,$138])|TupleT(^[$138...])|FunctionT(^[$138,$138,$138...])>>,^{|$45,$45|}[$45,$45]])|Inequality(^[^AType<IntT|RealT>,$3])|Equation(^[^AType<IntT|RealT>,$3])|SubsetEq(^[^SetT(^[^bool,$138]),^SExpr<$40|Set(^{$45...})>,^SExpr<$40|Set(^{$45...})>])|ForAll(^[^{^[^Var(^string),$138]...},^$126])|Exists(^[^{^[^Var(^string),$138]...},^$126])>>|SExpr<$40|Set(^{$45...})>>>...])>|Load(^[$45,^int])|LengthOf($45)>>>>>...|}[$3<^$20<AExpr<$12|Num(^real)|Sum($10)|Div(^[$3,$3])|$40<VExpr<Var(^string)|$51<Fn(^[^string,$45<^Expr<$20|$51|$86<Value<Num(^real)|Null|Tuple(^[^$86...])|Bool<True|False>|String(^string)|Set(^{^$86...})>>|Tuple(^[$45...])|$126<BExpr<$40|Bool<True|False>|And(^{^$126...})|Or(^{^$126...})|Not(^$126)|Equals(^[$138<^Type<Atom<NotT($161<^Proton<TupleT(^[$161...])|SetT(^[^bool,$161])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$161...])|SetT(^[^bool,$161])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($138)|OrT(^{$138...})|AndT(^{$138...})|SetT(^[^bool,$138])|TupleT(^[$138...])|FunctionT(^[$138,$138,$138...])>>,^{|$45,$45|}[$45,$45]])|Inequality(^[^AType<IntT|RealT>,$3])|Equation(^[^AType<IntT|RealT>,$3])|SubsetEq(^[^SetT(^[^bool,$138]),^SExpr<$40|Set(^{$45...})>,^SExpr<$40|Set(^{$45...})>])|ForAll(^[^{^[^Var(^string),$138]...},^$126])|Exists(^[^{^[^Var(^string),$138]...},^$126])>>|SExpr<$40|Set(^{$45...})>>>...])>|Load(^[$45,^int])|LengthOf($45)>>>>>...]]>)>
	public final static int K_Mul = 29;
	public final static int Mul(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_Mul, r1));
	}
	public final static int Mul(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_Mul, r1));
	}

	// Multiplication_1
	private final static class Reduction_49 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_49(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Mul) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.List l1 = (Automaton.List) s1;
				int r2 = l1.get(0);
				int r3 = l1.get(1);
				Automaton.State s3 = automaton.get(r3);
				Automaton.Collection c3 = (Automaton.Collection) s3;
				int[] state = {r0, r1, r2, r3, 0};
				activations.add(new Activation(this,null,state));
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r2 = state[2]; // n
			Automaton.Collection s3 = (Automaton.Collection) automaton.get(state[3]);
			int[] s3children = new int[s3.size() - 0];
			for(int s3i=0, s3j=0; s3i != s3.size();++s3i) {
				s3children[s3j++] = s3.get(s3i);
			}
			Automaton.Bag r4 = new Automaton.Bag(s3children);
			Automaton.Real r5 = new Automaton.Real(0); // 0.0
			Automaton.Real r6 = (Automaton.Real) automaton.get(r2);
			boolean r7 = r6.equals(r5);    // n eq 0.0
			Automaton.Int r8 = r4.lengthOf(); // |rest|
			Automaton.Int r9 = new Automaton.Int(0); // 0
			boolean r10 = r8.equals(r9);   // |rest| eq 0
			boolean r11 = r7 || r10;       // n eq 0.0 || |rest| eq 0
			if(r11) {
				Automaton.Term r12 = new Automaton.Term(K_Num, r2);
				int r13 = automaton.add(r12);
				if(r0 != r13) {
					return automaton.rewrite(r0, r13);
				}
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Multiplication_1"; }
		public final int rank() { return 0; }

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Multiplication_2
	private final static class Reduction_50 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_50(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Mul) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.List l1 = (Automaton.List) s1;
				int r2 = l1.get(0);
				int r3 = l1.get(1);
				Automaton.State s3 = automaton.get(r3);
				Automaton.Collection c3 = (Automaton.Collection) s3;
				if(c3.size() >= 1) {
					for(int r5=0;r5!=c3.size();++r5) {
						int r4 = c3.get(r5);
						Automaton.State s4 = automaton.get(r4);
						if(s4.kind == K_Num) {
							Automaton.Term t4 = (Automaton.Term) s4;
							int r6 = t4.contents;
							int[] state = {r0, r1, r2, r3, r4, r5, r6, 0};
							activations.add(new Activation(this,null,state));
						}
					}
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r2 = state[2]; // x
			int r5 = state[5];
			int r6 = state[6]; // y
			Automaton.Collection s3 = (Automaton.Collection) automaton.get(state[3]);
			int[] s3children = new int[s3.size() - 1];
			for(int s3i=0, s3j=0; s3i != s3.size();++s3i) {
				if(s3i == r5) { continue; }
				s3children[s3j++] = s3.get(s3i);
			}
			Automaton.Bag r7 = new Automaton.Bag(s3children);
			Automaton.Real r8 = (Automaton.Real) automaton.get(r2);
			Automaton.Real r9 = (Automaton.Real) automaton.get(r6);
			Automaton.Real r10 = r8.multiply(r9); // x mul y
			int r11 = automaton.add(r10);
			int r12 = automaton.add(r7);
			Automaton.List r13 = new Automaton.List(r11, r12); // [x mul yrest]
			int r14 = automaton.add(r13);
			Automaton.Term r15 = new Automaton.Term(K_Mul, r14);
			int r16 = automaton.add(r15);
			if(r0 != r16) {
				return automaton.rewrite(r0, r16);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Multiplication_2"; }
		public final int rank() { return 0; }

		public final int minimum() { return 5; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Multiplication_3
	private final static class Reduction_51 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_51(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Mul) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.List l1 = (Automaton.List) s1;
				int r2 = l1.get(0);
				int r3 = l1.get(1);
				Automaton.State s3 = automaton.get(r3);
				Automaton.Collection c3 = (Automaton.Collection) s3;
				if(c3.size() >= 1) {
					for(int r5=0;r5!=c3.size();++r5) {
						int r4 = c3.get(r5);
						Automaton.State s4 = automaton.get(r4);
						if(s4.kind == K_Mul) {
							Automaton.Term t4 = (Automaton.Term) s4;
							int r6 = t4.contents;
							Automaton.State s6 = automaton.get(r6);
							Automaton.List l6 = (Automaton.List) s6;
							int r7 = l6.get(0);
							int r8 = l6.get(1);
							Automaton.State s8 = automaton.get(r8);
							Automaton.Collection c8 = (Automaton.Collection) s8;
							int[] state = {r0, r1, r2, r3, r4, r5, r6, r7, r8, 0, 0};
							activations.add(new Activation(this,null,state));
						}
					}
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r2 = state[2]; // n1
			int r5 = state[5];
			int r7 = state[7]; // n2
			Automaton.Collection s8 = (Automaton.Collection) automaton.get(state[8]);
			int[] s8children = new int[s8.size() - 0];
			for(int s8i=0, s8j=0; s8i != s8.size();++s8i) {
				s8children[s8j++] = s8.get(s8i);
			}
			Automaton.Bag r9 = new Automaton.Bag(s8children);
			Automaton.Collection s3 = (Automaton.Collection) automaton.get(state[3]);
			int[] s3children = new int[s3.size() - 1];
			for(int s3i=0, s3j=0; s3i != s3.size();++s3i) {
				if(s3i == r5) { continue; }
				s3children[s3j++] = s3.get(s3i);
			}
			Automaton.Bag r10 = new Automaton.Bag(s3children);
			Automaton.Real r11 = (Automaton.Real) automaton.get(r2);
			Automaton.Real r12 = (Automaton.Real) automaton.get(r7);
			Automaton.Real r13 = r11.multiply(r12); // n1 mul n2
			int r14 = automaton.add(r13);
			Automaton.Bag r15 = r9.append(r10); // xs append ys
			int r16 = automaton.add(r15);
			Automaton.List r17 = new Automaton.List(r14, r16); // [n1 mul n2xs append ys]
			int r18 = automaton.add(r17);
			Automaton.Term r19 = new Automaton.Term(K_Mul, r18);
			int r20 = automaton.add(r19);
			if(r0 != r20) {
				return automaton.rewrite(r0, r20);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Multiplication_3"; }
		public final int rank() { return 1; }

		public final int minimum() { return 7; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Multiplication_4
	private final static class Reduction_52 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_52(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Mul) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.List l1 = (Automaton.List) s1;
				int r2 = l1.get(0);
				int r3 = l1.get(1);
				Automaton.State s3 = automaton.get(r3);
				Automaton.Collection c3 = (Automaton.Collection) s3;
				if(c3.size() >= 1) {
					for(int r5=0;r5!=c3.size();++r5) {
						int r4 = c3.get(r5);
						Automaton.State s4 = automaton.get(r4);
						if(s4.kind == K_Sum) {
							Automaton.Term t4 = (Automaton.Term) s4;
							int r6 = t4.contents;
							Automaton.State s6 = automaton.get(r6);
							Automaton.List l6 = (Automaton.List) s6;
							int r7 = l6.get(0);
							int r8 = l6.get(1);
							Automaton.State s8 = automaton.get(r8);
							Automaton.Collection c8 = (Automaton.Collection) s8;
							int[] state = {r0, r1, r2, r3, r4, r5, r6, r7, r8, 0, 0};
							activations.add(new Activation(this,null,state));
						}
					}
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r2 = state[2]; // n1
			int r5 = state[5];
			int r7 = state[7]; // n2
			Automaton.Collection s8 = (Automaton.Collection) automaton.get(state[8]);
			int[] s8children = new int[s8.size() - 0];
			for(int s8i=0, s8j=0; s8i != s8.size();++s8i) {
				s8children[s8j++] = s8.get(s8i);
			}
			Automaton.Bag r9 = new Automaton.Bag(s8children);
			Automaton.Collection s3 = (Automaton.Collection) automaton.get(state[3]);
			int[] s3children = new int[s3.size() - 1];
			for(int s3i=0, s3j=0; s3i != s3.size();++s3i) {
				if(s3i == r5) { continue; }
				s3children[s3j++] = s3.get(s3i);
			}
			Automaton.Bag r10 = new Automaton.Bag(s3children);
			Automaton.List t11 = new Automaton.List();
			for(int i12=0;i12<r9.size();i12++) {
				int r12 = (int) r9.get(i12);
				Automaton.Bag r13 = r10.appendFront(r12); // x append ys
				int r14 = automaton.add(r13);
				Automaton.List r15 = new Automaton.List(r2, r14); // [n1x append ys]
				int r16 = automaton.add(r15);
				Automaton.Term r17 = new Automaton.Term(K_Mul, r16);
				int r18 = automaton.add(r17);
				t11.add(r18);
			}
			Automaton.Bag r11 = new Automaton.Bag(t11.toArray());
			Automaton.Real r19 = (Automaton.Real) automaton.get(r2);
			Automaton.Real r20 = (Automaton.Real) automaton.get(r7);
			Automaton.Real r21 = r19.multiply(r20); // n1 mul n2
			int r22 = automaton.add(r21);
			int r23 = automaton.add(r10);
			Automaton.List r24 = new Automaton.List(r22, r23); // [n1 mul n2ys]
			int r25 = automaton.add(r24);
			Automaton.Term r26 = new Automaton.Term(K_Mul, r25);
			Automaton.Real r27 = new Automaton.Real(0); // 0.0
			int r28 = automaton.add(r27);
			int r29 = automaton.add(r26);
			Automaton.Bag r30 = r11.appendFront(r29); // z append zs
			int r31 = automaton.add(r30);
			Automaton.List r32 = new Automaton.List(r28, r31); // [0.0z append zs]
			int r33 = automaton.add(r32);
			Automaton.Term r34 = new Automaton.Term(K_Sum, r33);
			int r35 = automaton.add(r34);
			if(r0 != r35) {
				return automaton.rewrite(r0, r35);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Multiplication_4"; }
		public final int rank() { return 1; }

		public final int minimum() { return 7; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// term $8<Div(^[$2<^$16<AExpr<$8|Num(^real)|Sum(^[^real,^{|$2...|}[$2...]])|Mul(^[^real,^{|$2...|}[$2...]])|$40<VExpr<Var(^string)|$51<Fn(^[^string,$45<^Expr<$16|$51|$86<Value<Num(^real)|Null|Tuple(^[^$86...])|Bool<True|False>|String(^string)|Set(^{^$86...})>>|Tuple(^[$45...])|$126<BExpr<$40|Bool<True|False>|And(^{^$126...})|Or(^{^$126...})|Not(^$126)|Equals(^[$138<^Type<Atom<NotT($161<^Proton<TupleT(^[$161...])|SetT(^[^bool,$161])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$161...])|SetT(^[^bool,$161])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($138)|OrT(^{$138...})|AndT(^{$138...})|SetT(^[^bool,$138])|TupleT(^[$138...])|FunctionT(^[$138,$138,$138...])>>,^{|$45,$45|}[$45,$45]])|Inequality(^[^AType<IntT|RealT>,$2])|Equation(^[^AType<IntT|RealT>,$2])|SubsetEq(^[^SetT(^[^bool,$138]),^SExpr<$40|Set(^{$45...})>,^SExpr<$40|Set(^{$45...})>])|ForAll(^[^{^[^Var(^string),$138]...},^$126])|Exists(^[^{^[^Var(^string),$138]...},^$126])>>|SExpr<$40|Set(^{$45...})>>>...])>|Load(^[$45,^int])|LengthOf($45)>>>>>,$2])>
	public final static int K_Div = 30;
	public final static int Div(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_Div, r1));
	}
	public final static int Div(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_Div, r1));
	}

	// Division_1
	private final static class Reduction_53 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_53(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Div) {
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

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r3 = state[3]; // x
			int r5 = state[5]; // y
			Automaton.Real r6 = (Automaton.Real) automaton.get(r3);
			Automaton.Real r7 = (Automaton.Real) automaton.get(r5);
			Automaton.Real r8 = r6.divide(r7); // x div y
			int r9 = automaton.add(r8);
			Automaton.Term r10 = new Automaton.Term(K_Num, r9);
			int r11 = automaton.add(r10);
			if(r0 != r11) {
				return automaton.rewrite(r0, r11);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Division_1"; }
		public final int rank() { return 0; }

		public final int minimum() { return 5; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Division_2
	private final static class Reduction_54 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_54(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Div) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.List l1 = (Automaton.List) s1;
				int r2 = l1.get(0);
				int r3 = l1.get(1);
				Automaton.State s3 = automaton.get(r3);
				if(s3.kind == K_Div) {
					Automaton.Term t3 = (Automaton.Term) s3;
					int r4 = t3.contents;
					Automaton.State s4 = automaton.get(r4);
					Automaton.List l4 = (Automaton.List) s4;
					int r5 = l4.get(0);
					int r6 = l4.get(1);
					int[] state = {r0, r1, r2, r3, r4, r5, r6};
					activations.add(new Activation(this,null,state));
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r2 = state[2]; // x
			int r5 = state[5]; // y
			int r6 = state[6]; // z
			Automaton.Real r7 = new Automaton.Real(1); // 1.0
			int r8 = automaton.add(r7);
			Automaton.Bag r9 = new Automaton.Bag(r2, r6); // {|xz|}
			int r10 = automaton.add(r9);
			Automaton.List r11 = new Automaton.List(r8, r10); // [1.0{|xz|}]
			int r12 = automaton.add(r11);
			Automaton.Term r13 = new Automaton.Term(K_Mul, r12);
			int r14 = automaton.add(r13);
			Automaton.List r15 = new Automaton.List(r14, r5); // [Mul([1.0{|xz|}])y]
			int r16 = automaton.add(r15);
			Automaton.Term r17 = new Automaton.Term(K_Div, r16);
			int r18 = automaton.add(r17);
			if(r0 != r18) {
				return automaton.rewrite(r0, r18);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Division_2"; }
		public final int rank() { return 0; }

		public final int minimum() { return 9; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Division_3
	private final static class Reduction_55 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_55(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Div) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.List l1 = (Automaton.List) s1;
				int r2 = l1.get(0);
				Automaton.State s2 = automaton.get(r2);
				if(s2.kind == K_Div) {
					Automaton.Term t2 = (Automaton.Term) s2;
					int r3 = t2.contents;
					Automaton.State s3 = automaton.get(r3);
					Automaton.List l3 = (Automaton.List) s3;
					int r4 = l3.get(0);
					int r5 = l3.get(1);
					int r6 = l1.get(1);
					int[] state = {r0, r1, r2, r3, r4, r5, r6};
					activations.add(new Activation(this,null,state));
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r4 = state[4]; // x
			int r5 = state[5]; // y
			int r6 = state[6]; // z
			Automaton.Real r7 = new Automaton.Real(1); // 1.0
			int r8 = automaton.add(r7);
			Automaton.Bag r9 = new Automaton.Bag(r5, r6); // {|yz|}
			int r10 = automaton.add(r9);
			Automaton.List r11 = new Automaton.List(r8, r10); // [1.0{|yz|}]
			int r12 = automaton.add(r11);
			Automaton.Term r13 = new Automaton.Term(K_Mul, r12);
			int r14 = automaton.add(r13);
			Automaton.List r15 = new Automaton.List(r4, r14); // [xMul([1.0{|yz|}])]
			int r16 = automaton.add(r15);
			Automaton.Term r17 = new Automaton.Term(K_Div, r16);
			int r18 = automaton.add(r17);
			if(r0 != r18) {
				return automaton.rewrite(r0, r18);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Division_3"; }
		public final int rank() { return 0; }

		public final int minimum() { return 9; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Division_4
	private final static class Reduction_56 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_56(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Div) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.List l1 = (Automaton.List) s1;
				int r2 = l1.get(0);
				int r3 = l1.get(1);
				Automaton.State s3 = automaton.get(r3);
				if(s3.kind == K_Num) {
					Automaton.Term t3 = (Automaton.Term) s3;
					int r4 = t3.contents;
					int[] state = {r0, r1, r2, r3, r4};
					activations.add(new Activation(this,null,state));
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r2 = state[2]; // x
			int r4 = state[4]; // n
			Automaton.Real r5 = new Automaton.Real(1); // 1.0
			Automaton.Real r6 = (Automaton.Real) automaton.get(r4);
			boolean r7 = r6.equals(r5);    // n eq 1.0
			if(r7) {
				if(r0 != r2) {
					return automaton.rewrite(r0, r2);
				}
			}
			Automaton.Real r8 = new Automaton.Real(0); // 0.0
			Automaton.Real r9 = (Automaton.Real) automaton.get(r4);
			boolean r10 = r9.compareTo(r8)<0; // n lt 0.0
			if(r10) {
				Automaton.Real r11 = new Automaton.Real(1); // 1.0
				Automaton.Real r12 = r11.negate(); // -1.0
				int r13 = automaton.add(r12);
				Automaton.Bag r14 = new Automaton.Bag(r2); // {|x|}
				int r15 = automaton.add(r14);
				Automaton.List r16 = new Automaton.List(r13, r15); // [-1.0{|x|}]
				int r17 = automaton.add(r16);
				Automaton.Term r18 = new Automaton.Term(K_Mul, r17);
				int r19 = automaton.add(r18);
				Automaton.Real r20 = (Automaton.Real) automaton.get(r4);
				Automaton.Real r21 = r20.negate(); // -n
				int r22 = automaton.add(r21);
				Automaton.Term r23 = new Automaton.Term(K_Num, r22);
				int r24 = automaton.add(r23);
				Automaton.List r25 = new Automaton.List(r19, r24); // [Mul([-1.0{|x|}])Num(-n)]
				int r26 = automaton.add(r25);
				Automaton.Term r27 = new Automaton.Term(K_Div, r26);
				int r28 = automaton.add(r27);
				if(r0 != r28) {
					return automaton.rewrite(r0, r28);
				}
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Division_4"; }
		public final int rank() { return 1; }

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Division_5
	private final static class Reduction_57 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_57(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Div) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.List l1 = (Automaton.List) s1;
				int r2 = l1.get(0);
				Automaton.State s2 = automaton.get(r2);
				if(s2.kind == K_Mul) {
					Automaton.Term t2 = (Automaton.Term) s2;
					int r3 = t2.contents;
					Automaton.State s3 = automaton.get(r3);
					Automaton.List l3 = (Automaton.List) s3;
					int r4 = l3.get(0);
					int r5 = l3.get(1);
					Automaton.State s5 = automaton.get(r5);
					Automaton.Collection c5 = (Automaton.Collection) s5;
					if(c5.size() >= 1) {
						for(int r7=0;r7!=c5.size();++r7) {
							int r6 = c5.get(r7);
							int r9 = l1.get(1);
							int[] state = {r0, r1, r2, r3, r4, r5, r6, r7, 0, r9};
							activations.add(new Activation(this,null,state));
						}
					}
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r4 = state[4]; // n
			int r6 = state[6]; // x
			int r7 = state[7];
			Automaton.Collection s5 = (Automaton.Collection) automaton.get(state[5]);
			int[] s5children = new int[s5.size() - 1];
			for(int s5i=0, s5j=0; s5i != s5.size();++s5i) {
				if(s5i == r7) { continue; }
				s5children[s5j++] = s5.get(s5i);
			}
			Automaton.Bag r8 = new Automaton.Bag(s5children);
			int r9 = state[9]; // y
			boolean r10 = r6 == r9;        // x eq y
			if(r10) {
				int r11 = automaton.add(r8);
				Automaton.List r12 = new Automaton.List(r4, r11); // [nxs]
				int r13 = automaton.add(r12);
				Automaton.Term r14 = new Automaton.Term(K_Mul, r13);
				int r15 = automaton.add(r14);
				if(r0 != r15) {
					return automaton.rewrite(r0, r15);
				}
			}
			boolean r16 = Runtime.accepts(type20, automaton, r9, SCHEMA); // y is ^Num(^real)
			if(r16) {
				Automaton.Term r17 = (Automaton.Term) automaton.get(r9);
				int r18 = r17.contents;
				Automaton.Real r19 = (Automaton.Real) automaton.get(r4);
				Automaton.Real r20 = (Automaton.Real) automaton.get(r18);
				Automaton.Real r21 = r19.divide(r20); // n div *y
				int r22 = automaton.add(r21);
				int r23 = automaton.add(r8);
				Automaton.List r24 = new Automaton.List(r22, r23); // [n div *yxs]
				int r25 = automaton.add(r24);
				Automaton.Term r26 = new Automaton.Term(K_Mul, r25);
				int r27 = automaton.add(r26);
				if(r0 != r27) {
					return automaton.rewrite(r0, r27);
				}
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Division_5"; }
		public final int rank() { return 1; }

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Division_6
	private final static class Reduction_58 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_58(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Div) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.List l1 = (Automaton.List) s1;
				int r2 = l1.get(0);
				Automaton.State s2 = automaton.get(r2);
				if(s2.kind == K_Sum) {
					Automaton.Term t2 = (Automaton.Term) s2;
					int r3 = t2.contents;
					Automaton.State s3 = automaton.get(r3);
					Automaton.List l3 = (Automaton.List) s3;
					int r4 = l3.get(0);
					int r5 = l3.get(1);
					Automaton.State s5 = automaton.get(r5);
					Automaton.Collection c5 = (Automaton.Collection) s5;
					int r7 = l1.get(1);
					int[] state = {r0, r1, r2, r3, r4, r5, 0, r7};
					activations.add(new Activation(this,null,state));
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r4 = state[4]; // n
			Automaton.Collection s5 = (Automaton.Collection) automaton.get(state[5]);
			int[] s5children = new int[s5.size() - 0];
			for(int s5i=0, s5j=0; s5i != s5.size();++s5i) {
				s5children[s5j++] = s5.get(s5i);
			}
			Automaton.Bag r6 = new Automaton.Bag(s5children);
			int r7 = state[7]; // y
			Automaton.List t8 = new Automaton.List();
			for(int i9=0;i9<r6.size();i9++) {
				int r9 = (int) r6.get(i9);
				Automaton.List r10 = new Automaton.List(r9, r7); // [xy]
				int r11 = automaton.add(r10);
				Automaton.Term r12 = new Automaton.Term(K_Div, r11);
				int r13 = automaton.add(r12);
				t8.add(r13);
			}
			Automaton.Bag r8 = new Automaton.Bag(t8.toArray());
			Automaton.Real r14 = new Automaton.Real(0); // 0.0
			int r15 = automaton.add(r14);
			Automaton.Term r16 = new Automaton.Term(K_Num, r4);
			int r17 = automaton.add(r16);
			Automaton.List r18 = new Automaton.List(r17, r7); // [Num(n)y]
			int r19 = automaton.add(r18);
			Automaton.Term r20 = new Automaton.Term(K_Div, r19);
			int r21 = automaton.add(r20);
			Automaton.Bag r22 = r8.append(r21); // ys append Div([Num(n)y])
			int r23 = automaton.add(r22);
			Automaton.List r24 = new Automaton.List(r15, r23); // [0.0ys append Div([Num(n)y])]
			int r25 = automaton.add(r24);
			Automaton.Term r26 = new Automaton.Term(K_Sum, r25);
			int r27 = automaton.add(r26);
			if(r0 != r27) {
				return automaton.rewrite(r0, r27);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Division_6"; }
		public final int rank() { return 1; }

		public final int minimum() { return 7; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Division_7
	private final static class Reduction_59 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_59(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Div) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.List l1 = (Automaton.List) s1;
				int r2 = l1.get(0);
				Automaton.State s2 = automaton.get(r2);
				if(s2.kind == K_Mul) {
					Automaton.Term t2 = (Automaton.Term) s2;
					int r3 = t2.contents;
					Automaton.State s3 = automaton.get(r3);
					Automaton.List l3 = (Automaton.List) s3;
					int r4 = l3.get(0);
					int r5 = l3.get(1);
					Automaton.State s5 = automaton.get(r5);
					Automaton.Collection c5 = (Automaton.Collection) s5;
					int r7 = l1.get(1);
					int[] state = {r0, r1, r2, r3, r4, r5, 0, r7};
					activations.add(new Activation(this,null,state));
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r4 = state[4]; // n
			Automaton.Collection s5 = (Automaton.Collection) automaton.get(state[5]);
			int[] s5children = new int[s5.size() - 0];
			for(int s5i=0, s5j=0; s5i != s5.size();++s5i) {
				s5children[s5j++] = s5.get(s5i);
			}
			Automaton.Bag r6 = new Automaton.Bag(s5children);
			int r7 = state[7]; // y
			Automaton.Real r8 = new Automaton.Real(1); // 1.0
			int r9 = automaton.add(r8);
			Automaton.Term r10 = new Automaton.Term(K_Num, r9);
			int r11 = automaton.add(r10);
			Automaton.List r12 = new Automaton.List(r11, r7); // [Num(1.0)y]
			int r13 = automaton.add(r12);
			Automaton.Term r14 = new Automaton.Term(K_Div, r13);
			int r15 = automaton.add(r14);
			Automaton.Bag r16 = r6.append(r15); // xs append Div([Num(1.0)y])
			int r17 = automaton.add(r16);
			Automaton.List r18 = new Automaton.List(r4, r17); // [nxs append Div([Num(1.0)y])]
			int r19 = automaton.add(r18);
			Automaton.Term r20 = new Automaton.Term(K_Mul, r19);
			int r21 = automaton.add(r20);
			if(r0 != r21) {
				return automaton.rewrite(r0, r21);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Division_7"; }
		public final int rank() { return 1; }

		public final int minimum() { return 7; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// term $12<Sum($10<^[^real,^{|$3<^$20<AExpr<$12|Num(^real)|Mul($10)|Div(^[$3,$3])|$40<VExpr<Var(^string)|$51<Fn(^[^string,$45<^Expr<$20|$51|$86<Value<Num(^real)|Null|Tuple(^[^$86...])|Bool<True|False>|String(^string)|Set(^{^$86...})>>|Tuple(^[$45...])|$126<BExpr<$40|Bool<True|False>|And(^{^$126...})|Or(^{^$126...})|Not(^$126)|Equals(^[$138<^Type<Atom<NotT($161<^Proton<TupleT(^[$161...])|SetT(^[^bool,$161])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$161...])|SetT(^[^bool,$161])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($138)|OrT(^{$138...})|AndT(^{$138...})|SetT(^[^bool,$138])|TupleT(^[$138...])|FunctionT(^[$138,$138,$138...])>>,^{|$45,$45|}[$45,$45]])|Inequality(^[^AType<IntT|RealT>,$3])|Equation(^[^AType<IntT|RealT>,$3])|SubsetEq(^[^SetT(^[^bool,$138]),^SExpr<$40|Set(^{$45...})>,^SExpr<$40|Set(^{$45...})>])|ForAll(^[^{^[^Var(^string),$138]...},^$126])|Exists(^[^{^[^Var(^string),$138]...},^$126])>>|SExpr<$40|Set(^{$45...})>>>...])>|Load(^[$45,^int])|LengthOf($45)>>>>>...|}[$3<^$20<AExpr<$12|Num(^real)|Mul($10)|Div(^[$3,$3])|$40<VExpr<Var(^string)|$51<Fn(^[^string,$45<^Expr<$20|$51|$86<Value<Num(^real)|Null|Tuple(^[^$86...])|Bool<True|False>|String(^string)|Set(^{^$86...})>>|Tuple(^[$45...])|$126<BExpr<$40|Bool<True|False>|And(^{^$126...})|Or(^{^$126...})|Not(^$126)|Equals(^[$138<^Type<Atom<NotT($161<^Proton<TupleT(^[$161...])|SetT(^[^bool,$161])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$161...])|SetT(^[^bool,$161])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($138)|OrT(^{$138...})|AndT(^{$138...})|SetT(^[^bool,$138])|TupleT(^[$138...])|FunctionT(^[$138,$138,$138...])>>,^{|$45,$45|}[$45,$45]])|Inequality(^[^AType<IntT|RealT>,$3])|Equation(^[^AType<IntT|RealT>,$3])|SubsetEq(^[^SetT(^[^bool,$138]),^SExpr<$40|Set(^{$45...})>,^SExpr<$40|Set(^{$45...})>])|ForAll(^[^{^[^Var(^string),$138]...},^$126])|Exists(^[^{^[^Var(^string),$138]...},^$126])>>|SExpr<$40|Set(^{$45...})>>>...])>|Load(^[$45,^int])|LengthOf($45)>>>>>...]]>)>
	public final static int K_Sum = 31;
	public final static int Sum(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_Sum, r1));
	}
	public final static int Sum(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_Sum, r1));
	}

	// Sum_1
	private final static class Reduction_60 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_60(Pattern.Term pattern) { super(pattern); }

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

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r2 = state[2]; // n
			Automaton.Term r4 = new Automaton.Term(K_Num, r2);
			int r5 = automaton.add(r4);
			if(r0 != r5) {
				return automaton.rewrite(r0, r5);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Sum_1"; }
		public final int rank() { return 0; }

		public final int minimum() { return 3; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Sum_2
	private final static class Reduction_61 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_61(Pattern.Term pattern) { super(pattern); }

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
				if(c3.size() == 1) {
					for(int r5=0;r5!=c3.size();++r5) {
						int r4 = c3.get(r5);
						Automaton.State s4 = automaton.get(r4);
						if(s4.kind == K_Mul) {
							Automaton.Term t4 = (Automaton.Term) s4;
							int r6 = t4.contents;
							Automaton.State s6 = automaton.get(r6);
							Automaton.List l6 = (Automaton.List) s6;
							int r7 = l6.get(0);
							int r8 = l6.get(1);
							Automaton.State s8 = automaton.get(r8);
							Automaton.Collection c8 = (Automaton.Collection) s8;
							if(c8.size() == 1) {
								for(int r10=0;r10!=c8.size();++r10) {
									int r9 = c8.get(r10);
									if(Runtime.accepts(type9,automaton,automaton.get(r9), SCHEMA)) {
										int[] state = {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10};
										activations.add(new Activation(this,null,state));
									}
								}
							}
						}
					}
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r2 = state[2]; // n
			int r5 = state[5];
			int r7 = state[7]; // m
			int r9 = state[9]; // x
			int r10 = state[10];
			Automaton.Real r11 = new Automaton.Real(0); // 0.0
			Automaton.Real r12 = (Automaton.Real) automaton.get(r2);
			boolean r13 = r12.equals(r11); // n eq 0.0
			boolean r14 = false;           // n eq 0.0 && m eq 1.0
			if(r13) {
				Automaton.Real r15 = new Automaton.Real(1); // 1.0
				Automaton.Real r16 = (Automaton.Real) automaton.get(r7);
				boolean r17 = r16.equals(r15); // m eq 1.0
				r14 = r17;
			}
			if(r14) {
				if(r0 != r9) {
					return automaton.rewrite(r0, r9);
				}
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Sum_2"; }
		public final int rank() { return 0; }

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Sum_3
	private final static class Reduction_62 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_62(Pattern.Term pattern) { super(pattern); }

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
					for(int r5=0;r5!=c3.size();++r5) {
						int r4 = c3.get(r5);
						int[] state = {r0, r1, r2, r3, r4, r5, 0};
						activations.add(new Activation(this,null,state));
					}
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r2 = state[2]; // n
			int r4 = state[4]; // x
			int r5 = state[5];
			Automaton.Collection s3 = (Automaton.Collection) automaton.get(state[3]);
			int[] s3children = new int[s3.size() - 1];
			for(int s3i=0, s3j=0; s3i != s3.size();++s3i) {
				if(s3i == r5) { continue; }
				s3children[s3j++] = s3.get(s3i);
			}
			Automaton.Bag r6 = new Automaton.Bag(s3children);
			boolean r7 = Runtime.accepts(type20, automaton, r4, SCHEMA); // x is ^Num(^real)
			boolean r8 = Runtime.accepts(type21, automaton, r4, SCHEMA); // x is ^$13<Sum($11<^[^real,^{|$4<^$21<AExpr<$13|Num(^real)|Mul($11)|Div(^[$4,$4])|$41<VExpr<Var(^string)|$52<Fn(^[^string,$46<^Expr<$21|$52|$87<Value<Num(^real)|Null|Tuple(^[^$87...])|Bool<True|False>|String(^string)|Set(^{^$87...})>>|Tuple(^[$46...])|$127<BExpr<$41|Bool<True|False>|And(^{^$127...})|Or(^{^$127...})|Not(^$127)|Equals(^[$139<^Type<Atom<NotT($162<^Proton<TupleT(^[$162...])|SetT(^[^bool,$162])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$162...])|SetT(^[^bool,$162])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($139)|OrT(^{$139...})|AndT(^{$139...})|SetT(^[^bool,$139])|TupleT(^[$139...])|FunctionT(^[$139,$139,$139...])>>,^{|$46,$46|}[$46,$46]])|Inequality(^[^AType<IntT|RealT>,$4])|Equation(^[^AType<IntT|RealT>,$4])|SubsetEq(^[^SetT(^[^bool,$139]),^SExpr<$41|Set(^{$46...})>,^SExpr<$41|Set(^{$46...})>])|ForAll(^[^{^[^Var(^string),$139]...},^$127])|Exists(^[^{^[^Var(^string),$139]...},^$127])>>|SExpr<$41|Set(^{$46...})>>>...])>|Load(^[$46,^int])|LengthOf($46)>>>>>...|}[$4<^$21<AExpr<$13|Num(^real)|Mul($11)|Div(^[$4,$4])|$41<VExpr<Var(^string)|$52<Fn(^[^string,$46<^Expr<$21|$52|$87<Value<Num(^real)|Null|Tuple(^[^$87...])|Bool<True|False>|String(^string)|Set(^{^$87...})>>|Tuple(^[$46...])|$127<BExpr<$41|Bool<True|False>|And(^{^$127...})|Or(^{^$127...})|Not(^$127)|Equals(^[$139<^Type<Atom<NotT($162<^Proton<TupleT(^[$162...])|SetT(^[^bool,$162])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$162...])|SetT(^[^bool,$162])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($139)|OrT(^{$139...})|AndT(^{$139...})|SetT(^[^bool,$139])|TupleT(^[$139...])|FunctionT(^[$139,$139,$139...])>>,^{|$46,$46|}[$46,$46]])|Inequality(^[^AType<IntT|RealT>,$4])|Equation(^[^AType<IntT|RealT>,$4])|SubsetEq(^[^SetT(^[^bool,$139]),^SExpr<$41|Set(^{$46...})>,^SExpr<$41|Set(^{$46...})>])|ForAll(^[^{^[^Var(^string),$139]...},^$127])|Exists(^[^{^[^Var(^string),$139]...},^$127])>>|SExpr<$41|Set(^{$46...})>>>...])>|Load(^[$46,^int])|LengthOf($46)>>>>>...]]>)>
			boolean r9 = Runtime.accepts(type22, automaton, r4, SCHEMA); // x is ^$13<Mul($11<^[^real,^{|$4<^$21<AExpr<$13|Num(^real)|Sum($11)|Div(^[$4,$4])|$41<VExpr<Var(^string)|$52<Fn(^[^string,$46<^Expr<$21|$52|$87<Value<Num(^real)|Null|Tuple(^[^$87...])|Bool<True|False>|String(^string)|Set(^{^$87...})>>|Tuple(^[$46...])|$127<BExpr<$41|Bool<True|False>|And(^{^$127...})|Or(^{^$127...})|Not(^$127)|Equals(^[$139<^Type<Atom<NotT($162<^Proton<TupleT(^[$162...])|SetT(^[^bool,$162])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$162...])|SetT(^[^bool,$162])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($139)|OrT(^{$139...})|AndT(^{$139...})|SetT(^[^bool,$139])|TupleT(^[$139...])|FunctionT(^[$139,$139,$139...])>>,^{|$46,$46|}[$46,$46]])|Inequality(^[^AType<IntT|RealT>,$4])|Equation(^[^AType<IntT|RealT>,$4])|SubsetEq(^[^SetT(^[^bool,$139]),^SExpr<$41|Set(^{$46...})>,^SExpr<$41|Set(^{$46...})>])|ForAll(^[^{^[^Var(^string),$139]...},^$127])|Exists(^[^{^[^Var(^string),$139]...},^$127])>>|SExpr<$41|Set(^{$46...})>>>...])>|Load(^[$46,^int])|LengthOf($46)>>>>>...|}[$4<^$21<AExpr<$13|Num(^real)|Sum($11)|Div(^[$4,$4])|$41<VExpr<Var(^string)|$52<Fn(^[^string,$46<^Expr<$21|$52|$87<Value<Num(^real)|Null|Tuple(^[^$87...])|Bool<True|False>|String(^string)|Set(^{^$87...})>>|Tuple(^[$46...])|$127<BExpr<$41|Bool<True|False>|And(^{^$127...})|Or(^{^$127...})|Not(^$127)|Equals(^[$139<^Type<Atom<NotT($162<^Proton<TupleT(^[$162...])|SetT(^[^bool,$162])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$162...])|SetT(^[^bool,$162])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($139)|OrT(^{$139...})|AndT(^{$139...})|SetT(^[^bool,$139])|TupleT(^[$139...])|FunctionT(^[$139,$139,$139...])>>,^{|$46,$46|}[$46,$46]])|Inequality(^[^AType<IntT|RealT>,$4])|Equation(^[^AType<IntT|RealT>,$4])|SubsetEq(^[^SetT(^[^bool,$139]),^SExpr<$41|Set(^{$46...})>,^SExpr<$41|Set(^{$46...})>])|ForAll(^[^{^[^Var(^string),$139]...},^$127])|Exists(^[^{^[^Var(^string),$139]...},^$127])>>|SExpr<$41|Set(^{$46...})>>>...])>|Load(^[$46,^int])|LengthOf($46)>>>>>...]]>)>
			boolean r10 = r8 || r9;        // x is ^$13<Sum($11<^[^real,^{|$4<^$21<AExpr<$13|Num(^real)|Mul($11)|Div(^[$4,$4])|$41<VExpr<Var(^string)|$52<Fn(^[^string,$46<^Expr<$21|$52|$87<Value<Num(^real)|Null|Tuple(^[^$87...])|Bool<True|False>|String(^string)|Set(^{^$87...})>>|Tuple(^[$46...])|$127<BExpr<$41|Bool<True|False>|And(^{^$127...})|Or(^{^$127...})|Not(^$127)|Equals(^[$139<^Type<Atom<NotT($162<^Proton<TupleT(^[$162...])|SetT(^[^bool,$162])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$162...])|SetT(^[^bool,$162])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($139)|OrT(^{$139...})|AndT(^{$139...})|SetT(^[^bool,$139])|TupleT(^[$139...])|FunctionT(^[$139,$139,$139...])>>,^{|$46,$46|}[$46,$46]])|Inequality(^[^AType<IntT|RealT>,$4])|Equation(^[^AType<IntT|RealT>,$4])|SubsetEq(^[^SetT(^[^bool,$139]),^SExpr<$41|Set(^{$46...})>,^SExpr<$41|Set(^{$46...})>])|ForAll(^[^{^[^Var(^string),$139]...},^$127])|Exists(^[^{^[^Var(^string),$139]...},^$127])>>|SExpr<$41|Set(^{$46...})>>>...])>|Load(^[$46,^int])|LengthOf($46)>>>>>...|}[$4<^$21<AExpr<$13|Num(^real)|Mul($11)|Div(^[$4,$4])|$41<VExpr<Var(^string)|$52<Fn(^[^string,$46<^Expr<$21|$52|$87<Value<Num(^real)|Null|Tuple(^[^$87...])|Bool<True|False>|String(^string)|Set(^{^$87...})>>|Tuple(^[$46...])|$127<BExpr<$41|Bool<True|False>|And(^{^$127...})|Or(^{^$127...})|Not(^$127)|Equals(^[$139<^Type<Atom<NotT($162<^Proton<TupleT(^[$162...])|SetT(^[^bool,$162])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$162...])|SetT(^[^bool,$162])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($139)|OrT(^{$139...})|AndT(^{$139...})|SetT(^[^bool,$139])|TupleT(^[$139...])|FunctionT(^[$139,$139,$139...])>>,^{|$46,$46|}[$46,$46]])|Inequality(^[^AType<IntT|RealT>,$4])|Equation(^[^AType<IntT|RealT>,$4])|SubsetEq(^[^SetT(^[^bool,$139]),^SExpr<$41|Set(^{$46...})>,^SExpr<$41|Set(^{$46...})>])|ForAll(^[^{^[^Var(^string),$139]...},^$127])|Exists(^[^{^[^Var(^string),$139]...},^$127])>>|SExpr<$41|Set(^{$46...})>>>...])>|Load(^[$46,^int])|LengthOf($46)>>>>>...]]>)> || x is ^$13<Mul($11<^[^real,^{|$4<^$21<AExpr<$13|Num(^real)|Sum($11)|Div(^[$4,$4])|$41<VExpr<Var(^string)|$52<Fn(^[^string,$46<^Expr<$21|$52|$87<Value<Num(^real)|Null|Tuple(^[^$87...])|Bool<True|False>|String(^string)|Set(^{^$87...})>>|Tuple(^[$46...])|$127<BExpr<$41|Bool<True|False>|And(^{^$127...})|Or(^{^$127...})|Not(^$127)|Equals(^[$139<^Type<Atom<NotT($162<^Proton<TupleT(^[$162...])|SetT(^[^bool,$162])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$162...])|SetT(^[^bool,$162])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($139)|OrT(^{$139...})|AndT(^{$139...})|SetT(^[^bool,$139])|TupleT(^[$139...])|FunctionT(^[$139,$139,$139...])>>,^{|$46,$46|}[$46,$46]])|Inequality(^[^AType<IntT|RealT>,$4])|Equation(^[^AType<IntT|RealT>,$4])|SubsetEq(^[^SetT(^[^bool,$139]),^SExpr<$41|Set(^{$46...})>,^SExpr<$41|Set(^{$46...})>])|ForAll(^[^{^[^Var(^string),$139]...},^$127])|Exists(^[^{^[^Var(^string),$139]...},^$127])>>|SExpr<$41|Set(^{$46...})>>>...])>|Load(^[$46,^int])|LengthOf($46)>>>>>...|}[$4<^$21<AExpr<$13|Num(^real)|Sum($11)|Div(^[$4,$4])|$41<VExpr<Var(^string)|$52<Fn(^[^string,$46<^Expr<$21|$52|$87<Value<Num(^real)|Null|Tuple(^[^$87...])|Bool<True|False>|String(^string)|Set(^{^$87...})>>|Tuple(^[$46...])|$127<BExpr<$41|Bool<True|False>|And(^{^$127...})|Or(^{^$127...})|Not(^$127)|Equals(^[$139<^Type<Atom<NotT($162<^Proton<TupleT(^[$162...])|SetT(^[^bool,$162])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$162...])|SetT(^[^bool,$162])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($139)|OrT(^{$139...})|AndT(^{$139...})|SetT(^[^bool,$139])|TupleT(^[$139...])|FunctionT(^[$139,$139,$139...])>>,^{|$46,$46|}[$46,$46]])|Inequality(^[^AType<IntT|RealT>,$4])|Equation(^[^AType<IntT|RealT>,$4])|SubsetEq(^[^SetT(^[^bool,$139]),^SExpr<$41|Set(^{$46...})>,^SExpr<$41|Set(^{$46...})>])|ForAll(^[^{^[^Var(^string),$139]...},^$127])|Exists(^[^{^[^Var(^string),$139]...},^$127])>>|SExpr<$41|Set(^{$46...})>>>...])>|Load(^[$46,^int])|LengthOf($46)>>>>>...]]>)>
			boolean r11 = r7 || r10;       // x is ^Num(^real) || x is ^$13<Sum($11<^[^real,^{|$4<^$21<AExpr<$13|Num(^real)|Mul($11)|Div(^[$4,$4])|$41<VExpr<Var(^string)|$52<Fn(^[^string,$46<^Expr<$21|$52|$87<Value<Num(^real)|Null|Tuple(^[^$87...])|Bool<True|False>|String(^string)|Set(^{^$87...})>>|Tuple(^[$46...])|$127<BExpr<$41|Bool<True|False>|And(^{^$127...})|Or(^{^$127...})|Not(^$127)|Equals(^[$139<^Type<Atom<NotT($162<^Proton<TupleT(^[$162...])|SetT(^[^bool,$162])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$162...])|SetT(^[^bool,$162])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($139)|OrT(^{$139...})|AndT(^{$139...})|SetT(^[^bool,$139])|TupleT(^[$139...])|FunctionT(^[$139,$139,$139...])>>,^{|$46,$46|}[$46,$46]])|Inequality(^[^AType<IntT|RealT>,$4])|Equation(^[^AType<IntT|RealT>,$4])|SubsetEq(^[^SetT(^[^bool,$139]),^SExpr<$41|Set(^{$46...})>,^SExpr<$41|Set(^{$46...})>])|ForAll(^[^{^[^Var(^string),$139]...},^$127])|Exists(^[^{^[^Var(^string),$139]...},^$127])>>|SExpr<$41|Set(^{$46...})>>>...])>|Load(^[$46,^int])|LengthOf($46)>>>>>...|}[$4<^$21<AExpr<$13|Num(^real)|Mul($11)|Div(^[$4,$4])|$41<VExpr<Var(^string)|$52<Fn(^[^string,$46<^Expr<$21|$52|$87<Value<Num(^real)|Null|Tuple(^[^$87...])|Bool<True|False>|String(^string)|Set(^{^$87...})>>|Tuple(^[$46...])|$127<BExpr<$41|Bool<True|False>|And(^{^$127...})|Or(^{^$127...})|Not(^$127)|Equals(^[$139<^Type<Atom<NotT($162<^Proton<TupleT(^[$162...])|SetT(^[^bool,$162])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$162...])|SetT(^[^bool,$162])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($139)|OrT(^{$139...})|AndT(^{$139...})|SetT(^[^bool,$139])|TupleT(^[$139...])|FunctionT(^[$139,$139,$139...])>>,^{|$46,$46|}[$46,$46]])|Inequality(^[^AType<IntT|RealT>,$4])|Equation(^[^AType<IntT|RealT>,$4])|SubsetEq(^[^SetT(^[^bool,$139]),^SExpr<$41|Set(^{$46...})>,^SExpr<$41|Set(^{$46...})>])|ForAll(^[^{^[^Var(^string),$139]...},^$127])|Exists(^[^{^[^Var(^string),$139]...},^$127])>>|SExpr<$41|Set(^{$46...})>>>...])>|Load(^[$46,^int])|LengthOf($46)>>>>>...]]>)> || x is ^$13<Mul($11<^[^real,^{|$4<^$21<AExpr<$13|Num(^real)|Sum($11)|Div(^[$4,$4])|$41<VExpr<Var(^string)|$52<Fn(^[^string,$46<^Expr<$21|$52|$87<Value<Num(^real)|Null|Tuple(^[^$87...])|Bool<True|False>|String(^string)|Set(^{^$87...})>>|Tuple(^[$46...])|$127<BExpr<$41|Bool<True|False>|And(^{^$127...})|Or(^{^$127...})|Not(^$127)|Equals(^[$139<^Type<Atom<NotT($162<^Proton<TupleT(^[$162...])|SetT(^[^bool,$162])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$162...])|SetT(^[^bool,$162])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($139)|OrT(^{$139...})|AndT(^{$139...})|SetT(^[^bool,$139])|TupleT(^[$139...])|FunctionT(^[$139,$139,$139...])>>,^{|$46,$46|}[$46,$46]])|Inequality(^[^AType<IntT|RealT>,$4])|Equation(^[^AType<IntT|RealT>,$4])|SubsetEq(^[^SetT(^[^bool,$139]),^SExpr<$41|Set(^{$46...})>,^SExpr<$41|Set(^{$46...})>])|ForAll(^[^{^[^Var(^string),$139]...},^$127])|Exists(^[^{^[^Var(^string),$139]...},^$127])>>|SExpr<$41|Set(^{$46...})>>>...])>|Load(^[$46,^int])|LengthOf($46)>>>>>...|}[$4<^$21<AExpr<$13|Num(^real)|Sum($11)|Div(^[$4,$4])|$41<VExpr<Var(^string)|$52<Fn(^[^string,$46<^Expr<$21|$52|$87<Value<Num(^real)|Null|Tuple(^[^$87...])|Bool<True|False>|String(^string)|Set(^{^$87...})>>|Tuple(^[$46...])|$127<BExpr<$41|Bool<True|False>|And(^{^$127...})|Or(^{^$127...})|Not(^$127)|Equals(^[$139<^Type<Atom<NotT($162<^Proton<TupleT(^[$162...])|SetT(^[^bool,$162])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$162...])|SetT(^[^bool,$162])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($139)|OrT(^{$139...})|AndT(^{$139...})|SetT(^[^bool,$139])|TupleT(^[$139...])|FunctionT(^[$139,$139,$139...])>>,^{|$46,$46|}[$46,$46]])|Inequality(^[^AType<IntT|RealT>,$4])|Equation(^[^AType<IntT|RealT>,$4])|SubsetEq(^[^SetT(^[^bool,$139]),^SExpr<$41|Set(^{$46...})>,^SExpr<$41|Set(^{$46...})>])|ForAll(^[^{^[^Var(^string),$139]...},^$127])|Exists(^[^{^[^Var(^string),$139]...},^$127])>>|SExpr<$41|Set(^{$46...})>>>...])>|Load(^[$46,^int])|LengthOf($46)>>>>>...]]>)>
			boolean r12 = !r11;            // !x is ^Num(^real) || x is ^$13<Sum($11<^[^real,^{|$4<^$21<AExpr<$13|Num(^real)|Mul($11)|Div(^[$4,$4])|$41<VExpr<Var(^string)|$52<Fn(^[^string,$46<^Expr<$21|$52|$87<Value<Num(^real)|Null|Tuple(^[^$87...])|Bool<True|False>|String(^string)|Set(^{^$87...})>>|Tuple(^[$46...])|$127<BExpr<$41|Bool<True|False>|And(^{^$127...})|Or(^{^$127...})|Not(^$127)|Equals(^[$139<^Type<Atom<NotT($162<^Proton<TupleT(^[$162...])|SetT(^[^bool,$162])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$162...])|SetT(^[^bool,$162])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($139)|OrT(^{$139...})|AndT(^{$139...})|SetT(^[^bool,$139])|TupleT(^[$139...])|FunctionT(^[$139,$139,$139...])>>,^{|$46,$46|}[$46,$46]])|Inequality(^[^AType<IntT|RealT>,$4])|Equation(^[^AType<IntT|RealT>,$4])|SubsetEq(^[^SetT(^[^bool,$139]),^SExpr<$41|Set(^{$46...})>,^SExpr<$41|Set(^{$46...})>])|ForAll(^[^{^[^Var(^string),$139]...},^$127])|Exists(^[^{^[^Var(^string),$139]...},^$127])>>|SExpr<$41|Set(^{$46...})>>>...])>|Load(^[$46,^int])|LengthOf($46)>>>>>...|}[$4<^$21<AExpr<$13|Num(^real)|Mul($11)|Div(^[$4,$4])|$41<VExpr<Var(^string)|$52<Fn(^[^string,$46<^Expr<$21|$52|$87<Value<Num(^real)|Null|Tuple(^[^$87...])|Bool<True|False>|String(^string)|Set(^{^$87...})>>|Tuple(^[$46...])|$127<BExpr<$41|Bool<True|False>|And(^{^$127...})|Or(^{^$127...})|Not(^$127)|Equals(^[$139<^Type<Atom<NotT($162<^Proton<TupleT(^[$162...])|SetT(^[^bool,$162])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$162...])|SetT(^[^bool,$162])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($139)|OrT(^{$139...})|AndT(^{$139...})|SetT(^[^bool,$139])|TupleT(^[$139...])|FunctionT(^[$139,$139,$139...])>>,^{|$46,$46|}[$46,$46]])|Inequality(^[^AType<IntT|RealT>,$4])|Equation(^[^AType<IntT|RealT>,$4])|SubsetEq(^[^SetT(^[^bool,$139]),^SExpr<$41|Set(^{$46...})>,^SExpr<$41|Set(^{$46...})>])|ForAll(^[^{^[^Var(^string),$139]...},^$127])|Exists(^[^{^[^Var(^string),$139]...},^$127])>>|SExpr<$41|Set(^{$46...})>>>...])>|Load(^[$46,^int])|LengthOf($46)>>>>>...]]>)> || x is ^$13<Mul($11<^[^real,^{|$4<^$21<AExpr<$13|Num(^real)|Sum($11)|Div(^[$4,$4])|$41<VExpr<Var(^string)|$52<Fn(^[^string,$46<^Expr<$21|$52|$87<Value<Num(^real)|Null|Tuple(^[^$87...])|Bool<True|False>|String(^string)|Set(^{^$87...})>>|Tuple(^[$46...])|$127<BExpr<$41|Bool<True|False>|And(^{^$127...})|Or(^{^$127...})|Not(^$127)|Equals(^[$139<^Type<Atom<NotT($162<^Proton<TupleT(^[$162...])|SetT(^[^bool,$162])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$162...])|SetT(^[^bool,$162])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($139)|OrT(^{$139...})|AndT(^{$139...})|SetT(^[^bool,$139])|TupleT(^[$139...])|FunctionT(^[$139,$139,$139...])>>,^{|$46,$46|}[$46,$46]])|Inequality(^[^AType<IntT|RealT>,$4])|Equation(^[^AType<IntT|RealT>,$4])|SubsetEq(^[^SetT(^[^bool,$139]),^SExpr<$41|Set(^{$46...})>,^SExpr<$41|Set(^{$46...})>])|ForAll(^[^{^[^Var(^string),$139]...},^$127])|Exists(^[^{^[^Var(^string),$139]...},^$127])>>|SExpr<$41|Set(^{$46...})>>>...])>|Load(^[$46,^int])|LengthOf($46)>>>>>...|}[$4<^$21<AExpr<$13|Num(^real)|Sum($11)|Div(^[$4,$4])|$41<VExpr<Var(^string)|$52<Fn(^[^string,$46<^Expr<$21|$52|$87<Value<Num(^real)|Null|Tuple(^[^$87...])|Bool<True|False>|String(^string)|Set(^{^$87...})>>|Tuple(^[$46...])|$127<BExpr<$41|Bool<True|False>|And(^{^$127...})|Or(^{^$127...})|Not(^$127)|Equals(^[$139<^Type<Atom<NotT($162<^Proton<TupleT(^[$162...])|SetT(^[^bool,$162])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$162...])|SetT(^[^bool,$162])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($139)|OrT(^{$139...})|AndT(^{$139...})|SetT(^[^bool,$139])|TupleT(^[$139...])|FunctionT(^[$139,$139,$139...])>>,^{|$46,$46|}[$46,$46]])|Inequality(^[^AType<IntT|RealT>,$4])|Equation(^[^AType<IntT|RealT>,$4])|SubsetEq(^[^SetT(^[^bool,$139]),^SExpr<$41|Set(^{$46...})>,^SExpr<$41|Set(^{$46...})>])|ForAll(^[^{^[^Var(^string),$139]...},^$127])|Exists(^[^{^[^Var(^string),$139]...},^$127])>>|SExpr<$41|Set(^{$46...})>>>...])>|Load(^[$46,^int])|LengthOf($46)>>>>>...]]>)>
			if(r12) {
				Automaton.Real r13 = new Automaton.Real(1); // 1.0
				int r14 = automaton.add(r13);
				Automaton.Bag r15 = new Automaton.Bag(r4); // {|x|}
				int r16 = automaton.add(r15);
				Automaton.List r17 = new Automaton.List(r14, r16); // [1.0{|x|}]
				int r18 = automaton.add(r17);
				Automaton.Term r19 = new Automaton.Term(K_Mul, r18);
				int r20 = automaton.add(r19);
				Automaton.Bag r21 = r6.appendFront(r20); // Mul([1.0{|x|}]) append rest
				int r22 = automaton.add(r21);
				Automaton.List r23 = new Automaton.List(r2, r22); // [nMul([1.0{|x|}]) append rest]
				int r24 = automaton.add(r23);
				Automaton.Term r25 = new Automaton.Term(K_Sum, r24);
				int r26 = automaton.add(r25);
				if(r0 != r26) {
					return automaton.rewrite(r0, r26);
				}
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Sum_3"; }
		public final int rank() { return 1; }

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Sum_4
	private final static class Reduction_63 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_63(Pattern.Term pattern) { super(pattern); }

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
					for(int r5=0;r5!=c3.size();++r5) {
						int r4 = c3.get(r5);
						Automaton.State s4 = automaton.get(r4);
						if(s4.kind == K_Num) {
							Automaton.Term t4 = (Automaton.Term) s4;
							int r6 = t4.contents;
							int[] state = {r0, r1, r2, r3, r4, r5, r6, 0};
							activations.add(new Activation(this,null,state));
						}
					}
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r2 = state[2]; // x
			int r5 = state[5];
			int r6 = state[6]; // y
			Automaton.Collection s3 = (Automaton.Collection) automaton.get(state[3]);
			int[] s3children = new int[s3.size() - 1];
			for(int s3i=0, s3j=0; s3i != s3.size();++s3i) {
				if(s3i == r5) { continue; }
				s3children[s3j++] = s3.get(s3i);
			}
			Automaton.Bag r7 = new Automaton.Bag(s3children);
			Automaton.Real r8 = (Automaton.Real) automaton.get(r2);
			Automaton.Real r9 = (Automaton.Real) automaton.get(r6);
			Automaton.Real r10 = r8.add(r9); // x add y
			int r11 = automaton.add(r10);
			int r12 = automaton.add(r7);
			Automaton.List r13 = new Automaton.List(r11, r12); // [x add yrest]
			int r14 = automaton.add(r13);
			Automaton.Term r15 = new Automaton.Term(K_Sum, r14);
			int r16 = automaton.add(r15);
			if(r0 != r16) {
				return automaton.rewrite(r0, r16);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Sum_4"; }
		public final int rank() { return 1; }

		public final int minimum() { return 5; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Sum_5
	private final static class Reduction_64 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_64(Pattern.Term pattern) { super(pattern); }

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
				if(c3.size() >= 2) {
					for(int r5=0;r5!=c3.size();++r5) {
						int r4 = c3.get(r5);
						Automaton.State s4 = automaton.get(r4);
						if(s4.kind == K_Mul) {
							Automaton.Term t4 = (Automaton.Term) s4;
							int r6 = t4.contents;
							Automaton.State s6 = automaton.get(r6);
							Automaton.List l6 = (Automaton.List) s6;
							int r7 = l6.get(0);
							int r8 = l6.get(1);
							Automaton.State s8 = automaton.get(r8);
							Automaton.Collection c8 = (Automaton.Collection) s8;
							for(int r11=0;r11!=c3.size();++r11) {
								if(r11 == r5) { continue; }
								int r10 = c3.get(r11);
								Automaton.State s10 = automaton.get(r10);
								if(s10.kind == K_Mul) {
									Automaton.Term t10 = (Automaton.Term) s10;
									int r12 = t10.contents;
									Automaton.State s12 = automaton.get(r12);
									Automaton.List l12 = (Automaton.List) s12;
									int r13 = l12.get(0);
									int r14 = l12.get(1);
									Automaton.State s14 = automaton.get(r14);
									Automaton.Collection c14 = (Automaton.Collection) s14;
									int[] state = {r0, r1, r2, r3, r4, r5, r6, r7, r8, 0, r10, r11, r12, r13, r14, 0, 0};
									activations.add(new Activation(this,null,state));
								}
							}
						}
					}
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r2 = state[2]; // n
			int r5 = state[5];
			int r7 = state[7]; // x
			int r8 = state[8]; // xs
			int r11 = state[11];
			int r13 = state[13]; // y
			int r14 = state[14]; // ys
			Automaton.Collection s3 = (Automaton.Collection) automaton.get(state[3]);
			int[] s3children = new int[s3.size() - 2];
			for(int s3i=0, s3j=0; s3i != s3.size();++s3i) {
				if(s3i == r5 || s3i == r11) { continue; }
				s3children[s3j++] = s3.get(s3i);
			}
			Automaton.Bag r16 = new Automaton.Bag(s3children);
			boolean r17 = r8 == r14;       // xs eq ys
			if(r17) {
				Automaton.Real r18 = (Automaton.Real) automaton.get(r7);
				Automaton.Real r19 = (Automaton.Real) automaton.get(r13);
				Automaton.Real r20 = r18.add(r19); // x add y
				int r21 = automaton.add(r20);
				Automaton.List r22 = new Automaton.List(r21, r8); // [x add yxs]
				int r23 = automaton.add(r22);
				Automaton.Term r24 = new Automaton.Term(K_Mul, r23);
				int r25 = automaton.add(r24);
				Automaton.Bag r26 = r16.appendFront(r25); // Mul([x add yxs]) append zs
				int r27 = automaton.add(r26);
				Automaton.List r28 = new Automaton.List(r2, r27); // [nMul([x add yxs]) append zs]
				int r29 = automaton.add(r28);
				Automaton.Term r30 = new Automaton.Term(K_Sum, r29);
				int r31 = automaton.add(r30);
				if(r0 != r31) {
					return automaton.rewrite(r0, r31);
				}
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Sum_5"; }
		public final int rank() { return 2; }

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Sum_6
	private final static class Reduction_65 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_65(Pattern.Term pattern) { super(pattern); }

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
					for(int r5=0;r5!=c3.size();++r5) {
						int r4 = c3.get(r5);
						Automaton.State s4 = automaton.get(r4);
						if(s4.kind == K_Sum) {
							Automaton.Term t4 = (Automaton.Term) s4;
							int r6 = t4.contents;
							Automaton.State s6 = automaton.get(r6);
							Automaton.List l6 = (Automaton.List) s6;
							int r7 = l6.get(0);
							int r8 = l6.get(1);
							Automaton.State s8 = automaton.get(r8);
							Automaton.Collection c8 = (Automaton.Collection) s8;
							int[] state = {r0, r1, r2, r3, r4, r5, r6, r7, r8, 0, 0};
							activations.add(new Activation(this,null,state));
						}
					}
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r2 = state[2]; // x
			int r5 = state[5];
			int r7 = state[7]; // y
			Automaton.Collection s8 = (Automaton.Collection) automaton.get(state[8]);
			int[] s8children = new int[s8.size() - 0];
			for(int s8i=0, s8j=0; s8i != s8.size();++s8i) {
				s8children[s8j++] = s8.get(s8i);
			}
			Automaton.Bag r9 = new Automaton.Bag(s8children);
			Automaton.Collection s3 = (Automaton.Collection) automaton.get(state[3]);
			int[] s3children = new int[s3.size() - 1];
			for(int s3i=0, s3j=0; s3i != s3.size();++s3i) {
				if(s3i == r5) { continue; }
				s3children[s3j++] = s3.get(s3i);
			}
			Automaton.Bag r10 = new Automaton.Bag(s3children);
			Automaton.Real r11 = (Automaton.Real) automaton.get(r2);
			Automaton.Real r12 = (Automaton.Real) automaton.get(r7);
			Automaton.Real r13 = r11.add(r12); // x add y
			int r14 = automaton.add(r13);
			Automaton.Bag r15 = r10.append(r9); // xs append ys
			int r16 = automaton.add(r15);
			Automaton.List r17 = new Automaton.List(r14, r16); // [x add yxs append ys]
			int r18 = automaton.add(r17);
			Automaton.Term r19 = new Automaton.Term(K_Sum, r18);
			int r20 = automaton.add(r19);
			if(r0 != r20) {
				return automaton.rewrite(r0, r20);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Sum_6"; }
		public final int rank() { return 2; }

		public final int minimum() { return 7; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// term $10<Equation($8<^[^AType<IntT|RealT>,$4<^$29<AExpr<Num(^real)|Sum(^[^real,^{|$4...|}[$4...]])|Mul(^[^real,^{|$4...|}[$4...]])|Div(^[$4,$4])|$59<VExpr<Var(^string)|$70<Fn(^[^string,$64<^Expr<$29|$70|$105<Value<Num(^real)|Null|Tuple(^[^$105...])|Bool<True|False>|String(^string)|Set(^{^$105...})>>|Tuple(^[$64...])|$144<BExpr<$59|Bool<True|False>|And(^{^$144...})|Or(^{^$144...})|Not(^$144)|Equals(^[$156<^Type<Atom<NotT($179<^Proton<TupleT(^[$179...])|SetT(^[^bool,$179])|Quark<IntT|RealT|AnyT|NullT|VoidT|BoolT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$179...])|SetT(^[^bool,$179])|Quark<IntT|RealT|AnyT|NullT|VoidT|BoolT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($156)|OrT(^{$156...})|AndT(^{$156...})|SetT(^[^bool,$156])|TupleT(^[$156...])|FunctionT(^[$156,$156,$156...])>>,^{|$64,$64|}[$64,$64]])|$10|Inequality($8)|SubsetEq(^[^SetT(^[^bool,$156]),^SExpr<$59|Set(^{$64...})>,^SExpr<$59|Set(^{$64...})>])|ForAll(^[^{^[^Var(^string),$156]...},^$144])|Exists(^[^{^[^Var(^string),$156]...},^$144])>>|SExpr<$59|Set(^{$64...})>>>...])>|Load(^[$64,^int])|LengthOf($64)>>>>>]>)>
	public final static int K_Equation = 32;
	public final static int Equation(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_Equation, r1));
	}
	public final static int Equation(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_Equation, r1));
	}

	// Equation_1
	private final static class Reduction_66 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_66(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Equation) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.List l1 = (Automaton.List) s1;
				int r2 = l1.get(0);
				int r3 = l1.get(1);
				Automaton.State s3 = automaton.get(r3);
				if(s3.kind == K_Num) {
					Automaton.Term t3 = (Automaton.Term) s3;
					int r4 = t3.contents;
					int[] state = {r0, r1, r2, r3, r4};
					activations.add(new Activation(this,null,state));
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r4 = state[4]; // v
			Automaton.Real r5 = new Automaton.Real(0); // 0.0
			Automaton.Real r6 = (Automaton.Real) automaton.get(r4);
			boolean r7 = !r6.equals(r5);   // v neq 0.0
			if(r7) {
				Automaton.Term r8 = False;
				int r9 = automaton.add(r8);
				if(r0 != r9) {
					return automaton.rewrite(r0, r9);
				}
			}
			Automaton.Term r10 = True;
			int r11 = automaton.add(r10);
			if(r0 != r11) {
				return automaton.rewrite(r0, r11);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Equation_1"; }
		public final int rank() { return 0; }

		public final int minimum() { return 4; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Equation_1b
	private final static class Reduction_67 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_67(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Equation) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.List l1 = (Automaton.List) s1;
				int r2 = l1.get(0);
				int r3 = l1.get(1);
				Automaton.State s3 = automaton.get(r3);
				if(s3.kind == K_Sum) {
					Automaton.Term t3 = (Automaton.Term) s3;
					int r4 = t3.contents;
					Automaton.State s4 = automaton.get(r4);
					Automaton.List l4 = (Automaton.List) s4;
					int r5 = l4.get(0);
					int r6 = l4.get(1);
					Automaton.State s6 = automaton.get(r6);
					Automaton.Collection c6 = (Automaton.Collection) s6;
					if(c6.size() == 1) {
						for(int r8=0;r8!=c6.size();++r8) {
							int r7 = c6.get(r8);
							Automaton.State s7 = automaton.get(r7);
							if(s7.kind == K_Mul) {
								Automaton.Term t7 = (Automaton.Term) s7;
								int r9 = t7.contents;
								Automaton.State s9 = automaton.get(r9);
								Automaton.List l9 = (Automaton.List) s9;
								int r10 = l9.get(0);
								int r11 = l9.get(1);
								Automaton.State s11 = automaton.get(r11);
								Automaton.Collection c11 = (Automaton.Collection) s11;
								int[] state = {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, 0};
								activations.add(new Activation(this,null,state));
							}
						}
					}
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r2 = state[2]; // t
			int r5 = state[5]; // n
			int r8 = state[8];
			int r10 = state[10]; // m
			Automaton.Collection s11 = (Automaton.Collection) automaton.get(state[11]);
			int[] s11children = new int[s11.size() - 0];
			for(int s11i=0, s11j=0; s11i != s11.size();++s11i) {
				s11children[s11j++] = s11.get(s11i);
			}
			Automaton.Bag r12 = new Automaton.Bag(s11children);
			Automaton.Real r13 = new Automaton.Real(0); // 0.0
			Automaton.Real r14 = (Automaton.Real) automaton.get(r5);
			boolean r15 = r14.equals(r13); // n eq 0.0
			boolean r16 = false;           // n eq 0.0 && m lt 0.0
			if(r15) {
				Automaton.Real r17 = new Automaton.Real(0); // 0.0
				Automaton.Real r18 = (Automaton.Real) automaton.get(r10);
				boolean r19 = r18.compareTo(r17)<0; // m lt 0.0
				r16 = r19;
			}
			if(r16) {
				Automaton.Real r20 = (Automaton.Real) automaton.get(r10);
				Automaton.Real r21 = r20.negate(); // -m
				int r22 = automaton.add(r21);
				int r23 = automaton.add(r12);
				Automaton.List r24 = new Automaton.List(r22, r23); // [-mxs]
				int r25 = automaton.add(r24);
				Automaton.Term r26 = new Automaton.Term(K_Mul, r25);
				int r27 = automaton.add(r26);
				Automaton.Bag r28 = new Automaton.Bag(r27); // {|Mul([-mxs])|}
				int r29 = automaton.add(r28);
				Automaton.List r30 = new Automaton.List(r5, r29); // [n{|Mul([-mxs])|}]
				int r31 = automaton.add(r30);
				Automaton.Term r32 = new Automaton.Term(K_Sum, r31);
				int r33 = automaton.add(r32);
				Automaton.List r34 = new Automaton.List(r2, r33); // [tSum([n{|Mul([-mxs])|}])]
				int r35 = automaton.add(r34);
				Automaton.Term r36 = new Automaton.Term(K_Equation, r35);
				int r37 = automaton.add(r36);
				if(r0 != r37) {
					return automaton.rewrite(r0, r37);
				}
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Equation_1b"; }
		public final int rank() { return 0; }

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Equation_Gcd_1
	private final static class Reduction_68 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_68(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Equation) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.List l1 = (Automaton.List) s1;
				int r2 = l1.get(0);
				int r3 = l1.get(1);
				Automaton.State s3 = automaton.get(r3);
				if(s3.kind == K_Sum) {
					Automaton.Term t3 = (Automaton.Term) s3;
					int r4 = t3.contents;
					Automaton.State s4 = automaton.get(r4);
					Automaton.List l4 = (Automaton.List) s4;
					int r5 = l4.get(0);
					int r6 = l4.get(1);
					Automaton.State s6 = automaton.get(r6);
					Automaton.Collection c6 = (Automaton.Collection) s6;
					boolean m6_0 = true;
					for(int i7=0;i7!=c6.size();++i7) {
						int r7 = c6.get(i7);
						if(Runtime.accepts(type24,automaton,automaton.get(r7), SCHEMA)) {
							continue;
						}
						m6_0 = false;
						break;
					}
					if(m6_0) {
						int[] state = {r0, r1, r2, r3, r4, r5, r6, 0};
						activations.add(new Activation(this,null,state));
					}
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r2 = state[2]; // t
			int r5 = state[5]; // n
			int r6 = state[6]; // ms
			Automaton.Collection s6 = (Automaton.Collection) automaton.get(state[6]);
			int[] s6children = new int[s6.size() - 0];
			for(int s6i=0, s6j=0; s6i != s6.size();++s6i) {
				s6children[s6j++] = s6.get(s6i);
			}
			Automaton.Bag r7 = new Automaton.Bag(s6children);
			Automaton.List r8 = new Automaton.List(r5, r6); // [nms]
			Automaton.Real r9 = Solver$native.gcd(automaton, r8);
			Automaton.Int r10 = r7.lengthOf(); // |xs|
			Automaton.Int r11 = new Automaton.Int(0); // 0
			boolean r12 = r10.compareTo(r11)>0; // |xs| gt 0
			boolean r13 = false;           // |xs| gt 0 && gcd neq 1.0
			if(r12) {
				Automaton.Real r14 = new Automaton.Real(1); // 1.0
				boolean r15 = !r9.equals(r14); // gcd neq 1.0
				r13 = r15;
			}
			if(r13) {
				Automaton.List t16 = new Automaton.List();
				for(int i17=0;i17<r7.size();i17++) {
					int r17 = (int) r7.get(i17);
					Automaton.Term r18 = (Automaton.Term) automaton.get(r17);
					int r19 = r18.contents;
					Automaton.Int r20 = new Automaton.Int(0); // 0
					Automaton.List r21 = (Automaton.List) automaton.get(r19);
					int r22 = r21.indexOf(r20);    // *x[0]
					Automaton.Real r23 = (Automaton.Real) automaton.get(r22);
					Automaton.Real r24 = r23.divide(r9); // *x[0] div gcd
					int r25 = automaton.add(r24);
					Automaton.Term r26 = (Automaton.Term) automaton.get(r17);
					int r27 = r26.contents;
					Automaton.Int r28 = new Automaton.Int(1); // 1
					Automaton.List r29 = (Automaton.List) automaton.get(r27);
					int r30 = r29.indexOf(r28);    // *x[1]
					Automaton.List r31 = new Automaton.List(r25, r30); // [*x[0] div gcd*x[1]]
					int r32 = automaton.add(r31);
					Automaton.Term r33 = new Automaton.Term(K_Mul, r32);
					int r34 = automaton.add(r33);
					t16.add(r34);
				}
				Automaton.Bag r16 = new Automaton.Bag(t16.toArray());
				Automaton.Real r35 = (Automaton.Real) automaton.get(r5);
				Automaton.Real r36 = r35.divide(r9); // n div gcd
				int r37 = automaton.add(r36);
				int r38 = automaton.add(r16);
				Automaton.List r39 = new Automaton.List(r37, r38); // [n div gcdys]
				int r40 = automaton.add(r39);
				Automaton.Term r41 = new Automaton.Term(K_Sum, r40);
				int r42 = automaton.add(r41);
				Automaton.List r43 = new Automaton.List(r2, r42); // [tSum([n div gcdys])]
				int r44 = automaton.add(r43);
				Automaton.Term r45 = new Automaton.Term(K_Equation, r44);
				int r46 = automaton.add(r45);
				if(r0 != r46) {
					return automaton.rewrite(r0, r46);
				}
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Equation_Gcd_1"; }
		public final int rank() { return 2; }

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Equation_2
	private final static class Inference_1 extends AbstractRewriteRule implements InferenceRule {

		public Inference_1(Pattern.Term pattern) { super(pattern); }

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
						if(s2.kind == K_Equation) {
							Automaton.Term t2 = (Automaton.Term) s2;
							int r4 = t2.contents;
							Automaton.State s4 = automaton.get(r4);
							Automaton.List l4 = (Automaton.List) s4;
							int r5 = l4.get(0);
							int r6 = l4.get(1);
							Automaton.State s6 = automaton.get(r6);
							if(s6.kind == K_Sum) {
								Automaton.Term t6 = (Automaton.Term) s6;
								int r7 = t6.contents;
								Automaton.State s7 = automaton.get(r7);
								Automaton.List l7 = (Automaton.List) s7;
								int r8 = l7.get(0);
								int r9 = l7.get(1);
								Automaton.State s9 = automaton.get(r9);
								Automaton.Collection c9 = (Automaton.Collection) s9;
								if(c9.size() >= 1) {
									for(int r11=0;r11!=c9.size();++r11) {
										int r10 = c9.get(r11);
										Automaton.State s10 = automaton.get(r10);
										if(s10.kind == K_Mul) {
											Automaton.Term t10 = (Automaton.Term) s10;
											int r12 = t10.contents;
											Automaton.State s12 = automaton.get(r12);
											Automaton.List l12 = (Automaton.List) s12;
											int r13 = l12.get(0);
											int r14 = l12.get(1);
											Automaton.State s14 = automaton.get(r14);
											Automaton.Collection c14 = (Automaton.Collection) s14;
											if(c14.size() == 1) {
												for(int r16=0;r16!=c14.size();++r16) {
													int r15 = c14.get(r16);
													boolean m9_1 = true;
													for(int i17=0;i17!=c9.size();++i17) {
														if(i17 == r11) { continue; }
														int r17 = c9.get(i17);
														if(Runtime.accepts(type24,automaton,automaton.get(r17), SCHEMA)) {
															continue;
														}
														m9_1 = false;
														break;
													}
													if(m9_1) {
														int[] state = {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, 0, 0};
														activations.add(new Activation(this,null,state));
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r2 = state[2]; // eq
			int r3 = state[3];
			int r5 = state[5]; // t
			int r8 = state[8]; // c
			int r9 = state[9]; // xs
			int r11 = state[11];
			int r13 = state[13]; // vc
			int r15 = state[15]; // v
			int r16 = state[16];
			Automaton.Collection s9 = (Automaton.Collection) automaton.get(state[9]);
			int[] s9children = new int[s9.size() - 1];
			for(int s9i=0, s9j=0; s9i != s9.size();++s9i) {
				if(s9i == r11) { continue; }
				s9children[s9j++] = s9.get(s9i);
			}
			Automaton.Bag r17 = new Automaton.Bag(s9children);
			Automaton.Collection s1 = (Automaton.Collection) automaton.get(state[1]);
			int[] s1children = new int[s1.size() - 1];
			for(int s1i=0, s1j=0; s1i != s1.size();++s1i) {
				if(s1i == r3) { continue; }
				s1children[s1j++] = s1.get(s1i);
			}
			Automaton.Set r18 = new Automaton.Set(s1children);
			Automaton.Term r19 = Solver$native.maxMultiplicand(automaton, r9);
			Object r20 = (Object) automaton.get(r15);
			boolean r21 = r20.equals(r19); // v eq var
			if(r21) {
				Automaton.Real r22 = new Automaton.Real(0); // 0.0
				int r23 = automaton.add(r22);
				Automaton.Real r24 = new Automaton.Real(1); // 1.0
				Automaton.Real r25 = r24.negate(); // -1.0
				int r26 = automaton.add(r25);
				int r27 = automaton.add(r17);
				Automaton.List r28 = new Automaton.List(r8, r27); // [cms]
				int r29 = automaton.add(r28);
				Automaton.Term r30 = new Automaton.Term(K_Sum, r29);
				int r31 = automaton.add(r30);
				Automaton.Bag r32 = new Automaton.Bag(r31); // {|Sum([cms])|}
				int r33 = automaton.add(r32);
				Automaton.List r34 = new Automaton.List(r26, r33); // [-1.0{|Sum([cms])|}]
				int r35 = automaton.add(r34);
				Automaton.Term r36 = new Automaton.Term(K_Mul, r35);
				int r37 = automaton.add(r36);
				Automaton.Term r38 = new Automaton.Term(K_Num, r13);
				int r39 = automaton.add(r38);
				Automaton.List r40 = new Automaton.List(r37, r39); // [Mul([-1.0{|Sum([cms])|}])Num(vc)]
				int r41 = automaton.add(r40);
				Automaton.Term r42 = new Automaton.Term(K_Div, r41);
				int r43 = automaton.add(r42);
				Automaton.Bag r44 = new Automaton.Bag(r43); // {|Div([Mul([-1.0{|Sum([cms])|}])Num(vc)])|}
				int r45 = automaton.add(r44);
				Automaton.List r46 = new Automaton.List(r23, r45); // [0.0{|Div([Mul([-1.0{|Sum([cms])|}])Num(vc)])|}]
				int r47 = automaton.add(r46);
				Automaton.Term r48 = new Automaton.Term(K_Sum, r47);
				Automaton.List t49 = new Automaton.List();
				for(int i50=0;i50<r18.size();i50++) {
					int r50 = (int) r18.get(i50);
					int r51 = automaton.add(r19);
					int r52 = automaton.add(r48);
					int r53 = automaton.substitute(r50, r51, r52);
					t49.add(r53);
				}
				Automaton.Set r49 = new Automaton.Set(t49.toArray());
				Automaton.Set r54 = r49.appendFront(r2); // eq append cs
				int r55 = automaton.add(r54);
				Automaton.Term r56 = new Automaton.Term(K_And, r55);
				int r57 = automaton.add(r56);
				if(r0 != r57) {
					return automaton.rewrite(r0, r57);
				}
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Equation_2"; }
		public final int rank() { return 0; }

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Equation_3
	private final static class Inference_2 extends AbstractRewriteRule implements InferenceRule {

		public Inference_2(Pattern.Term pattern) { super(pattern); }

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
						if(s2.kind == K_Equation) {
							Automaton.Term t2 = (Automaton.Term) s2;
							int r4 = t2.contents;
							Automaton.State s4 = automaton.get(r4);
							Automaton.List l4 = (Automaton.List) s4;
							int r5 = l4.get(0);
							int r6 = l4.get(1);
							if(Runtime.accepts(type9,automaton,automaton.get(r6), SCHEMA)) {
								int[] state = {r0, r1, r2, r3, r4, r5, r6, 0};
								activations.add(new Activation(this,null,state));
							}
						}
					}
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r2 = state[2]; // eq
			int r3 = state[3];
			int r5 = state[5]; // t
			int r6 = state[6]; // v
			Automaton.Collection s1 = (Automaton.Collection) automaton.get(state[1]);
			int[] s1children = new int[s1.size() - 1];
			for(int s1i=0, s1j=0; s1i != s1.size();++s1i) {
				if(s1i == r3) { continue; }
				s1children[s1j++] = s1.get(s1i);
			}
			Automaton.Set r7 = new Automaton.Set(s1children);
			Automaton.List t8 = new Automaton.List();
			for(int i9=0;i9<r7.size();i9++) {
				int r9 = (int) r7.get(i9);
				Automaton.Real r10 = new Automaton.Real(0); // 0.0
				int r11 = automaton.add(r10);
				Automaton.Term r12 = new Automaton.Term(K_Num, r11);
				int r13 = automaton.add(r12);
				int r14 = automaton.substitute(r9, r6, r13);
				t8.add(r14);
			}
			Automaton.Set r8 = new Automaton.Set(t8.toArray());
			Automaton.Set r15 = r8.appendFront(r2); // eq append cs
			int r16 = automaton.add(r15);
			Automaton.Term r17 = new Automaton.Term(K_And, r16);
			int r18 = automaton.add(r17);
			if(r0 != r18) {
				return automaton.rewrite(r0, r18);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Equation_3"; }
		public final int rank() { return 0; }

		public final int minimum() { return 6; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Equation_4
	private final static class Reduction_69 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_69(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Not) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				if(s1.kind == K_Equation) {
					Automaton.Term t1 = (Automaton.Term) s1;
					int r2 = t1.contents;
					Automaton.State s2 = automaton.get(r2);
					Automaton.List l2 = (Automaton.List) s2;
					int r3 = l2.get(0);
					if(Runtime.accepts(type25,automaton,automaton.get(r3), SCHEMA)) {
						int r4 = l2.get(1);
						int[] state = {r0, r1, r2, r3, r4};
						activations.add(new Activation(this,null,state));
					}
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r3 = state[3]; // t
			int r4 = state[4]; // e
			Automaton.Real r5 = new Automaton.Real(1); // 1.0
			Automaton.Real r6 = r5.negate(); // -1.0
			int r7 = automaton.add(r6);
			Automaton.Real r8 = new Automaton.Real(1); // 1.0
			Automaton.Real r9 = r8.negate(); // -1.0
			int r10 = automaton.add(r9);
			Automaton.Bag r11 = new Automaton.Bag(r4); // {|e|}
			int r12 = automaton.add(r11);
			Automaton.List r13 = new Automaton.List(r10, r12); // [-1.0{|e|}]
			int r14 = automaton.add(r13);
			Automaton.Term r15 = new Automaton.Term(K_Mul, r14);
			int r16 = automaton.add(r15);
			Automaton.Bag r17 = new Automaton.Bag(r16); // {|Mul([-1.0{|e|}])|}
			int r18 = automaton.add(r17);
			Automaton.List r19 = new Automaton.List(r7, r18); // [-1.0{|Mul([-1.0{|e|}])|}]
			int r20 = automaton.add(r19);
			Automaton.Term r21 = new Automaton.Term(K_Sum, r20);
			Automaton.Real r22 = new Automaton.Real(1); // 1.0
			Automaton.Real r23 = r22.negate(); // -1.0
			int r24 = automaton.add(r23);
			Automaton.Bag r25 = new Automaton.Bag(r4); // {|e|}
			int r26 = automaton.add(r25);
			Automaton.List r27 = new Automaton.List(r24, r26); // [-1.0{|e|}]
			int r28 = automaton.add(r27);
			Automaton.Term r29 = new Automaton.Term(K_Sum, r28);
			int r30 = automaton.add(r21);
			Automaton.List r31 = new Automaton.List(r3, r30); // [tneg_em1]
			int r32 = automaton.add(r31);
			Automaton.Term r33 = new Automaton.Term(K_Inequality, r32);
			int r34 = automaton.add(r33);
			int r35 = automaton.add(r29);
			Automaton.List r36 = new Automaton.List(r3, r35); // [tem1]
			int r37 = automaton.add(r36);
			Automaton.Term r38 = new Automaton.Term(K_Inequality, r37);
			int r39 = automaton.add(r38);
			Automaton.Set r40 = new Automaton.Set(r34, r39); // {Inequality([tneg_em1])Inequality([tem1])}
			int r41 = automaton.add(r40);
			Automaton.Term r42 = new Automaton.Term(K_Or, r41);
			int r43 = automaton.add(r42);
			if(r0 != r43) {
				return automaton.rewrite(r0, r43);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Equation_4"; }
		public final int rank() { return 1; }

		public final int minimum() { return 5; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Equation_5
	private final static class Reduction_70 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_70(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Not) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				if(s1.kind == K_Equation) {
					Automaton.Term t1 = (Automaton.Term) s1;
					int r2 = t1.contents;
					Automaton.State s2 = automaton.get(r2);
					Automaton.List l2 = (Automaton.List) s2;
					int r3 = l2.get(0);
					if(Runtime.accepts(type26,automaton,automaton.get(r3), SCHEMA)) {
						int r4 = l2.get(1);
						int[] state = {r0, r1, r2, r3, r4};
						activations.add(new Activation(this,null,state));
					}
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r3 = state[3]; // t
			int r4 = state[4]; // e
			Automaton.Real r5 = new Automaton.Real(1); // 1.0
			Automaton.Real r6 = r5.negate(); // -1.0
			int r7 = automaton.add(r6);
			Automaton.Bag r8 = new Automaton.Bag(r4); // {|e|}
			int r9 = automaton.add(r8);
			Automaton.List r10 = new Automaton.List(r7, r9); // [-1.0{|e|}]
			int r11 = automaton.add(r10);
			Automaton.Term r12 = new Automaton.Term(K_Mul, r11);
			int r13 = automaton.add(r12);
			Automaton.List r14 = new Automaton.List(r3, r13); // [tneg_e]
			int r15 = automaton.add(r14);
			Automaton.Term r16 = new Automaton.Term(K_Inequality, r15);
			int r17 = automaton.add(r16);
			Automaton.List r18 = new Automaton.List(r3, r4); // [te]
			int r19 = automaton.add(r18);
			Automaton.Term r20 = new Automaton.Term(K_Inequality, r19);
			int r21 = automaton.add(r20);
			Automaton.Set r22 = new Automaton.Set(r17, r21); // {Inequality([tneg_e])Inequality([te])}
			int r23 = automaton.add(r22);
			Automaton.Term r24 = new Automaton.Term(K_Or, r23);
			int r25 = automaton.add(r24);
			if(r0 != r25) {
				return automaton.rewrite(r0, r25);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Equation_5"; }
		public final int rank() { return 1; }

		public final int minimum() { return 5; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Equation_6
	private final static class Reduction_71 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_71(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Equals) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.List l1 = (Automaton.List) s1;
				int r2 = l1.get(0);
				if(Runtime.accepts(type23,automaton,automaton.get(r2), SCHEMA)) {
					int r3 = l1.get(1);
					Automaton.State s3 = automaton.get(r3);
					Automaton.Collection c3 = (Automaton.Collection) s3;
					for(int r5=0;r5!=c3.size();++r5) {
						int r4 = c3.get(r5);
						if(Runtime.accepts(type19,automaton,automaton.get(r4), SCHEMA)) {
							for(int r7=0;r7!=c3.size();++r7) {
								if(r7 == r5) { continue; }
								int r6 = c3.get(r7);
								if(Runtime.accepts(type19,automaton,automaton.get(r6), SCHEMA)) {
									int[] state = {r0, r1, r2, r3, r4, r5, r6, r7};
									activations.add(new Activation(this,null,state));
								}
							}
						}
					}
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r2 = state[2]; // t
			int r4 = state[4]; // e1
			int r5 = state[5];
			int r6 = state[6]; // e2
			int r7 = state[7];
			Automaton.Real r8 = new Automaton.Real(1); // 1.0
			Automaton.Real r9 = r8.negate(); // -1.0
			int r10 = automaton.add(r9);
			Automaton.Bag r11 = new Automaton.Bag(r4); // {|e1|}
			int r12 = automaton.add(r11);
			Automaton.List r13 = new Automaton.List(r10, r12); // [-1.0{|e1|}]
			int r14 = automaton.add(r13);
			Automaton.Term r15 = new Automaton.Term(K_Mul, r14);
			Automaton.Real r16 = new Automaton.Real(0); // 0.0
			int r17 = automaton.add(r16);
			int r18 = automaton.add(r15);
			Automaton.Bag r19 = new Automaton.Bag(r18, r6); // {|neg_e1e2|}
			int r20 = automaton.add(r19);
			Automaton.List r21 = new Automaton.List(r17, r20); // [0.0{|neg_e1e2|}]
			int r22 = automaton.add(r21);
			Automaton.Term r23 = new Automaton.Term(K_Sum, r22);
			int r24 = automaton.add(r23);
			Automaton.List r25 = new Automaton.List(r2, r24); // [tSum([0.0{|neg_e1e2|}])]
			int r26 = automaton.add(r25);
			Automaton.Term r27 = new Automaton.Term(K_Equation, r26);
			int r28 = automaton.add(r27);
			if(r0 != r28) {
				return automaton.rewrite(r0, r28);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Equation_6"; }
		public final int rank() { return 1; }

		public final int minimum() { return 7; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// term $10<Inequality($8<^[^AType<IntT|RealT>,$4<^$29<AExpr<Num(^real)|Sum(^[^real,^{|$4...|}[$4...]])|Mul(^[^real,^{|$4...|}[$4...]])|Div(^[$4,$4])|$59<VExpr<Var(^string)|$70<Fn(^[^string,$64<^Expr<$29|$70|$105<Value<Num(^real)|Null|Tuple(^[^$105...])|Bool<True|False>|String(^string)|Set(^{^$105...})>>|Tuple(^[$64...])|$144<BExpr<$59|Bool<True|False>|And(^{^$144...})|Or(^{^$144...})|Not(^$144)|Equals(^[$156<^Type<Atom<NotT($179<^Proton<TupleT(^[$179...])|SetT(^[^bool,$179])|Quark<IntT|RealT|AnyT|NullT|VoidT|BoolT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$179...])|SetT(^[^bool,$179])|Quark<IntT|RealT|AnyT|NullT|VoidT|BoolT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($156)|OrT(^{$156...})|AndT(^{$156...})|SetT(^[^bool,$156])|TupleT(^[$156...])|FunctionT(^[$156,$156,$156...])>>,^{|$64,$64|}[$64,$64]])|$10|Equation($8)|SubsetEq(^[^SetT(^[^bool,$156]),^SExpr<$59|Set(^{$64...})>,^SExpr<$59|Set(^{$64...})>])|ForAll(^[^{^[^Var(^string),$156]...},^$144])|Exists(^[^{^[^Var(^string),$156]...},^$144])>>|SExpr<$59|Set(^{$64...})>>>...])>|Load(^[$64,^int])|LengthOf($64)>>>>>]>)>
	public final static int K_Inequality = 33;
	public final static int Inequality(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_Inequality, r1));
	}
	public final static int Inequality(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_Inequality, r1));
	}

	// Inequality_1
	private final static class Reduction_72 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_72(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Inequality) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.List l1 = (Automaton.List) s1;
				int r2 = l1.get(0);
				int r3 = l1.get(1);
				Automaton.State s3 = automaton.get(r3);
				if(s3.kind == K_Num) {
					Automaton.Term t3 = (Automaton.Term) s3;
					int r4 = t3.contents;
					int[] state = {r0, r1, r2, r3, r4};
					activations.add(new Activation(this,null,state));
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r2 = state[2]; // t
			int r4 = state[4]; // v
			Automaton.Real r5 = new Automaton.Real(0); // 0.0
			Automaton.Real r6 = (Automaton.Real) automaton.get(r4);
			boolean r7 = r6.compareTo(r5)<0; // v lt 0.0
			if(r7) {
				Automaton.Term r8 = False;
				int r9 = automaton.add(r8);
				if(r0 != r9) {
					return automaton.rewrite(r0, r9);
				}
			}
			Automaton.Real r10 = new Automaton.Real(0); // 0.0
			Automaton.Real r11 = (Automaton.Real) automaton.get(r4);
			boolean r12 = r11.equals(r10); // v eq 0.0
			boolean r13 = false;           // v eq 0.0 && t eq RealT
			if(r12) {
				Automaton.Term r14 = RealT;
				Object r15 = (Object) automaton.get(r2);
				boolean r16 = r15.equals(r14); // t eq RealT
				r13 = r16;
			}
			if(r13) {
				Automaton.Term r17 = False;
				int r18 = automaton.add(r17);
				if(r0 != r18) {
					return automaton.rewrite(r0, r18);
				}
			}
			Automaton.Term r19 = True;
			int r20 = automaton.add(r19);
			if(r0 != r20) {
				return automaton.rewrite(r0, r20);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Inequality_1"; }
		public final int rank() { return 0; }

		public final int minimum() { return 4; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Inequality_2
	private final static class Reduction_73 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_73(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Not) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				if(s1.kind == K_Inequality) {
					Automaton.Term t1 = (Automaton.Term) s1;
					int r2 = t1.contents;
					Automaton.State s2 = automaton.get(r2);
					Automaton.List l2 = (Automaton.List) s2;
					int r3 = l2.get(0);
					if(Runtime.accepts(type25,automaton,automaton.get(r3), SCHEMA)) {
						int r4 = l2.get(1);
						int[] state = {r0, r1, r2, r3, r4};
						activations.add(new Activation(this,null,state));
					}
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r3 = state[3]; // t
			int r4 = state[4]; // e
			Automaton.Real r5 = new Automaton.Real(1); // 1.0
			Automaton.Real r6 = r5.negate(); // -1.0
			int r7 = automaton.add(r6);
			Automaton.Bag r8 = new Automaton.Bag(r4); // {|e|}
			int r9 = automaton.add(r8);
			Automaton.List r10 = new Automaton.List(r7, r9); // [-1.0{|e|}]
			int r11 = automaton.add(r10);
			Automaton.Term r12 = new Automaton.Term(K_Mul, r11);
			Automaton.Real r13 = new Automaton.Real(1); // 1.0
			Automaton.Real r14 = r13.negate(); // -1.0
			int r15 = automaton.add(r14);
			int r16 = automaton.add(r12);
			Automaton.Bag r17 = new Automaton.Bag(r16); // {|neg_e|}
			int r18 = automaton.add(r17);
			Automaton.List r19 = new Automaton.List(r15, r18); // [-1.0{|neg_e|}]
			int r20 = automaton.add(r19);
			Automaton.Term r21 = new Automaton.Term(K_Sum, r20);
			int r22 = automaton.add(r21);
			Automaton.List r23 = new Automaton.List(r3, r22); // [tSum([-1.0{|neg_e|}])]
			int r24 = automaton.add(r23);
			Automaton.Term r25 = new Automaton.Term(K_Inequality, r24);
			int r26 = automaton.add(r25);
			if(r0 != r26) {
				return automaton.rewrite(r0, r26);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Inequality_2"; }
		public final int rank() { return 1; }

		public final int minimum() { return 5; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Inequality_Gcd_1
	private final static class Reduction_74 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_74(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Inequality) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.List l1 = (Automaton.List) s1;
				int r2 = l1.get(0);
				int r3 = l1.get(1);
				Automaton.State s3 = automaton.get(r3);
				if(s3.kind == K_Sum) {
					Automaton.Term t3 = (Automaton.Term) s3;
					int r4 = t3.contents;
					Automaton.State s4 = automaton.get(r4);
					Automaton.List l4 = (Automaton.List) s4;
					int r5 = l4.get(0);
					int r6 = l4.get(1);
					Automaton.State s6 = automaton.get(r6);
					Automaton.Collection c6 = (Automaton.Collection) s6;
					boolean m6_0 = true;
					for(int i7=0;i7!=c6.size();++i7) {
						int r7 = c6.get(i7);
						if(Runtime.accepts(type24,automaton,automaton.get(r7), SCHEMA)) {
							continue;
						}
						m6_0 = false;
						break;
					}
					if(m6_0) {
						int[] state = {r0, r1, r2, r3, r4, r5, r6, 0};
						activations.add(new Activation(this,null,state));
					}
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r2 = state[2]; // t
			int r5 = state[5]; // n
			int r6 = state[6]; // ms
			Automaton.Collection s6 = (Automaton.Collection) automaton.get(state[6]);
			int[] s6children = new int[s6.size() - 0];
			for(int s6i=0, s6j=0; s6i != s6.size();++s6i) {
				s6children[s6j++] = s6.get(s6i);
			}
			Automaton.Bag r7 = new Automaton.Bag(s6children);
			Automaton.List r8 = new Automaton.List(r5, r6); // [nms]
			Automaton.Real r9 = Solver$native.gcd(automaton, r8);
			Automaton.Int r10 = r7.lengthOf(); // |xs|
			Automaton.Int r11 = new Automaton.Int(0); // 0
			boolean r12 = r10.compareTo(r11)>0; // |xs| gt 0
			boolean r13 = false;           // |xs| gt 0 && gcd neq 1.0
			if(r12) {
				Automaton.Real r14 = new Automaton.Real(1); // 1.0
				boolean r15 = !r9.equals(r14); // gcd neq 1.0
				r13 = r15;
			}
			if(r13) {
				Automaton.List t16 = new Automaton.List();
				for(int i17=0;i17<r7.size();i17++) {
					int r17 = (int) r7.get(i17);
					Automaton.Term r18 = (Automaton.Term) automaton.get(r17);
					int r19 = r18.contents;
					Automaton.Int r20 = new Automaton.Int(0); // 0
					Automaton.List r21 = (Automaton.List) automaton.get(r19);
					int r22 = r21.indexOf(r20);    // *x[0]
					Automaton.Real r23 = (Automaton.Real) automaton.get(r22);
					Automaton.Real r24 = r23.divide(r9); // *x[0] div gcd
					int r25 = automaton.add(r24);
					Automaton.Term r26 = (Automaton.Term) automaton.get(r17);
					int r27 = r26.contents;
					Automaton.Int r28 = new Automaton.Int(1); // 1
					Automaton.List r29 = (Automaton.List) automaton.get(r27);
					int r30 = r29.indexOf(r28);    // *x[1]
					Automaton.List r31 = new Automaton.List(r25, r30); // [*x[0] div gcd*x[1]]
					int r32 = automaton.add(r31);
					Automaton.Term r33 = new Automaton.Term(K_Mul, r32);
					int r34 = automaton.add(r33);
					t16.add(r34);
				}
				Automaton.Bag r16 = new Automaton.Bag(t16.toArray());
				Automaton.Real r35 = (Automaton.Real) automaton.get(r5);
				Automaton.Real r36 = r35.divide(r9); // n div gcd
				int r37 = automaton.add(r36);
				int r38 = automaton.add(r16);
				Automaton.List r39 = new Automaton.List(r37, r38); // [n div gcdys]
				int r40 = automaton.add(r39);
				Automaton.Term r41 = new Automaton.Term(K_Sum, r40);
				int r42 = automaton.add(r41);
				Automaton.List r43 = new Automaton.List(r2, r42); // [tSum([n div gcdys])]
				int r44 = automaton.add(r43);
				Automaton.Term r45 = new Automaton.Term(K_Inequality, r44);
				int r46 = automaton.add(r45);
				if(r0 != r46) {
					return automaton.rewrite(r0, r46);
				}
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Inequality_Gcd_1"; }
		public final int rank() { return 2; }

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// 
	private final static class Reduction_75 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_75(Pattern.Term pattern) { super(pattern); }

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
						if(s2.kind == K_Inequality) {
							Automaton.Term t2 = (Automaton.Term) s2;
							int r4 = t2.contents;
							Automaton.State s4 = automaton.get(r4);
							Automaton.List l4 = (Automaton.List) s4;
							int r5 = l4.get(0);
							if(Runtime.accepts(type25,automaton,automaton.get(r5), SCHEMA)) {
								int r6 = l4.get(1);
								Automaton.State s6 = automaton.get(r6);
								if(s6.kind == K_Sum) {
									Automaton.Term t6 = (Automaton.Term) s6;
									int r7 = t6.contents;
									Automaton.State s7 = automaton.get(r7);
									Automaton.List l7 = (Automaton.List) s7;
									int r8 = l7.get(0);
									int r9 = l7.get(1);
									Automaton.State s9 = automaton.get(r9);
									Automaton.Collection c9 = (Automaton.Collection) s9;
									if(c9.size() == 1) {
										for(int r11=0;r11!=c9.size();++r11) {
											int r10 = c9.get(r11);
											Automaton.State s10 = automaton.get(r10);
											if(s10.kind == K_Mul) {
												Automaton.Term t10 = (Automaton.Term) s10;
												int r12 = t10.contents;
												Automaton.State s12 = automaton.get(r12);
												Automaton.List l12 = (Automaton.List) s12;
												int r13 = l12.get(0);
												int r14 = l12.get(1);
												Automaton.State s14 = automaton.get(r14);
												Automaton.Collection c14 = (Automaton.Collection) s14;
												for(int r17=0;r17!=c1.size();++r17) {
													if(r17 == r3) { continue; }
													int r16 = c1.get(r17);
													Automaton.State s16 = automaton.get(r16);
													if(s16.kind == K_Inequality) {
														Automaton.Term t16 = (Automaton.Term) s16;
														int r18 = t16.contents;
														Automaton.State s18 = automaton.get(r18);
														Automaton.List l18 = (Automaton.List) s18;
														int r19 = l18.get(0);
														if(Runtime.accepts(type25,automaton,automaton.get(r19), SCHEMA)) {
															int r20 = l18.get(1);
															Automaton.State s20 = automaton.get(r20);
															if(s20.kind == K_Sum) {
																Automaton.Term t20 = (Automaton.Term) s20;
																int r21 = t20.contents;
																Automaton.State s21 = automaton.get(r21);
																Automaton.List l21 = (Automaton.List) s21;
																int r22 = l21.get(0);
																int r23 = l21.get(1);
																Automaton.State s23 = automaton.get(r23);
																Automaton.Collection c23 = (Automaton.Collection) s23;
																if(c23.size() == 1) {
																	for(int r25=0;r25!=c23.size();++r25) {
																		int r24 = c23.get(r25);
																		Automaton.State s24 = automaton.get(r24);
																		if(s24.kind == K_Mul) {
																			Automaton.Term t24 = (Automaton.Term) s24;
																			int r26 = t24.contents;
																			Automaton.State s26 = automaton.get(r26);
																			Automaton.List l26 = (Automaton.List) s26;
																			int r27 = l26.get(0);
																			int r28 = l26.get(1);
																			Automaton.State s28 = automaton.get(r28);
																			Automaton.Collection c28 = (Automaton.Collection) s28;
																			int[] state = {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, 0, r16, r17, r18, r19, r20, r21, r22, r23, r24, r25, r26, r27, r28, 0, 0};
																			activations.add(new Activation(this,null,state));
																		}
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r2 = state[2]; // ieq1
			int r3 = state[3];
			int r6 = state[6]; // s1
			int r8 = state[8]; // x1
			int r10 = state[10]; // xs
			int r11 = state[11];
			int r13 = state[13]; // x2
			Automaton.Collection s14 = (Automaton.Collection) automaton.get(state[14]);
			int[] s14children = new int[s14.size() - 0];
			for(int s14i=0, s14j=0; s14i != s14.size();++s14i) {
				s14children[s14j++] = s14.get(s14i);
			}
			Automaton.Bag r15 = new Automaton.Bag(s14children);
			int r16 = state[16]; // ieq2
			int r17 = state[17];
			int r20 = state[20]; // s2
			int r22 = state[22]; // y1
			int r24 = state[24]; // ys
			int r25 = state[25];
			int r27 = state[27]; // y2
			Automaton.Collection s28 = (Automaton.Collection) automaton.get(state[28]);
			int[] s28children = new int[s28.size() - 0];
			for(int s28i=0, s28j=0; s28i != s28.size();++s28i) {
				s28children[s28j++] = s28.get(s28i);
			}
			Automaton.Bag r29 = new Automaton.Bag(s28children);
			Automaton.Collection s1 = (Automaton.Collection) automaton.get(state[1]);
			int[] s1children = new int[s1.size() - 2];
			for(int s1i=0, s1j=0; s1i != s1.size();++s1i) {
				if(s1i == r3 || s1i == r17) { continue; }
				s1children[s1j++] = s1.get(s1i);
			}
			Automaton.Set r30 = new Automaton.Set(s1children);
			Automaton.Real r31 = (Automaton.Real) automaton.get(r22);
			Automaton.Real r32 = r31.negate(); // -y1
			Automaton.Real r33 = (Automaton.Real) automaton.get(r8);
			boolean r34 = r33.equals(r32); // x1 eq -y1
			boolean r35 = false;           // x1 eq -y1 && x2 eq -y2 && v1s eq v2s
			if(r34) {
				Automaton.Real r36 = (Automaton.Real) automaton.get(r27);
				Automaton.Real r37 = r36.negate(); // -y2
				Automaton.Real r38 = (Automaton.Real) automaton.get(r13);
				boolean r39 = r38.equals(r37); // x2 eq -y2
				boolean r40 = false;           // x2 eq -y2 && v1s eq v2s
				if(r39) {
					boolean r41 = r15.equals(r29); // v1s eq v2s
					r40 = r41;
				}
				r35 = r40;
			}
			if(r35) {
				Automaton.Term r42 = IntT;
				int r43 = automaton.add(r42);
				Automaton.List r44 = new Automaton.List(r43, r6); // [IntTs1]
				int r45 = automaton.add(r44);
				Automaton.Term r46 = new Automaton.Term(K_Equation, r45);
				int r47 = automaton.add(r46);
				Automaton.Set r48 = r30.appendFront(r47); // Equation([IntTs1]) append rest
				int r49 = automaton.add(r48);
				Automaton.Term r50 = new Automaton.Term(K_And, r49);
				int r51 = automaton.add(r50);
				if(r0 != r51) {
					return automaton.rewrite(r0, r51);
				}
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return ""; }
		public final int rank() { return 0; }

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// 
	private final static class Reduction_76 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_76(Pattern.Term pattern) { super(pattern); }

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
						if(s2.kind == K_Inequality) {
							Automaton.Term t2 = (Automaton.Term) s2;
							int r4 = t2.contents;
							Automaton.State s4 = automaton.get(r4);
							Automaton.List l4 = (Automaton.List) s4;
							int r5 = l4.get(0);
							if(Runtime.accepts(type25,automaton,automaton.get(r5), SCHEMA)) {
								int r6 = l4.get(1);
								if(Runtime.accepts(type9,automaton,automaton.get(r6), SCHEMA)) {
									for(int r8=0;r8!=c1.size();++r8) {
										if(r8 == r3) { continue; }
										int r7 = c1.get(r8);
										Automaton.State s7 = automaton.get(r7);
										if(s7.kind == K_Inequality) {
											Automaton.Term t7 = (Automaton.Term) s7;
											int r9 = t7.contents;
											Automaton.State s9 = automaton.get(r9);
											Automaton.List l9 = (Automaton.List) s9;
											int r10 = l9.get(0);
											if(Runtime.accepts(type25,automaton,automaton.get(r10), SCHEMA)) {
												int r11 = l9.get(1);
												Automaton.State s11 = automaton.get(r11);
												if(s11.kind == K_Sum) {
													Automaton.Term t11 = (Automaton.Term) s11;
													int r12 = t11.contents;
													Automaton.State s12 = automaton.get(r12);
													Automaton.List l12 = (Automaton.List) s12;
													int r13 = l12.get(0);
													int r14 = l12.get(1);
													Automaton.State s14 = automaton.get(r14);
													Automaton.Collection c14 = (Automaton.Collection) s14;
													if(c14.size() == 1) {
														for(int r16=0;r16!=c14.size();++r16) {
															int r15 = c14.get(r16);
															Automaton.State s15 = automaton.get(r15);
															if(s15.kind == K_Mul) {
																Automaton.Term t15 = (Automaton.Term) s15;
																int r17 = t15.contents;
																Automaton.State s17 = automaton.get(r17);
																Automaton.List l17 = (Automaton.List) s17;
																int r18 = l17.get(0);
																int r19 = l17.get(1);
																Automaton.State s19 = automaton.get(r19);
																Automaton.Collection c19 = (Automaton.Collection) s19;
																if(c19.size() == 1) {
																	for(int r21=0;r21!=c19.size();++r21) {
																		int r20 = c19.get(r21);
																		int[] state = {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17, r18, r19, r20, r21, 0};
																		activations.add(new Activation(this,null,state));
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r2 = state[2]; // ieq1
			int r3 = state[3];
			int r6 = state[6]; // v1
			int r7 = state[7]; // ieq2
			int r8 = state[8];
			int r11 = state[11]; // s2
			int r13 = state[13]; // y1
			int r15 = state[15]; // ys
			int r16 = state[16];
			int r18 = state[18]; // y2
			int r20 = state[20]; // v2
			int r21 = state[21];
			Automaton.Collection s1 = (Automaton.Collection) automaton.get(state[1]);
			int[] s1children = new int[s1.size() - 2];
			for(int s1i=0, s1j=0; s1i != s1.size();++s1i) {
				if(s1i == r3 || s1i == r8) { continue; }
				s1children[s1j++] = s1.get(s1i);
			}
			Automaton.Set r22 = new Automaton.Set(s1children);
			Automaton.Real r23 = new Automaton.Real(0); // 0.0
			Automaton.Real r24 = (Automaton.Real) automaton.get(r13);
			boolean r25 = r24.equals(r23); // y1 eq 0.0
			boolean r26 = false;           // y1 eq 0.0 && y2 eq -1.0 && v1 eq v2
			if(r25) {
				Automaton.Real r27 = new Automaton.Real(1); // 1.0
				Automaton.Real r28 = r27.negate(); // -1.0
				Automaton.Real r29 = (Automaton.Real) automaton.get(r18);
				boolean r30 = r29.equals(r28); // y2 eq -1.0
				boolean r31 = false;           // y2 eq -1.0 && v1 eq v2
				if(r30) {
					boolean r32 = r6 == r20;       // v1 eq v2
					r31 = r32;
				}
				r26 = r31;
			}
			if(r26) {
				Automaton.Term r33 = IntT;
				int r34 = automaton.add(r33);
				Automaton.List r35 = new Automaton.List(r34, r6); // [IntTv1]
				int r36 = automaton.add(r35);
				Automaton.Term r37 = new Automaton.Term(K_Equation, r36);
				int r38 = automaton.add(r37);
				Automaton.Set r39 = r22.appendFront(r38); // Equation([IntTv1]) append rest
				int r40 = automaton.add(r39);
				Automaton.Term r41 = new Automaton.Term(K_And, r40);
				int r42 = automaton.add(r41);
				if(r0 != r42) {
					return automaton.rewrite(r0, r42);
				}
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return ""; }
		public final int rank() { return 0; }

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Inequality_3
	private final static class Inference_3 extends AbstractRewriteRule implements InferenceRule {

		public Inference_3(Pattern.Term pattern) { super(pattern); }

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
						if(s2.kind == K_Inequality) {
							Automaton.Term t2 = (Automaton.Term) s2;
							int r4 = t2.contents;
							Automaton.State s4 = automaton.get(r4);
							Automaton.List l4 = (Automaton.List) s4;
							int r5 = l4.get(0);
							int r6 = l4.get(1);
							Automaton.State s6 = automaton.get(r6);
							if(s6.kind == K_Sum) {
								Automaton.Term t6 = (Automaton.Term) s6;
								int r7 = t6.contents;
								Automaton.State s7 = automaton.get(r7);
								Automaton.List l7 = (Automaton.List) s7;
								int r8 = l7.get(0);
								int r9 = l7.get(1);
								Automaton.State s9 = automaton.get(r9);
								Automaton.Collection c9 = (Automaton.Collection) s9;
								if(c9.size() >= 1) {
									for(int r11=0;r11!=c9.size();++r11) {
										int r10 = c9.get(r11);
										Automaton.State s10 = automaton.get(r10);
										if(s10.kind == K_Mul) {
											Automaton.Term t10 = (Automaton.Term) s10;
											int r12 = t10.contents;
											Automaton.State s12 = automaton.get(r12);
											Automaton.List l12 = (Automaton.List) s12;
											int r13 = l12.get(0);
											int r14 = l12.get(1);
											Automaton.State s14 = automaton.get(r14);
											Automaton.Collection c14 = (Automaton.Collection) s14;
											if(c14.size() == 1) {
												for(int r16=0;r16!=c14.size();++r16) {
													int r15 = c14.get(r16);
													boolean m9_1 = true;
													for(int i17=0;i17!=c9.size();++i17) {
														if(i17 == r11) { continue; }
														int r17 = c9.get(i17);
														if(Runtime.accepts(type24,automaton,automaton.get(r17), SCHEMA)) {
															continue;
														}
														m9_1 = false;
														break;
													}
													if(m9_1) {
														for(int r19=0;r19!=c1.size();++r19) {
															if(r19 == r3) { continue; }
															int r18 = c1.get(r19);
															Automaton.State s18 = automaton.get(r18);
															if(s18.kind == K_Inequality) {
																Automaton.Term t18 = (Automaton.Term) s18;
																int r20 = t18.contents;
																Automaton.State s20 = automaton.get(r20);
																Automaton.List l20 = (Automaton.List) s20;
																int r21 = l20.get(0);
																int r22 = l20.get(1);
																Automaton.State s22 = automaton.get(r22);
																if(s22.kind == K_Sum) {
																	Automaton.Term t22 = (Automaton.Term) s22;
																	int r23 = t22.contents;
																	Automaton.State s23 = automaton.get(r23);
																	Automaton.List l23 = (Automaton.List) s23;
																	int r24 = l23.get(0);
																	int r25 = l23.get(1);
																	Automaton.State s25 = automaton.get(r25);
																	Automaton.Collection c25 = (Automaton.Collection) s25;
																	if(c25.size() >= 1) {
																		for(int r27=0;r27!=c25.size();++r27) {
																			int r26 = c25.get(r27);
																			Automaton.State s26 = automaton.get(r26);
																			if(s26.kind == K_Mul) {
																				Automaton.Term t26 = (Automaton.Term) s26;
																				int r