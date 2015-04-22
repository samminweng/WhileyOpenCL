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
																				int r28 = t26.contents;
																				Automaton.State s28 = automaton.get(r28);
																				Automaton.List l28 = (Automaton.List) s28;
																				int r29 = l28.get(0);
																				int r30 = l28.get(1);
																				Automaton.State s30 = automaton.get(r30);
																				Automaton.Collection c30 = (Automaton.Collection) s30;
																				if(c30.size() == 1) {
																					for(int r32=0;r32!=c30.size();++r32) {
																						int r31 = c30.get(r32);
																						boolean m25_1 = true;
																						for(int i33=0;i33!=c25.size();++i33) {
																							if(i33 == r27) { continue; }
																							int r33 = c25.get(i33);
																							if(Runtime.accepts(type24,automaton,automaton.get(r33), SCHEMA)) {
																								continue;
																							}
																							m25_1 = false;
																							break;
																						}
																						if(m25_1) {
																							int[] state = {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, 0, r18, r19, r20, r21, r22, r23, r24, r25, r26, r27, r28, r29, r30, r31, r32, 0, 0};
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
					}
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r2 = state[2]; // eq1
			int r3 = state[3];
			int r5 = state[5]; // t1
			int r6 = state[6]; // s1
			int r8 = state[8]; // x1
			int r9 = state[9]; // xxs
			int r11 = state[11];
			int r13 = state[13]; // x2
			int r15 = state[15]; // v1
			int r16 = state[16];
			Automaton.Collection s9 = (Automaton.Collection) automaton.get(state[9]);
			int[] s9children = new int[s9.size() - 1];
			for(int s9i=0, s9j=0; s9i != s9.size();++s9i) {
				if(s9i == r11) { continue; }
				s9children[s9j++] = s9.get(s9i);
			}
			Automaton.Bag r17 = new Automaton.Bag(s9children);
			int r18 = state[18]; // eq2
			int r19 = state[19];
			int r21 = state[21]; // t2
			int r22 = state[22]; // s2
			int r24 = state[24]; // y1
			int r25 = state[25]; // yys
			int r27 = state[27];
			int r29 = state[29]; // y2
			int r31 = state[31]; // v2
			int r32 = state[32];
			Automaton.Collection s25 = (Automaton.Collection) automaton.get(state[25]);
			int[] s25children = new int[s25.size() - 1];
			for(int s25i=0, s25j=0; s25i != s25.size();++s25i) {
				if(s25i == r27) { continue; }
				s25children[s25j++] = s25.get(s25i);
			}
			Automaton.Bag r33 = new Automaton.Bag(s25children);
			Automaton.Collection s1 = (Automaton.Collection) automaton.get(state[1]);
			int[] s1children = new int[s1.size() - 2];
			for(int s1i=0, s1j=0; s1i != s1.size();++s1i) {
				if(s1i == r3 || s1i == r19) { continue; }
				s1children[s1j++] = s1.get(s1i);
			}
			Automaton.Set r34 = new Automaton.Set(s1children);
			Automaton.Term r35 = Solver$native.maxMultiplicand(automaton, r9);
			Automaton.Term r36 = Solver$native.maxMultiplicand(automaton, r25);
			boolean r37 = r15 == r31;      // v1 eq v2
			boolean r38 = false;           // v1 eq v2 && t1 eq t2 && x2 lt 0.0 && y2 gt 0.0 && vx eq v1 && vy eq v1
			if(r37) {
				boolean r39 = r5 == r21;       // t1 eq t2
				boolean r40 = false;           // t1 eq t2 && x2 lt 0.0 && y2 gt 0.0 && vx eq v1 && vy eq v1
				if(r39) {
					Automaton.Real r41 = new Automaton.Real(0); // 0.0
					Automaton.Real r42 = (Automaton.Real) automaton.get(r13);
					boolean r43 = r42.compareTo(r41)<0; // x2 lt 0.0
					boolean r44 = false;           // x2 lt 0.0 && y2 gt 0.0 && vx eq v1 && vy eq v1
					if(r43) {
						Automaton.Real r45 = new Automaton.Real(0); // 0.0
						Automaton.Real r46 = (Automaton.Real) automaton.get(r29);
						boolean r47 = r46.compareTo(r45)>0; // y2 gt 0.0
						boolean r48 = false;           // y2 gt 0.0 && vx eq v1 && vy eq v1
						if(r47) {
							Object r49 = (Object) automaton.get(r15);
							boolean r50 = r35.equals(r49); // vx eq v1
							boolean r51 = false;           // vx eq v1 && vy eq v1
							if(r50) {
								Object r52 = (Object) automaton.get(r15);
								boolean r53 = r36.equals(r52); // vy eq v1
								r51 = r53;
							}
							r48 = r51;
						}
						r44 = r48;
					}
					r40 = r44;
				}
				r38 = r40;
			}
			if(r38) {
				int r54 = automaton.add(r17);
				Automaton.List r55 = new Automaton.List(r8, r54); // [x1xs]
				int r56 = automaton.add(r55);
				Automaton.Term r57 = new Automaton.Term(K_Sum, r56);
				int r58 = automaton.add(r57);
				Automaton.Bag r59 = new Automaton.Bag(r58); // {|Sum([x1xs])|}
				int r60 = automaton.add(r59);
				Automaton.List r61 = new Automaton.List(r29, r60); // [y2{|Sum([x1xs])|}]
				int r62 = automaton.add(r61);
				Automaton.Term r63 = new Automaton.Term(K_Mul, r62);
				Automaton.Real r64 = (Automaton.Real) automaton.get(r13);
				Automaton.Real r65 = r64.negate(); // -x2
				int r66 = automaton.add(r65);
				int r67 = automaton.add(r33);
				Automaton.List r68 = new Automaton.List(r24, r67); // [y1ys]
				int r69 = automaton.add(r68);
				Automaton.Term r70 = new Automaton.Term(K_Sum, r69);
				int r71 = automaton.add(r70);
				Automaton.Bag r72 = new Automaton.Bag(r71); // {|Sum([y1ys])|}
				int r73 = automaton.add(r72);
				Automaton.List r74 = new Automaton.List(r66, r73); // [-x2{|Sum([y1ys])|}]
				int r75 = automaton.add(r74);
				Automaton.Term r76 = new Automaton.Term(K_Mul, r75);
				Automaton.Real r77 = new Automaton.Real(0); // 0.0
				int r78 = automaton.add(r77);
				int r79 = automaton.add(r63);
				int r80 = automaton.add(r76);
				Automaton.Bag r81 = new Automaton.Bag(r79, r80); // {|s3s4|}
				int r82 = automaton.add(r81);
				Automaton.List r83 = new Automaton.List(r78, r82); // [0.0{|s3s4|}]
				int r84 = automaton.add(r83);
				Automaton.Term r85 = new Automaton.Term(K_Sum, r84);
				int r86 = automaton.add(r85);
				Automaton.List r87 = new Automaton.List(r5, r86); // [t1Sum([0.0{|s3s4|}])]
				int r88 = automaton.add(r87);
				Automaton.Term r89 = new Automaton.Term(K_Inequality, r88);
				int r90 = automaton.add(r89);
				Automaton.Set r91 = new Automaton.Set(r2, r18, r90); // {eq1eq2eq3}
				Automaton.Set r92 = r91.append(r34); // {eq1eq2eq3} append rest
				int r93 = automaton.add(r92);
				Automaton.Term r94 = new Automaton.Term(K_And, r93);
				int r95 = automaton.add(r94);
				if(r0 != r95) {
					return automaton.rewrite(r0, r95);
				}
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Inequality_3"; }
		public final int rank() { return 1; }

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Inequality_4
	private final static class Inference_4 extends AbstractRewriteRule implements InferenceRule {

		public Inference_4(Pattern.Term pattern) { super(pattern); }

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
																if(Runtime.accepts(type9,automaton,automaton.get(r22), SCHEMA)) {
																	int[] state = {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, 0, r18, r19, r20, r21, r22, 0};
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

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r2 = state[2]; // eq1
			int r3 = state[3];
			int r5 = state[5]; // t1
			int r6 = state[6]; // s1
			int r8 = state[8]; // x1
			int r9 = state[9]; // xxs
			int r11 = state[11];
			int r13 = state[13]; // x2
			int r15 = state[15]; // v1
			int r16 = state[16];
			Automaton.Collection s9 = (Automaton.Collection) automaton.get(state[9]);
			int[] s9children = new int[s9.size() - 1];
			for(int s9i=0, s9j=0; s9i != s9.size();++s9i) {
				if(s9i == r11) { continue; }
				s9children[s9j++] = s9.get(s9i);
			}
			Automaton.Bag r17 = new Automaton.Bag(s9children);
			int r18 = state[18]; // eq2
			int r19 = state[19];
			int r21 = state[21]; // t2
			int r22 = state[22]; // v2
			Automaton.Collection s1 = (Automaton.Collection) automaton.get(state[1]);
			int[] s1children = new int[s1.size() - 2];
			for(int s1i=0, s1j=0; s1i != s1.size();++s1i) {
				if(s1i == r3 || s1i == r19) { continue; }
				s1children[s1j++] = s1.get(s1i);
			}
			Automaton.Set r23 = new Automaton.Set(s1children);
			Automaton.Term r24 = Solver$native.maxMultiplicand(automaton, r9);
			boolean r25 = r15 == r22;      // v1 eq v2
			boolean r26 = false;           // v1 eq v2 && t1 eq t2 && x2 lt 0.0 && vx eq v1
			if(r25) {
				boolean r27 = r5 == r21;       // t1 eq t2
				boolean r28 = false;           // t1 eq t2 && x2 lt 0.0 && vx eq v1
				if(r27) {
					Automaton.Real r29 = new Automaton.Real(0); // 0.0
					Automaton.Real r30 = (Automaton.Real) automaton.get(r13);
					boolean r31 = r30.compareTo(r29)<0; // x2 lt 0.0
					boolean r32 = false;           // x2 lt 0.0 && vx eq v1
					if(r31) {
						Object r33 = (Object) automaton.get(r15);
						boolean r34 = r24.equals(r33); // vx eq v1
						r32 = r34;
					}
					r28 = r32;
				}
				r26 = r28;
			}
			if(r26) {
				int r35 = automaton.add(r17);
				Automaton.List r36 = new Automaton.List(r8, r35); // [x1xs]
				int r37 = automaton.add(r36);
				Automaton.Term r38 = new Automaton.Term(K_Sum, r37);
				int r39 = automaton.add(r38);
				Automaton.List r40 = new Automaton.List(r5, r39); // [t1Sum([x1xs])]
				int r41 = automaton.add(r40);
				Automaton.Term r42 = new Automaton.Term(K_Inequality, r41);
				int r43 = automaton.add(r42);
				Automaton.Set r44 = new Automaton.Set(r2, r18, r43); // {eq1eq2eq3}
				Automaton.Set r45 = r44.append(r23); // {eq1eq2eq3} append rest
				int r46 = automaton.add(r45);
				Automaton.Term r47 = new Automaton.Term(K_And, r46);
				int r48 = automaton.add(r47);
				if(r0 != r48) {
					return automaton.rewrite(r0, r48);
				}
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Inequality_4"; }
		public final int rank() { return 1; }

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// term $7<Set(^{$2<^Expr<$44<Value<Null|Tuple(^[^$44...])|Bool<True|False>|Num(^real)|String(^string)|Set(^{^$44...})>>|Tuple(^[$2...])|Fn(^[^string,$2...])|$95<BExpr<Bool<True|False>|VExpr<Fn(^[^string,$2...])|Var(^string)|Load(^[$2,^int])|LengthOf($2)>|And(^{^$95...})|Or(^{^$95...})|Not(^$95)|Equals(^[$127<^Type<Atom<NotT($150<^Proton<TupleT(^[$150...])|SetT(^[^bool,$150])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$150...])|SetT(^[^bool,$150])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($127)|OrT(^{$127...})|AndT(^{$127...})|SetT(^[^bool,$127])|TupleT(^[$127...])|FunctionT(^[$127,$127,$127...])>>,^{|$2,$2|}[$2,$2]])|Inequality(^[^AType<IntT|RealT>,$233<^AExpr<Num(^real)|VExpr<Fn(^[^string,$2...])|Var(^string)|Load(^[$2,^int])|LengthOf($2)>|Sum(^[^real,^{|$233...|}[$233...]])|Mul(^[^real,^{|$233...|}[$233...]])|Div(^[$233,$233])>>])|Equation(^[^AType<IntT|RealT>,$233])|SubsetEq(^[^SetT(^[^bool,$127]),^SExpr<$7|VExpr<Fn(^[^string,$2...])|Var(^string)|Load(^[$2,^int])|LengthOf($2)>>,^SExpr<$7|VExpr<Fn(^[^string,$2...])|Var(^string)|Load(^[$2,^int])|LengthOf($2)>>])|ForAll(^[^{^[^Var(^string),$127]...},^$95])|Exists(^[^{^[^Var(^string),$127]...},^$95])>>|AExpr<Num(^real)|VExpr<Fn(^[^string,$2...])|Var(^string)|Load(^[$2,^int])|LengthOf($2)>|Sum(^[^real,^{|$233...|}[$233...]])|Mul(^[^real,^{|$233...|}[$233...]])|Div(^[$233,$233])>|SExpr<$7|VExpr<Fn(^[^string,$2...])|Var(^string)|Load(^[$2,^int])|LengthOf($2)>>>>...})>
	public final static int K_Set = 34;
	public final static int Set(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.Set(r0));
		return automaton.add(new Automaton.Term(K_Set, r1));
	}
	public final static int Set(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.Set(r0));
		return automaton.add(new Automaton.Term(K_Set, r1));
	}

	// 
	private final static class Reduction_77 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_77(Pattern.Term pattern) { super(pattern); }

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
					Automaton.State s4 = automaton.get(r4);
					if(s4.kind == K_Set) {
						Automaton.Term t4 = (Automaton.Term) s4;
						int r6 = t4.contents;
						Automaton.State s6 = automaton.get(r6);
						Automaton.Collection c6 = (Automaton.Collection) s6;
						for(int r9=0;r9!=c3.size();++r9) {
							if(r9 == r5) { continue; }
							int r8 = c3.get(r9);
							Automaton.State s8 = automaton.get(r8);
							if(s8.kind == K_Set) {
								Automaton.Term t8 = (Automaton.Term) s8;
								int r10 = t8.contents;
								Automaton.State s10 = automaton.get(r10);
								Automaton.Collection c10 = (Automaton.Collection) s10;
								int[] state = {r0, r1, r2, r3, r4, r5, r6, 0, r8, r9, r10, 0};
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
			int r5 = state[5];
			Automaton.Collection s6 = (Automaton.Collection) automaton.get(state[6]);
			int[] s6children = new int[s6.size() - 0];
			for(int s6i=0, s6j=0; s6i != s6.size();++s6i) {
				s6children[s6j++] = s6.get(s6i);
			}
			Automaton.Set r7 = new Automaton.Set(s6children);
			int r9 = state[9];
			Automaton.Collection s10 = (Automaton.Collection) automaton.get(state[10]);
			int[] s10children = new int[s10.size() - 0];
			for(int s10i=0, s10j=0; s10i != s10.size();++s10i) {
				s10children[s10j++] = s10.get(s10i);
			}
			Automaton.Set r11 = new Automaton.Set(s10children);
			Automaton.Int r12 = r7.lengthOf(); // |xs|
			Automaton.Int r13 = new Automaton.Int(0); // 0
			boolean r14 = r12.equals(r13); // |xs| eq 0
			boolean r15 = false;           // |xs| eq 0 && |ys| neq 0
			if(r14) {
				Automaton.Int r16 = r11.lengthOf(); // |ys|
				Automaton.Int r17 = new Automaton.Int(0); // 0
				boolean r18 = !r16.equals(r17); // |ys| neq 0
				r15 = r18;
			}
			if(r15) {
				Automaton.Term r19 = False;
				int r20 = automaton.add(r19);
				if(r0 != r20) {
					return automaton.rewrite(r0, r20);
				}
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return ""; }
		public final int rank() { return 1; }

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// 
	private final static class Reduction_78 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_78(Pattern.Term pattern) { super(pattern); }

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
										if(Runtime.accepts(type27,automaton,automaton.get(r9), SCHEMA)) {
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
		public final String name() { return ""; }
		public final int rank() { return 0; }

		public final int minimum() { return 8; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Set_LengthOf_1
	private final static class Reduction_79 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_79(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_LengthOf) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				if(s1.kind == K_Set) {
					Automaton.Term t1 = (Automaton.Term) s1;
					int r2 = t1.contents;
					Automaton.State s2 = automaton.get(r2);
					Automaton.Collection c2 = (Automaton.Collection) s2;
					boolean m2_0 = true;
					for(int i3=0;i3!=c2.size();++i3) {
						int r3 = c2.get(i3);
						if(Runtime.accepts(type17,automaton,automaton.get(r3), SCHEMA)) {
							continue;
						}
						m2_0 = false;
						break;
					}
					if(m2_0) {
						int[] state = {r0, r1, r2, 0};
						activations.add(new Activation(this,null,state));
					}
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
		public final String name() { return "Set_LengthOf_1"; }
		public final int rank() { return 0; }

		public final int minimum() { return 2; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Set_LengthOf_2
	private final static class Reduction_80 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_80(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Equals) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.List l1 = (Automaton.List) s1;
				int r2 = l1.get(0);
				if(Runtime.accepts(type25,automaton,automaton.get(r2), SCHEMA)) {
					int r3 = l1.get(1);
					Automaton.State s3 = automaton.get(r3);
					Automaton.Collection c3 = (Automaton.Collection) s3;
					for(int r5=0;r5!=c3.size();++r5) {
						int r4 = c3.get(r5);
						Automaton.State s4 = automaton.get(r4);
						if(s4.kind == K_LengthOf) {
							Automaton.Term t4 = (Automaton.Term) s4;
							int r6 = t4.contents;
							if(Runtime.accepts(type28,automaton,automaton.get(r6), SCHEMA)) {
								for(int r8=0;r8!=c3.size();++r8) {
									if(r8 == r5) { continue; }
									int r7 = c3.get(r8);
									Automaton.State s7 = automaton.get(r7);
									if(s7.kind == K_Num) {
										Automaton.Term t7 = (Automaton.Term) s7;
										int r9 = t7.contents;
										int[] state = {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9};
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
			int r5 = state[5];
			int r6 = state[6]; // x
			int r8 = state[8];
			int r9 = state[9]; // y
			Automaton.Real r10 = new Automaton.Real(0); // 0.0
			Automaton.Real r11 = (Automaton.Real) automaton.get(r9);
			boolean r12 = r11.equals(r10); // y eq 0.0
			if(r12) {
				boolean r13 = true;            // true
				int r14 = automaton.add(r13 ? Automaton.TRUE : Automaton.FALSE);
				Automaton.Term r15 = VoidT;
				int r16 = automaton.add(r15);
				Automaton.List r17 = new Automaton.List(r14, r16); // [trueVoidT]
				int r18 = automaton.add(r17);
				Automaton.Term r19 = new Automaton.Term(K_SetT, r18);
				int r20 = automaton.add(r19);
				Automaton.Set r21 = new Automaton.Set(); // {}
				int r22 = automaton.add(r21);
				Automaton.Term r23 = new Automaton.Term(K_Set, r22);
				int r24 = automaton.add(r23);
				Automaton.Bag r25 = new Automaton.Bag(r6, r24); // {|xSet({})|}
				int r26 = automaton.add(r25);
				Automaton.List r27 = new Automaton.List(r20, r26); // [SetT([trueVoidT]){|xSet({})|}]
				int r28 = automaton.add(r27);
				Automaton.Term r29 = new Automaton.Term(K_Equals, r28);
				int r30 = automaton.add(r29);
				if(r0 != r30) {
					return automaton.rewrite(r0, r30);
				}
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Set_LengthOf_2"; }
		public final int rank() { return 1; }

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// 
	private final static class Reduction_81 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_81(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Equation) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.List l1 = (Automaton.List) s1;
				int r2 = l1.get(0);
				if(Runtime.accepts(type25,automaton,automaton.get(r2), SCHEMA)) {
					int r3 = l1.get(1);
					Automaton.State s3 = automaton.get(r3);
					if(s3.kind == K_LengthOf) {
						Automaton.Term t3 = (Automaton.Term) s3;
						int r4 = t3.contents;
						if(Runtime.accepts(type28,automaton,automaton.get(r4), SCHEMA)) {
							int[] state = {r0, r1, r2, r3, r4};
							activations.add(new Activation(this,null,state));
						}
					}
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r4 = state[4]; // x
			boolean r5 = true;             // true
			int r6 = automaton.add(r5 ? Automaton.TRUE : Automaton.FALSE);
			Automaton.Term r7 = VoidT;
			int r8 = automaton.add(r7);
			Automaton.List r9 = new Automaton.List(r6, r8); // [trueVoidT]
			int r10 = automaton.add(r9);
			Automaton.Term r11 = new Automaton.Term(K_SetT, r10);
			int r12 = automaton.add(r11);
			Automaton.Set r13 = new Automaton.Set(); // {}
			int r14 = automaton.add(r13);
			Automaton.Term r15 = new Automaton.Term(K_Set, r14);
			int r16 = automaton.add(r15);
			Automaton.Bag r17 = new Automaton.Bag(r4, r16); // {|xSet({})|}
			int r18 = automaton.add(r17);
			Automaton.List r19 = new Automaton.List(r12, r18); // [SetT([trueVoidT]){|xSet({})|}]
			int r20 = automaton.add(r19);
			Automaton.Term r21 = new Automaton.Term(K_Equals, r20);
			int r22 = automaton.add(r21);
			if(r0 != r22) {
				return automaton.rewrite(r0, r22);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return ""; }
		public final int rank() { return 0; }

		public final int minimum() { return 4; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// term $10<SubsetEq(^[^$19<SetT(^[^bool,$13<^Type<$19|Atom<NotT($31<^Proton<TupleT(^[$31...])|SetT(^[^bool,$31])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$31...])|SetT(^[^bool,$31])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($13)|OrT(^{$13...})|AndT(^{$13...})|TupleT(^[$13...])|FunctionT(^[$13,$13,$13...])>>])>,^$111<SExpr<$121<VExpr<Var(^string)|$131<Fn(^[^string,$125<^Expr<$111|$131|$166<Value<Null|Tuple(^[^$166...])|Bool<True|False>|Num(^real)|String(^string)|Set(^{^$166...})>>|Tuple(^[$125...])|$208<BExpr<$10|$121|Bool<True|False>|And(^{^$208...})|Or(^{^$208...})|Not(^$208)|Equals(^[$13,^{|$125,$125|}[$125,$125]])|Inequality(^[^AType<IntT|RealT>,$231<^AExpr<$121|Num(^real)|Sum(^[^real,^{|$231...|}[$231...]])|Mul(^[^real,^{|$231...|}[$231...]])|Div(^[$231,$231])>>])|Equation(^[^AType<IntT|RealT>,$231])|ForAll(^[^{^[^Var(^string),$13]...},^$208])|Exists(^[^{^[^Var(^string),$13]...},^$208])>>|AExpr<$121|Num(^real)|Sum(^[^real,^{|$231...|}[$231...]])|Mul(^[^real,^{|$231...|}[$231...]])|Div(^[$231,$231])>>>...])>|Load(^[$125,^int])|LengthOf($125)>>|Set(^{$125...})>>,^$111])>
	public final static int K_SubsetEq = 35;
	public final static int SubsetEq(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_SubsetEq, r1));
	}
	public final static int SubsetEq(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_SubsetEq, r1));
	}

	// Set_SubsetEq_1
	private final static class Reduction_82 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_82(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_SubsetEq) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.List l1 = (Automaton.List) s1;
				int r2 = l1.get(0);
				int r3 = l1.get(1);
				Automaton.State s3 = automaton.get(r3);
				if(s3.kind == K_Set) {
					Automaton.Term t3 = (Automaton.Term) s3;
					int r4 = t3.contents;
					Automaton.State s4 = automaton.get(r4);
					Automaton.Collection c4 = (Automaton.Collection) s4;
					int r6 = l1.get(2);
					Automaton.State s6 = automaton.get(r6);
					if(s6.kind == K_Set) {
						Automaton.Term t6 = (Automaton.Term) s6;
						int r7 = t6.contents;
						Automaton.State s7 = automaton.get(r7);
						Automaton.Collection c7 = (Automaton.Collection) s7;
						int[] state = {r0, r1, r2, r3, r4, 0, r6, r7, 0};
						activations.add(new Activation(this,null,state));
					}
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r2 = state[2]; // t
			int r3 = state[3]; // s1
			Automaton.Collection s4 = (Automaton.Collection) automaton.get(state[4]);
			int[] s4children = new int[s4.size() - 0];
			for(int s4i=0, s4j=0; s4i != s4.size();++s4i) {
				s4children[s4j++] = s4.get(s4i);
			}
			Automaton.Set r5 = new Automaton.Set(s4children);
			int r6 = state[6]; // s2
			Automaton.Collection s7 = (Automaton.Collection) automaton.get(state[7]);
			int[] s7children = new int[s7.size() - 0];
			for(int s7i=0, s7j=0; s7i != s7.size();++s7i) {
				s7children[s7j++] = s7.get(s7i);
			}
			Automaton.Set r8 = new Automaton.Set(s7children);
			Automaton.Int r9 = r5.lengthOf(); // |xs|
			Automaton.Int r10 = new Automaton.Int(0); // 0
			boolean r11 = r9.equals(r10);  // |xs| eq 0
			if(r11) {
				Automaton.Term r12 = True;
				int r13 = automaton.add(r12);
				if(r0 != r13) {
					return automaton.rewrite(r0, r13);
				}
			}
			Automaton.Int r14 = r8.lengthOf(); // |ys|
			Automaton.Int r15 = new Automaton.Int(0); // 0
			boolean r16 = r14.equals(r15); // |ys| eq 0
			if(r16) {
				Automaton.Term r17 = False;
				int r18 = automaton.add(r17);
				if(r0 != r18) {
					return automaton.rewrite(r0, r18);
				}
			}
			Automaton.Int r19 = r5.lengthOf(); // |xs|
			Automaton.Int r20 = r8.lengthOf(); // |ys|
			boolean r21 = r19.compareTo(r20)<=0; // |xs| le |ys|
			boolean r22 = false;           // |xs| le |ys| && wyrl.core.Expr$Comprehension@7c682e26
			if(r21) {
				Automaton.List t23 = new Automaton.List();
				boolean r23 = true;
				outer:
				for(int i24=0;i24<r5.size();i24++) {
					int r24 = (int) r5.get(i24);
					boolean r25 = r8.contains(r24); // x in ys
					boolean r26 = !r25;            // !x in ys
					if(r26) {
						r23 = false;
						break outer;
					}
				}
				r22 = r23;
			}
			if(r22) {
				Automaton.Term r27 = True;
				int r28 = automaton.add(r27);
				if(r0 != r28) {
					return automaton.rewrite(r0, r28);
				}
			}
			boolean r29 = Runtime.accepts(type30, automaton, r3, SCHEMA); // s1 is ^$7<Set(^{$2<^Value<$7|Null|Tuple(^[$2...])|Bool<True|False>|Num(^real)|String(^string)>>...})>
			boolean r30 = false;           // s1 is ^$7<Set(^{$2<^Value<$7|Null|Tuple(^[$2...])|Bool<True|False>|Num(^real)|String(^string)>>...})> && s2 is ^$7<Set(^{$2<^Value<$7|Null|Tuple(^[$2...])|Bool<True|False>|Num(^real)|String(^string)>>...})>
			if(r29) {
				boolean r31 = Runtime.accepts(type30, automaton, r6, SCHEMA); // s2 is ^$7<Set(^{$2<^Value<$7|Null|Tuple(^[$2...])|Bool<True|False>|Num(^real)|String(^string)>>...})>
				r30 = r31;
			}
			if(r30) {
				Automaton.Term r32 = False;
				int r33 = automaton.add(r32);
				if(r0 != r33) {
					return automaton.rewrite(r0, r33);
				}
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Set_SubsetEq_1"; }
		public final int rank() { return 2; }

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Set_SubsetEq_2
	private final static class Reduction_83 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_83(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_SubsetEq) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.List l1 = (Automaton.List) s1;
				int r2 = l1.get(0);
				int r3 = l1.get(1);
				int r4 = l1.get(2);
				int[] state = {r0, r1, r2, r3, r4};
				activations.add(new Activation(this,null,state));
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r2 = state[2]; // t
			int r3 = state[3]; // x
			int r4 = state[4]; // y
			boolean r5 = r3 == r4;         // x eq y
			if(r5) {
				Automaton.Term r6 = True;
				int r7 = automaton.add(r6);
				if(r0 != r7) {
					return automaton.rewrite(r0, r7);
				}
			}
			boolean r8 = Runtime.accepts(type31, automaton, r3, SCHEMA); // x is ^$8<Set(^{$3<^Expr<$45<Value<Null|Tuple(^[^$45...])|Bool<True|False>|Num(^real)|String(^string)|Set(^{^$45...})>>|Tuple(^[$3...])|Fn(^[^string,$3...])|$96<BExpr<Bool<True|False>|VExpr<Fn(^[^string,$3...])|Var(^string)|Load(^[$3,^int])|LengthOf($3)>|And(^{^$96...})|Or(^{^$96...})|Not(^$96)|Equals(^[$128<^Type<Atom<NotT($151<^Proton<TupleT(^[$151...])|SetT(^[^bool,$151])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$151...])|SetT(^[^bool,$151])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($128)|OrT(^{$128...})|AndT(^{$128...})|SetT(^[^bool,$128])|TupleT(^[$128...])|FunctionT(^[$128,$128,$128...])>>,^{|$3,$3|}[$3,$3]])|Inequality(^[^AType<IntT|RealT>,$234<^AExpr<Num(^real)|VExpr<Fn(^[^string,$3...])|Var(^string)|Load(^[$3,^int])|LengthOf($3)>|Sum(^[^real,^{|$234...|}[$234...]])|Mul(^[^real,^{|$234...|}[$234...]])|Div(^[$234,$234])>>])|Equation(^[^AType<IntT|RealT>,$234])|SubsetEq(^[^SetT(^[^bool,$128]),^SExpr<$8|VExpr<Fn(^[^string,$3...])|Var(^string)|Load(^[$3,^int])|LengthOf($3)>>,^SExpr<$8|VExpr<Fn(^[^string,$3...])|Var(^string)|Load(^[$3,^int])|LengthOf($3)>>])|ForAll(^[^{^[^Var(^string),$128]...},^$96])|Exists(^[^{^[^Var(^string),$128]...},^$96])>>|AExpr<Num(^real)|VExpr<Fn(^[^string,$3...])|Var(^string)|Load(^[$3,^int])|LengthOf($3)>|Sum(^[^real,^{|$234...|}[$234...]])|Mul(^[^real,^{|$234...|}[$234...]])|Div(^[$234,$234])>|SExpr<$8|VExpr<Fn(^[^string,$3...])|Var(^string)|Load(^[$3,^int])|LengthOf($3)>>>>...})>
			boolean r9 = false;            // x is ^$8<Set(^{$3<^Expr<$45<Value<Null|Tuple(^[^$45...])|Bool<True|False>|Num(^real)|String(^string)|Set(^{^$45...})>>|Tuple(^[$3...])|Fn(^[^string,$3...])|$96<BExpr<Bool<True|False>|VExpr<Fn(^[^string,$3...])|Var(^string)|Load(^[$3,^int])|LengthOf($3)>|And(^{^$96...})|Or(^{^$96...})|Not(^$96)|Equals(^[$128<^Type<Atom<NotT($151<^Proton<TupleT(^[$151...])|SetT(^[^bool,$151])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$151...])|SetT(^[^bool,$151])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($128)|OrT(^{$128...})|AndT(^{$128...})|SetT(^[^bool,$128])|TupleT(^[$128...])|FunctionT(^[$128,$128,$128...])>>,^{|$3,$3|}[$3,$3]])|Inequality(^[^AType<IntT|RealT>,$234<^AExpr<Num(^real)|VExpr<Fn(^[^string,$3...])|Var(^string)|Load(^[$3,^int])|LengthOf($3)>|Sum(^[^real,^{|$234...|}[$234...]])|Mul(^[^real,^{|$234...|}[$234...]])|Div(^[$234,$234])>>])|Equation(^[^AType<IntT|RealT>,$234])|SubsetEq(^[^SetT(^[^bool,$128]),^SExpr<$8|VExpr<Fn(^[^string,$3...])|Var(^string)|Load(^[$3,^int])|LengthOf($3)>>,^SExpr<$8|VExpr<Fn(^[^string,$3...])|Var(^string)|Load(^[$3,^int])|LengthOf($3)>>])|ForAll(^[^{^[^Var(^string),$128]...},^$96])|Exists(^[^{^[^Var(^string),$128]...},^$96])>>|AExpr<Num(^real)|VExpr<Fn(^[^string,$3...])|Var(^string)|Load(^[$3,^int])|LengthOf($3)>|Sum(^[^real,^{|$234...|}[$234...]])|Mul(^[^real,^{|$234...|}[$234...]])|Div(^[$234,$234])>|SExpr<$8|VExpr<Fn(^[^string,$3...])|Var(^string)|Load(^[$3,^int])|LengthOf($3)>>>>...})> && |*x| eq 0
			if(r8) {
				Automaton.Term r10 = (Automaton.Term) automaton.get(r3);
				int r11 = r10.contents;
				Automaton.Set r12 = (Automaton.Set) automaton.get(r11);
				Automaton.Int r13 = r12.lengthOf(); // |*x|
				Automaton.Int r14 = new Automaton.Int(0); // 0
				boolean r15 = r13.equals(r14); // |*x| eq 0
				r9 = r15;
			}
			if(r9) {
				Automaton.Term r16 = True;
				int r17 = automaton.add(r16);
				if(r0 != r17) {
					return automaton.rewrite(r0, r17);
				}
			}
			boolean r18 = Runtime.accepts(type31, automaton, r4, SCHEMA); // y is ^$8<Set(^{$3<^Expr<$45<Value<Null|Tuple(^[^$45...])|Bool<True|False>|Num(^real)|String(^string)|Set(^{^$45...})>>|Tuple(^[$3...])|Fn(^[^string,$3...])|$96<BExpr<Bool<True|False>|VExpr<Fn(^[^string,$3...])|Var(^string)|Load(^[$3,^int])|LengthOf($3)>|And(^{^$96...})|Or(^{^$96...})|Not(^$96)|Equals(^[$128<^Type<Atom<NotT($151<^Proton<TupleT(^[$151...])|SetT(^[^bool,$151])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$151...])|SetT(^[^bool,$151])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($128)|OrT(^{$128...})|AndT(^{$128...})|SetT(^[^bool,$128])|TupleT(^[$128...])|FunctionT(^[$128,$128,$128...])>>,^{|$3,$3|}[$3,$3]])|Inequality(^[^AType<IntT|RealT>,$234<^AExpr<Num(^real)|VExpr<Fn(^[^string,$3...])|Var(^string)|Load(^[$3,^int])|LengthOf($3)>|Sum(^[^real,^{|$234...|}[$234...]])|Mul(^[^real,^{|$234...|}[$234...]])|Div(^[$234,$234])>>])|Equation(^[^AType<IntT|RealT>,$234])|SubsetEq(^[^SetT(^[^bool,$128]),^SExpr<$8|VExpr<Fn(^[^string,$3...])|Var(^string)|Load(^[$3,^int])|LengthOf($3)>>,^SExpr<$8|VExpr<Fn(^[^string,$3...])|Var(^string)|Load(^[$3,^int])|LengthOf($3)>>])|ForAll(^[^{^[^Var(^string),$128]...},^$96])|Exists(^[^{^[^Var(^string),$128]...},^$96])>>|AExpr<Num(^real)|VExpr<Fn(^[^string,$3...])|Var(^string)|Load(^[$3,^int])|LengthOf($3)>|Sum(^[^real,^{|$234...|}[$234...]])|Mul(^[^real,^{|$234...|}[$234...]])|Div(^[$234,$234])>|SExpr<$8|VExpr<Fn(^[^string,$3...])|Var(^string)|Load(^[$3,^int])|LengthOf($3)>>>>...})>
			boolean r19 = false;           // y is ^$8<Set(^{$3<^Expr<$45<Value<Null|Tuple(^[^$45...])|Bool<True|False>|Num(^real)|String(^string)|Set(^{^$45...})>>|Tuple(^[$3...])|Fn(^[^string,$3...])|$96<BExpr<Bool<True|False>|VExpr<Fn(^[^string,$3...])|Var(^string)|Load(^[$3,^int])|LengthOf($3)>|And(^{^$96...})|Or(^{^$96...})|Not(^$96)|Equals(^[$128<^Type<Atom<NotT($151<^Proton<TupleT(^[$151...])|SetT(^[^bool,$151])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$151...])|SetT(^[^bool,$151])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($128)|OrT(^{$128...})|AndT(^{$128...})|SetT(^[^bool,$128])|TupleT(^[$128...])|FunctionT(^[$128,$128,$128...])>>,^{|$3,$3|}[$3,$3]])|Inequality(^[^AType<IntT|RealT>,$234<^AExpr<Num(^real)|VExpr<Fn(^[^string,$3...])|Var(^string)|Load(^[$3,^int])|LengthOf($3)>|Sum(^[^real,^{|$234...|}[$234...]])|Mul(^[^real,^{|$234...|}[$234...]])|Div(^[$234,$234])>>])|Equation(^[^AType<IntT|RealT>,$234])|SubsetEq(^[^SetT(^[^bool,$128]),^SExpr<$8|VExpr<Fn(^[^string,$3...])|Var(^string)|Load(^[$3,^int])|LengthOf($3)>>,^SExpr<$8|VExpr<Fn(^[^string,$3...])|Var(^string)|Load(^[$3,^int])|LengthOf($3)>>])|ForAll(^[^{^[^Var(^string),$128]...},^$96])|Exists(^[^{^[^Var(^string),$128]...},^$96])>>|AExpr<Num(^real)|VExpr<Fn(^[^string,$3...])|Var(^string)|Load(^[$3,^int])|LengthOf($3)>|Sum(^[^real,^{|$234...|}[$234...]])|Mul(^[^real,^{|$234...|}[$234...]])|Div(^[$234,$234])>|SExpr<$8|VExpr<Fn(^[^string,$3...])|Var(^string)|Load(^[$3,^int])|LengthOf($3)>>>>...})> && |*y| eq 0
			if(r18) {
				Automaton.Term r20 = (Automaton.Term) automaton.get(r4);
				int r21 = r20.contents;
				Automaton.Set r22 = (Automaton.Set) automaton.get(r21);
				Automaton.Int r23 = r22.lengthOf(); // |*y|
				Automaton.Int r24 = new Automaton.Int(0); // 0
				boolean r25 = r23.equals(r24); // |*y| eq 0
				r19 = r25;
			}
			if(r19) {
				Automaton.Bag r26 = new Automaton.Bag(r3, r4); // {|xy|}
				int r27 = automaton.add(r26);
				Automaton.List r28 = new Automaton.List(r2, r27); // [t{|xy|}]
				int r29 = automaton.add(r28);
				Automaton.Term r30 = new Automaton.Term(K_Equals, r29);
				int r31 = automaton.add(r30);
				if(r0 != r31) {
					return automaton.rewrite(r0, r31);
				}
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Set_SubsetEq_2"; }
		public final int rank() { return 1; }

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Set_SubsetEq_3
	private final static class Reduction_84 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_84(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_SubsetEq) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.List l1 = (Automaton.List) s1;
				int r2 = l1.get(0);
				Automaton.State s2 = automaton.get(r2);
				Automaton.Term t2 = (Automaton.Term) s2;
				int r3 = t2.contents;
				Automaton.State s3 = automaton.get(r3);
				Automaton.List l3 = (Automaton.List) s3;
				int r4 = l3.get(0);
				int r5 = l3.get(1);
				int r6 = l1.get(1);
				Automaton.State s6 = automaton.get(r6);
				if(s6.kind == K_Set) {
					Automaton.Term t6 = (Automaton.Term) s6;
					int r7 = t6.contents;
					Automaton.State s7 = automaton.get(r7);
					Automaton.Collection c7 = (Automaton.Collection) s7;
					if(c7.size() >= 1) {
						for(int r9=0;r9!=c7.size();++r9) {
							int r8 = c7.get(r9);
							int r11 = l1.get(2);
							Automaton.State s11 = automaton.get(r11);
							if(s11.kind == K_Set) {
								Automaton.Term t11 = (Automaton.Term) s11;
								int r12 = t11.contents;
								Automaton.State s12 = automaton.get(r12);
								Automaton.Collection c12 = (Automaton.Collection) s12;
								int[] state = {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, 0, r11, r12, 0};
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
			int r4 = state[4]; // b
			int r5 = state[5]; // e
			int r6 = state[6]; // s1
			int r8 = state[8]; // x
			int r9 = state[9];
			Automaton.Collection s7 = (Automaton.Collection) automaton.get(state[7]);
			int[] s7children = new int[s7.size() - 1];
			for(int s7i=0, s7j=0; s7i != s7.size();++s7i) {
				if(s7i == r9) { continue; }
				s7children[s7j++] = s7.get(s7i);
			}
			Automaton.Set r10 = new Automaton.Set(s7children);
			int r11 = state[11]; // s2
			Automaton.Collection s12 = (Automaton.Collection) automaton.get(state[12]);
			int[] s12children = new int[s12.size() - 0];
			for(int s12i=0, s12j=0; s12i != s12.size();++s12i) {
				s12children[s12j++] = s12.get(s12i);
			}
			Automaton.Set r13 = new Automaton.Set(s12children);
			boolean r14 = Runtime.accepts(type16, automaton, r8, SCHEMA); // x is $1<^Value<Null|Tuple(^[$1...])|Bool<True|False>|Num(^real)|String(^string)|Set(^{$1...})>>
			boolean r15 = !r14;            // !x is $1<^Value<Null|Tuple(^[$1...])|Bool<True|False>|Num(^real)|String(^string)|Set(^{$1...})>>
			boolean r16 = false;           // !x is $1<^Value<Null|Tuple(^[$1...])|Bool<True|False>|Num(^real)|String(^string)|Set(^{$1...})>> && |ys| gt 0
			if(r15) {
				Automaton.Int r17 = r13.lengthOf(); // |ys|
				Automaton.Int r18 = new Automaton.Int(0); // 0
				boolean r19 = r17.compareTo(r18)>0; // |ys| gt 0
				r16 = r19;
			}
			if(r16) {
				Automaton.List t20 = new Automaton.List();
				for(int i21=0;i21<r13.size();i21++) {
					int r21 = (int) r13.get(i21);
					Automaton.Bag r22 = new Automaton.Bag(r8, r21); // {|xy|}
					int r23 = automaton.add(r22);
					Automaton.List r24 = new Automaton.List(r5, r23); // [e{|xy|}]
					int r25 = automaton.add(r24);
					Automaton.Term r26 = new Automaton.Term(K_Equals, r25);
					int r27 = automaton.add(r26);
					t20.add(r27);
				}
				Automaton.Set r20 = new Automaton.Set(t20.toArray());
				int r28 = automaton.add(r20);
				Automaton.Term r29 = new Automaton.Term(K_Or, r28);
				int r30 = automaton.add(r29);
				int r31 = automaton.add(r10);
				Automaton.Term r32 = new Automaton.Term(K_Set, r31);
				int r33 = automaton.add(r32);
				Automaton.List r34 = new Automaton.List(r2, r33, r11); // [tSet(xs)s2]
				int r35 = automaton.add(r34);
				Automaton.Term r36 = new Automaton.Term(K_SubsetEq, r35);
				int r37 = automaton.add(r36);
				Automaton.Set r38 = new Automaton.Set(r30, r37); // {Or(zs)SubsetEq([tSet(xs)s2])}
				int r39 = automaton.add(r38);
				Automaton.Term r40 = new Automaton.Term(K_And, r39);
				int r41 = automaton.add(r40);
				if(r0 != r41) {
					return automaton.rewrite(r0, r41);
				}
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Set_SubsetEq_3"; }
		public final int rank() { return 4; }

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Set_SubsetEq_4
	private final static class Reduction_85 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_85(Pattern.Term pattern) { super(pattern); }

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
						if(s2.kind == K_SubsetEq) {
							Automaton.Term t2 = (Automaton.Term) s2;
							int r4 = t2.contents;
							Automaton.State s4 = automaton.get(r4);
							Automaton.List l4 = (Automaton.List) s4;
							int r5 = l4.get(0);
							Automaton.State s5 = automaton.get(r5);
							Automaton.Term t5 = (Automaton.Term) s5;
							int r6 = t5.contents;
							Automaton.State s6 = automaton.get(r6);
							Automaton.List l6 = (Automaton.List) s6;
							int r7 = l6.get(0);
							int r8 = l6.get(1);
							int r9 = l4.get(1);
							Automaton.State s9 = automaton.get(r9);
							if(s9.kind == K_Set) {
								Automaton.Term t9 = (Automaton.Term) s9;
								int r10 = t9.contents;
								Automaton.State s10 = automaton.get(r10);
								Automaton.Collection c10 = (Automaton.Collection) s10;
								int r12 = l4.get(2);
								for(int r14=0;r14!=c1.size();++r14) {
									if(r14 == r3) { continue; }
									int r13 = c1.get(r14);
									Automaton.State s13 = automaton.get(r13);
									if(s13.kind == K_SubsetEq) {
										Automaton.Term t13 = (Automaton.Term) s13;
										int r15 = t13.contents;
										Automaton.State s15 = automaton.get(r15);
										Automaton.List l15 = (Automaton.List) s15;
										int r16 = l15.get(0);
										Automaton.State s16 = automaton.get(r16);
										Automaton.Term t16 = (Automaton.Term) s16;
										int r17 = t16.contents;
										Automaton.State s17 = automaton.get(r17);
										Automaton.List l17 = (Automaton.List) s17;
										int r18 = l17.get(0);
										int r19 = l17.get(1);
										int r20 = l15.get(1);
										Automaton.State s20 = automaton.get(r20);
										if(s20.kind == K_Set) {
											Automaton.Term t20 = (Automaton.Term) s20;
											int r21 = t20.contents;
											Automaton.State s21 = automaton.get(r21);
											Automaton.Collection c21 = (Automaton.Collection) s21;
											int r23 = l15.get(2);
											int[] state = {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, 0, r12, r13, r14, r15, r16, r17, r18, r19, r20, r21, 0, r23, 0};
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
			int r3 = state[3];
			int r7 = state[7]; // b1
			int r8 = state[8]; // e1
			Automaton.Collection s10 = (Automaton.Collection) automaton.get(state[10]);
			int[] s10children = new int[s10.size() - 0];
			for(int s10i=0, s10j=0; s10i != s10.size();++s10i) {
				s10children[s10j++] = s10.get(s10i);
			}
			Automaton.Set r11 = new Automaton.Set(s10children);
			int r12 = state[12]; // x
			int r14 = state[14];
			int r18 = state[18]; // b2
			int r19 = state[19]; // e2
			Automaton.Collection s21 = (Automaton.Collection) automaton.get(state[21]);
			int[] s21children = new int[s21.size() - 0];
			for(int s21i=0, s21j=0; s21i != s21.size();++s21i) {
				s21children[s21j++] = s21.get(s21i);
			}
			Automaton.Set r22 = new Automaton.Set(s21children);
			int r23 = state[23]; // y
			Automaton.Collection s1 = (Automaton.Collection) automaton.get(state[1]);
			int[] s1children = new int[s1.size() - 2];
			for(int s1i=0, s1j=0; s1i != s1.size();++s1i) {
				if(s1i == r3 || s1i == r14) { continue; }
				s1children[s1j++] = s1.get(s1i);
			}
			Automaton.Set r24 = new Automaton.Set(s1children);
			boolean r25 = r12 == r23;      // x eq y
			if(r25) {
				Automaton.Set r26 = r11.append(r22); // xs append ys
				boolean r27 = ((Automaton.Bool)automaton.get(r7)).value;
				boolean r28 = ((Automaton.Bool)automaton.get(r18)).value;
				boolean r29 = r27 || r28;      // b1 || b2
				int r30 = automaton.add(r29 ? Automaton.TRUE : Automaton.FALSE);
				Automaton.Set r31 = new Automaton.Set(r8, r19); // {e1e2}
				int r32 = automaton.add(r31);
				Automaton.Term r33 = new Automaton.Term(K_OrT, r32);
				int r34 = automaton.add(r33);
				Automaton.List r35 = new Automaton.List(r30, r34); // [b1 || b2OrT({e1e2})]
				int r36 = automaton.add(r35);
				Automaton.Term r37 = new Automaton.Term(K_SetT, r36);
				int r38 = automaton.add(r37);
				int r39 = automaton.add(r26);
				Automaton.Term r40 = new Automaton.Term(K_Set, r39);
				int r41 = automaton.add(r40);
				Automaton.List r42 = new Automaton.List(r38, r41, r12); // [SetT([b1 || b2OrT({e1e2})])Set(zs)x]
				int r43 = automaton.add(r42);
				Automaton.Term r44 = new Automaton.Term(K_SubsetEq, r43);
				int r45 = automaton.add(r44);
				Automaton.Set r46 = r24.appendFront(r45); // SubsetEq([SetT([b1 || b2OrT({e1e2})])Set(zs)x]) append rest
				int r47 = automaton.add(r46);
				Automaton.Term r48 = new Automaton.Term(K_And, r47);
				int r49 = automaton.add(r48);
				if(r0 != r49) {
					return automaton.rewrite(r0, r49);
				}
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Set_SubsetEq_4"; }
		public final int rank() { return 3; }

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Set_SubsetEq_5
	private final static class Reduction_86 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_86(Pattern.Term pattern) { super(pattern); }

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
						if(s2.kind == K_SubsetEq) {
							Automaton.Term t2 = (Automaton.Term) s2;
							int r4 = t2.contents;
							Automaton.State s4 = automaton.get(r4);
							Automaton.List l4 = (Automaton.List) s4;
							int r5 = l4.get(0);
							Automaton.State s5 = automaton.get(r5);
							Automaton.Term t5 = (Automaton.Term) s5;
							int r6 = t5.contents;
							Automaton.State s6 = automaton.get(r6);
							Automaton.List l6 = (Automaton.List) s6;
							int r7 = l6.get(0);
							int r8 = l6.get(1);
							int r9 = l4.get(1);
							int r10 = l4.get(2);
							Automaton.State s10 = automaton.get(r10);
							if(s10.kind == K_Set) {
								Automaton.Term t10 = (Automaton.Term) s10;
								int r11 = t10.contents;
								Automaton.State s11 = automaton.get(r11);
								Automaton.Collection c11 = (Automaton.Collection) s11;
								for(int r14=0;r14!=c1.size();++r14) {
									if(r14 == r3) { continue; }
									int r13 = c1.get(r14);
									Automaton.State s13 = automaton.get(r13);
									if(s13.kind == K_SubsetEq) {
										Automaton.Term t13 = (Automaton.Term) s13;
										int r15 = t13.contents;
										Automaton.State s15 = automaton.get(r15);
										Automaton.List l15 = (Automaton.List) s15;
										int r16 = l15.get(0);
										Automaton.State s16 = automaton.get(r16);
										Automaton.Term t16 = (Automaton.Term) s16;
										int r17 = t16.contents;
										Automaton.State s17 = automaton.get(r17);
										Automaton.List l17 = (Automaton.List) s17;
										int r18 = l17.get(0);
										int r19 = l17.get(1);
										int r20 = l15.get(1);
										int r21 = l15.get(2);
										Automaton.State s21 = automaton.get(r21);
										if(s21.kind == K_Set) {
											Automaton.Term t21 = (Automaton.Term) s21;
											int r22 = t21.contents;
											Automaton.State s22 = automaton.get(r22);
											Automaton.Collection c22 = (Automaton.Collection) s22;
											int[] state = {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, 0, r13, r14, r15, r16, r17, r18, r19, r20, r21, r22, 0, 0};
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
			int r3 = state[3];
			int r7 = state[7]; // b1
			int r8 = state[8]; // e1
			int r9 = state[9]; // x
			Automaton.Collection s11 = (Automaton.Collection) automaton.get(state[11]);
			int[] s11children = new int[s11.size() - 0];
			for(int s11i=0, s11j=0; s11i != s11.size();++s11i) {
				s11children[s11j++] = s11.get(s11i);
			}
			Automaton.Set r12 = new Automaton.Set(s11children);
			int r14 = state[14];
			int r18 = state[18]; // b2
			int r19 = state[19]; // e2
			int r20 = state[20]; // y
			Automaton.Collection s22 = (Automaton.Collection) automaton.get(state[22]);
			int[] s22children = new int[s22.size() - 0];
			for(int s22i=0, s22j=0; s22i != s22.size();++s22i) {
				s22children[s22j++] = s22.get(s22i);
			}
			Automaton.Set r23 = new Automaton.Set(s22children);
			Automaton.Collection s1 = (Automaton.Collection) automaton.get(state[1]);
			int[] s1children = new int[s1.size() - 2];
			for(int s1i=0, s1j=0; s1i != s1.size();++s1i) {
				if(s1i == r3 || s1i == r14) { continue; }
				s1children[s1j++] = s1.get(s1i);
			}
			Automaton.Set r24 = new Automaton.Set(s1children);
			boolean r25 = r9 == r20;       // x eq y
			if(r25) {
				Automaton.List t26 = new Automaton.List();
				for(int i27=0;i27<r12.size();i27++) {
					int r27 = (int) r12.get(i27);
					boolean r28 = true;            // true
					boolean r29 = false;           // true && z in ys
					if(r28) {
						boolean r30 = r23.contains(r27); // z in ys
						r29 = r30;
					}
					if(r29) {
						t26.add(r27);
					}
				}
				Automaton.Set r26 = new Automaton.Set(t26.toArray());
				boolean r31 = ((Automaton.Bool)automaton.get(r7)).value;
				boolean r32 = ((Automaton.Bool)automaton.get(r18)).value;
				boolean r33 = r31 || r32;      // b1 || b2
				int r34 = automaton.add(r33 ? Automaton.TRUE : Automaton.FALSE);
				Automaton.Set r35 = new Automaton.Set(r8, r19); // {e1e2}
				int r36 = automaton.add(r35);
				Automaton.Term r37 = new Automaton.Term(K_OrT, r36);
				int r38 = automaton.add(r37);
				Automaton.List r39 = new Automaton.List(r34, r38); // [b1 || b2OrT({e1e2})]
				int r40 = automaton.add(r39);
				Automaton.Term r41 = new Automaton.Term(K_SetT, r40);
				int r42 = automaton.add(r41);
				int r43 = automaton.add(r26);
				Automaton.Term r44 = new Automaton.Term(K_Set, r43);
				int r45 = automaton.add(r44);
				Automaton.List r46 = new Automaton.List(r42, r9, r45); // [SetT([b1 || b2OrT({e1e2})])xSet(zs)]
				int r47 = automaton.add(r46);
				Automaton.Term r48 = new Automaton.Term(K_SubsetEq, r47);
				int r49 = automaton.add(r48);
				Automaton.Set r50 = r24.appendFront(r49); // SubsetEq([SetT([b1 || b2OrT({e1e2})])xSet(zs)]) append rest
				int r51 = automaton.add(r50);
				Automaton.Term r52 = new Automaton.Term(K_And, r51);
				int r53 = automaton.add(r52);
				if(r0 != r53) {
					return automaton.rewrite(r0, r53);
				}
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Set_SubsetEq_5"; }
		public final int rank() { return 3; }

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Set_SubsetEq_6
	private final static class Reduction_87 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_87(Pattern.Term pattern) { super(pattern); }

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
						if(s2.kind == K_SubsetEq) {
							Automaton.Term t2 = (Automaton.Term) s2;
							int r4 = t2.contents;
							Automaton.State s4 = automaton.get(r4);
							Automaton.List l4 = (Automaton.List) s4;
							int r5 = l4.get(0);
							int r6 = l4.get(1);
							int r7 = l4.get(2);
							for(int r9=0;r9!=c1.size();++r9) {
								if(r9 == r3) { continue; }
								int r8 = c1.get(r9);
								Automaton.State s8 = automaton.get(r8);
								if(s8.kind == K_SubsetEq) {
									Automaton.Term t8 = (Automaton.Term) s8;
									int r10 = t8.contents;
									Automaton.State s10 = automaton.get(r10);
									Automaton.List l10 = (Automaton.List) s10;
									int r11 = l10.get(0);
									int r12 = l10.get(1);
									int r13 = l10.get(2);
									int[] state = {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, 0};
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
			int r5 = state[5]; // t1
			int r6 = state[6]; // x
			int r7 = state[7]; // y
			int r8 = state[8]; // s2
			int r9 = state[9];
			int r11 = state[11]; // t2
			int r12 = state[12]; // u
			int r13 = state[13]; // v
			Automaton.Collection s1 = (Automaton.Collection) automaton.get(state[1]);
			int[] s1children = new int[s1.size() - 2];
			for(int s1i=0, s1j=0; s1i != s1.size();++s1i) {
				if(s1i == r3 || s1i == r9) { continue; }
				s1children[s1j++] = s1.get(s1i);
			}
			Automaton.Set r14 = new Automaton.Set(s1children);
			boolean r15 = r7 == r12;       // y eq u
			boolean r16 = false;           // y eq u && v eq x
			if(r15) {
				boolean r17 = r13 == r6;       // v eq x
				r16 = r17;
			}
			if(r16) {
				Automaton.Bag r18 = new Automaton.Bag(r6, r7); // {|xy|}
				int r19 = automaton.add(r18);
				Automaton.List r20 = new Automaton.List(r5, r19); // [t1{|xy|}]
				int r21 = automaton.add(r20);
				Automaton.Term r22 = new Automaton.Term(K_Equals, r21);
				int r23 = automaton.add(r22);
				Automaton.Set r24 = new Automaton.Set(r23); // {Equals([t1{|xy|}])}
				Automaton.Set r25 = r24.append(r14); // {Equals([t1{|xy|}])} append rest
				int r26 = automaton.add(r25);
				Automaton.Term r27 = new Automaton.Term(K_And, r26);
				int r28 = automaton.add(r27);
				if(r0 != r28) {
					return automaton.rewrite(r0, r28);
				}
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Set_SubsetEq_6"; }
		public final int rank() { return 0; }

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Set_SubsetEq_7
	private final static class Inference_5 extends AbstractRewriteRule implements InferenceRule {

		public Inference_5(Pattern.Term pattern) { super(pattern); }

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
						if(s2.kind == K_SubsetEq) {
							Automaton.Term t2 = (Automaton.Term) s2;
							int r4 = t2.contents;
							Automaton.State s4 = automaton.get(r4);
							Automaton.List l4 = (Automaton.List) s4;
							int r5 = l4.get(0);
							int r6 = l4.get(1);
							int r7 = l4.get(2);
							for(int r9=0;r9!=c1.size();++r9) {
								if(r9 == r3) { continue; }
								int r8 = c1.get(r9);
								Automaton.State s8 = automaton.get(r8);
								if(s8.kind == K_SubsetEq) {
									Automaton.Term t8 = (Automaton.Term) s8;
									int r10 = t8.contents;
									Automaton.State s10 = automaton.get(r10);
									Automaton.List l10 = (Automaton.List) s10;
									int r11 = l10.get(0);
									int r12 = l10.get(1);
									int r13 = l10.get(2);
									int[] state = {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, 0};
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
			int r5 = state[5]; // t1
			int r6 = state[6]; // x
			int r7 = state[7]; // y
			int r8 = state[8]; // s2
			int r9 = state[9];
			int r11 = state[11]; // t2
			int r12 = state[12]; // u
			int r13 = state[13]; // v
			Automaton.Collection s1 = (Automaton.Collection) automaton.get(state[1]);
			int[] s1children = new int[s1.size() - 2];
			for(int s1i=0, s1j=0; s1i != s1.size();++s1i) {
				if(s1i == r3 || s1i == r9) { continue; }
				s1children[s1j++] = s1.get(s1i);
			}
			Automaton.Set r14 = new Automaton.Set(s1children);
			boolean r15 = r7 == r12;       // y eq u
			if(r15) {
				Automaton.List r16 = new Automaton.List(r5, r6, r13); // [t1xv]
				int r17 = automaton.add(r16);
				Automaton.Term r18 = new Automaton.Term(K_SubsetEq, r17);
				int r19 = automaton.add(r18);
				Automaton.Set r20 = new Automaton.Set(r2, r8, r19); // {s1s2SubsetEq([t1xv])}
				Automaton.Set r21 = r20.append(r14); // {s1s2SubsetEq([t1xv])} append rest
				int r22 = automaton.add(r21);
				Automaton.Term r23 = new Automaton.Term(K_And, r22);
				int r24 = automaton.add(r23);
				if(r0 != r24) {
					return automaton.rewrite(r0, r24);
				}
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Set_SubsetEq_7"; }
		public final int rank() { return 2; }

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// term $19<ForAll($17<^[^{^[^Var(^string),$4<^Type<Atom<NotT($35<^Proton<TupleT(^[$35...])|SetT(^[^bool,$35])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$35...])|SetT(^[^bool,$35])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($4)|OrT(^{$4...})|AndT(^{$4...})|SetT(^[^bool,$4])|TupleT(^[$4...])|FunctionT(^[$4,$4,$4...])>>]...},$13<^$139<BExpr<$148<VExpr<Var(^string)|$156<Fn(^[^string,$150<^Expr<$139|$156|$191<Value<Null|Tuple(^[^$191...])|Bool<True|False>|Num(^real)|String(^string)|Set(^{^$191...})>>|Tuple(^[$150...])|$218<AExpr<$148|Num(^real)|Sum(^[^real,^{|^$218...|}[^$218...]])|Mul(^[^real,^{|^$218...|}[^$218...]])|Div(^[^$218,^$218])>>|SExpr<$148|Set(^{$150...})>>>...])>|Load(^[$150,^int])|LengthOf($150)>>|Bool<True|False>|And(^{$13...})|Or(^{$13...})|Not($13)|Equals(^[$4,^{|$150,$150|}[$150,$150]])|Inequality(^[^AType<IntT|RealT>,^$218])|Equation(^[^AType<IntT|RealT>,^$218])|SubsetEq(^[^SetT(^[^bool,$4]),^SExpr<$148|Set(^{$150...})>,^SExpr<$148|Set(^{$150...})>])|$19|Exists($17)>>>]>)>
	public final static int K_ForAll = 36;
	public final static int ForAll(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_ForAll, r1));
	}
	public final static int ForAll(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_ForAll, r1));
	}

	// ForAll_1
	private final static class Reduction_88 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_88(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_ForAll) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.List l1 = (Automaton.List) s1;
				int r2 = l1.get(0);
				Automaton.State s2 = automaton.get(r2);
				Automaton.Collection c2 = (Automaton.Collection) s2;
				int r4 = l1.get(1);
				int[] state = {r0, r1, r2, 0, r4};
				activations.add(new Activation(this,null,state));
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
			int r4 = state[4]; // be
			boolean r5 = Runtime.accepts(type33, automaton, r4, SCHEMA); // be is ^Bool<True|False>
			Automaton.Int r6 = r3.lengthOf(); // |qs|
			Automaton.Int r7 = new Automaton.Int(0); // 0
			boolean r8 = r6.equals(r7);    // |qs| eq 0
			boolean r9 = r5 || r8;         // be is ^Bool<True|False> || |qs| eq 0
			if(r9) {
				if(r0 != r4) {
					return automaton.rewrite(r0, r4);
				}
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "ForAll_1"; }
		public final int rank() { return 1; }

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// ForAll_2
	private final static class Reduction_89 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_89(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Not) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				if(s1.kind == K_ForAll) {
					Automaton.Term t1 = (Automaton.Term) s1;
					int r2 = t1.contents;
					Automaton.State s2 = automaton.get(r2);
					Automaton.List l2 = (Automaton.List) s2;
					int r3 = l2.get(0);
					Automaton.State s3 = automaton.get(r3);
					Automaton.Collection c3 = (Automaton.Collection) s3;
					int r5 = l2.get(1);
					int[] state = {r0, r1, r2, r3, 0, r5};
					activations.add(new Activation(this,null,state));
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r3 = state[3]; // vars
			int r5 = state[5]; // be
			Automaton.Term r6 = new Automaton.Term(K_Not, r5);
			int r7 = automaton.add(r6);
			Automaton.List r8 = new Automaton.List(r3, r7); // [varsNot(be)]
			int r9 = automaton.add(r8);
			Automaton.Term r10 = new Automaton.Term(K_Exists, r9);
			int r11 = automaton.add(r10);
			if(r0 != r11) {
				return automaton.rewrite(r0, r11);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "ForAll_2"; }
		public final int rank() { return 0; }

		public final int minimum() { return 4; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// ForAll_3
	private final static class Reduction_90 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_90(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_ForAll) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.List l1 = (Automaton.List) s1;
				int r2 = l1.get(0);
				Automaton.State s2 = automaton.get(r2);
				Automaton.Collection c2 = (Automaton.Collection) s2;
				int r4 = l1.get(1);
				Automaton.State s4 = automaton.get(r4);
				if(s4.kind == K_ForAll) {
					Automaton.Term t4 = (Automaton.Term) s4;
					int r5 = t4.contents;
					Automaton.State s5 = automaton.get(r5);
					Automaton.List l5 = (Automaton.List) s5;
					int r6 = l5.get(0);
					Automaton.State s6 = automaton.get(r6);
					Automaton.Collection c6 = (Automaton.Collection) s6;
					int r8 = l5.get(1);
					int[] state = {r0, r1, r2, 0, r4, r5, r6, 0, r8};
					activations.add(new Activation(this,null,state));
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r2 = state[2]; // xs
			int r6 = state[6]; // ys
			int r8 = state[8]; // e
			Automaton.Set r9 = (Automaton.Set) automaton.get(r2);
			Automaton.Set r10 = (Automaton.Set) automaton.get(r6);
			Automaton.Set r11 = r9.append(r10); // xs append ys
			int r12 = automaton.add(r11);
			Automaton.List r13 = new Automaton.List(r12, r8); // [xs append yse]
			int r14 = automaton.add(r13);
			Automaton.Term r15 = new Automaton.Term(K_ForAll, r14);
			int r16 = automaton.add(r15);
			if(r0 != r16) {
				return automaton.rewrite(r0, r16);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "ForAll_3"; }
		public final int rank() { return 1; }

		public final int minimum() { return 6; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// ForAll_4
	private final static class Reduction_91 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_91(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_ForAll) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.List l1 = (Automaton.List) s1;
				int r2 = l1.get(0);
				Automaton.State s2 = automaton.get(r2);
				Automaton.Collection c2 = (Automaton.Collection) s2;
				if(c2.size() >= 1) {
					for(int r4=0;r4!=c2.size();++r4) {
						int r3 = c2.get(r4);
						Automaton.State s3 = automaton.get(r3);
						Automaton.List l3 = (Automaton.List) s3;
						int r5 = l3.get(0);
						int r6 = l3.get(1);
						int r8 = l1.get(1);
						int[] state = {r0, r1, r2, r3, r4, r5, r6, 0, r8};
						activations.add(new Activation(this,null,state));
					}
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r4 = state[4];
			int r5 = state[5]; // v
			Automaton.Collection s2 = (Automaton.Collection) automaton.get(state[2]);
			int[] s2children = new int[s2.size() - 1];
			for(int s2i=0, s2j=0; s2i != s2.size();++s2i) {
				if(s2i == r4) { continue; }
				s2children[s2j++] = s2.get(s2i);
			}
			Automaton.Set r7 = new Automaton.Set(s2children);
			int r8 = state[8]; // e
			Automaton.List r9 = new Automaton.List(r8, r5); // [ev]
			boolean r10 = Solver$native.contains(automaton, r9);
			boolean r11 = !r10;            // !contains([ev])
			if(r11) {
				int r12 = automaton.add(r7);
				Automaton.List r13 = new Automaton.List(r12, r8); // [xse]
				int r14 = automaton.add(r13);
				Automaton.Term r15 = new Automaton.Term(K_ForAll, r14);
				int r16 = automaton.add(r15);
				if(r0 != r16) {
					return automaton.rewrite(r0, r16);
				}
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "ForAll_4"; }
		public final int rank() { return 1; }

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// ForAll_5
	private final static class Inference_6 extends AbstractRewriteRule implements InferenceRule {

		public Inference_6(Pattern.Term pattern) { super(pattern); }

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
						if(Runtime.accepts(type34,automaton,automaton.get(r2), SCHEMA)) {
							for(int r5=0;r5!=c1.size();++r5) {
								if(r5 == r3) { continue; }
								int r4 = c1.get(r5);
								Automaton.State s4 = automaton.get(r4);
								if(s4.kind == K_ForAll) {
									Automaton.Term t4 = (Automaton.Term) s4;
									int r6 = t4.contents;
									Automaton.State s6 = automaton.get(r6);
									Automaton.List l6 = (Automaton.List) s6;
									int r7 = l6.get(0);
									Automaton.State s7 = automaton.get(r7);
									Automaton.Collection c7 = (Automaton.Collection) s7;
									if(c7.size() >= 1) {
										for(int r9=0;r9!=c7.size();++r9) {
											int r8 = c7.get(r9);
											Automaton.State s8 = automaton.get(r8);
											Automaton.List l8 = (Automaton.List) s8;
											int r10 = l8.get(0);
											int r11 = l8.get(1);
											int r13 = l6.get(1);
											int[] state = {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, 0, r13, 0};
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
			int r2 = state[2]; // e1
			int r3 = state[3];
			int r4 = state[4]; // qf
			int r5 = state[5];
			int r7 = state[7]; // vs
			int r9 = state[9];
			int r13 = state[13]; // e2
			Automaton.Collection s1 = (Automaton.Collection) automaton.get(state[1]);
			int[] s1children = new int[s1.size() - 2];
			for(int s1i=0, s1j=0; s1i != s1.size();++s1i) {
				if(s1i == r3 || s1i == r5) { continue; }
				s1children[s1j++] = s1.get(s1i);
			}
			Automaton.Set r14 = new Automaton.Set(s1children);
			Automaton.List r15 = new Automaton.List(r2, r7, r13); // [e1vse2]
			Automaton.Set r16 = Solver$native.instantiate(automaton, r15);
			Automaton.Int r17 = r16.lengthOf(); // |instantiations|
			Automaton.Int r18 = new Automaton.Int(0); // 0
			boolean r19 = r17.compareTo(r18)>0; // |instantiations| gt 0
			if(r19) {
				Automaton.Set r20 = new Automaton.Set(r2, r4); // {e1qf}
				Automaton.Set r21 = r14.append(r16); // es append instantiations
				Automaton.Set r22 = r20.append(r21); // {e1qf} append es append instantiations
				int r23 = automaton.add(r22);
				Automaton.Term r24 = new Automaton.Term(K_And, r23);
				int r25 = automaton.add(r24);
				if(r0 != r25) {
					return automaton.rewrite(r0, r25);
				}
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "ForAll_5"; }
		public final int rank() { return 3; }

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// ForAll_6
	private final static class Inference_7 extends AbstractRewriteRule implements InferenceRule {

		public Inference_7(Pattern.Term pattern) { super(pattern); }

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
							if(Runtime.accepts(type34,automaton,automaton.get(r4), SCHEMA)) {
								for(int r6=0;r6!=c1.size();++r6) {
									if(r6 == r3) { continue; }
									int r5 = c1.get(r6);
									Automaton.State s5 = automaton.get(r5);
									if(s5.kind == K_ForAll) {
										Automaton.Term t5 = (Automaton.Term) s5;
										int r7 = t5.contents;
										Automaton.State s7 = automaton.get(r7);
										Automaton.List l7 = (Automaton.List) s7;
										int r8 = l7.get(0);
										Automaton.State s8 = automaton.get(r8);
										Automaton.Collection c8 = (Automaton.Collection) s8;
										if(c8.size() >= 1) {
											for(int r10=0;r10!=c8.size();++r10) {
												int r9 = c8.get(r10);
												Automaton.State s9 = automaton.get(r9);
												Automaton.List l9 = (Automaton.List) s9;
												int r11 = l9.get(0);
												int r12 = l9.get(1);
												int r14 = l7.get(1);
												int[] state = {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, 0, r14, 0};
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

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r2 = state[2]; // ne1
			int r3 = state[3];
			int r4 = state[4]; // e1
			int r5 = state[5]; // qf
			int r6 = state[6];
			int r8 = state[8]; // vs
			int r10 = state[10];
			int r14 = state[14]; // e2
			Automaton.Collection s1 = (Automaton.Collection) automaton.get(state[1]);
			int[] s1children = new int[s1.size() - 2];
			for(int s1i=0, s1j=0; s1i != s1.size();++s1i) {
				if(s1i == r3 || s1i == r6) { continue; }
				s1children[s1j++] = s1.get(s1i);
			}
			Automaton.Set r15 = new Automaton.Set(s1children);
			Automaton.List r16 = new Automaton.List(r4, r8, r14); // [e1vse2]
			Automaton.Set r17 = Solver$native.instantiate(automaton, r16);
			Automaton.Int r18 = r17.lengthOf(); // |instantiations|
			Automaton.Int r19 = new Automaton.Int(0); // 0
			boolean r20 = r18.compareTo(r19)>0; // |instantiations| gt 0
			if(r20) {
				Automaton.Set r21 = new Automaton.Set(r2, r5); // {ne1qf}
				Automaton.Set r22 = r15.append(r17); // es append instantiations
				Automaton.Set r23 = r21.append(r22); // {ne1qf} append es append instantiations
				int r24 = automaton.add(r23);
				Automaton.Term r25 = new Automaton.Term(K_And, r24);
				int r26 = automaton.add(r25);
				if(r0 != r26) {
					return automaton.rewrite(r0, r26);
				}
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "ForAll_6"; }
		public final int rank() { return 3; }

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// term $19<Exists($17<^[^{^[^Var(^string),$4<^Type<Atom<NotT($35<^Proton<TupleT(^[$35...])|SetT(^[^bool,$35])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$35...])|SetT(^[^bool,$35])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($4)|OrT(^{$4...})|AndT(^{$4...})|SetT(^[^bool,$4])|TupleT(^[$4...])|FunctionT(^[$4,$4,$4...])>>]...},$13<^$139<BExpr<$148<VExpr<Var(^string)|$156<Fn(^[^string,$150<^Expr<$139|$156|$191<Value<Null|Tuple(^[^$191...])|Bool<True|False>|Num(^real)|String(^string)|Set(^{^$191...})>>|Tuple(^[$150...])|$218<AExpr<$148|Num(^real)|Sum(^[^real,^{|^$218...|}[^$218...]])|Mul(^[^real,^{|^$218...|}[^$218...]])|Div(^[^$218,^$218])>>|SExpr<$148|Set(^{$150...})>>>...])>|Load(^[$150,^int])|LengthOf($150)>>|Bool<True|False>|And(^{$13...})|Or(^{$13...})|Not($13)|Equals(^[$4,^{|$150,$150|}[$150,$150]])|Inequality(^[^AType<IntT|RealT>,^$218])|Equation(^[^AType<IntT|RealT>,^$218])|SubsetEq(^[^SetT(^[^bool,$4]),^SExpr<$148|Set(^{$150...})>,^SExpr<$148|Set(^{$150...})>])|$19|ForAll($17)>>>]>)>
	public final static int K_Exists = 37;
	public final static int Exists(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_Exists, r1));
	}
	public final static int Exists(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_Exists, r1));
	}

	// Exists_1
	private final static class Reduction_92 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_92(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Exists) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.List l1 = (Automaton.List) s1;
				int r2 = l1.get(0);
				Automaton.State s2 = automaton.get(r2);
				Automaton.Collection c2 = (Automaton.Collection) s2;
				int r4 = l1.get(1);
				int[] state = {r0, r1, r2, 0, r4};
				activations.add(new Activation(this,null,state));
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
			int r4 = state[4]; // be
			boolean r5 = Runtime.accepts(type33, automaton, r4, SCHEMA); // be is ^Bool<True|False>
			Automaton.Int r6 = r3.lengthOf(); // |qs|
			Automaton.Int r7 = new Automaton.Int(0); // 0
			boolean r8 = r6.equals(r7);    // |qs| eq 0
			boolean r9 = r5 || r8;         // be is ^Bool<True|False> || |qs| eq 0
			if(r9) {
				if(r0 != r4) {
					return automaton.rewrite(r0, r4);
				}
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Exists_1"; }
		public final int rank() { return 1; }

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Exists_2
	private final static class Reduction_93 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_93(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Not) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				if(s1.kind == K_Exists) {
					Automaton.Term t1 = (Automaton.Term) s1;
					int r2 = t1.contents;
					Automaton.State s2 = automaton.get(r2);
					Automaton.List l2 = (Automaton.List) s2;
					int r3 = l2.get(0);
					Automaton.State s3 = automaton.get(r3);
					Automaton.Collection c3 = (Automaton.Collection) s3;
					int r5 = l2.get(1);
					int[] state = {r0, r1, r2, r3, 0, r5};
					activations.add(new Activation(this,null,state));
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r3 = state[3]; // vars
			int r5 = state[5]; // be
			Automaton.Term r6 = new Automaton.Term(K_Not, r5);
			int r7 = automaton.add(r6);
			Automaton.List r8 = new Automaton.List(r3, r7); // [varsNot(be)]
			int r9 = automaton.add(r8);
			Automaton.Term r10 = new Automaton.Term(K_ForAll, r9);
			int r11 = automaton.add(r10);
			if(r0 != r11) {
				return automaton.rewrite(r0, r11);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Exists_2"; }
		public final int rank() { return 2; }

		public final int minimum() { return 4; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Exists_3
	private final static class Reduction_94 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_94(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Exists) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.List l1 = (Automaton.List) s1;
				int r2 = l1.get(0);
				Automaton.State s2 = automaton.get(r2);
				Automaton.Collection c2 = (Automaton.Collection) s2;
				int r4 = l1.get(1);
				Automaton.State s4 = automaton.get(r4);
				if(s4.kind == K_Exists) {
					Automaton.Term t4 = (Automaton.Term) s4;
					int r5 = t4.contents;
					Automaton.State s5 = automaton.get(r5);
					Automaton.List l5 = (Automaton.List) s5;
					int r6 = l5.get(0);
					Automaton.State s6 = automaton.get(r6);
					Automaton.Collection c6 = (Automaton.Collection) s6;
					int r8 = l5.get(1);
					int[] state = {r0, r1, r2, 0, r4, r5, r6, 0, r8};
					activations.add(new Activation(this,null,state));
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r2 = state[2]; // xs
			int r6 = state[6]; // ys
			int r8 = state[8]; // e
			Automaton.Set r9 = (Automaton.Set) automaton.get(r2);
			Automaton.Set r10 = (Automaton.Set) automaton.get(r6);
			Automaton.Set r11 = r9.append(r10); // xs append ys
			int r12 = automaton.add(r11);
			Automaton.List r13 = new Automaton.List(r12, r8); // [xs append yse]
			int r14 = automaton.add(r13);
			Automaton.Term r15 = new Automaton.Term(K_Exists, r14);
			int r16 = automaton.add(r15);
			if(r0 != r16) {
				return automaton.rewrite(r0, r16);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Exists_3"; }
		public final int rank() { return 1; }

		public final int minimum() { return 6; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Exists_4
	private final static class Reduction_95 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_95(Pattern.Term pattern) { super(pattern); }

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
						if(s2.kind == K_Exists) {
							Automaton.Term t2 = (Automaton.Term) s2;
							int r4 = t2.contents;
							Automaton.State s4 = automaton.get(r4);
							Automaton.List l4 = (Automaton.List) s4;
							int r5 = l4.get(0);
							Automaton.State s5 = automaton.get(r5);
							Automaton.Collection c5 = (Automaton.Collection) s5;
							int r7 = l4.get(1);
							int[] state = {r0, r1, r2, r3, r4, r5, 0, r7, 0};
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
			int r5 = state[5]; // vs
			int r7 = state[7]; // e
			Automaton.Collection s1 = (Automaton.Collection) automaton.get(state[1]);
			int[] s1children = new int[s1.size() - 1];
			for(int s1i=0, s1j=0; s1i != s1.size();++s1i) {
				if(s1i == r3) { continue; }
				s1children[s1j++] = s1.get(s1i);
			}
			Automaton.Set r8 = new Automaton.Set(s1children);
			Automaton.Set r9 = r8.appendFront(r7); // e append es
			int r10 = automaton.add(r9);
			Automaton.Term r11 = new Automaton.Term(K_And, r10);
			int r12 = automaton.add(r11);
			Automaton.List r13 = new Automaton.List(r5, r12); // [vsAnd(e append es)]
			int r14 = automaton.add(r13);
			Automaton.Term r15 = new Automaton.Term(K_Exists, r14);
			int r16 = automaton.add(r15);
			if(r0 != r16) {
				return automaton.rewrite(r0, r16);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Exists_4"; }
		public final int rank() { return 1; }

		public final int minimum() { return 5; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// term Inhabited($2<^Type<Atom<NotT($17<^Proton<TupleT(^[$17...])|SetT(^[^bool,$17])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$17...])|SetT(^[^bool,$17])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($2)|OrT(^{$2...})|AndT(^{$2...})|SetT(^[^bool,$2])|TupleT(^[$2...])|FunctionT(^[$2,$2,$2...])>>)
	public final static int K_Inhabited = 38;
	public final static int Inhabited(Automaton automaton, int r0) {
		return automaton.add(new Automaton.Term(K_Inhabited, r0));
	}

	// Inhabited_1
	private final static class Reduction_96 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_96(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Inhabited) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				if(Runtime.accepts(type35,automaton,automaton.get(r1), SCHEMA)) {
					int[] state = {r0, r1};
					activations.add(new Activation(this,null,state));
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r1 = state[1]; // t
			Automaton.Term r2 = VoidT;
			Object r3 = (Object) automaton.get(r1);
			boolean r4 = r3.equals(r2);    // t eq VoidT
			Automaton.Term r5 = AnyT;
			int r6 = automaton.add(r5);
			Automaton.Term r7 = new Automaton.Term(K_NotT, r6);
			Object r8 = (Object) automaton.get(r1);
			boolean r9 = r8.equals(r7);    // t eq NotT(AnyT)
			boolean r10 = r4 || r9;        // t eq VoidT || t eq NotT(AnyT)
			if(r10) {
				Automaton.Term r11 = False;
				int r12 = automaton.add(r11);
				if(r0 != r12) {
					return automaton.rewrite(r0, r12);
				}
			}
			Automaton.Term r13 = True;
			int r14 = automaton.add(r13);
			if(r0 != r14) {
				return automaton.rewrite(r0, r14);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Inhabited_1"; }
		public final int rank() { return 0; }

		public final int minimum() { return 1; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Inhabited_2
	private final static class Reduction_97 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_97(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Inhabited) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				if(s1.kind == K_AndT) {
					Automaton.Term t1 = (Automaton.Term) s1;
					int r2 = t1.contents;
					Automaton.State s2 = automaton.get(r2);
					Automaton.Collection c2 = (Automaton.Collection) s2;
					boolean m2_0 = true;
					for(int i3=0;i3!=c2.size();++i3) {
						int r3 = c2.get(i3);
						Automaton.State s3 = automaton.get(r3);
						if(s3.kind == K_NotT) {
							Automaton.Term t3 = (Automaton.Term) s3;
							int r4 = t3.contents;
							if(Runtime.accepts(type4,automaton,automaton.get(r4), SCHEMA)) {
								continue;
							}
						}
						m2_0 = false;
						break;
					}
					if(m2_0) {
						int[] state = {r0, r1, r2, 0};
						activations.add(new Activation(this,null,state));
					}
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
			boolean r4 = true;
			outer:
			for(int i5=0;i5<r3.size();i5++) {
				int r5 = (int) r3.get(i5);
				Automaton.Term r6 = AnyT;
				Automaton.Term r7 = (Automaton.Term) automaton.get(r5);
				boolean r8 = r7.equals(r6);    // t eq AnyT
				if(r8) {
					r4 = false;
					break outer;
				}
			}
			if(r4) {
				Automaton.Term r9 = True;
				int r10 = automaton.add(r9);
				if(r0 != r10) {
					return automaton.rewrite(r0, r10);
				}
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Inhabited_2"; }
		public final int rank() { return 0; }

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Inhabited_3
	private final static class Reduction_98 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_98(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Inhabited) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				if(s1.kind == K_SetT) {
					Automaton.Term t1 = (Automaton.Term) s1;
					int r2 = t1.contents;
					Automaton.State s2 = automaton.get(r2);
					Automaton.List l2 = (Automaton.List) s2;
					int r3 = l2.get(0);
					int r4 = l2.get(1);
					int[] state = {r0, r1, r2, r3, r4};
					activations.add(new Activation(this,null,state));
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r3 = state[3]; // b1
			int r4 = state[4]; // t
			boolean r5 = ((Automaton.Bool)automaton.get(r3)).value;
			boolean r6 = !r5;              // !b1
			if(r6) {
				Automaton.Term r7 = new Automaton.Term(K_Inhabited, r4);
				int r8 = automaton.add(r7);
				if(r0 != r8) {
					return automaton.rewrite(r0, r8);
				}
			}
			Automaton.Term r9 = True;
			int r10 = automaton.add(r9);
			if(r0 != r10) {
				return automaton.rewrite(r0, r10);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Inhabited_3"; }
		public final int rank() { return 0; }

		public final int minimum() { return 4; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// term Is(^[$2<^Expr<$48<Value<Null|Tuple(^[^$48...])|Bool<True|False>|Num(^real)|String(^string)|Set(^{^$48...})>>|Tuple(^[$2...])|Fn(^[^string,$2...])|$99<BExpr<Bool<True|False>|VExpr<Fn(^[^string,$2...])|Var(^string)|Load(^[$2,^int])|LengthOf($2)>|And(^{^$99...})|Or(^{^$99...})|Not(^$99)|Equals(^[$4<^Type<Atom<NotT($152<^Proton<TupleT(^[$152...])|SetT(^[^bool,$152])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$152...])|SetT(^[^bool,$152])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($4)|OrT(^{$4...})|AndT(^{$4...})|SetT(^[^bool,$4])|TupleT(^[$4...])|FunctionT(^[$4,$4,$4...])>>,^{|$2,$2|}[$2,$2]])|Inequality(^[^AType<IntT|RealT>,$235<^AExpr<Num(^real)|VExpr<Fn(^[^string,$2...])|Var(^string)|Load(^[$2,^int])|LengthOf($2)>|Sum(^[^real,^{|$235...|}[$235...]])|Mul(^[^real,^{|$235...|}[$235...]])|Div(^[$235,$235])>>])|Equation(^[^AType<IntT|RealT>,$235])|SubsetEq(^[^SetT(^[^bool,$4]),^SExpr<VExpr<Fn(^[^string,$2...])|Var(^string)|Load(^[$2,^int])|LengthOf($2)>|Set(^{$2...})>,^SExpr<VExpr<Fn(^[^string,$2...])|Var(^string)|Load(^[$2,^int])|LengthOf($2)>|Set(^{$2...})>])|ForAll(^[^{^[^Var(^string),$4]...},^$99])|Exists(^[^{^[^Var(^string),$4]...},^$99])>>|AExpr<Num(^real)|VExpr<Fn(^[^string,$2...])|Var(^string)|Load(^[$2,^int])|LengthOf($2)>|Sum(^[^real,^{|$235...|}[$235...]])|Mul(^[^real,^{|$235...|}[$235...]])|Div(^[$235,$235])>|SExpr<VExpr<Fn(^[^string,$2...])|Var(^string)|Load(^[$2,^int])|LengthOf($2)>|Set(^{$2...})>>>,$4])
	public final static int K_Is = 39;
	public final static int Is(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_Is, r1));
	}
	public final static int Is(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_Is, r1));
	}

	// Is_1
	private final static class Reduction_99 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_99(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Is) {
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
			int r2 = state[2]; // e
			Automaton.Term r4 = False;
			int r5 = automaton.add(r4);
			if(r0 != r5) {
				return automaton.rewrite(r0, r5);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Is_1"; }
		public final int rank() { return 0; }

		public final int minimum() { return 3; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Is_2
	private final static class Reduction_100 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_100(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Not) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				if(s1.kind == K_Is) {
					Automaton.Term t1 = (Automaton.Term) s1;
					int r2 = t1.contents;
					Automaton.State s2 = automaton.get(r2);
					Automaton.List l2 = (Automaton.List) s2;
					int r3 = l2.get(0);
					int r4 = l2.get(1);
					int[] state = {r0, r1, r2, r3, r4};
					activations.add(new Activation(this,null,state));
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r3 = state[3]; // e
			int r4 = state[4]; // t
			Automaton.Term r5 = new Automaton.Term(K_NotT, r4);
			int r6 = automaton.add(r5);
			Automaton.List r7 = new Automaton.List(r3, r6); // [eNotT(t)]
			int r8 = automaton.add(r7);
			Automaton.Term r9 = new Automaton.Term(K_Is, r8);
			int r10 = automaton.add(r9);
			if(r0 != r10) {
				return automaton.rewrite(r0, r10);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Is_2"; }
		public final int rank() { return 0; }

		public final int minimum() { return 4; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Is_3
	private final static class Reduction_101 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_101(Pattern.Term pattern) { super(pattern); }

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
						if(s2.kind == K_Is) {
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
								if(s7.kind == K_Is) {
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
			int r5 = state[5]; // e1
			int r6 = state[6]; // t1
			int r8 = state[8];
			int r10 = state[10]; // e2
			int r11 = state[11]; // t2
			Automaton.Collection s1 = (Automaton.Collection) automaton.get(state[1]);
			int[] s1children = new int[s1.size() - 2];
			for(int s1i=0, s1j=0; s1i != s1.size();++s1i) {
				if(s1i == r3 || s1i == r8) { continue; }
				s1children[s1j++] = s1.get(s1i);
			}
			Automaton.Set r12 = new Automaton.Set(s1children);
			boolean r13 = r5 == r10;       // e1 eq e2
			if(r13) {
				Automaton.Set r14 = new Automaton.Set(r6, r11); // {t1t2}
				int r15 = automaton.add(r14);
				Automaton.Term r16 = new Automaton.Term(K_AndT, r15);
				int r17 = automaton.add(r16);
				Automaton.List r18 = new Automaton.List(r5, r17); // [e1AndT({t1t2})]
				int r19 = automaton.add(r18);
				Automaton.Term r20 = new Automaton.Term(K_Is, r19);
				int r21 = automaton.add(r20);
				Automaton.Set r22 = new Automaton.Set(r21); // {Is([e1AndT({t1t2})])}
				Automaton.Set r23 = r22.append(r12); // {Is([e1AndT({t1t2})])} append bs
				int r24 = automaton.add(r23);
				Automaton.Term r25 = new Automaton.Term(K_And, r24);
				int r26 = automaton.add(r25);
				if(r0 != r26) {
					return automaton.rewrite(r0, r26);
				}
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Is_3"; }
		public final int rank() { return 0; }

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// =========================================================================
	// Schema
	// =========================================================================

	public static final Schema SCHEMA = new Schema(new Schema.Term[]{
		// $4<NotT($2<^Type<$4|Atom<NotT($16<^Proton<TupleT(^[$16...])|SetT(^[^bool,$16])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$16...])|SetT(^[^bool,$16])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|OrT(^{$2...})|AndT(^{$2...})|SetT(^[^bool,$2])|TupleT(^[$2...])|FunctionT(^[$2,$2,$2...])>>)>
		Schema.Term("NotT",Schema.Or(Schema.Any, Schema.Or(Schema.Term("NotT",Schema.Or(Schema.Term("TupleT",Schema.List(true)), Schema.Term("SetT",Schema.List(true,Schema.Bool,Schema.Any)), Schema.Or(Schema.Term("AnyT"), Schema.Term("NullT"), Schema.Term("VoidT"), Schema.Term("BoolT"), Schema.Term("IntT"), Schema.Term("RealT"), Schema.Term("StringT"), Schema.Term("VarT",Schema.String), Schema.Term("NominalT",Schema.Any)))), Schema.Any), Schema.Term("OrT",Schema.Set(true)), Schema.Term("AndT",Schema.Any), Schema.Term("SetT",Schema.List(true,Schema.Any,Schema.Any)), Schema.Term("TupleT",Schema.List(true)), Schema.Term("FunctionT",Schema.List(true,Schema.Any,Schema.Any)))),
		// $7<AndT($5<^{$2<^Type<$7|Atom<NotT($19<^Proton<TupleT(^[$19...])|SetT(^[^bool,$19])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$19...])|SetT(^[^bool,$19])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($2)|OrT($5)|SetT(^[^bool,$2])|TupleT(^[$2...])|FunctionT(^[$2,$2,$2...])>>...}>)>
		Schema.Term("AndT",Schema.Set(true)),
		// $7<OrT($5<^{$2<^Type<$7|Atom<NotT($19<^Proton<TupleT(^[$19...])|SetT(^[^bool,$19])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$19...])|SetT(^[^bool,$19])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($2)|AndT($5)|SetT(^[^bool,$2])|TupleT(^[$2...])|FunctionT(^[$2,$2,$2...])>>...}>)>
		Schema.Term("OrT",Schema.Set(true)),
		// $7<TupleT(^[$2<^Type<$7|Atom<NotT($19<^Proton<TupleT(^[$19...])|SetT(^[^bool,$19])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$19...])|SetT(^[^bool,$19])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($2)|OrT(^{$2...})|AndT(^{$2...})|SetT(^[^bool,$2])|FunctionT(^[$2,$2,$2...])>>...])>
		Schema.Term("TupleT",Schema.List(true)),
		// $9<SetT(^[^bool,$3<^Type<$9|Atom<NotT($21<^Proton<TupleT(^[$21...])|SetT(^[^bool,$21])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$21...])|SetT(^[^bool,$21])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($3)|OrT(^{$3...})|AndT(^{$3...})|TupleT(^[$3...])|FunctionT(^[$3,$3,$3...])>>])>
		Schema.Term("SetT",Schema.List(true,Schema.Bool,Schema.Or(Schema.Any, Schema.Or(Schema.Term("NotT",Schema.Or(Schema.Term("TupleT",Schema.List(true)), Schema.Term("SetT",Schema.List(true,Schema.Any,Schema.Any)), Schema.Or(Schema.Term("AnyT"), Schema.Term("NullT"), Schema.Term("VoidT"), Schema.Term("BoolT"), Schema.Term("IntT"), Schema.Term("RealT"), Schema.Term("StringT"), Schema.Term("VarT",Schema.String), Schema.Term("NominalT",Schema.Any)))), Schema.Any), Schema.Term("NotT",Schema.Any), Schema.Term("OrT",Schema.Set(true)), Schema.Term("AndT",Schema.Any), Schema.Term("TupleT",Schema.List(true)), Schema.Term("FunctionT",Schema.List(true,Schema.Any,Schema.Any))))),
		// AnyT
		Schema.Term("AnyT"),
		// VoidT
		Schema.Term("VoidT"),
		// NullT
		Schema.Term("NullT"),
		// BoolT
		Schema.Term("BoolT"),
		// IntT
		Schema.Term("IntT"),
		// RealT
		Schema.Term("RealT"),
		// StringT
		Schema.Term("StringT"),
		// VarT(^string)
		Schema.Term("VarT",Schema.String),
		// NominalT(^string)
		Schema.Term("NominalT",Schema.String),
		// $8<FunctionT(^[$2<^Type<$8|Atom<NotT($20<^Proton<TupleT(^[$20...])|SetT(^[^bool,$20])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$20...])|SetT(^[^bool,$20])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($2)|OrT(^{$2...})|AndT(^{$2...})|SetT(^[^bool,$2])|TupleT(^[$2...])>>,$2,$2...])>
		Schema.Term("FunctionT",Schema.List(true,Schema.Or(Schema.Any, Schema.Or(Schema.Term("NotT",Schema.Or(Schema.Term("TupleT",Schema.List(true)), Schema.Term("SetT",Schema.List(true,Schema.Bool,Schema.Any)), Schema.Or(Schema.Term("AnyT"), Schema.Term("NullT"), Schema.Term("VoidT"), Schema.Term("BoolT"), Schema.Term("IntT"), Schema.Term("RealT"), Schema.Term("StringT"), Schema.Term("VarT",Schema.String), Schema.Term("NominalT",Schema.Any)))), Schema.Any), Schema.Term("NotT",Schema.Any), Schema.Term("OrT",Schema.Set(true)), Schema.Term("AndT",Schema.Any), Schema.Term("SetT",Schema.List(true,Schema.Any,Schema.Any)), Schema.Term("TupleT",Schema.List(true))),Schema.Any)),
		// Null
		Schema.Term("Null"),
		// True
		Schema.Term("True"),
		// False
		Schema.Term("False"),
		// Num(^real)
		Schema.Term("Num",Schema.Real),
		// Var(^string)
		Schema.Term("Var",Schema.String),
		// $7<Tuple(^[$2<^Expr<$7|$44<Value<Null|Tuple(^[^$44...])|Bool<True|False>|Num(^real)|String(^string)|Set(^{^$44...})>>|Fn(^[^string,$2...])|$90<BExpr<Bool<True|False>|VExpr<Fn(^[^string,$2...])|Var(^string)|Load(^[$2,^int])|LengthOf($2)>|And(^{^$90...})|Or(^{^$90...})|Not(^$90)|Equals(^[$122<^Type<Atom<NotT($145<^Proton<TupleT(^[$145...])|SetT(^[^bool,$145])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$145...])|SetT(^[^bool,$145])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($122)|OrT(^{$122...})|AndT(^{$122...})|SetT(^[^bool,$122])|TupleT(^[$122...])|FunctionT(^[$122,$122,$122...])>>,^{|$2,$2|}[$2,$2]])|Inequality(^[^AType<IntT|RealT>,$228<^AExpr<Num(^real)|VExpr<Fn(^[^string,$2...])|Var(^string)|Load(^[$2,^int])|LengthOf($2)>|Sum(^[^real,^{|$228...|}[$228...]])|Mul(^[^real,^{|$228...|}[$228...]])|Div(^[$228,$228])>>])|Equation(^[^AType<IntT|RealT>,$228])|SubsetEq(^[^SetT(^[^bool,$122]),^SExpr<VExpr<Fn(^[^string,$2...])|Var(^string)|Load(^[$2,^int])|LengthOf($2)>|Set(^{$2...})>,^SExpr<VExpr<Fn(^[^string,$2...])|Var(^string)|Load(^[$2,^int])|LengthOf($2)>|Set(^{$2...})>])|ForAll(^[^{^[^Var(^string),$122]...},^$90])|Exists(^[^{^[^Var(^string),$122]...},^$90])>>|AExpr<Num(^real)|VExpr<Fn(^[^string,$2...])|Var(^string)|Load(^[$2,^int])|LengthOf($2)>|Sum(^[^real,^{|$228...|}[$228...]])|Mul(^[^real,^{|$228...|}[$228...]])|Div(^[$228,$228])>|SExpr<VExpr<Fn(^[^string,$2...])|Var(^string)|Load(^[$2,^int])|LengthOf($2)>|Set(^{$2...})>>>...])>
		Schema.Term("Tuple",Schema.List(true)),
		// $9<Load(^[$2<^Expr<$47<Value<Null|Tuple(^[^$47...])|Bool<True|False>|Num(^real)|String(^string)|Set(^{^$47...})>>|Tuple(^[$2...])|Fn(^[^string,$2...])|$98<BExpr<Bool<True|False>|VExpr<$9|Fn(^[^string,$2...])|Var(^string)|LengthOf($2)>|And(^{^$98...})|Or(^{^$98...})|Not(^$98)|Equals(^[$122<^Type<Atom<NotT($145<^Proton<TupleT(^[$145...])|SetT(^[^bool,$145])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$145...])|SetT(^[^bool,$145])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($122)|OrT(^{$122...})|AndT(^{$122...})|SetT(^[^bool,$122])|TupleT(^[$122...])|FunctionT(^[$122,$122,$122...])>>,^{|$2,$2|}[$2,$2]])|Inequality(^[^AType<IntT|RealT>,$228<^AExpr<Num(^real)|VExpr<$9|Fn(^[^string,$2...])|Var(^string)|LengthOf($2)>|Sum(^[^real,^{|$228...|}[$228...]])|Mul(^[^real,^{|$228...|}[$228...]])|Div(^[$228,$228])>>])|Equation(^[^AType<IntT|RealT>,$228])|SubsetEq(^[^SetT(^[^bool,$122]),^SExpr<VExpr<$9|Fn(^[^string,$2...])|Var(^string)|LengthOf($2)>|Set(^{$2...})>,^SExpr<VExpr<$9|Fn(^[^string,$2...])|Var(^string)|LengthOf($2)>|Set(^{$2...})>])|ForAll(^[^{^[^Var(^string),$122]...},^$98])|Exists(^[^{^[^Var(^string),$122]...},^$98])>>|AExpr<Num(^real)|VExpr<$9|Fn(^[^string,$2...])|Var(^string)|LengthOf($2)>|Sum(^[^real,^{|$228...|}[$228...]])|Mul(^[^real,^{|$228...|}[$228...]])|Div(^[$228,$228])>|SExpr<VExpr<$9|Fn(^[^string,$2...])|Var(^string)|LengthOf($2)>|Set(^{$2...})>>>,^int])>
		Schema.Term("Load",Schema.List(true,Schema.Or(Schema.Or(Schema.Or(Schema.Or(Schema.Or(Schema.Term("Null"), Schema.Term("Tuple",Schema.List(true)), Schema.Or(Schema.Term("True"), Schema.Term("False")), Schema.Term("Num",Schema.Real), Schema.Term("String",Schema.String)), Schema.Term("Set",Schema.Set(true))), Schema.Term("Tuple",Schema.List(true)), Schema.Term("Fn",Schema.List(true,Schema.Any)), Schema.Or(Schema.Or(Schema.Or(Schema.Or(Schema.Any, Schema.Or(Schema.Or(Schema.Any, Schema.Any, Schema.Term("Var",Schema.Any)), Schema.Term("LengthOf",Schema.Any)), Schema.Term("And",Schema.Set(true)), Schema.Term("Or",Schema.Any), Schema.Term("Not",Schema.Any), Schema.Term("Equals",Schema.List(true,Schema.Or(Schema.Or(Schema.Term("NotT",Schema.Or(Schema.Term("TupleT",Schema.List(true)), Schema.Term("SetT",Schema.List(true,Schema.Bool,Schema.Any)), Schema.Or(Schema.Term("AnyT"), Schema.Term("NullT"), Schema.Term("VoidT"), Schema.Term("BoolT"), Schema.Term("IntT"), Schema.Term("RealT"), Schema.Term("StringT"), Schema.Term("VarT",Schema.Any), Schema.Term("NominalT",Schema.Any)))), Schema.Any), Schema.Term("NotT",Schema.Any), Schema.Term("OrT",Schema.Set(true)), Schema.Term("AndT",Schema.Any), Schema.Term("SetT",Schema.List(true,Schema.Any,Schema.Any)), Schema.Term("TupleT",Schema.List(true)), Schema.Term("FunctionT",Schema.List(true,Schema.Any,Schema.Any))),Schema.Bag(true,Schema.Any,Schema.Any)))), Schema.Or(Schema.Term("Inequality",Schema.List(true,Schema.Or(Schema.Any, Schema.Any),Schema.Or(Schema.Any, Schema.Any, Schema.Term("Sum",Schema.List(true,Schema.Any,Schema.Bag(true))), Schema.Term("Mul",Schema.Any), Schema.Term("Div",Schema.List(true,Schema.Any,Schema.Any))))), Schema.Term("Equation",Schema.Any))), Schema.Term("SubsetEq",Schema.List(true,Schema.Any,Schema.Or(Schema.Any, Schema.Term("Set",Schema.Set(true))),Schema.Any))), Schema.Or(Schema.Term("ForAll",Schema.List(true,Schema.Set(true),Schema.Any)), Schema.Term("Exists",Schema.Any)))), Schema.Any), Schema.Any),Schema.Int)),
		// $4<LengthOf($2<^Expr<$42<Value<Null|Tuple(^[^$42...])|Bool<True|False>|Num(^real)|String(^string)|Set(^{^$42...})>>|Tuple(^[$2...])|Fn(^[^string,$2...])|$93<BExpr<Bool<True|False>|VExpr<$4|Fn(^[^string,$2...])|Var(^string)|Load(^[$2,^int])>|And(^{^$93...})|Or(^{^$93...})|Not(^$93)|Equals(^[$122<^Type<Atom<NotT($145<^Proton<TupleT(^[$145...])|SetT(^[^bool,$145])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$145...])|SetT(^[^bool,$145])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($122)|OrT(^{$122...})|AndT(^{$122...})|SetT(^[^bool,$122])|TupleT(^[$122...])|FunctionT(^[$122,$122,$122...])>>,^{|$2,$2|}[$2,$2]])|Inequality(^[^AType<IntT|RealT>,$228<^AExpr<Num(^real)|VExpr<$4|Fn(^[^string,$2...])|Var(^string)|Load(^[$2,^int])>|Sum(^[^real,^{|$228...|}[$228...]])|Mul(^[^real,^{|$228...|}[$228...]])|Div(^[$228,$228])>>])|Equation(^[^AType<IntT|RealT>,$228])|SubsetEq(^[^SetT(^[^bool,$122]),^SExpr<VExpr<$4|Fn(^[^string,$2...])|Var(^string)|Load(^[$2,^int])>|Set(^{$2...})>,^SExpr<VExpr<$4|Fn(^[^string,$2...])|Var(^string)|Load(^[$2,^int])>|Set(^{$2...})>])|ForAll(^[^{^[^Var(^string),$122]...},^$93])|Exists(^[^{^[^Var(^string),$122]...},^$93])>>|AExpr<Num(^real)|VExpr<$4|Fn(^[^string,$2...])|Var(^string)|Load(^[$2,^int])>|Sum(^[^real,^{|$228...|}[$228...]])|Mul(^[^real,^{|$228...|}[$228...]])|Div(^[$228,$228])>|SExpr<VExpr<$4|Fn(^[^string,$2...])|Var(^string)|Load(^[$2,^int])>|Set(^{$2...})>>>)>
		Schema.Term("LengthOf",Schema.Or(Schema.Or(Schema.Or(Schema.Or(Schema.Or(Schema.Term("Null"), Schema.Term("Tuple",Schema.List(true)), Schema.Or(Schema.Term("True"), Schema.Term("False")), Schema.Term("Num",Schema.Real), Schema.Term("String",Schema.String)), Schema.Term("Set",Schema.Set(true))), Schema.Term("Tuple",Schema.List(true)), Schema.Term("Fn",Schema.List(true,Schema.Any)), Schema.Or(Schema.Or(Schema.Or(Schema.Or(Schema.Any, Schema.Or(Schema.Any, Schema.Or(Schema.Any, Schema.Term("Var",Schema.Any), Schema.Term("Load",Schema.List(true,Schema.Any,Schema.Int)))), Schema.Term("And",Schema.Set(true)), Schema.Term("Or",Schema.Any), Schema.Term("Not",Schema.Any), Schema.Term("Equals",Schema.List(true,Schema.Or(Schema.Or(Schema.Term("NotT",Schema.Or(Schema.Term("TupleT",Schema.List(true)), Schema.Term("SetT",Schema.List(true,Schema.Bool,Schema.Any)), Schema.Or(Schema.Term("AnyT"), Schema.Term("NullT"), Schema.Term("VoidT"), Schema.Term("BoolT"), Schema.Term("IntT"), Schema.Term("RealT"), Schema.Term("StringT"), Schema.Term("VarT",Schema.Any), Schema.Term("NominalT",Schema.Any)))), Schema.Any), Schema.Term("NotT",Schema.Any), Schema.Term("OrT",Schema.Set(true)), Schema.Term("AndT",Schema.Any), Schema.Term("SetT",Schema.List(true,Schema.Any,Schema.Any)), Schema.Term("TupleT",Schema.List(true)), Schema.Term("FunctionT",Schema.List(true,Schema.Any,Schema.Any))),Schema.Bag(true,Schema.Any,Schema.Any)))), Schema.Or(Schema.Term("Inequality",Schema.List(true,Schema.Or(Schema.Any, Schema.Any),Schema.Or(Schema.Any, Schema.Any, Schema.Term("Sum",Schema.List(true,Schema.Any,Schema.Bag(true))), Schema.Term("Mul",Schema.Any), Schema.Term("Div",Schema.List(true,Schema.Any,Schema.Any))))), Schema.Term("Equation",Schema.Any))), Schema.Term("SubsetEq",Schema.List(true,Schema.Any,Schema.Or(Schema.Any, Schema.Term("Set",Schema.Set(true))),Schema.Any))), Schema.Or(Schema.Term("ForAll",Schema.List(true,Schema.Set(true),Schema.Any)), Schema.Term("Exists",Schema.Any)))), Schema.Any), Schema.Any)),
		// $9<Fn(^[^string,$3<^Expr<$9|$46<Value<Null|Tuple(^[^$46...])|Bool<True|False>|Num(^real)|String(^string)|Set(^{^$46...})>>|Tuple(^[$3...])|$90<BExpr<Bool<True|False>|VExpr<$9|Var(^string)|Load(^[$3,^int])|LengthOf($3)>|And(^{^$90...})|Or(^{^$90...})|Not(^$90)|Equals(^[$122<^Type<Atom<NotT($145<^Proton<TupleT(^[$145...])|SetT(^[^bool,$145])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$145...])|SetT(^[^bool,$145])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($122)|OrT(^{$122...})|AndT(^{$122...})|SetT(^[^bool,$122])|TupleT(^[$122...])|FunctionT(^[$122,$122,$122...])>>,^{|$3,$3|}[$3,$3]])|Inequality(^[^AType<IntT|RealT>,$228<^AExpr<Num(^real)|VExpr<$9|Var(^string)|Load(^[$3,^int])|LengthOf($3)>|Sum(^[^real,^{|$228...|}[$228...]])|Mul(^[^real,^{|$228...|}[$228...]])|Div(^[$228,$228])>>])|Equation(^[^AType<IntT|RealT>,$228])|SubsetEq(^[^SetT(^[^bool,$122]),^SExpr<VExpr<$9|Var(^string)|Load(^[$3,^int])|LengthOf($3)>|Set(^{$3...})>,^SExpr<VExpr<$9|Var(^string)|Load(^[$3,^int])|LengthOf($3)>|Set(^{$3...})>])|ForAll(^[^{^[^Var(^string),$122]...},^$90])|Exists(^[^{^[^Var(^string),$122]...},^$90])>>|AExpr<Num(^real)|VExpr<$9|Var(^string)|Load(^[$3,^int])|LengthOf($3)>|Sum(^[^real,^{|$228...|}[$228...]])|Mul(^[^real,^{|$228...|}[$228...]])|Div(^[$228,$228])>|SExpr<VExpr<$9|Var(^string)|Load(^[$3,^int])|LengthOf($3)>|Set(^{$3...})>>>...])>
		Schema.Term("Fn",Schema.List(true,Schema.String)),
		// String(^string)
		Schema.Term("String",Schema.String),
		// $4<Not($2<^$28<BExpr<$4|$38<VExpr<Var(^string)|$49<Fn(^[^string,$43<^Expr<$28|$49|$84<Value<Null|Tuple(^[^$84...])|Bool<True|False>|Num(^real)|String(^string)|Set(^{^$84...})>>|Tuple(^[$43...])|$111<AExpr<$38|Num(^real)|Sum(^[^real,^{|^$111...|}[^$111...]])|Mul(^[^real,^{|^$111...|}[^$111...]])|Div(^[^$111,^$111])>>|SExpr<$38|Set(^{$43...})>>>...])>|Load(^[$43,^int])|LengthOf($43)>>|Bool<True|False>|And(^{$2...})|Or(^{$2...})|Equals(^[$156<^Type<Atom<NotT($179<^Proton<TupleT(^[$179...])|SetT(^[^bool,$179])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$179...])|SetT(^[^bool,$179])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($156)|OrT(^{$156...})|AndT(^{$156...})|SetT(^[^bool,$156])|TupleT(^[$156...])|FunctionT(^[$156,$156,$156...])>>,^{|$43,$43|}[$43,$43]])|Inequality(^[^AType<IntT|RealT>,^$111])|Equation(^[^AType<IntT|RealT>,^$111])|SubsetEq(^[^SetT(^[^bool,$156]),^SExpr<$38|Set(^{$43...})>,^SExpr<$38|Set(^{$43...})>])|ForAll(^[^{^[^Var(^string),$156]...},$2])|Exists(^[^{^[^Var(^string),$156]...},$2])>>>)>
		Schema.Term("Not",Schema.Or(Schema.Or(Schema.Or(Schema.Or(Schema.Any, Schema.Or(Schema.Or(Schema.Term("Var",Schema.String), Schema.Term("Fn",Schema.List(true,Schema.Any)), Schema.Term("Load",Schema.List(true,Schema.Or(Schema.Or(Schema.Or(Schema.Any, Schema.Any, Schema.Or(Schema.Or(Schema.Term("Null"), Schema.Term("Tuple",Schema.List(true)), Schema.Or(Schema.Term("True"), Schema.Term("False")), Schema.Term("Num",Schema.Real), Schema.Term("String",Schema.Any)), Schema.Term("Set",Schema.Set(true))), Schema.Term("Tuple",Schema.List(true))), Schema.Or(Schema.Any, Schema.Any, Schema.Term("Sum",Schema.List(true,Schema.Any,Schema.Bag(true))), Schema.Term("Mul",Schema.Any), Schema.Term("Div",Schema.List(true,Schema.Any,Schema.Any)))), Schema.Or(Schema.Any, Schema.Term("Set",Schema.Set(true)))),Schema.Int))), Schema.Term("LengthOf",Schema.Any)), Schema.Any, Schema.Term("And",Schema.Set(true)), Schema.Term("Or",Schema.Any), Schema.Term("Equals",Schema.List(true,Schema.Or(Schema.Or(Schema.Term("NotT",Schema.Or(Schema.Term("TupleT",Schema.List(true)), Schema.Term("SetT",Schema.List(true,Schema.Bool,Schema.Any)), Schema.Or(Schema.Term("AnyT"), Schema.Term("NullT"), Schema.Term("VoidT"), Schema.Term("BoolT"), Schema.Term("IntT"), Schema.Term("RealT"), Schema.Term("StringT"), Schema.Term("VarT",Schema.Any), Schema.Term("NominalT",Schema.Any)))), Schema.Any), Schema.Term("NotT",Schema.Any), Schema.Term("OrT",Schema.Set(true)), Schema.Term("AndT",Schema.Any), Schema.Term("SetT",Schema.List(true,Schema.Any,Schema.Any)), Schema.Term("TupleT",Schema.List(true)), Schema.Term("FunctionT",Schema.List(true,Schema.Any,Schema.Any))),Schema.Bag(true,Schema.Any,Schema.Any)))), Schema.Or(Schema.Term("Inequality",Schema.List(true,Schema.Or(Schema.Any, Schema.Any),Schema.Any)), Schema.Term("Equation",Schema.Any))), Schema.Term("SubsetEq",Schema.List(true,Schema.Any,Schema.Any,Schema.Any))), Schema.Or(Schema.Term("ForAll",Schema.List(true,Schema.Set(true),Schema.Any)), Schema.Term("Exists",Schema.Any)))),
		// $7<And($5<^{$2<^$31<BExpr<$7|$41<VExpr<Var(^string)|$52<Fn(^[^string,$46<^Expr<$31|$52|$87<Value<Null|Tuple(^[^$87...])|Bool<True|False>|Num(^real)|String(^string)|Set(^{^$87...})>>|Tuple(^[$46...])|$114<AExpr<$41|Num(^real)|Sum(^[^real,^{|^$114...|}[^$114...]])|Mul(^[^real,^{|^$114...|}[^$114...]])|Div(^[^$114,^$114])>>|SExpr<$41|Set(^{$46...})>>>...])>|Load(^[$46,^int])|LengthOf($46)>>|Bool<True|False>|Or($5)|Not($2)|Equals(^[$156<^Type<Atom<NotT($179<^Proton<TupleT(^[$179...])|SetT(^[^bool,$179])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$179...])|SetT(^[^bool,$179])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($156)|OrT(^{$156...})|AndT(^{$156...})|SetT(^[^bool,$156])|TupleT(^[$156...])|FunctionT(^[$156,$156,$156...])>>,^{|$46,$46|}[$46,$46]])|Inequality(^[^AType<IntT|RealT>,^$114])|Equation(^[^AType<IntT|RealT>,^$114])|SubsetEq(^[^SetT(^[^bool,$156]),^SExpr<$41|Set(^{$46...})>,^SExpr<$41|Set(^{$46...})>])|ForAll(^[^{^[^Var(^string),$156]...},$2])|Exists(^[^{^[^Var(^string),$156]...},$2])>>>...}>)>
		Schema.Term("And",Schema.Set(true)),
		// $7<Or($5<^{$2<^$31<BExpr<$7|$41<VExpr<Var(^string)|$52<Fn(^[^string,$46<^Expr<$31|$52|$87<Value<Null|Tuple(^[^$87...])|Bool<True|False>|Num(^real)|String(^string)|Set(^{^$87...})>>|Tuple(^[$46...])|$114<AExpr<$41|Num(^real)|Sum(^[^real,^{|^$114...|}[^$114...]])|Mul(^[^real,^{|^$114...|}[^$114...]])|Div(^[^$114,^$114])>>|SExpr<$41|Set(^{$46...})>>>...])>|Load(^[$46,^int])|LengthOf($46)>>|Bool<True|False>|And($5)|Not($2)|Equals(^[$156<^Type<Atom<NotT($179<^Proton<TupleT(^[$179...])|SetT(^[^bool,$179])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$179...])|SetT(^[^bool,$179])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($156)|OrT(^{$156...})|AndT(^{$156...})|SetT(^[^bool,$156])|TupleT(^[$156...])|FunctionT(^[$156,$156,$156...])>>,^{|$46,$46|}[$46,$46]])|Inequality(^[^AType<IntT|RealT>,^$114])|Equation(^[^AType<IntT|RealT>,^$114])|SubsetEq(^[^SetT(^[^bool,$156]),^SExpr<$41|Set(^{$46...})>,^SExpr<$41|Set(^{$46...})>])|ForAll(^[^{^[^Var(^string),$156]...},$2])|Exists(^[^{^[^Var(^string),$156]...},$2])>>>...}>)>
		Schema.Term("Or",Schema.Set(true)),
		// $14<Equals(^[$2<^Type<Atom<NotT($27<^Proton<TupleT(^[$27...])|SetT(^[^bool,$27])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$27...])|SetT(^[^bool,$27])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($2)|OrT(^{$2...})|AndT(^{$2...})|SetT(^[^bool,$2])|TupleT(^[$2...])|FunctionT(^[$2,$2,$2...])>>,^{|$4<^Expr<$146<Value<Null|Tuple(^[^$146...])|Bool<True|False>|Num(^real)|String(^string)|Set(^{^$146...})>>|Tuple(^[$4...])|Fn(^[^string,$4...])|$195<BExpr<$14|Bool<True|False>|VExpr<Fn(^[^string,$4...])|Var(^string)|Load(^[$4,^int])|LengthOf($4)>|And(^{^$195...})|Or(^{^$195...})|Not(^$195)|Inequality(^[^AType<IntT|RealT>,$228<^AExpr<Num(^real)|VExpr<Fn(^[^string,$4...])|Var(^string)|Load(^[$4,^int])|LengthOf($4)>|Sum(^[^real,^{|$228...|}[$228...]])|Mul(^[^real,^{|$228...|}[$228...]])|Div(^[$228,$228])>>])|Equation(^[^AType<IntT|RealT>,$228])|SubsetEq(^[^SetT(^[^bool,$2]),^SExpr<VExpr<Fn(^[^string,$4...])|Var(^string)|Load(^[$4,^int])|LengthOf($4)>|Set(^{$4...})>,^SExpr<VExpr<Fn(^[^string,$4...])|Var(^string)|Load(^[$4,^int])|LengthOf($4)>|Set(^{$4...})>])|ForAll(^[^{^[^Var(^string),$2]...},^$195])|Exists(^[^{^[^Var(^string),$2]...},^$195])>>|AExpr<Num(^real)|VExpr<Fn(^[^string,$4...])|Var(^string)|Load(^[$4,^int])|LengthOf($4)>|Sum(^[^real,^{|$228...|}[$228...]])|Mul(^[^real,^{|$228...|}[$228...]])|Div(^[$228,$228])>|SExpr<VExpr<Fn(^[^string,$4...])|Var(^string)|Load(^[$4,^int])|LengthOf($4)>|Set(^{$4...})>>>,$4|}[$4<^Expr<$146<Value<Null|Tuple(^[^$146...])|Bool<True|False>|Num(^real)|String(^string)|Set(^{^$146...})>>|Tuple(^[$4...])|Fn(^[^string,$4...])|$195<BExpr<$14|Bool<True|False>|VExpr<Fn(^[^string,$4...])|Var(^string)|Load(^[$4,^int])|LengthOf($4)>|And(^{^$195...})|Or(^{^$195...})|Not(^$195)|Inequality(^[^AType<IntT|RealT>,$228<^AExpr<Num(^real)|VExpr<Fn(^[^string,$4...])|Var(^string)|Load(^[$4,^int])|LengthOf($4)>|Sum(^[^real,^{|$228...|}[$228...]])|Mul(^[^real,^{|$228...|}[$228...]])|Div(^[$228,$228])>>])|Equation(^[^AType<IntT|RealT>,$228])|SubsetEq(^[^SetT(^[^bool,$2]),^SExpr<VExpr<Fn(^[^string,$4...])|Var(^string)|Load(^[$4,^int])|LengthOf($4)>|Set(^{$4...})>,^SExpr<VExpr<Fn(^[^string,$4...])|Var(^string)|Load(^[$4,^int])|LengthOf($4)>|Set(^{$4...})>])|ForAll(^[^{^[^Var(^string),$2]...},^$195])|Exists(^[^{^[^Var(^string),$2]...},^$195])>>|AExpr<Num(^real)|VExpr<Fn(^[^string,$4...])|Var(^string)|Load(^[$4,^int])|LengthOf($4)>|Sum(^[^real,^{|$228...|}[$228...]])|Mul(^[^real,^{|$228...|}[$228...]])|Div(^[$228,$228])>|SExpr<VExpr<Fn(^[^string,$4...])|Var(^string)|Load(^[$4,^int])|LengthOf($4)>|Set(^{$4...})>>>,$4]])>
		Schema.Term("Equals",Schema.List(true,Schema.Or(Schema.Or(Schema.Term("NotT",Schema.Or(Schema.Term("TupleT",Schema.List(true)), Schema.Term("SetT",Schema.List(true,Schema.Bool,Schema.Any)), Schema.Or(Schema.Term("AnyT"), Schema.Term("NullT"), Schema.Term("VoidT"), Schema.Term("BoolT"), Schema.Term("IntT"), Schema.Term("RealT"), Schema.Term("StringT"), Schema.Term("VarT",Schema.String), Schema.Term("NominalT",Schema.Any)))), Schema.Any), Schema.Term("NotT",Schema.Any), Schema.Term("OrT",Schema.Set(true)), Schema.Term("AndT",Schema.Any), Schema.Term("SetT",Schema.List(true,Schema.Any,Schema.Any)), Schema.Term("TupleT",Schema.List(true)), Schema.Term("FunctionT",Schema.List(true,Schema.Any,Schema.Any))),Schema.Bag(true,Schema.Or(Schema.Or(Schema.Or(Schema.Or(Schema.Or(Schema.Term("Null"), Schema.Term("Tuple",Schema.List(true)), Schema.Or(Schema.Term("True"), Schema.Term("False")), Schema.Term("Num",Schema.Real), Schema.Term("String",Schema.Any)), Schema.Term("Set",Schema.Set(true))), Schema.Term("Tuple",Schema.List(true)), Schema.Term("Fn",Schema.List(true,Schema.Any)), Schema.Or(Schema.Or(Schema.Or(Schema.Or(Schema.Any, Schema.Any, Schema.Or(Schema.Or(Schema.Any, Schema.Term("Var",Schema.Any), Schema.Term("Load",Schema.List(true,Schema.Any,Schema.Int))), Schema.Term("LengthOf",Schema.Any)), Schema.Term("And",Schema.Set(true)), Schema.Term("Or",Schema.Any), Schema.Term("Not",Schema.Any)), Schema.Or(Schema.Term("Inequality",Schema.List(true,Schema.Or(Schema.Any, Schema.Any),Schema.Or(Schema.Any, Schema.Any, Schema.Term("Sum",Schema.List(true,Schema.Any,Schema.Bag(true))), Schema.Term("Mul",Schema.Any), Schema.Term("Div",Schema.List(true,Schema.Any,Schema.Any))))), Schema.Term("Equation",Schema.Any))), Schema.Term("SubsetEq",Schema.List(true,Schema.Any,Schema.Or(Schema.Any, Schema.Term("Set",Schema.Set(true))),Schema.Any))), Schema.Or(Schema.Term("ForAll",Schema.List(true,Schema.Set(true),Schema.Any)), Schema.Term("Exists",Schema.Any)))), Schema.Any), Schema.Any),Schema.Any))),
		// $12<Mul($10<^[^real,^{|$3<^$20<AExpr<$12|Num(^real)|Sum($10)|Div(^[$3,$3])|$40<VExpr<Var(^string)|$51<Fn(^[^string,$45<^Expr<$20|$51|$86<Value<Num(^real)|Null|Tuple(^[^$86...])|Bool<True|False>|String(^string)|Set(^{^$86...})>>|Tuple(^[$45...])|$126<BExpr<$40|Bool<True|False>|And(^{^$126...})|Or(^{^$126...})|Not(^$126)|Equals(^[$138<^Type<Atom<NotT($161<^Proton<TupleT(^[$161...])|SetT(^[^bool,$161])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$161...])|SetT(^[^bool,$161])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($138)|OrT(^{$138...})|AndT(^{$138...})|SetT(^[^bool,$138])|TupleT(^[$138...])|FunctionT(^[$138,$138,$138...])>>,^{|$45,$45|}[$45,$45]])|Inequality(^[^AType<IntT|RealT>,$3])|Equation(^[^AType<IntT|RealT>,$3])|SubsetEq(^[^SetT(^[^bool,$138]),^SExpr<$40|Set(^{$45...})>,^SExpr<$40|Set(^{$45...})>])|ForAll(^[^{^[^Var(^string),$138]...},^$126])|Exists(^[^{^[^Var(^string),$138]...},^$126])>>|SExpr<$40|Set(^{$45...})>>>...])>|Load(^[$45,^int])|LengthOf($45)>>>>>...|}[$3<^$20<AExpr<$12|Num(^real)|Sum($10)|Div(^[$3,$3])|$40<VExpr<Var(^string)|$51<Fn(^[^string,$45<^Expr<$20|$51|$86<Value<Num(^real)|Null|Tuple(^[^$86...])|Bool<True|False>|String(^string)|Set(^{^$86...})>>|Tuple(^[$45...])|$126<BExpr<$40|Bool<True|False>|And(^{^$126...})|Or(^{^$126...})|Not(^$126)|Equals(^[$138<^Type<Atom<NotT($161<^Proton<TupleT(^[$161...])|SetT(^[^bool,$161])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$161...])|SetT(^[^bool,$161])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($138)|OrT(^{$138...})|AndT(^{$138...})|SetT(^[^bool,$138])|TupleT(^[$138...])|FunctionT(^[$138,$138,$138...])>>,^{|$45,$45|}[$45,$45]])|Inequality(^[^AType<IntT|RealT>,$3])|Equation(^[^AType<IntT|RealT>,$3])|SubsetEq(^[^SetT(^[^bool,$138]),^SExpr<$40|Set(^{$45...})>,^SExpr<$40|Set(^{$45...})>])|ForAll(^[^{^[^Var(^string),$138]...},^$126])|Exists(^[^{^[^Var(^string),$138]...},^$126])>>|SExpr<$40|Set(^{$45...})>>>...])>|Load(^[$45,^int])|LengthOf($45)>>>>>...]]>)>
		Schema.Term("Mul",Schema.List(true,Schema.Real,Schema.Bag(true))),
		// $8<Div(^[$2<^$16<AExpr<$8|Num(^real)|Sum(^[^real,^{|$2...|}[$2...]])|Mul(^[^real,^{|$2...|}[$2...]])|$40<VExpr<Var(^string)|$51<Fn(^[^string,$45<^Expr<$16|$51|$86<Value<Num(^real)|Null|Tuple(^[^$86...])|Bool<True|False>|String(^string)|Set(^{^$86...})>>|Tuple(^[$45...])|$126<BExpr<$40|Bool<True|False>|And(^{^$126...})|Or(^{^$126...})|Not(^$126)|Equals(^[$138<^Type<Atom<NotT($161<^Proton<TupleT(^[$161...])|SetT(^[^bool,$161])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$161...])|SetT(^[^bool,$161])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($138)|OrT(^{$138...})|AndT(^{$138...})|SetT(^[^bool,$138])|TupleT(^[$138...])|FunctionT(^[$138,$138,$138...])>>,^{|$45,$45|}[$45,$45]])|Inequality(^[^AType<IntT|RealT>,$2])|Equation(^[^AType<IntT|RealT>,$2])|SubsetEq(^[^SetT(^[^bool,$138]),^SExpr<$40|Set(^{$45...})>,^SExpr<$40|Set(^{$45...})>])|ForAll(^[^{^[^Var(^string),$138]...},^$126])|Exists(^[^{^[^Var(^string),$138]...},^$126])>>|SExpr<$40|Set(^{$45...})>>>...])>|Load(^[$45,^int])|LengthOf($45)>>>>>,$2])>
		Schema.Term("Div",Schema.List(true,Schema.Or(Schema.Any, Schema.Term("Num",Schema.Real), Schema.Term("Sum",Schema.List(true,Schema.Any,Schema.Bag(true))), Schema.Term("Mul",Schema.Any), Schema.Or(Schema.Or(Schema.Term("Var",Schema.String), Schema.Term("Fn",Schema.List(true,Schema.Any)), Schema.Term("Load",Schema.List(true,Schema.Or(Schema.Or(Schema.Any, Schema.Or(Schema.Any, Schema.Or(Schema.Or(Schema.Any, Schema.Term("Null"), Schema.Term("Tuple",Schema.List(true)), Schema.Or(Schema.Term("True"), Schema.Term("False")), Schema.Term("String",Schema.Any)), Schema.Term("Set",Schema.Set(true))), Schema.Term("Tuple",Schema.List(true)), Schema.Or(Schema.Or(Schema.Or(Schema.Or(Schema.Any, Schema.Any, Schema.Term("And",Schema.Set(true)), Schema.Term("Or",Schema.Any), Schema.Term("Not",Schema.Any), Schema.Term("Equals",Schema.List(true,Schema.Or(Schema.Or(Schema.Term("NotT",Schema.Or(Schema.Term("TupleT",Schema.List(true)), Schema.Term("SetT",Schema.List(true,Schema.Bool,Schema.Any)), Schema.Or(Schema.Term("AnyT"), Schema.Term("NullT"), Schema.Term("VoidT"), Schema.Term("BoolT"), Schema.Term("IntT"), Schema.Term("RealT"), Schema.Term("StringT"), Schema.Term("VarT",Schema.Any), Schema.Term("NominalT",Schema.Any)))), Schema.Any), Schema.Term("NotT",Schema.Any), Schema.Term("OrT",Schema.Set(true)), Schema.Term("AndT",Schema.Any), Schema.Term("SetT",Schema.List(true,Schema.Any,Schema.Any)), Schema.Term("TupleT",Schema.List(true)), Schema.Term("FunctionT",Schema.List(true,Schema.Any,Schema.Any))),Schema.Bag(true,Schema.Any,Schema.Any)))), Schema.Or(Schema.Term("Inequality",Schema.List(true,Schema.Or(Schema.Any, Schema.Any),Schema.Any)), Schema.Term("Equation",Schema.Any))), Schema.Term("SubsetEq",Schema.List(true,Schema.Any,Schema.Or(Schema.Any, Schema.Term("Set",Schema.Set(true))),Schema.Any))), Schema.Or(Schema.Term("ForAll",Schema.List(true,Schema.Set(true),Schema.Any)), Schema.Term("Exists",Schema.Any))))), Schema.Any),Schema.Int))), Schema.Term("LengthOf",Schema.Any))),Schema.Any)),
		// $12<Sum($10<^[^real,^{|$3<^$20<AExpr<$12|Num(^real)|Mul($10)|Div(^[$3,$3])|$40<VExpr<Var(^string)|$51<Fn(^[^string,$45<^Expr<$20|$51|$86<Value<Num(^real)|Null|Tuple(^[^$86...])|Bool<True|False>|String(^string)|Set(^{^$86...})>>|Tuple(^[$45...])|$126<BExpr<$40|Bool<True|False>|And(^{^$126...})|Or(^{^$126...})|Not(^$126)|Equals(^[$138<^Type<Atom<NotT($161<^Proton<TupleT(^[$161...])|SetT(^[^bool,$161])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$161...])|SetT(^[^bool,$161])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($138)|OrT(^{$138...})|AndT(^{$138...})|SetT(^[^bool,$138])|TupleT(^[$138...])|FunctionT(^[$138,$138,$138...])>>,^{|$45,$45|}[$45,$45]])|Inequality(^[^AType<IntT|RealT>,$3])|Equation(^[^AType<IntT|RealT>,$3])|SubsetEq(^[^SetT(^[^bool,$138]),^SExpr<$40|Set(^{$45...})>,^SExpr<$40|Set(^{$45...})>])|ForAll(^[^{^[^Var(^string),$138]...},^$126])|Exists(^[^{^[^Var(^string),$138]...},^$126])>>|SExpr<$40|Set(^{$45...})>>>...])>|Load(^[$45,^int])|LengthOf($45)>>>>>...|}[$3<^$20<AExpr<$12|Num(^real)|Mul($10)|Div(^[$3,$3])|$40<VExpr<Var(^string)|$51<Fn(^[^string,$45<^Expr<$20|$51|$86<Value<Num(^real)|Null|Tuple(^[^$86...])|Bool<True|False>|String(^string)|Set(^{^$86...})>>|Tuple(^[$45...])|$126<BExpr<$40|Bool<True|False>|And(^{^$126...})|Or(^{^$126...})|Not(^$126)|Equals(^[$138<^Type<Atom<NotT($161<^Proton<TupleT(^[$161...])|SetT(^[^bool,$161])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$161...])|SetT(^[^bool,$161])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($138)|OrT(^{$138...})|AndT(^{$138...})|SetT(^[^bool,$138])|TupleT(^[$138...])|FunctionT(^[$138,$138,$138...])>>,^{|$45,$45|}[$45,$45]])|Inequality(^[^AType<IntT|RealT>,$3])|Equation(^[^AType<IntT|RealT>,$3])|SubsetEq(^[^SetT(^[^bool,$138]),^SExpr<$40|Set(^{$45...})>,^SExpr<$40|Set(^{$45...})>])|ForAll(^[^{^[^Var(^string),$138]...},^$126])|Exists(^[^{^[^Var(^string),$138]...},^$126])>>|SExpr<$40|Set(^{$45...})>>>...])>|Load(^[$45,^int])|LengthOf($45)>>>>>...]]>)>
		Schema.Term("Sum",Schema.List(true,Schema.Real,Schema.Bag(true))),
		// $10<Equation($8<^[^AType<IntT|RealT>,$4<^$29<AExpr<Num(^real)|Sum(^[^real,^{|$4...|}[$4...]])|Mul(^[^real,^{|$4...|}[$4...]])|Div(^[$4,$4])|$59<VExpr<Var(^string)|$70<Fn(^[^string,$64<^Expr<$29|$70|$105<Value<Num(^real)|Null|Tuple(^[^$105...])|Bool<True|False>|String(^string)|Set(^{^$105...})>>|Tuple(^[$64...])|$144<BExpr<$59|Bool<True|False>|And(^{^$144...})|Or(^{^$144...})|Not(^$144)|Equals(^[$156<^Type<Atom<NotT($179<^Proton<TupleT(^[$179...])|SetT(^[^bool,$179])|Quark<IntT|RealT|AnyT|NullT|VoidT|BoolT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$179...])|SetT(^[^bool,$179])|Quark<IntT|RealT|AnyT|NullT|VoidT|BoolT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($156)|OrT(^{$156...})|AndT(^{$156...})|SetT(^[^bool,$156])|TupleT(^[$156...])|FunctionT(^[$156,$156,$156...])>>,^{|$64,$64|}[$64,$64]])|$10|Inequality($8)|SubsetEq(^[^SetT(^[^bool,$156]),^SExpr<$59|Set(^{$64...})>,^SExpr<$59|Set(^{$64...})>])|ForAll(^[^{^[^Var(^string),$156]...},^$144])|Exists(^[^{^[^Var(^string),$156]...},^$144])>>|SExpr<$59|Set(^{$64...})>>>...])>|Load(^[$64,^int])|LengthOf($64)>>>>>]>)>
		Schema.Term("Equation",Schema.List(true,Schema.Or(Schema.Term("IntT"), Schema.Term("RealT")),Schema.Or(Schema.Term("Num",Schema.Real), Schema.Term("Sum",Schema.List(true,Schema.Any,Schema.Bag(true))), Schema.Term("Mul",Schema.Any), Schema.Term("Div",Schema.List(true,Schema.Any,Schema.Any)), Schema.Or(Schema.Or(Schema.Term("Var",Schema.String), Schema.Term("Fn",Schema.List(true,Schema.Any)), Schema.Term("Load",Schema.List(true,Schema.Or(Schema.Or(Schema.Any, Schema.Or(Schema.Any, Schema.Or(Schema.Or(Schema.Any, Schema.Term("Null"), Schema.Term("Tuple",Schema.List(true)), Schema.Or(Schema.Term("True"), Schema.Term("False")), Schema.Term("String",Schema.Any)), Schema.Term("Set",Schema.Set(true))), Schema.Term("Tuple",Schema.List(true)), Schema.Or(Schema.Or(Schema.Or(Schema.Or(Schema.Any, Schema.Any, Schema.Term("And",Schema.Set(true)), Schema.Term("Or",Schema.Any), Schema.Term("Not",Schema.Any), Schema.Term("Equals",Schema.List(true,Schema.Or(Schema.Or(Schema.Term("NotT",Schema.Or(Schema.Term("TupleT",Schema.List(true)), Schema.Term("SetT",Schema.List(true,Schema.Bool,Schema.Any)), Schema.Or(Schema.Any, Schema.Any, Schema.Term("AnyT"), Schema.Term("NullT"), Schema.Term("VoidT"), Schema.Term("BoolT"), Schema.Term("StringT"), Schema.Term("VarT",Schema.Any), Schema.Term("NominalT",Schema.Any)))), Schema.Any), Schema.Term("NotT",Schema.Any), Schema.Term("OrT",Schema.Set(true)), Schema.Term("AndT",Schema.Any), Schema.Term("SetT",Schema.List(true,Schema.Any,Schema.Any)), Schema.Term("TupleT",Schema.List(true)), Schema.Term("FunctionT",Schema.List(true,Schema.Any,Schema.Any))),Schema.Bag(true,Schema.Any,Schema.Any)))), Schema.Or(Schema.Any, Schema.Term("Inequality",Schema.Any))), Schema.Term("SubsetEq",Schema.List(true,Schema.Any,Schema.Or(Schema.Any, Schema.Term("Set",Schema.Set(true))),Schema.Any))), Schema.Or(Schema.Term("ForAll",Schema.List(true,Schema.Set(true),Schema.Any)), Schema.Term("Exists",Schema.Any))))), Schema.Any),Schema.Int))), Schema.Term("LengthOf",Schema.Any))))),
		// $10<Inequality($8<^[^AType<IntT|RealT>,$4<^$29<AExpr<Num(^real)|Sum(^[^real,^{|$4...|}[$4...]])|Mul(^[^real,^{|$4...|}[$4...]])|Div(^[$4,$4])|$59<VExpr<Var(^string)|$70<Fn(^[^string,$64<^Expr<$29|$70|$105<Value<Num(^real)|Null|Tuple(^[^$105...])|Bool<True|False>|String(^string)|Set(^{^$105...})>>|Tuple(^[$64...])|$144<BExpr<$59|Bool<True|False>|And(^{^$144...})|Or(^{^$144...})|Not(^$144)|Equals(^[$156<^Type<Atom<NotT($179<^Proton<TupleT(^[$179...])|SetT(^[^bool,$179])|Quark<IntT|RealT|AnyT|NullT|VoidT|BoolT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$179...])|SetT(^[^bool,$179])|Quark<IntT|RealT|AnyT|NullT|VoidT|BoolT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($156)|OrT(^{$156...})|AndT(^{$156...})|SetT(^[^bool,$156])|TupleT(^[$156...])|FunctionT(^[$156,$156,$156...])>>,^{|$64,$64|}[$64,$64]])|$10|Equation($8)|SubsetEq(^[^SetT(^[^bool,$156]),^SExpr<$59|Set(^{$64...})>,^SExpr<$59|Set(^{$64...})>])|ForAll(^[^{^[^Var(^string),$156]...},^$144])|Exists(^[^{^[^Var(^string),$156]...},^$144])>>|SExpr<$59|Set(^{$64...})>>>...])>|Load(^[$64,^int])|LengthOf($64)>>>>>]>)>
		Schema.Term("Inequality",Schema.List(true,Schema.Or(Schema.Term("IntT"), Schema.Term("RealT")),Schema.Or(Schema.Term("Num",Schema.Real), Schema.Term("Sum",Schema.List(true,Schema.Any,Schema.Bag(true))), Schema.Term("Mul",Schema.Any), Schema.Term("Div",Schema.List(true,Schema.Any,Schema.Any)), Schema.Or(Schema.Or(Schema.Term("Var",Schema.String), Schema.Term("Fn",Schema.List(true,Schema.Any)), Schema.Term("Load",Schema.List(true,Schema.Or(Schema.Or(Schema.Any, Schema.Or(Schema.Any, Schema.Or(Schema.Or(Schema.Any, Schema.Term("Null"), Schema.Term("Tuple",Schema.List(true)), Schema.Or(Schema.Term("True"), Schema.Term("False")), Schema.Term("String",Schema.Any)), Schema.Term("Set",Schema.Set(true))), Schema.Term("Tuple",Schema.List(true)), Schema.Or(Schema.Or(Schema.Or(Schema.Or(Schema.Any, Schema.Any, Schema.Term("And",Schema.Set(true)), Schema.Term("Or",Schema.Any), Schema.Term("Not",Schema.Any), Schema.Term("Equals",Schema.List(true,Schema.Or(Schema.Or(Schema.Term("NotT",Schema.Or(Schema.Term("TupleT",Schema.List(true)), Schema.Term("SetT",Schema.List(true,Schema.Bool,Schema.Any)), Schema.Or(Schema.Any, Schema.Any, Schema.Term("AnyT"), Schema.Term("NullT"), Schema.Term("VoidT"), Schema.Term("BoolT"), Schema.Term("StringT"), Schema.Term("VarT",Schema.Any), Schema.Term("NominalT",Schema.Any)))), Schema.Any), Schema.Term("NotT",Schema.Any), Schema.Term("OrT",Schema.Set(true)), Schema.Term("AndT",Schema.Any), Schema.Term("SetT",Schema.List(true,Schema.Any,Schema.Any)), Schema.Term("TupleT",Schema.List(true)), Schema.Term("FunctionT",Schema.List(true,Schema.Any,Schema.Any))),Schema.Bag(true,Schema.Any,Schema.Any)))), Schema.Or(Schema.Any, Schema.Term("Equation",Schema.Any))), Schema.Term("SubsetEq",Schema.List(true,Schema.Any,Schema.Or(Schema.Any, Schema.Term("Set",Schema.Set(true))),Schema.Any))), Schema.Or(Schema.Term("ForAll",Schema.List(true,Schema.Set(true),Schema.Any)), Schema.Term("Exists",Schema.Any))))), Schema.Any),Schema.Int))), Schema.Term("LengthOf",Schema.Any))))),
		// $7<Set(^{$2<^Expr<$44<Value<Null|Tuple(^[^$44...])|Bool<True|False>|Num(^real)|String(^string)|Set(^{^$44...})>>|Tuple(^[$2...])|Fn(^[^string,$2...])|$95<BExpr<Bool<True|False>|VExpr<Fn(^[^string,$2...])|Var(^string)|Load(^[$2,^int])|LengthOf($2)>|And(^{^$95...})|Or(^{^$95...})|Not(^$95)|Equals(^[$127<^Type<Atom<NotT($150<^Proton<TupleT(^[$150...])|SetT(^[^bool,$150])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$150...])|SetT(^[^bool,$150])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($127)|OrT(^{$127...})|AndT(^{$127...})|SetT(^[^bool,$127])|TupleT(^[$127...])|FunctionT(^[$127,$127,$127...])>>,^{|$2,$2|}[$2,$2]])|Inequality(^[^AType<IntT|RealT>,$233<^AExpr<Num(^real)|VExpr<Fn(^[^string,$2...])|Var(^string)|Load(^[$2,^int])|LengthOf($2)>|Sum(^[^real,^{|$233...|}[$233...]])|Mul(^[^real,^{|$233...|}[$233...]])|Div(^[$233,$233])>>])|Equation(^[^AType<IntT|RealT>,$233])|SubsetEq(^[^SetT(^[^bool,$127]),^SExpr<$7|VExpr<Fn(^[^string,$2...])|Var(^string)|Load(^[$2,^int])|LengthOf($2)>>,^SExpr<$7|VExpr<Fn(^[^string,$2...])|Var(^string)|Load(^[$2,^int])|LengthOf($2)>>])|ForAll(^[^{^[^Var(^string),$127]...},^$95])|Exists(^[^{^[^Var(^string),$127]...},^$95])>>|AExpr<Num(^real)|VExpr<Fn(^[^string,$2...])|Var(^string)|Load(^[$2,^int])|LengthOf($2)>|Sum(^[^real,^{|$233...|}[$233...]])|Mul(^[^real,^{|$233...|}[$233...]])|Div(^[$233,$233])>|SExpr<$7|VExpr<Fn(^[^string,$2...])|Var(^string)|Load(^[$2,^int])|LengthOf($2)>>>>...})>
		Schema.Term("Set",Schema.Set(true)),
		// $10<SubsetEq(^[^$19<SetT(^[^bool,$13<^Type<$19|Atom<NotT($31<^Proton<TupleT(^[$31...])|SetT(^[^bool,$31])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$31...])|SetT(^[^bool,$31])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($13)|OrT(^{$13...})|AndT(^{$13...})|TupleT(^[$13...])|FunctionT(^[$13,$13,$13...])>>])>,^$111<SExpr<$121<VExpr<Var(^string)|$131<Fn(^[^string,$125<^Expr<$111|$131|$166<Value<Null|Tuple(^[^$166...])|Bool<True|False>|Num(^real)|String(^string)|Set(^{^$166...})>>|Tuple(^[$125...])|$208<BExpr<$10|$121|Bool<True|False>|And(^{^$208...})|Or(^{^$208...})|Not(^$208)|Equals(^[$13,^{|$125,$125|}[$125,$125]])|Inequality(^[^AType<IntT|RealT>,$231<^AExpr<$121|Num(^real)|Sum(^[^real,^{|$231...|}[$231...]])|Mul(^[^real,^{|$231...|}[$231...]])|Div(^[$231,$231])>>])|Equation(^[^AType<IntT|RealT>,$231])|ForAll(^[^{^[^Var(^string),$13]...},^$208])|Exists(^[^{^[^Var(^string),$13]...},^$208])>>|AExpr<$121|Num(^real)|Sum(^[^real,^{|$231...|}[$231...]])|Mul(^[^real,^{|$231...|}[$231...]])|Div(^[$231,$231])>>>...])>|Load(^[$125,^int])|LengthOf($125)>>|Set(^{$125...})>>,^$111])>
		Schema.Term("SubsetEq",Schema.List(true,Schema.Term("SetT",Schema.List(true,Schema.Bool,Schema.Or(Schema.Any, Schema.Or(Schema.Term("NotT",Schema.Or(Schema.Term("TupleT",Schema.List(true)), Schema.Term("SetT",Schema.List(true,Schema.Any,Schema.Any)), Schema.Or(Schema.Term("AnyT"), Schema.Term("NullT"), Schema.Term("VoidT"), Schema.Term("BoolT"), Schema.Term("IntT"), Schema.Term("RealT"), Schema.Term("StringT"), Schema.Term("VarT",Schema.String), Schema.Term("NominalT",Schema.Any)))), Schema.Any), Schema.Term("NotT",Schema.Any), Schema.Term("OrT",Schema.Set(true)), Schema.Term("AndT",Schema.Any), Schema.Term("TupleT",Schema.List(true)), Schema.Term("FunctionT",Schema.List(true,Schema.Any,Schema.Any))))),Schema.Or(Schema.Or(Schema.Or(Schema.Term("Var",Schema.Any), Schema.Term("Fn",Schema.List(true,Schema.Any)), Schema.Term("Load",Schema.List(true,Schema.Or(Schema.Any, Schema.Or(Schema.Or(Schema.Any, Schema.Or(Schema.Or(Schema.Term("Null"), Schema.Term("Tuple",Schema.List(true)), Schema.Or(Schema.Term("True"), Schema.Term("False")), Schema.Term("Num",Schema.Real), Schema.Term("String",Schema.Any)), Schema.Term("Set",Schema.Set(true))), Schema.Term("Tuple",Schema.List(true)), Schema.Or(Schema.Or(Schema.Any, Schema.Or(Schema.Or(Schema.Any, Schema.Any, Schema.Term("And",Schema.Set(true)), Schema.Term("Or",Schema.Any), Schema.Term("Not",Schema.Any), Schema.Term("Equals",Schema.List(true,Schema.Any,Schema.Bag(true,Schema.Any,Schema.Any)))), Schema.Or(Schema.Term("Inequality",Schema.List(true,Schema.Or(Schema.Any, Schema.Any),Schema.Or(Schema.Any, Schema.Any, Schema.Term("Sum",Schema.List(true,Schema.Any,Schema.Bag(true))), Schema.Term("Mul",Schema.Any), Schema.Term("Div",Schema.List(true,Schema.Any,Schema.Any))))), Schema.Term("Equation",Schema.Any)))), Schema.Or(Schema.Term("ForAll",Schema.List(true,Schema.Set(true),Schema.Any)), Schema.Term("Exists",Schema.Any)))), Schema.Any)),Schema.Int))), Schema.Term("LengthOf",Schema.Any)), Schema.Term("Set",Schema.Set(true))),Schema.Any)),
		// $19<ForAll($17<^[^{^[^Var(^string),$4<^Type<Atom<NotT($35<^Proton<TupleT(^[$35...])|SetT(^[^bool,$35])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$35...])|SetT(^[^bool,$35])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($4)|OrT(^{$4...})|AndT(^{$4...})|SetT(^[^bool,$4])|TupleT(^[$4...])|FunctionT(^[$4,$4,$4...])>>]...},$13<^$139<BExpr<$148<VExpr<Var(^string)|$156<Fn(^[^string,$150<^Expr<$139|$156|$191<Value<Null|Tuple(^[^$191...])|Bool<True|False>|Num(^real)|String(^string)|Set(^{^$191...})>>|Tuple(^[$150...])|$218<AExpr<$148|Num(^real)|Sum(^[^real,^{|^$218...|}[^$218...]])|Mul(^[^real,^{|^$218...|}[^$218...]])|Div(^[^$218,^$218])>>|SExpr<$148|Set(^{$150...})>>>...])>|Load(^[$150,^int])|LengthOf($150)>>|Bool<True|False>|And(^{$13...})|Or(^{$13...})|Not($13)|Equals(^[$4,^{|$150,$150|}[$150,$150]])|Inequality(^[^AType<IntT|RealT>,^$218])|Equation(^[^AType<IntT|RealT>,^$218])|SubsetEq(^[^SetT(^[^bool,$4]),^SExpr<$148|Set(^{$150...})>,^SExpr<$148|Set(^{$150...})>])|$19|Exists($17)>>>]>)>
		Schema.Term("ForAll",Schema.List(true,Schema.Set(true),Schema.Or(Schema.Or(Schema.Or(Schema.Or(Schema.Or(Schema.Or(Schema.Term("Var",Schema.String), Schema.Term("Fn",Schema.List(true,Schema.Any)), Schema.Term("Load",Schema.List(true,Schema.Or(Schema.Or(Schema.Or(Schema.Any, Schema.Any, Schema.Or(Schema.Or(Schema.Term("Null"), Schema.Term("Tuple",Schema.List(true)), Schema.Or(Schema.Term("True"), Schema.Term("False")), Schema.Term("Num",Schema.Real), Schema.Term("String",Schema.Any)), Schema.Term("Set",Schema.Set(true))), Schema.Term("Tuple",Schema.List(true))), Schema.Or(Schema.Any, Schema.Any, Schema.Term("Sum",Schema.List(true,Schema.Any,Schema.Bag(true))), Schema.Term("Mul",Schema.Any), Schema.Term("Div",Schema.List(true,Schema.Any,Schema.Any)))), Schema.Or(Schema.Any, Schema.Term("Set",Schema.Set(true)))),Schema.Int))), Schema.Term("LengthOf",Schema.Any)), Schema.Any, Schema.Term("And",Schema.Set(true)), Schema.Term("Or",Schema.Any), Schema.Term("Not",Schema.Any), Schema.Term("Equals",Schema.List(true,Schema.Or(Schema.Or(Schema.Term("NotT",Schema.Or(Schema.Term("TupleT",Schema.List(true)), Schema.Term("SetT",Schema.List(true,Schema.Bool,Schema.Any)), Schema.Or(Schema.Term("AnyT"), Schema.Term("NullT"), Schema.Term("VoidT"), Schema.Term("BoolT"), Schema.Term("IntT"), Schema.Term("RealT"), Schema.Term("StringT"), Schema.Term("VarT",Schema.Any), Schema.Term("NominalT",Schema.Any)))), Schema.Any), Schema.Term("NotT",Schema.Any), Schema.Term("OrT",Schema.Set(true)), Schema.Term("AndT",Schema.Any), Schema.Term("SetT",Schema.List(true,Schema.Any,Schema.Any)), Schema.Term("TupleT",Schema.List(true)), Schema.Term("FunctionT",Schema.List(true,Schema.Any,Schema.Any))),Schema.Bag(true,Schema.Any,Schema.Any)))), Schema.Or(Schema.Term("Inequality",Schema.List(true,Schema.Or(Schema.Any, Schema.Any),Schema.Any)), Schema.Term("Equation",Schema.Any))), Schema.Term("SubsetEq",Schema.List(true,Schema.Any,Schema.Any,Schema.Any))), Schema.Or(Schema.Any, Schema.Term("Exists",Schema.Any))))),
		// $19<Exists($17<^[^{^[^Var(^string),$4<^Type<Atom<NotT($35<^Proton<TupleT(^[$35...])|SetT(^[^bool,$35])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$35...])|SetT(^[^bool,$35])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($4)|OrT(^{$4...})|AndT(^{$4...})|SetT(^[^bool,$4])|TupleT(^[$4...])|FunctionT(^[$4,$4,$4...])>>]...},$13<^$139<BExpr<$148<VExpr<Var(^string)|$156<Fn(^[^string,$150<^Expr<$139|$156|$191<Value<Null|Tuple(^[^$191...])|Bool<True|False>|Num(^real)|String(^string)|Set(^{^$191...})>>|Tuple(^[$150...])|$218<AExpr<$148|Num(^real)|Sum(^[^real,^{|^$218...|}[^$218...]])|Mul(^[^real,^{|^$218...|}[^$218...]])|Div(^[^$218,^$218])>>|SExpr<$148|Set(^{$150...})>>>...])>|Load(^[$150,^int])|LengthOf($150)>>|Bool<True|False>|And(^{$13...})|Or(^{$13...})|Not($13)|Equals(^[$4,^{|$150,$150|}[$150,$150]])|Inequality(^[^AType<IntT|RealT>,^$218])|Equation(^[^AType<IntT|RealT>,^$218])|SubsetEq(^[^SetT(^[^bool,$4]),^SExpr<$148|Set(^{$150...})>,^SExpr<$148|Set(^{$150...})>])|$19|ForAll($17)>>>]>)>
		Schema.Term("Exists",Schema.List(true,Schema.Set(true),Schema.Or(Schema.Or(Schema.Or(Schema.Or(Schema.Or(Schema.Or(Schema.Term("Var",Schema.String), Schema.Term("Fn",Schema.List(true,Schema.Any)), Schema.Term("Load",Schema.List(true,Schema.Or(Schema.Or(Schema.Or(Schema.Any, Schema.Any, Schema.Or(Schema.Or(Schema.Term("Null"), Schema.Term("Tuple",Schema.List(true)), Schema.Or(Schema.Term("True"), Schema.Term("False")), Schema.Term("Num",Schema.Real), Schema.Term("String",Schema.Any)), Schema.Term("Set",Schema.Set(true))), Schema.Term("Tuple",Schema.List(true))), Schema.Or(Schema.Any, Schema.Any, Schema.Term("Sum",Schema.List(true,Schema.Any,Schema.Bag(true))), Schema.Term("Mul",Schema.Any), Schema.Term("Div",Schema.List(true,Schema.Any,Schema.Any)))), Schema.Or(Schema.Any, Schema.Term("Set",Schema.Set(true)))),Schema.Int))), Schema.Term("LengthOf",Schema.Any)), Schema.Any, Schema.Term("And",Schema.Set(true)), Schema.Term("Or",Schema.Any), Schema.Term("Not",Schema.Any), Schema.Term("Equals",Schema.List(true,Schema.Or(Schema.Or(Schema.Term("NotT",Schema.Or(Schema.Term("TupleT",Schema.List(true)), Schema.Term("SetT",Schema.List(true,Schema.Bool,Schema.Any)), Schema.Or(Schema.Term("AnyT"), Schema.Term("NullT"), Schema.Term("VoidT"), Schema.Term("BoolT"), Schema.Term("IntT"), Schema.Term("RealT"), Schema.Term("StringT"), Schema.Term("VarT",Schema.Any), Schema.Term("NominalT",Schema.Any)))), Schema.Any), Schema.Term("NotT",Schema.Any), Schema.Term("OrT",Schema.Set(true)), Schema.Term("AndT",Schema.Any), Schema.Term("SetT",Schema.List(true,Schema.Any,Schema.Any)), Schema.Term("TupleT",Schema.List(true)), Schema.Term("FunctionT",Schema.List(true,Schema.Any,Schema.Any))),Schema.Bag(true,Schema.Any,Schema.Any)))), Schema.Or(Schema.Term("Inequality",Schema.List(true,Schema.Or(Schema.Any, Schema.Any),Schema.Any)), Schema.Term("Equation",Schema.Any))), Schema.Term("SubsetEq",Schema.List(true,Schema.Any,Schema.Any,Schema.Any))), Schema.Or(Schema.Any, Schema.Term("ForAll",Schema.Any))))),
		// Inhabited($2<^Type<Atom<NotT($17<^Proton<TupleT(^[$17...])|SetT(^[^bool,$17])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$17...])|SetT(^[^bool,$17])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($2)|OrT(^{$2...})|AndT(^{$2...})|SetT(^[^bool,$2])|TupleT(^[$2...])|FunctionT(^[$2,$2,$2...])>>)
		Schema.Term("Inhabited",Schema.Or(Schema.Or(Schema.Term("NotT",Schema.Or(Schema.Term("TupleT",Schema.List(true)), Schema.Term("SetT",Schema.List(true,Schema.Bool,Schema.Any)), Schema.Or(Schema.Term("AnyT"), Schema.Term("NullT"), Schema.Term("VoidT"), Schema.Term("BoolT"), Schema.Term("IntT"), Schema.Term("RealT"), Schema.Term("StringT"), Schema.Term("VarT",Schema.String), Schema.Term("NominalT",Schema.Any)))), Schema.Any), Schema.Term("NotT",Schema.Any), Schema.Term("OrT",Schema.Set(true)), Schema.Term("AndT",Schema.Any), Schema.Term("SetT",Schema.List(true,Schema.Any,Schema.Any)), Schema.Term("TupleT",Schema.List(true)), Schema.Term("FunctionT",Schema.List(true,Schema.Any,Schema.Any)))),
		// Is(^[$2<^Expr<$48<Value<Null|Tuple(^[^$48...])|Bool<True|False>|Num(^real)|String(^string)|Set(^{^$48...})>>|Tuple(^[$2...])|Fn(^[^string,$2...])|$99<BExpr<Bool<True|False>|VExpr<Fn(^[^string,$2...])|Var(^string)|Load(^[$2,^int])|LengthOf($2)>|And(^{^$99...})|Or(^{^$99...})|Not(^$99)|Equals(^[$4<^Type<Atom<NotT($152<^Proton<TupleT(^[$152...])|SetT(^[^bool,$152])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$152...])|SetT(^[^bool,$152])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($4)|OrT(^{$4...})|AndT(^{$4...})|SetT(^[^bool,$4])|TupleT(^[$4...])|FunctionT(^[$4,$4,$4...])>>,^{|$2,$2|}[$2,$2]])|Inequality(^[^AType<IntT|RealT>,$235<^AExpr<Num(^real)|VExpr<Fn(^[^string,$2...])|Var(^string)|Load(^[$2,^int])|LengthOf($2)>|Sum(^[^real,^{|$235...|}[$235...]])|Mul(^[^real,^{|$235...|}[$235...]])|Div(^[$235,$235])>>])|Equation(^[^AType<IntT|RealT>,$235])|SubsetEq(^[^SetT(^[^bool,$4]),^SExpr<VExpr<Fn(^[^string,$2...])|Var(^string)|Load(^[$2,^int])|LengthOf($2)>|Set(^{$2...})>,^SExpr<VExpr<Fn(^[^string,$2...])|Var(^string)|Load(^[$2,^int])|LengthOf($2)>|Set(^{$2...})>])|ForAll(^[^{^[^Var(^string),$4]...},^$99])|Exists(^[^{^[^Var(^string),$4]...},^$99])>>|AExpr<Num(^real)|VExpr<Fn(^[^string,$2...])|Var(^string)|Load(^[$2,^int])|LengthOf($2)>|Sum(^[^real,^{|$235...|}[$235...]])|Mul(^[^real,^{|$235...|}[$235...]])|Div(^[$235,$235])>|SExpr<VExpr<Fn(^[^string,$2...])|Var(^string)|Load(^[$2,^int])|LengthOf($2)>|Set(^{$2...})>>>,$4])
		Schema.Term("Is",Schema.List(true,Schema.Or(Schema.Or(Schema.Or(Schema.Or(Schema.Or(Schema.Term("Null"), Schema.Term("Tuple",Schema.List(true)), Schema.Or(Schema.Term("True"), Schema.Term("False")), Schema.Term("Num",Schema.Real), Schema.Term("String",Schema.String)), Schema.Term("Set",Schema.Set(true))), Schema.Term("Tuple",Schema.List(true)), Schema.Term("Fn",Schema.List(true,Schema.Any)), Schema.Or(Schema.Or(Schema.Or(Schema.Or(Schema.Any, Schema.Or(Schema.Or(Schema.Any, Schema.Term("Var",Schema.Any), Schema.Term("Load",Schema.List(true,Schema.Any,Schema.Int))), Schema.Term("LengthOf",Schema.Any)), Schema.Term("And",Schema.Set(true)), Schema.Term("Or",Schema.Any), Schema.Term("Not",Schema.Any), Schema.Term("Equals",Schema.List(true,Schema.Or(Schema.Or(Schema.Term("NotT",Schema.Or(Schema.Term("TupleT",Schema.List(true)), Schema.Term("SetT",Schema.List(true,Schema.Bool,Schema.Any)), Schema.Or(Schema.Term("AnyT"), Schema.Term("NullT"), Schema.Term("VoidT"), Schema.Term("BoolT"), Schema.Term("IntT"), Schema.Term("RealT"), Schema.Term("StringT"), Schema.Term("VarT",Schema.Any), Schema.Term("NominalT",Schema.Any)))), Schema.Any), Schema.Term("NotT",Schema.Any), Schema.Term("OrT",Schema.Set(true)), Schema.Term("AndT",Schema.Any), Schema.Term("SetT",Schema.List(true,Schema.Any,Schema.Any)), Schema.Term("TupleT",Schema.List(true)), Schema.Term("FunctionT",Schema.List(true,Schema.Any,Schema.Any))),Schema.Bag(true,Schema.Any,Schema.Any)))), Schema.Or(Schema.Term("Inequality",Schema.List(true,Schema.Or(Schema.Any, Schema.Any),Schema.Or(Schema.Any, Schema.Any, Schema.Term("Sum",Schema.List(true,Schema.Any,Schema.Bag(true))), Schema.Term("Mul",Schema.Any), Schema.Term("Div",Schema.List(true,Schema.Any,Schema.Any))))), Schema.Term("Equation",Schema.Any))), Schema.Term("SubsetEq",Schema.List(true,Schema.Any,Schema.Or(Schema.Any, Schema.Term("Set",Schema.Set(true))),Schema.Any))), Schema.Or(Schema.Term("ForAll",Schema.List(true,Schema.Set(true),Schema.Any)), Schema.Term("Exists",Schema.Any)))), Schema.Any), Schema.Any),Schema.Any))
	});

	// =========================================================================
	// Types
	// =========================================================================

	// AnyT
	private static Type type0 = Runtime.Type("2G0tLTJCWDggIk2");
	// VoidT
	private static Type type1 = Runtime.Type("2KLxLPZGp3ukmD0E");
	// $11<Type<Atom<NotT($13<^Proton<TupleT(^[$13...])|SetT(^[^bool,$13])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$13...])|SetT(^[^bool,$13])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT(^$11)|OrT(^{^$11...})|AndT(^{^$11...})|SetT(^[^bool,^$11])|TupleT(^[^$11...])|FunctionT(^[^$11,^$11,^$11...])>>
	private static Type type2 = Runtime.Type("763GKTkK5G0GrQhGZIjG6KowZRJGJFiG5K3CKOoG4OJK6RgK5KJ55KbQYGMPjt5KlpKmWn0qWrluGyl59CXDAp1IZ0_RjGrQidXUYknIgVK7Otr5PCmDQp1MJ4KSW8rPYw3Atw_9cC1HdlXPekl7gxo7SoLDidmQYw2TgZMBfdbjl5vCXIwpHU34ZQtGp3zl1X0KDK6QgGp395ggNF_Kj_5OJCGY0AD5J8oQjl5KIVOkHa0G8t5SJCla0AR5J8KOWl5KIsOkmb0SIGbRdtqOJCGe0Ae53OKNmG_9OB1fGf0Ai535DxLQdtLNgGp7s5h5gZQ3OZNkNwNcOoOVPgPwPcQglil7TlQoHjW9CC1Ez5gVRBmjl9jcRcmml7xkRkHnl7ykRkmnl7gxQBH6O6tcScmql7zkSkHrl7z5gZnrW9c6YVJu0Ae6YwQwQBmj0vGDh6esTBHHj6gVU3Cx");
	// bool
	private static Type type3 = Runtime.Type("Fk0");
	// $20<Proton<TupleT(^[^$20...])|SetT(^[^bool,^$20])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>
	private static Type type4 = Runtime.Type("hG5Jmx5Sjt5KGKMNmh5OJK6RgK5Kesp7xkHDycmEYk2HgZ3GIK5SJd16YkJEYoGItsZ9ECmHNlHLlcZLT5Qgp7ukKASGJFi_6KIw4AcG_Ipl5QJCWPgg5KLxLPZGp3hlXQJ8oQjl5KIV6AtGJHiG6KIg6AwG_J_45QJCWUgw6SIGbRdtqOJCGX0A953OKNmG_9OB1YGY0AD535DxLQdtLNgGp7N5C5gZO3OZ5QjdMU75A5E5P5QgOBmDR5hoO3Tx");
	// ^AnyT
	private static Type type5 = Runtime.Type("3G0tLTJCWDggY9w3x$");
	// Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>
	private static Type type6 = Runtime.Type("8GKJp4aRfGJFi_6KIg2AwF_Ipl5QJCWEgw2KLxLPZGp38lXHJ8oQjl5KIk3ACGJHiG6KIw3ANG_J_45QJCWLgg4SIGbRdtqOJCGMgs4GL4aRJdH5YVLPgc5WWIjpLPi45QJC1QdlHQG5xVoHD_4MUhaQQwq7uVMAt4ux");
	// $14<Expr<$38<Value<Null|Tuple(^[^$38...])|Bool<True|False>|Num(^real)|String(^string)|Set(^{^$38...})>>|Tuple(^[^$14...])|Fn(^[^string,^$14...])|$90<BExpr<Bool<True|False>|VExpr<Fn(^[^string,^$14...])|Var(^string)|Load(^[^$14,^int])|LengthOf(^$14)>|And(^{^$90...})|Or(^{^$90...})|Not(^$90)|Equals(^[$122<^Type<Atom<NotT($145<^Proton<TupleT(^[$145...])|SetT(^[^bool,$145])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$145...])|SetT(^[^bool,$145])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($122)|OrT(^{$122...})|AndT(^{$122...})|SetT(^[^bool,$122])|TupleT(^[$122...])|FunctionT(^[$122,$122,$122...])>>,^{|^$14,^$14|}[^$14,^$14]])|Inequality(^[^AType<IntT|RealT>,$228<^AExpr<Num(^real)|VExpr<Fn(^[^string,^$14...])|Var(^string)|Load(^[^$14,^int])|LengthOf(^$14)>|Sum(^[^real,^{|$228...|}[$228...]])|Mul(^[^real,^{|$228...|}[$228...]])|Div(^[$228,$228])>>])|Equation(^[^AType<IntT|RealT>,$228])|SubsetEq(^[^SetT(^[^bool,$122]),^SExpr<VExpr<Fn(^[^string,^$14...])|Var(^string)|Load(^[^$14,^int])|LengthOf(^$14)>|Set(^{^$14...})>,^SExpr<VExpr<Fn(^[^string,^$14...])|Var(^string)|Load(^[^$14,^int])|LengthOf(^$14)>|Set(^{^$14...})>])|ForAll(^[^{^[^Var(^string),$122]...},^$90])|Exists(^[^{^[^Var(^string),$122]...},^$90])>>|AExpr<Num(^real)|VExpr<Fn(^[^string,^$14...])|Var(^string)|Load(^[^$14,^int])|LengthOf(^$14)>|Sum(^[^real,^{|$228...|}[$228...]])|Mul(^[^real,^{|$228...|}[$228...]])|Div(^[$228,$228])>|SExpr<VExpr<Fn(^[^string,^$14...])|Var(^string)|Load(^[^$14,^int])|LengthOf(^$14)>|Set(^{^$14...})>>>
	private static Type type7 = Runtime.Type("PI3K3Tk86KL45QpK5KJK6RgK585t5K1K3Tk8MF75i5w5g6Qw2K0K3Tk8M77x8hWHJCKGs0bRWgZro5CCXDDpmI3tJSglq3OlXL38oQjl5CDKMQZC4Sm_aQbd1Xl7UlHDcdHPYkYPggLJQlaaGb0el5hGnJ_Gr7UhmAsdHTYwaTggM7ilr5xCmDypmU3G_RpKq385gcNF_GWlqR_C0Y0AC5WgNsNglYl7RWOoHaW9PBHMQ5gkOcH5Ys_b0AU5eVp7d5gZYeW9f5Yk2f0Ah5IsOBHelfGDs5eZQBHEu5ggQF_K4W6RmGIFiG58E86CDx5SZKJRp45Qn4aaGzWb1eXeXjm596Z58tLOlKMNg_5StGNJJRp45SdxaQWk7dBhWnG7A6E6QVSFNBKSXCMOoKJRWZScChlq0O5xaR0l5QZK3TdC6Sn4HXpXp5U6WkSVTgGul7ycTomu0CL4aR3loQWGLBw5z6D9QwTFNkJOiS5ScxZOWVUVdgWyl7x5v6hkUBHvWb0Ay6egl7d579YoGXHD99egcBXv0Y1AC9YZUZPkmYX9g6YZdgmAP9egdBXj0b1AS9YwQkdkmbm776O9gZeF3Kt0MOeZh7HeGel7SoeVYfX9j9YkeVfBH6t9tcfcmim786w9gofFJFoxLQ3toQoG4CE86K34ZQZG4GIK5SJG5Kp06Q_G4_WGptqNo_qQiGKRdAAENEPEcEhEvEQsgBmemnHANAZ0_RjGrQidXXn77AQAgkh3HrXXn5TAYwfwho1u1KGKMNmhq7QAgZnuX9gAYkgoikXvX9RB1ymqm7SZjZYyX9vAYggkjkHzHBjAyA8EQwjBXq1XIA8D34ZQtGp3ADgksF_Ipl5QJCWY2AEDJOpQdG5KIZtkXa2K1xqQgGp3RDgotFJHiG6KIwtk1e2KHKLNgGp3eDgguFrJo8MPiS5KIoukXf2GL4aRJC1iYb0AtD35DxLQdtLNgGp7vDT5gkv3OosVtgtstZukuwucvovgWjn7eAzDhVwB1m1f1A9EYkegmABEeowBHmXn2AEEYcgswkHqn7sAg9YolqIDREeoxBmmXr2AUEYkekHDdEecyB1nmu2AgEYkekeB1fXvIDjEeVzBHnHy2AuEJ43Kt0MOeV8dmbo7xEyEYolzID7HeZ7C1nWX3AAHWZukugGYo7wEDHhw7GnJpp5CCK6QoFJPq4KbGz0iZi3mo5RHYZJbJATHYszg1DcHeZ9CmaWeo7Sg9_2fZ9hHYZ8t9lmfo7PHiHgZACXzYzn7SgA_2jZ9xHYg8tAlmjo7C69HgZBd1uY9TIngBlBlBCH6CItsBdmno7P6NIgZC4Hzluo5QIYk3rJASIYZPgmAUIeVDCmQdIgcDdmzl7gIg9YoGvJDiIewDC1yo9jZEdXyo7vIO9Yo0zJDxIesECHrlz3A7LYsSwElXXKVp2");
	// int
	private static Type type8 = Runtime.Type("Fg0");
	// $10<VExpr<Var(^string)|$21<Fn(^[^string,$15<^Expr<$21|$58<Value<Null|Tuple(^[^$58...])|Bool<True|False>|Num(^real)|String(^string)|Set(^{^$58...})>>|Tuple(^[$15...])|$101<BExpr<$10|Bool<True|False>|And(^{^$101...})|Or(^{^$101...})|Not(^$101)|Equals(^[$113<^Type<Atom<NotT($136<^Proton<TupleT(^[$136...])|SetT(^[^bool,$136])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$136...])|SetT(^[^bool,$136])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($113)|OrT(^{$113...})|AndT(^{$113...})|SetT(^[^bool,$113])|TupleT(^[$113...])|FunctionT(^[$113,$113,$113...])>>,^{|$15,$15|}[$15,$15]])|Inequality(^[^AType<IntT|RealT>,$219<^AExpr<$10|Num(^real)|Sum(^[^real,^{|$219...|}[$219...]])|Mul(^[^real,^{|$219...|}[$219...]])|Div(^[$219,$219])>>])|Equation(^[^AType<IntT|RealT>,$219])|SubsetEq(^[^SetT(^[^bool,$113]),^SExpr<$10|Set(^{$15...})>,^SExpr<$10|Set(^{$15...})>])|ForAll(^[^{^[^Var(^string),$113]...},^$101])|Exists(^[^{^[^Var(^string),$113]...},^$101])>>|AExpr<$10|Num(^real)|Sum(^[^real,^{|$219...|}[$219...]])|Mul(^[^real,^{|$219...|}[$219...]])|Div(^[$219,$219])>|SExpr<$10|Set(^{$15...})>>>...])>|Load(^[$15,^int])|LengthOf($15)>>
	private static Type type9 = Runtime.Type("PIJOKGs0bRoNKNmGXGiG3Ij45OlwoM8LQs2W0I_tqOoWqIa4mEALQZo7ucJAAdH5YgIIgs3G4W6Rmd1UIoo7OdKDQd1MYkIMgs4KL45QpK5KJK6RgK5K1K3Tk8MFUlPVSwUglPJ4JGs0bRWkaYo5iGpJ4W6Rm4mQCIQZr7NdMAvGZIpl5QIo6AyGZFjx5QosJShGqJo8MPiSa9g5YgNkHDB5eoNBHPD5gwN3pUN5y586A6QZOFnJ_Gr7A5fw1bW9S5YgOsOkmbG7P5c5QZPB1Pe5hgPF3KmKMOIoPkXf0K545QnKq3s5gZQ3mfWil5v5YVNkQoHjW9PBHXlj0A76YcNo3A96YZ4AtkRcHnl7dtRkmn0C0t5OZwZRosoQoGLGlKMNgCMNBtQocwcZdoegGr0dGHiKLRp45QdGMT3544MSWGMPjtL7vEtHQZT3XrWul5f635IKbNnK5S44M7g68IQsTFaGj8MFgl5O4WMPnGrRWVEdEhWyG7j6v6QkUBXPx6hsUcmzl779fwHXX999YZSgck1Ym7P6A9gscBmq0X1AN93GKTkKa97AXZKLYo0b1DS9esdBmambm7SVeZIeX9e9YkSgek1f1G0GrQhGZIjG6KowZRJGJFiG5K3CKOoG4OJK6RgK5KJ55KbQYGMPjt5KlWhcvwvZwwwkxcygGjm7P9y9hwfF5Jmx5Sjta9tAYwecgkmmH7BAtAQogBXfXnHAEAJ4KSW8rPYcgkHDPAeghBmi1r1ASAekl7UA9AYo0uHDdAeciBXimu1AgAlshoiVvgWvm78AjAhVjFJFi_6KIcjkmy1KDK6QgGp3xAgsjF_Kj_5OJC0X2A8DJ8oQjl5KIgsk1Y2G8t5SJCWY2AEDJ8KOWl5KIZtkXa2SIGbRdtqOJC0b2ASD3OKNmGp7UDCl1e2WWIjpLPi45QJCXeIIggu3OkjwjcsosVtgtstZukugGfn7OAiDhwuBmfma1AtDYgdgmAvDekvB1iHj2AyDYZfovk1mn7UAQ9YoWmIDAEekwBXiHn2ADEYgdkHDNEeZxBmiXq2AQEYgdgdBmaHrIDTEewxB1j1u2AdEJ43Kt0MOewzcXYo7gEhEYoWvIDjEeVzBmrGy2AuEWVtgtg0zn7fExEhszFnJpp5CCK6QoFJPq44I86UHdHjHQg7CHQBHho7CHvn9sw7d1ao7z5OHYoWaJDQHek8C1XJb3ATHYZ7p8l1eo7hEhEYoWeJDfHek9CXXJf3AiHYVTZzk1iZ9EEeoBCYioioio7SkA_IjZ9yHYoTwAl1mJ7BdChWmo7shBp1no7OhmADIewBCma0q3AOIewo7QIQ9Yo0rJDSIesCCmro9jVDdHuo7eI79YoluJDgIeoDC1yWv3AjIYZUsDlHyZ9QBHLvIYo0zJDxIesECHEzIgVNC1HOlXXKko2");
	// $7<Tuple(^[$2<^Expr<$7|$44<Value<Null|Tuple(^[^$44...])|Bool<True|False>|Num(^real)|String(^string)|Set(^{^$44...})>>|Fn(^[^string,$2...])|$90<BExpr<Bool<True|False>|VExpr<Fn(^[^string,$2...])|Var(^string)|Load(^[$2,^int])|LengthOf($2)>|And(^{^$90...})|Or(^{^$90...})|Not(^$90)|Equals(^[$122<^Type<Atom<NotT($145<^Proton<TupleT(^[$145...])|SetT(^[^bool,$145])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$145...])|SetT(^[^bool,$145])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($122)|OrT(^{$122...})|AndT(^{$122...})|SetT(^[^bool,$122])|TupleT(^[$122...])|FunctionT(^[$122,$122,$122...])>>,^{|$2,$2|}[$2,$2]])|Inequality(^[^AType<IntT|RealT>,$228<^AExpr<Num(^real)|VExpr<Fn(^[^string,$2...])|Var(^string)|Load(^[$2,^int])|LengthOf($2)>|Sum(^[^real,^{|$228...|}[$228...]])|Mul(^[^real,^{|$228...|}[$228...]])|Div(^[$228,$228])>>])|Equation(^[^AType<IntT|RealT>,$228])|SubsetEq(^[^SetT(^[^bool,$122]),^SExpr<VExpr<Fn(^[^string,$2...])|Var(^string)|Load(^[$2,^int])|LengthOf($2)>|Set(^{$2...})>,^SExpr<VExpr<Fn(^[^string,$2...])|Var(^string)|Load(^[$2,^int])|LengthOf($2)>|Set(^{$2...})>])|ForAll(^[^{^[^Var(^string),$122]...},^$90])|Exists(^[^{^[^Var(^string),$122]...},^$90])>>|AExpr<Num(^real)|VExpr<Fn(^[^string,$2...])|Var(^string)|Load(^[$2,^int])|LengthOf($2)>|Sum(^[^real,^{|$228...|}[$228...]])|Mul(^[^real,^{|$228...|}[$228...]])|Div(^[$228,$228])>|SExpr<VExpr<Fn(^[^string,$2...])|Var(^string)|Load(^[$2,^int])|LengthOf($2)>|Set(^{$2...})>>>...])>
	private static Type type10 = Runtime.Type("PIJGKSklLO3K3Tk8b9TC1EgZIEesn7uw2A7G_KWlLS_GXGiG_F4W6Rm4JHD5w5g6Qo3K0K3Tk8M7Dx8h0LJCKGs0bRWZ_ro5QCmDRpHM3tJSglq3Ul1P38oQjl5CDKMQZC4Sm_aQbdXYl7hlHDidmQYc2TgZMJdd6eleWfl5vGnJ_Gr7hhmAydmUYo6X0A85WkbXl5A5Yc3YGAC53G_RpKq3E5gVOF_GWlqR_CWa0AQ5WZOkOgGbl7etOombW9PBmPd5gcPcH5Yk5f0Ah5IkPB1Ej5tVQcHil7AdQkmi0KLK3Tk86C0t5OZwZRosoQoGLGlKMNgCMNc5x6T9c9e9y9QcRFPZZQ_4MSWlLPo_6WGGlKMNo_qQi41YZmo5D6WgRwRg0q0WlJp8qR_GMGl4HqWqo5Q6ZOoQm43QgGLGs_qRoCM78LALQwS31r0ul5d6YkZuGAf6oNKNmG3Ij45OlkQwUscglv0W0I_tqOoWqIa41y0am5u6YoQgUo1zl7h6g5gsUcm5Yk2Xm7SZcZYXX9A9YsTkckHYm7t6wkmYX9g6YZdgmAP9egdBXj0b1AS9YwQkdkmbm776O9gZeF3Kt0MOeZh71EwBH6h9ssecmfm7g9s9YoGiHDu9egfBHm0j1Ax9343Sjp5GDx5SJGnImG4G0t5OJGoJ_G6KZGKSklLOJGONJSiC5SdxaQJ4Mumm2qYq2uIvnyn5DAYgewgo1q1OF8rQoxaQecsB1mmq1ARAWohcsgWrm7z9UAhViFKJp4aRfCmq1Atgic1vm7BAhAgsic16YVjghBH6tAtcjcmym7AAwAgoj3nvXzHmn5zAYchVsoHX2G0tLTJClX2ABDJtJSgl5KIsskmY2KLxLPZGp3ODgctF_Fjx5QJC0b2ASD3_ZQoGp3UDgVuF_J_45QJCWe2AfDoC4Sm_aQbGp3hDgsuFZKW86KYVvkPkHi2WWIjpLPi45QJCmi2f0AwDG5CDNDQDTDdDgDjDuDxDQsvBXumjIA7EYVgkekXmn7g9fw1nY9CEYZgswkmnn79ADEgZxB1y1fm7SgxZ2rY9SEYggsxkmrn7g9gZIuY9eEYkggyk1vn7g9g9YkesyZnvY9sEYogZzkXy2K0GKTkKa9NHew8CHzYzn7SwzZ2XZ98HYkRc7lmXJ7dDgDQo7C1zYYJAEHoBKShGIIpl5C3_aSGhPoUVAdAWBh0bo7Ep8pXbo7yEfV2eZ9dHYZPc9CH6fHtk9dHfo7OHiHgw9CXaZf3AtHYszszBH6vHtkAdHjo7QHyHgwACHnWX3A8IeVycXroBAIBIBIYoGnJDDIewBCXq0q3AOIWoUgDhlqo7PlCpHro7wgmAUIeVDCHUdIgcDdmzl7gIg9YoGvJDiIewDC1yo9jZEdXyo7vIO9Yo0zJDxIesECHrlz3A7LYsSwElXXKZo2");
	// $25<BExpr<$35<VExpr<Var(^string)|$46<Fn(^[^string,$40<^Expr<$25|$46|$81<Value<Null|Tuple(^[^$81...])|Bool<True|False>|Num(^real)|String(^string)|Set(^{^$81...})>>|Tuple(^[$40...])|$108<AExpr<$35|Num(^real)|Sum(^[^real,^{|^$108...|}[^$108...]])|Mul(^[^real,^{|^$108...|}[^$108...]])|Div(^[^$108,^$108])>>|SExpr<$35|Set(^{$40...})>>>...])>|Load(^[$40,^int])|LengthOf($40)>>|Bool<True|False>|And(^{^$25...})|Or(^{^$25...})|Not(^$25)|Equals(^[$156<^Type<Atom<NotT($179<^Proton<TupleT(^[$179...])|SetT(^[^bool,$179])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$179...])|SetT(^[^bool,$179])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($156)|OrT(^{$156...})|AndT(^{$156...})|SetT(^[^bool,$156])|TupleT(^[$156...])|FunctionT(^[$156,$156,$156...])>>,^{|$40,$40|}[$40,$40]])|Inequality(^[^AType<IntT|RealT>,^$108])|Equation(^[^AType<IntT|RealT>,^$108])|SubsetEq(^[^SetT(^[^bool,$156]),^SExpr<$35|Set(^{$40...})>,^SExpr<$35|Set(^{$40...})>])|ForAll(^[^{^[^Var(^string),$156]...},^$25])|Exists(^[^{^[^Var(^string),$156]...},^$25])>>
	private static Type type11 = Runtime.Type("PIJ8JGs0bRJOKGs0bR38oQjl5C0t5OZwZRosoQoGLGlKMNgCMNxpTVicikiVsgGHZ58tLOlKMNg_5StGNJJRp45SdxaQWoBhChGIWcZIQw3WlJp8qR_GMGl41LfIQc4O5xaR0l5QZK3TdC6Sn4HXpXp5T4mLUh0PYcIPhc5CL4aRZNZQ3loQWGLB75N5NAQw5W0I_tqOoWqIa41TPAQcr7vgMAwdH5YkaUgw6G4W6Rmd1fl3yCXXlXGDB5eoNBHQD5gwNF_KWlLS_G4Kp06Q_4oPN5Q6z6QgOFKF4W6Rm41bWYm5T5JCKGs0bRWwOkfgGel785e5hgPFZIpl5QIoPkXf0CDKMQZC4Sm_aQbdmql7u5gZniW9w5YcOoQkXjGJj5z5h6s6u6QVRFnJ_Gr7u5fwmmW9B6YcRoRkXnG786E6QVSBHaGqGAP63G_RpKq3R6goSF_GWlqR_Clr0Ac6WsSZTgWul7wgTo1vW9PB1iWv0Aj6YZQs6At6YcNkHDv6ekUBXaGz0Ay6oBKShGIIpl5C3_aSGp6y0eXe1im5A9YoOkcoHYX9D9Ywcg1DN9eZdBXvWam7SgdZ2bX9S9YVcsdkmbm789T9gZeBmYmYm7SgeZ2fX9h9YccsekmfH7x_ggGim7c5u9hgfBXXl9jofcXjm796z9gVgcm5YcNcgBH6AAtkgcHnm7itgkmnm7tdNkHqX9fCmqm9jkhcHrm7xshkmrm7yshkHum7zghkmu1GJ_6R_dmaY79595Yolv1DsAeZjBXvXym7SgjZ2zX9xAYVZz1AzA343Sjp5GDx5SJGnImG4G0t5OJGoJ_G6KZGKSklLOJGONJSiC5SdxaQJ4reIYZa3bZeofJjo5NDYoiZtoXa2OF8rQoxaQekwBXXIb2ATDWwtkwg0en78DdDhcuFKJp4aRfCHb2AtoucXfn7DDjDgVvc16YcvotBH6vDtkvcHjn7CDyDgwv3Ii2mnXo58EYktcwomm2G0tLTJCGn2ADEJtJSgl5KIVxkHq2KLxLPZGp3QEgkxF_Fjx5QJCWr2AUE3_ZQoGp3dEgcyF_J_45QJC0v2AhEoC4Sm_aQbGp3jEgVzFZKW86KYczs6AvE35DxLQdtLNgGp7xEylXzIZlnYqIr2unuYvIy2znzn57HYkuZ7pXXo79DiAgk7CXvm9js7dmYo7ADNHgZ8C1Y2a3AQHYcvsiBH6SHts8dmbo7CDcHgZ9CXv1Atg9d1fo7DDhHgs9CXvXvm7iAsHtZAdXio7EDvHgkAGKFJ_6R_dHqo7zHE9Yo0mJD8IecBCmHAIgkB4muYvn5DIYsAxBp1qo7BhBlXqZ9eHekfB2rJrJro7SsC_nrZ9cIYZKu3AeIeVNB1vZvm7SoD_YvZ9jIYVEhmAtIecECmyoqm7SkE_IzZ9yIYkpz3A7LYopz3A9LlPE");
	// Bool<True|False>
	private static Type type12 = Runtime.Type("QFZFjx5Q3G_RpKq3vk1EJOJNgCMOIs2Az3HE7hGHYcYHhgJko2");
	// any
	private static Type type13 = Runtime.Type("Fs0");
	// False
	private static Type type14 = Runtime.Type("2K545QnKq3ukmD0E");
	// True
	private static Type type15 = Runtime.Type("2GJ8MS_CWDggIk2");
	// $1<^Value<Null|Tuple(^[$1...])|Bool<True|False>|Num(^real)|String(^string)|Set(^{$1...})>>
	private static Type type16 = Runtime.Type("PG_KWlLS_dmP3tJSglq3wkHE38oQjl5CDKMQZC4Sm_aQbG4Kp06Q_CmDgZnHeko79p3AD4_EEp6XlXl5NGnJ_Gr7vgmAQd1MYcKMgsK7Oxp5cCXDdpXP3G_RpKq3glHQJOJNgCMOIw5As4XQthWTYwnThkb9PB1HylmUeZl78_NkXXGgn2");
	// $25<Value<Null|Tuple(^[^$25...])|Bool<True|False>|Num(^real)|String(^string)|Set(^{^$25...})>>
	private static Type type17 = Runtime.Type("PG_KWlLS_GZIpl5QIg2AwFZFjx5QosJShGqJo8MPiS5KJK6RgKa9fCXHgZnHeko78p3AD4KEEp6XlXl5NGnJ_Gr79hmAQd1MYcKMgsK7Oxp5cCXDdpXP3G_RpKq3glHQJOJNgCMOIw5As4XQthWTYsnThkb9PBmEylmUeZl77_NkXXGgq2");
	// real
	private static Type type18 = Runtime.Type("Fc0");
	// $9<AExpr<Num(^real)|Sum(^[^real,^{|^$9...|}[^$9...]])|Mul(^[^real,^{|^$9...|}[^$9...]])|Div(^[^$9,^$9])|$40<VExpr<Var(^string)|$51<Fn(^[^string,$45<^Expr<$9|$51|$86<Value<Num(^real)|Null|Tuple(^[^$86...])|Bool<True|False>|String(^string)|Set(^{^$86...})>>|Tuple(^[$45...])|$126<BExpr<$40|Bool<True|False>|And(^{^$126...})|Or(^{^$126...})|Not(^$126)|Equals(^[$138<^Type<Atom<NotT($161<^Proton<TupleT(^[$161...])|SetT(^[^bool,$161])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$161...])|SetT(^[^bool,$161])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($138)|OrT(^{$138...})|AndT(^{$138...})|SetT(^[^bool,$138])|TupleT(^[$138...])|FunctionT(^[$138,$138,$138...])>>,^{|$45,$45|}[$45,$45]])|Inequality(^[^AType<IntT|RealT>,^$9])|Equation(^[^AType<IntT|RealT>,^$9])|SubsetEq(^[^SetT(^[^bool,$138]),^SExpr<$40|Set(^{$45...})>,^SExpr<$40|Set(^{$45...})>])|ForAll(^[^{^[^Var(^string),$138]...},^$126])|Exists(^[^{^[^Var(^string),$138]...},^$126])>>|SExpr<$40|Set(^{$45...})>>>...])>|Load(^[$45,^int])|LengthOf($45)>>>>
	private static Type type19 = Runtime.Type("PIJ4JGs0bRosJShGnJpp5CCK6QoFJPqG_K4W6Rm4_Icd5T95QVo7uZJA9dX5Yg2IgoZ9ACmIfV2LeZp7Bdp7SgKDRdHMYkYMgwp7xs4AdCmIECH6f_2Qeoq7ys5AjGYKW8685t5GBxLNZ4IYGbGXp5wGNkJOiS5ScxZOWorXp5zCmE75hZNcH5YZrX0AB53K3Tk8b9t5IgNBmY0aGDO5ecOBXTQ5gkOF_KWlLS_G4Kp06Q_G_F4W6Rm4Jb0uGX1im5d5WgZel5f5JCKGs0bRWkPoBhWfl7D5j5hVQFZIpl5QIcQkmi0G1xqQgGqJo8MPiSa9c6YwQkHD76eZRBmbWm0AA6Gt3j0nWy0zl5C6oBKOoCmjl9jVScHql7E6P6ggS3Xn0rl5S6YsOsSomr0GJ8MS_CGu0Ae6JOJNgCMOIkTkHvG7f6i6QwTBHj0yGAt6YsQgNkmyl7E5gZIzW9y6YwOwUk1X1C0t5OZwZRosoQoGLGlKMNgCMN95u6y97A9ATAQscFPZZQ_4MSWlLPo_6WGGlKMNo_qQi4meJio5P9Wwcgdg0b1WlJp8qR_GMGl4HbHmo5U9ZOoQm43QgGLGs_qRoCM7sIuIQge31e1fm5h9YVPseomfX9s9YZfgmAu9egfBXX1j1Ax9Ygckfkmjm7B9t9gZgF3Kt0MOeZj7mYlYl7SogVYnX9EAYkgVhBH6OAtchcmqm7C9RAgohFJFoxLQ3toQoG4CE86K34ZQZG4GIK5SJG5Kp06Q_G4_WGptqNo_qQiGKR8DfEsEuE7HCHQHQsiBmmmvHAsAZ0_RjGrQidXen7cAvAgkj3HzXen5yAYwhwjo1X2KGKMNmhq7vAgZnXY9BDYkioskXYY9RB1anym7SZtZYaY9QDYgiktkHbIBEDTDdEQwtBXy1eIAdD34ZQtGp3fDgkuF_Ipl5QJCWf2AjDJOpQdG5KIZvkXi2K1xqQgGp3wDgovFJHiG6KIwvk1m2KHKLNgGp39EggwFrJo8MPiS5KIowkXn2GL4aRJC1qnX0AOE35DxLQdtLNgGp7QEA5gkx3OouVvgvsvZwkwwwcxoxgWrn79DUEhVyB1u1n1AeEYkggmAgEeoyBHuXv2AjEYcisykHyn7NDBAYolyIDwEeozBmuXz2AzEYkgkHD8Hec7C1vmX3ABHYkgkgB1nXYJDEHeV8CHvHa3APHJ43Kt0MOew9CHboIYoWbJDUHeV9C1aHe3AeHWZwkwg0fo7RHhHhs9CHaHe3AsHeV7dHnoBuHvHvHYo0jJDxHesACXbmj3A7IWcNcChWmo7h5AIhkBCmYl9jsBdmno7E6NIgZCdHYl7QIBAYo0rJDSIesCCmro9jVDdHuo7eIt9YoluJDgIeoDCHeXv3AjIYcesDlHyZ9QBmYlyo7SkE_IzZ9yIYgrz3A7LYsrY0A9LlHE");
	// ^Num(^real)
	private static Type type20 = Runtime.Type("4CDKMQesY9PBXDwkHElD");
	// ^$13<Sum($11<^[^real,^{|$4<^$21<AExpr<$13|Num(^real)|Mul($11)|Div(^[$4,$4])|$41<VExpr<Var(^string)|$52<Fn(^[^string,$46<^Expr<$21|$52|$87<Value<Num(^real)|Null|Tuple(^[^$87...])|Bool<True|False>|String(^string)|Set(^{^$87...})>>|Tuple(^[$46...])|$127<BExpr<$41|Bool<True|False>|And(^{^$127...})|Or(^{^$127...})|Not(^$127)|Equals(^[$139<^Type<Atom<NotT($162<^Proton<TupleT(^[$162...])|SetT(^[^bool,$162])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$162...])|SetT(^[^bool,$162])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($139)|OrT(^{$139...})|AndT(^{$139...})|SetT(^[^bool,$139])|TupleT(^[$139...])|FunctionT(^[$139,$139,$139...])>>,^{|$46,$46|}[$46,$46]])|Inequality(^[^AType<IntT|RealT>,$4])|Equation(^[^AType<IntT|RealT>,$4])|SubsetEq(^[^SetT(^[^bool,$139]),^SExpr<$41|Set(^{$46...})>,^SExpr<$41|Set(^{$46...})>])|ForAll(^[^{^[^Var(^string),$139]...},^$127])|Exists(^[^{^[^Var(^string),$139]...},^$127])>>|SExpr<$41|Set(^{$46...})>>>...])>|Load(^[$46,^int])|LengthOf($46)>>>>>...|}[$4<^$21<AExpr<$13|Num(^real)|Mul($11)|Div(^[$4,$4])|$41<VExpr<Var(^string)|$52<Fn(^[^string,$46<^Expr<$21|$52|$87<Value<Num(^real)|Null|Tuple(^[^$87...])|Bool<True|False>|String(^string)|Set(^{^$87...})>>|Tuple(^[$46...])|$127<BExpr<$41|Bool<True|False>|And(^{^$127...})|Or(^{^$127...})|Not(^$127)|Equals(^[$139<^Type<Atom<NotT($162<^Proton<TupleT(^[$162...])|SetT(^[^bool,$162])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$162...])|SetT(^[^bool,$162])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($139)|OrT(^{$139...})|AndT(^{$139...})|SetT(^[^bool,$139])|TupleT(^[$139...])|FunctionT(^[$139,$139,$139...])>>,^{|$46,$46|}[$46,$46]])|Inequality(^[^AType<IntT|RealT>,$4])|Equation(^[^AType<IntT|RealT>,$4])|SubsetEq(^[^SetT(^[^bool,$139]),^SExpr<$41|Set(^{$46...})>,^SExpr<$41|Set(^{$46...})>])|ForAll(^[^{^[^Var(^string),$139]...},^$127])|Exists(^[^{^[^Var(^string),$139]...},^$127])>>|SExpr<$41|Set(^{$46...})>>>...])>|Load(^[$46,^int])|LengthOf($46)>>>>>...]]>)>
	private static Type type21 = Runtime.Type("QIoBKShdmIec0K0K3Tk8b9UCXEfVnEeVo7wZo7ScJDAd1IYcIIgs3CDKMQooJSgG2GdO6KLK3Tk8MJE_qPthNg0MYoIMhsp7Nl2AcCHLClXPYsYEYo0Qtoa9iCXLjl1ToNKNmGXGiG3Ij45OlsNsOcNhGU35BKaQbG6PEOL7ylNh0Xl7Q_NoXXW9OBXTB5goNFJGs0bRecQB0Yl7N5O5tcOcmal7vlOkHb0KL45QpK5KJK6RgK5K1K3Tk8MFT5d699t9QcP3mMf5QkPFpJ4W6Rm4HfWno5j5YwNVQoHi0GDK6QgCli0Aw538oQjl5OIGbRdtqOeZTB1m0AtZRcXml7c5A6gkR3KPx5C6v6x6QsRFnJ_Gr776fwHqW9P6YVSgSk1rG7E6S6QsSBmblrGAc63G_RpKq3e6ggTF_GWlqR_CGv0Ai6WkTwTg0yl7y5t6hcUBmj0Y0Aw6YVOkHDy6ewUB1e0X1A89o3ZQZGmImGYIjG6O44MSWlqRWhNgUwfZgggwhglY1dGHiKLRp45QdGMT3544MSWGMPjtL7gHuHQgd31a1bm5S935IKbNnK5S44M7T99IQVeFaGj8MFgl5O4WMPnGrRWZEhEh0fH7d9h9QseBHelfHAs9eZfBXim9jgfc1jm7A9x9gsfB1YHj1A7AYoccfkXm1GJ_6R_dXyX7N5N5YoWn1DEAeVhBHnHqm7SchZnqX9RAYscohkXr1G0GrQhGZIjG6KowZRJGJFiG5K3CKOoG4OJK6RgK5KJ55KbQYGMPjt5KldskyZzgzZ7t7l8hlvm7BAsAhZjF5Jmx5Sjta9fDYZikjkHzH7yAfDQwjB1u1XIA8DJ4KSW8rPYkjkHDBDeosBHvXY2AEDekl7ODwAYoWaIDQDektB1vHb2ATDlVtwtcyg0en7vAdDhcuFJFi_6KIkukHf2KDK6QgGp3jDgVvF_Kj_5OJCWi2AvDJ8oQjl5KIovkXj2G8t5SJC0m2A8EJ8KOWl5KIgwk1n2SIGbRdtqOJCWn2AEE3OKNmGp7OEB5gcxFNsoQh_aQWl5KYkxkNkHrIZWfIi2jnjYmIn2qnqYrn5UEYgsVyoHun7dACAggyBHnm9joycXvn7eAjEgVzBmumv2AuEYZtogBH6wEtozcXzn7gAzEgV7CHn1Atc7dmXo7hABHgo7CHnHnm7CAEHtV8dHao7iAPHgg8GKFJ_6R_d1io7THyBH6UHtV9dHeo7O9eHgg94XmInn5hHYo8t9pmfo7P9eHgZAdHXZ9DIngAlAlACH6xHtsAdmjo7U97IgZB4mXlqo5AIYsPkBpHno7N5fwmnZ9NIYVSZClXqZ9D5YkCpgBH6SItsCdmro7cIfwHuZ9eIYgDdfBH6gItoDdXvo7e9jIgVECmemv3AuIegl7N5wIYoGzJDyIewEC1U7LgZNCmUN5ggN4v$");
	// ^$13<Mul($11<^[^real,^{|$4<^$21<AExpr<$13|Num(^real)|Sum($11)|Div(^[$4,$4])|$41<VExpr<Var(^string)|$52<Fn(^[^string,$46<^Expr<$21|$52|$87<Value<Num(^real)|Null|Tuple(^[^$87...])|Bool<True|False>|String(^string)|Set(^{^$87...})>>|Tuple(^[$46...])|$127<BExpr<$41|Bool<True|False>|And(^{^$127...})|Or(^{^$127...})|Not(^$127)|Equals(^[$139<^Type<Atom<NotT($162<^Proton<TupleT(^[$162...])|SetT(^[^bool,$162])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$162...])|SetT(^[^bool,$162])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($139)|OrT(^{$139...})|AndT(^{$139...})|SetT(^[^bool,$139])|TupleT(^[$139...])|FunctionT(^[$139,$139,$139...])>>,^{|$46,$46|}[$46,$46]])|Inequality(^[^AType<IntT|RealT>,$4])|Equation(^[^AType<IntT|RealT>,$4])|SubsetEq(^[^SetT(^[^bool,$139]),^SExpr<$41|Set(^{$46...})>,^SExpr<$41|Set(^{$46...})>])|ForAll(^[^{^[^Var(^string),$139]...},^$127])|Exists(^[^{^[^Var(^string),$139]...},^$127])>>|SExpr<$41|Set(^{$46...})>>>...])>|Load(^[$46,^int])|LengthOf($46)>>>>>...|}[$4<^$21<AExpr<$13|Num(^real)|Sum($11)|Div(^[$4,$4])|$41<VExpr<Var(^string)|$52<Fn(^[^string,$46<^Expr<$21|$52|$87<Value<Num(^real)|Null|Tuple(^[^$87...])|Bool<True|False>|String(^string)|Set(^{^$87...})>>|Tuple(^[$46...])|$127<BExpr<$41|Bool<True|False>|And(^{^$127...})|Or(^{^$127...})|Not(^$127)|Equals(^[$139<^Type<Atom<NotT($162<^Proton<TupleT(^[$162...])|SetT(^[^bool,$162])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$162...])|SetT(^[^bool,$162])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($139)|OrT(^{$139...})|AndT(^{$139...})|SetT(^[^bool,$139])|TupleT(^[$139...])|FunctionT(^[$139,$139,$139...])>>,^{|$46,$46|}[$46,$46]])|Inequality(^[^AType<IntT|RealT>,$4])|Equation(^[^AType<IntT|RealT>,$4])|SubsetEq(^[^SetT(^[^bool,$139]),^SExpr<$41|Set(^{$46...})>,^SExpr<$41|Set(^{$46...})>])|ForAll(^[^{^[^Var(^string),$139]...},^$127])|Exists(^[^{^[^Var(^string),$139]...},^$127])>>|SExpr<$41|Set(^{$46...})>>>...])>|Load(^[$46,^int])|LengthOf($46)>>>>>...]]>)>
	private static Type type22 = Runtime.Type("QIooJSgdmIec0K0K3Tk8b9UCXEfVnEeVo7wZo7ScJDAd1IYcIIgs3CDKMQoBKShG2GdO6KLK3Tk8MJE_qPthNg0MYoIMhsp7Nl2AcCHLClXPYsYEYo0Qtoa9iCXLjl1ToNKNmGXGiG3Ij45OlsNsOcNhGU35BKaQbG6PEOL7ylNh0Xl7Q_NoXXW9OBXTB5goNFJGs0bRecQB0Yl7N5O5tcOcmal7vlOkHb0KL45QpK5KJK6RgK5K1K3Tk8MFT5d699t9QcP3mMf5QkPFpJ4W6Rm4HfWno5j5YwNVQoHi0GDK6QgCli0Aw538oQjl5OIGbRdtqOeZTB1m0AtZRcXml7c5A6gkR3KPx5C6v6x6QsRFnJ_Gr776fwHqW9P6YVSgSk1rG7E6S6QsSBmblrGAc63G_RpKq3e6ggTF_GWlqR_CGv0Ai6WkTwTg0yl7y5t6hcUBmj0Y0Aw6YVOkHDy6ewUB1e0X1A89o3ZQZGmImGYIjG6O44MSWlqRWhNgUwfZgggwhglY1dGHiKLRp45QdGMT3544MSWGMPjtL7gHuHQgd31a1bm5S935IKbNnK5S44M7T99IQVeFaGj8MFgl5O4WMPnGrRWZEhEh0fH7d9h9QseBHelfHAs9eZfBXim9jgfc1jm7A9x9gsfB1YHj1A7AYoccfkXm1GJ_6R_dXyX7N5N5YoWn1DEAeVhBHnHqm7SchZnqX9RAYscohkXr1G0GrQhGZIjG6KowZRJGJFiG5K3CKOoG4OJK6RgK5KJ55KbQYGMPjt5KldskyZzgzZ7t7l8hlvm7BAsAhZjF5Jmx5Sjta9fDYZikjkHzH7yAfDQwjB1u1XIA8DJ4KSW8rPYkjkHDBDeosBHvXY2AEDekl7ODwAYoWaIDQDektB1vHb2ATDlVtwtcyg0en7vAdDhcuFJFi_6KIkukHf2KDK6QgGp3jDgVvF_Kj_5OJCWi2AvDJ8oQjl5KIovkXj2G8t5SJC0m2A8EJ8KOWl5KIgwk1n2SIGbRdtqOJCWn2AEE3OKNmGp7OEB5gcxFNsoQh_aQWl5KYkxkNkHrIZWfIi2jnjYmIn2qnqYrn5UEYgsVyoHun7dACAggyBHnm9joycXvn7eAjEgVzBmumv2AuEYZtogBH6wEtozcXzn7gAzEgV7CHn1Atc7dmXo7hABHgo7CHnHnm7CAEHtV8dHao7iAPHgg8GKFJ_6R_d1io7THyBH6UHtV9dHeo7O9eHgg94XmInn5hHYo8t9pmfo7P9eHgZAdHXZ9DIngAlAlACH6xHtsAdmjo7U97IgZB4mXlqo5AIYsPkBpHno7N5fwmnZ9NIYVSZClXqZ9D5YkCpgBH6SItsCdmro7cIfwHuZ9eIYgDdfBH6gItoDdXvo7e9jIgVECmemv3AuIegl7N5wIYoGzJDyIewEC1U7LgZNCmUN5ggN4v$");
	// AType<IntT|RealT>
	private static Type type23 = Runtime.Type("QFKFJ_6R_GJHiG6KIg2AwF_J_45QJCWEgwI7xVo58CXD9pmH0IE");
	// $12<Mul($10<^[^real,^{|$3<^$20<AExpr<$12|Num(^real)|Sum($10)|Div(^[$3,$3])|$40<VExpr<Var(^string)|$51<Fn(^[^string,$45<^Expr<$20|$51|$86<Value<Num(^real)|Null|Tuple(^[^$86...])|Bool<True|False>|String(^string)|Set(^{^$86...})>>|Tuple(^[$45...])|$126<BExpr<$40|Bool<True|False>|And(^{^$126...})|Or(^{^$126...})|Not(^$126)|Equals(^[$138<^Type<Atom<NotT($161<^Proton<TupleT(^[$161...])|SetT(^[^bool,$161])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$161...])|SetT(^[^bool,$161])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($138)|OrT(^{$138...})|AndT(^{$138...})|SetT(^[^bool,$138])|TupleT(^[$138...])|FunctionT(^[$138,$138,$138...])>>,^{|$45,$45|}[$45,$45]])|Inequality(^[^AType<IntT|RealT>,$3])|Equation(^[^AType<IntT|RealT>,$3])|SubsetEq(^[^SetT(^[^bool,$138]),^SExpr<$40|Set(^{$45...})>,^SExpr<$40|Set(^{$45...})>])|ForAll(^[^{^[^Var(^string),$138]...},^$126])|Exists(^[^{^[^Var(^string),$138]...},^$126])>>|SExpr<$40|Set(^{$45...})>>>...])>|Load(^[$45,^int])|LengthOf($45)>>>>>...|}[$3<^$20<AExpr<$12|Num(^real)|Sum($10)|Div(^[$3,$3])|$40<VExpr<Var(^string)|$51<Fn(^[^string,$45<^Expr<$20|$51|$86<Value<Num(^real)|Null|Tuple(^[^$86...])|Bool<True|False>|String(^string)|Set(^{^$86...})>>|Tuple(^[$45...])|$126<BExpr<$40|Bool<True|False>|And(^{^$126...})|Or(^{^$126...})|Not(^$126)|Equals(^[$138<^Type<Atom<NotT($161<^Proton<TupleT(^[$161...])|SetT(^[^bool,$161])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$161...])|SetT(^[^bool,$161])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($138)|OrT(^{$138...})|AndT(^{$138...})|SetT(^[^bool,$138])|TupleT(^[$138...])|FunctionT(^[$138,$138,$138...])>>,^{|$45,$45|}[$45,$45]])|Inequality(^[^AType<IntT|RealT>,$3])|Equation(^[^AType<IntT|RealT>,$3])|SubsetEq(^[^SetT(^[^bool,$138]),^SExpr<$40|Set(^{$45...})>,^SExpr<$40|Set(^{$45...})>])|ForAll(^[^{^[^Var(^string),$138]...},^$126])|Exists(^[^{^[^Var(^string),$138]...},^$126])>>|SExpr<$40|Set(^{$45...})>>>...])>|Load(^[$45,^int])|LengthOf($45)>>>>>...]]>)>
	private static Type type24 = Runtime.Type("PIooJSgdX5J4JGs0bResp7xg1DycmEYg2HYoGHtcZ9ACXDBlHIosJShGnJpp5C3_aSJOKGs0bRGt3PeWbXl5QC1ERpHMYwoDgwp7Nl3AdCHExBH6f_2Qeoq7Ot5AjGYKW8685t5GBxLNZ4IYGbGXp5wGNkJOiS5ScxZOWorXp5zCXL75hZNcH5YZrX0AB53K3Tk8b9t5IgNBmY0aGDO5ecOBXTQ5gkOF_KWlLS_G4Kp06Q_G_F4W6Rm4Jb0uGX1im5d5Ws_el5f5JCKGs0bRWkPoBhWfl7D5j5hVQFZIpl5QIcQkmi0G1xqQgGqJo8MPiSa9c6YwQkHD76eZRBmbWm0AA6GW5j0nWy0zl5C6oBKOoCmjl9jVScHql7E6P6ggS3Xn0rl5S6YsOsSomr0GJ8MS_CGu0Ae6JOJNgCMOIkTkHvG7f6i6QwTBHj0yGAt6YsQgNkmyl7E5gZIzW9y6YwOwUk1X1C0t5OZwZRosoQoGLGlKMNgCMN95u6y97A9ATAQscFPZZQ_4MSWlLPo_6WGGlKMNo_qQi4meJio5P9Wwcgdg0b1WlJp8qR_GMGl4HbHmo5U9ZOoQm43QgGLGs_qRoCM7sIuIQge31e1fm5h9YVPseomfX9s9YZfgmAu9egfBXX1j1Ax9Ygckfkmjm7B9t9gZgF3Kt0MOeZj7mYlYl7SogVYnX9EAYkgVhBH6OAtchcmqm7C9RAgohFJFoxLQ3toQoG4CE86K34ZQZG4GIK5SJG5Kp06Q_G4_WGptqNo_qQiGKR8DfEsEuE7HCHQHQsiBmmmvHAsAZ0_RjGrQidXen7cAvAgkj3HzXen5yAYwhwjo1X2KGKMNmhq7vAgZnXY9BDYkioskXYY9RB1anym7SZtZYaY9QDYgiktkHbIBEDTDdEQwtBXy1eIAdD34ZQtGp3fDgkuF_Ipl5QJCWf2AjDJOpQdG5KIZvkXi2K1xqQgGp3wDgovFJHiG6KIwvk1m2KHKLNgGp39EggwFrJo8MPiS5KIowkXn2GL4aRJC1qnX0AOE35DxLQdtLNgGp7QEA5gkx3OouVvgvsvZwkwwwcxoxgWrn79DUEhVyB1u1n1AeEYkggmAgEeoyBHuXv2AjEYcisykHyn7NDBAYolyIDwEeozBmuXz2AzEYkgkHD8Hec7C1vmX3ABHYkgkgB1nXYJDEHeV8CHvHa3APHJ43Kt0MOew9CHbJEYoWbJDUHeV9C1aHe3AeHWZwkwg0fo7RHhHhs9CHaHe3AsHeV7dHnoBuHvHvHYo0jJDxHesACXbmj3A7IWcNcChWmo7h5AIhkBCmYl9jsBdmno7E6NIgZCdHYl7QIBAYo0rJDSIesCCmro9jVDdHuo7eIt9YoluJDgIeoDCHeXv3AjIYcesDlHyZ9QBmYlyo7SkE_IzZ9yIYgrz3A7LYsrY0A9LWIE");
	// IntT
	private static Type type25 = Runtime.Type("2G8t5SJCWDggIk2");
	// RealT
	private static Type type26 = Runtime.Type("2KHKLNgGp3ukmD0E");
	// $7<Set(^{$2<^Expr<$44<Value<Null|Tuple(^[^$44...])|Bool<True|False>|Num(^real)|String(^string)|Set(^{^$44...})>>|Tuple(^[$2...])|Fn(^[^string,$2...])|$95<BExpr<Bool<True|False>|VExpr<Fn(^[^string,$2...])|Var(^string)|Load(^[$2,^int])|LengthOf($2)>|And(^{^$95...})|Or(^{^$95...})|Not(^$95)|Equals(^[$127<^Type<Atom<NotT($150<^Proton<TupleT(^[$150...])|SetT(^[^bool,$150])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$150...])|SetT(^[^bool,$150])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($127)|OrT(^{$127...})|AndT(^{$127...})|SetT(^[^bool,$127])|TupleT(^[$127...])|FunctionT(^[$127,$127,$127...])>>,^{|$2,$2|}[$2,$2]])|Inequality(^[^AType<IntT|RealT>,$233<^AExpr<Num(^real)|VExpr<Fn(^[^string,$2...])|Var(^string)|Load(^[$2,^int])|LengthOf($2)>|Sum(^[^real,^{|$233...|}[$233...]])|Mul(^[^real,^{|$233...|}[$233...]])|Div(^[$233,$233])>>])|Equation(^[^AType<IntT|RealT>,$233])|SubsetEq(^[^SetT(^[^bool,$127]),^SExpr<$7|VExpr<Fn(^[^string,$2...])|Var(^string)|Load(^[$2,^int])|LengthOf($2)>>,^SExpr<$7|VExpr<Fn(^[^string,$2...])|Var(^string)|Load(^[$2,^int])|LengthOf($2)>>])|ForAll(^[^{^[^Var(^string),$127]...},^$95])|Exists(^[^{^[^Var(^string),$127]...},^$95])>>|AExpr<Num(^real)|VExpr<Fn(^[^string,$2...])|Var(^string)|Load(^[$2,^int])|LengthOf($2)>|Sum(^[^real,^{|$233...|}[$233...]])|Mul(^[^real,^{|$233...|}[$233...]])|Div(^[$233,$233])>|SExpr<$7|VExpr<Fn(^[^string,$2...])|Var(^string)|Load(^[$2,^int])|LengthOf($2)>>>>...})>
	private static Type type27 = Runtime.Type("PIoBKOoGJGs0bRewp7wgmAxcXEYcnEgV3KL45QpK5KJK6RgK585t5K1K3Tk8MFD5v586t6Qs3K0K3Tk8M7El9hGLJCKGs0bRWcpuo5RCmDSpXM3tJSglq3clHP38oQjl5CDKMQZC4Sm_aQbdXYl7ilHDjd1TYgJTgcMJeh6eleWfl5wCXQfwXUewr7uVNkHXG7xdNglXl79lNoHY0GJ8MS_ClY0AN5JOJNgCMOIcOkmaG7O5R5QoOBmPT5hwOcX5YkLe0Ae5eZl7hlPkHfl7wkHDj5eVQBmHt5gcQB0fl7wkQZIjW9y5Ykoj0A76JOKGs0bRo3ZQZGmImGYIjG6O44MSWlqRWWPccgeoewegggln0dGHiKLRp45QdGMT3544MSWGMPjtL7OHEIQgS31q0rl5S635IKbNnK5S44M7T6UIQVTFaGj8MFgl5O4WMPnGrRWZNhNh0vG7d6h6QsTBHIj6hVUFYKW86GBxLNZ4Im0Ymam5w635BKaQbG6PEOL7x6S9QwUBXm0XHA89YcUkPkmXX9QB1EC9YoWYHDE9eVdBmyGa1AP9YsUk2AR9eZUBXbm9jwdc1em7A6d9gceB1nGe1Ag9YoRsdkXf1GJ_6R_dXrX7wkn7ScfVniX9w9YZfofBH6y9twfc1mm7D68AgcgFJFoxLQ3toQoG4CE86K34ZQZG4GIK5SJG5Kp06Q_G4_WGptqNo_qQiGKRiANESEUEhEuE7HQghB1i1rHASAZ0_RjGrQidmYn7CAcAgZi3XumYn5fAYkgkioHv1KGKMNmhq7cAgZ2yX9tAYZhcjkmyX9RBHz1um7SsjZnzX97DYVhZskXXIBwAADDEQksBmrHYIADD34ZQtGp3NDgZtF_Ipl5QJCla2ARDJOpQdG5KIstkmb2K1xqQgGp3dDgcuFJHiG6KIkukHf2KHKLNgGp3jDgVvFrJo8MPiS5KIcvkmi2GL4aRJCHj2f0AyD35DxLQdtLNgGp77Eg5gZw3OctotVugusuZvkvwvcwglmn7jABEhowBHnHi1AEEYZfgmAOEecxBXnmq2AREYwggxkXrn7xAt9Yo0uIDdEecyB1qmu2AgEYZfkHDiEewyBHq1y2AtEYZfZfBHimyIDwEeozBXqXz2AzEJ43Kt0MOeo8d1fo79HAHYo0YJDCHes7CHqlY3ANHWsuZvgWao78HQHhk8GnJpp5CCK6QoFJPq4peWXHjojJno5dHYV_eJAfHYg7h1DhHes9CHelfo7SVA_IiZ9uHYs8hAl1jo7UHvHgsACmXoXo7SVB_ImZ99IYV9hBl1no7P6EHgsBdHvY9fInVC_C_CCH6PItgCd1ro7U6SIgsC4HH99QVDCmLdIhcDd1Ym7gIt9YoGvJDiIewDC1yo9jZEdXyo7vIT9Yo0zJDxIesECXulz3A7LYgTwElXXKZo2");
	// $6<SExpr<$16<VExpr<Var(^string)|$27<Fn(^[^string,$21<^Expr<$6|$27|$62<Value<Null|Tuple(^[^$62...])|Bool<True|False>|Num(^real)|String(^string)|Set(^{^$62...})>>|Tuple(^[$21...])|$105<BExpr<$16|Bool<True|False>|And(^{^$105...})|Or(^{^$105...})|Not(^$105)|Equals(^[$117<^Type<Atom<NotT($140<^Proton<TupleT(^[$140...])|SetT(^[^bool,$140])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$140...])|SetT(^[^bool,$140])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($117)|OrT(^{$117...})|AndT(^{$117...})|SetT(^[^bool,$117])|TupleT(^[$117...])|FunctionT(^[$117,$117,$117...])>>,^{|$21,$21|}[$21,$21]])|Inequality(^[^AType<IntT|RealT>,$223<^AExpr<$16|Num(^real)|Sum(^[^real,^{|$223...|}[$223...]])|Mul(^[^real,^{|$223...|}[$223...]])|Div(^[$223,$223])>>])|Equation(^[^AType<IntT|RealT>,$223])|SubsetEq(^[^SetT(^[^bool,$117]),^$6,^$6])|ForAll(^[^{^[^Var(^string),$117]...},^$105])|Exists(^[^{^[^Var(^string),$117]...},^$105])>>|AExpr<$16|Num(^real)|Sum(^[^real,^{|$223...|}[$223...]])|Mul(^[^real,^{|$223...|}[$223...]])|Div(^[$223,$223])>>>...])>|Load(^[$21,^int])|LengthOf($21)>>|Set(^{$21...})>>
	private static Type type28 = Runtime.Type("PIJCKGs0bRJOKGs0bRoBKOo4XLALQon7usIAzFYKW8685t5GBxLNZ4IMhlEh0I35BKaQbG6PEOL7CtEhlIYg2LhZ_9OBHHQl1M3K3Tk8b985Igp7UWLDddXPYcoPgk5KL45QpK5KJK6RgK5K1K3Tk8MFhWQkSgcgGTJ4JGs0bRWcbao5w41HxhWUYspUhVNFZIpl5QIcNkmX0G1xqQgGYIpp5OIGbRdtqOeVQB1a0AtZOcXal7jhOk1bGJB5S596C6E6QsOB1al9jVPcHel7wcPkmeG7U5g5QoPBXQi5hwPF3KmKMOIZQkXi0K545QnKq3w5goQ3miWjl5z5YoNVRoHmW9PBXYlm0AB6YwNg4AD6Yw4AtVScHql7jdSkmq0C0t5OZwZRosoQoGLGlKMNgCMNPdRZdgdodZfgGu0dGHiKLRp45QdGMT3544MSWGMPjtL7zExHQoT3XuWvl5j635IKbNnK5S44M7s6CIQcUFaGj8MFgl5O4WMPnGrRWgDpDhWzG7v6z6QVcB1T89hcccmXm7B9fwHYX9D9YoSwck1am7T6E9gcdBmr0Y1AR93GKTkKa9BAXwpMYo0e1Dd9eceBmbmem7SkeZIfX9i9YVTwek1i1G0GrQhGZIjG6KowZRJGJFiG5K3CKOoG4OJK6RgK5KJ55KbQYGMPjt5KllhsvgwowgxVysygGmm7T99AhggF5Jmx5Sjta9xAYgfsgkmnH7NAxAQZhBXiXqHAQAJ4KSW8rPYsgkHDTAewhBmj1u1AdAekl7fADAYo0vHDhAesiBXjmv1AsAlciZjkvgWym7CAvAhkjFJFi_6KIsjkmz1KDK6QgGp38DgcsF_Kj_5OJC0Y2ACDJ8oQjl5KIwsk1a2G8t5SJCWa2AQDJ8KOWl5KIotkXb2SIGbRdtqOJC0e2AdD3OKNmGp7fDQl1f2WWIjpLPi45QJCXfnLgwu3OVsgsssZtktwtcuouVvgGin7SAuDhgvBmimb1AxDYwdgmAzDeVwB1jHm2A9EYofZwk1nn7fAU9YoWnIDEEeVxBXjHq2APEYwdkHDREeoxBmjXr2AUEYwdwdBmbHuIDeEegyB1m1v2AhEJ43Kt0MOeg7dXao7sEtEYoWyIDvEekzBmuGz2AyEWktwtg0Xo7jE8Hhc7GnJpp5CCK6QoFJPq4_LC6fHhHvHQw7CmTNHhZ8CHyn9sg8d1bo7A6SHYoWbJDUHeV9C1YJe3AeHYo7_9l1fo7tEtEYoWfJDjHeVACXYJi3AuHYkTozk1jZ9QEeVoByHzHzHYo0mJD8IecBCHylm3ABIeop7DIU9YolnJDNIeZCCXqo9jgCd1ro7SIB9YoWrJDUIeVDC1zGu3AeIYoUZDl1vZ9QBmMiIYolvJDsIeZECmHuIggECXIUlHzo7UhmAzIeVNC1E8LgcN47x");
	// $9<SetT(^[^bool,$3<^Type<$9|Atom<NotT($21<^Proton<TupleT(^[$21...])|SetT(^[^bool,$21])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$21...])|SetT(^[^bool,$21])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($3)|OrT(^{$3...})|AndT(^{$3...})|TupleT(^[$3...])|FunctionT(^[$3,$3,$3...])>>])>
	private static Type type29 = Runtime.Type("763CKOoG_9RF3Kt0MOeop7von7SsIDzc1HYcIHgc3G0GrQhGZIjG6KowZRJGJFiG5KZGKSklLOJGONJSiC5SdxaQJ4rHhxRkSsSgTZUgWLYknLhk4OF8rQoxaQeoNBHIUl1PWZLYl5eC1Ifp1QJ4KSW8rPYw4Atwa9sC1LtlXTYgnMYo0Utob9yCXDzl1XGBv_NoRgWXl7ThNo1Y0G0tLTJCWY0AE5JtJSgl5KIZOkXa0KLxLPZGp3R5goOF_Fjx5QJClb0Ac53_ZQoGp3e5ggPF_J_45QJCGf0Ai5oC4Sm_aQbGp3s5gZQFZKW86KeZl7v5w5goQFNsoQh_aQWl5KYwQkQk1mGZ0alaWbGe0flfWiWjGml596YsqmGAB6YoJEgsRBHEfw1qW9O6YsZq0AQ6YwZq0AS6Yo2AtwSc1ul7N_TkXul7xon7xkTZIvW9i6YZpv0As6lH");
	// ^$7<Set(^{$2<^Value<$7|Null|Tuple(^[$2...])|Bool<True|False>|Num(^real)|String(^string)>>...})>
	private static Type type30 = Runtime.Type("QGnJ_G6KL45QpKa9gC1EfwHEesn7uw2A7dHH3tJSglq3Al1I38oQjl5CDKMQZC4Sm_aQbG4Kp06Q_C1EgZYLegp7Ol4AS4KITtMX0Yl5U4HHchGPYgYPhg5GJ8MS_CGQgs5K545QnKq3slHTWwaTQgr7DlMAxdX5YwoUgVNcH5YV_X0AA5WH");
	// ^$8<Set(^{$3<^Expr<$45<Value<Null|Tuple(^[^$45...])|Bool<True|False>|Num(^real)|String(^string)|Set(^{^$45...})>>|Tuple(^[$3...])|Fn(^[^string,$3...])|$96<BExpr<Bool<True|False>|VExpr<Fn(^[^string,$3...])|Var(^string)|Load(^[$3,^int])|LengthOf($3)>|And(^{^$96...})|Or(^{^$96...})|Not(^$96)|Equals(^[$128<^Type<Atom<NotT($151<^Proton<TupleT(^[$151...])|SetT(^[^bool,$151])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$151...])|SetT(^[^bool,$151])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($128)|OrT(^{$128...})|AndT(^{$128...})|SetT(^[^bool,$128])|TupleT(^[$128...])|FunctionT(^[$128,$128,$128...])>>,^{|$3,$3|}[$3,$3]])|Inequality(^[^AType<IntT|RealT>,$234<^AExpr<Num(^real)|VExpr<Fn(^[^string,$3...])|Var(^string)|Load(^[$3,^int])|LengthOf($3)>|Sum(^[^real,^{|$234...|}[$234...]])|Mul(^[^real,^{|$234...|}[$234...]])|Div(^[$234,$234])>>])|Equation(^[^AType<IntT|RealT>,$234])|SubsetEq(^[^SetT(^[^bool,$128]),^SExpr<$8|VExpr<Fn(^[^string,$3...])|Var(^string)|Load(^[$3,^int])|LengthOf($3)>>,^SExpr<$8|VExpr<Fn(^[^string,$3...])|Var(^string)|Load(^[$3,^int])|LengthOf($3)>>])|ForAll(^[^{^[^Var(^string),$128]...},^$96])|Exists(^[^{^[^Var(^string),$128]...},^$96])>>|AExpr<Num(^real)|VExpr<Fn(^[^string,$3...])|Var(^string)|Load(^[$3,^int])|LengthOf($3)>|Sum(^[^real,^{|$234...|}[$234...]])|Mul(^[^real,^{|$234...|}[$234...]])|Div(^[$234,$234])>|SExpr<$8|VExpr<Fn(^[^string,$3...])|Var(^string)|Load(^[$3,^int])|LengthOf($3)>>>>...})>
	private static Type type31 = Runtime.Type("QIoBKOodXH3K3Tk8b9cCHEfwXEewn7uV3A8G_KWlLS_G4Kp06Q_GXGiG_F4W6Rm4oY0jWmWyl5EGKF4W6Rm41LhHQc4KIK3Tk8M7QlDhGMYkYMhw4GDK6QgCGPgc5G1xqQgGYIpp5OIGbRdtqOewNBmQgZ2TeZr7Bd6Av4pPw_PkPwPgGUYwq9jwb975YcIX0A95WsrXl5B5YgJYGAD53G_RpKq3N5gZOF_GWlqR_Cla0AR5WcOoOgWbl7gxOo1eW9PBHQe5ggPcH5YsLf0Ai5Yo2AtVQcHil7BdQkmil3h5YoIjGDy5ewQBHI76gZRF_K4W6RmGIFiG58E86CDx5SZKJRp45Qn4LelX1fXf1i1nm5N6Z58tLOlKMNg_5StGNJJRp45SdxaQWc8WCh0rG7O6S6QsSFNBKSXCMOoKJRWwSVDhGu0O5xaR0l5QZK3TdC6Sn4XX4Yp5h6WcTsTglvl7DWUoHy0CL4aR3loQWGLB96C9R9QoUFNkJOiS5ScxZOWsUsdg0Xm7A689hccBmyGf0AB9egl7xscBH6E9tVdcHam7w6P9ggdBmzGEgodcXyl7U9fw1eX9d9YkRcekmem7C6e9goeBXnlb1Aj93GKTkKa9UAXoIEYoli1Dw9eofBXiXjm7SwfZ2mX98AYwRcgkmm1G0GrQhGZIjG6KowZRJGJFiG5K3CKOoG4OJK6RgK5KJ55KbQYGMPjt5KlxiZxsxVysygzZ7h0rm7t9SAhshF5Jmx5Sjta9NDYsgZikXuH7fANDQkiBHnHvHAiAJ4KSW8rPYZikHDtAecjBXqmy1AwAekl7yAdAYolzHD7DeZsBHqXX2AADlojkswwgGYn7cADDhwsFJFi_6KIZtkXa2KDK6QgGp3RDgotF_Kj_5OJClb2AcDJ8oQjl5KIcukme2G8t5SJCGf2AiDJ8KOWl5KIVvkHi2SIGbRdtqOJCli2AwD3OKNmGp7yDh5gwvFNsoQh_aQWl5KYZwoPkXmIZlaYbIe2fnfYiIj2mnmn5BEYVjowoXnn7DAu9gVxBXim9jcxcmqn7EAREgoxB1q1r2AUEYsjcfBH6dEtcycmun7OAgEgoyBXi1Atwyc1yn7PAtEgczBXiXim7u9wEtozcXzn7QAzEgV7GKFJ_6R_dXbZ9hHYg7l7CH6CHts7dmYo7P6NHgZ84mfYin5QHYc7l8pHb3CIKMQooJSgG2GdOMJg5A9yH7IDIQc9CHLfHhk9C1Yo9ss9dmfo7e5sHYoGiJDuHegACmb3j3AxHYV9lAlmjo7BHBHYoGmJD9IegBCHe3n3ACIYgSV8lmnZ9iEekDCIqZqZqo7SgC_2rZ9SIYVTsClmrJ79hcgGuo7RdDpmuZ9C9YoDdfBH6iItwDd1yo7tIfwXyZ9vIYkExdBH6xItsEdmzo7f67LgZNC1v0X4AALlD");
	// Var(^string)
	private static Type type32 = Runtime.Type("3CL4aReZl7ug2Aw3x$");
	// ^Bool<True|False>
	private static Type type33 = Runtime.Type("RFZFjx5Qeo3GJ8MS_C0Ego2K545QnKq3zk1HWsIHQco7ugJAB4vw");
	// $10<SubsetEq(^[^$19<SetT(^[^bool,$13<^Type<$19|Atom<NotT($31<^Proton<TupleT(^[$31...])|SetT(^[^bool,$31])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$31...])|SetT(^[^bool,$31])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($13)|OrT(^{$13...})|AndT(^{$13...})|TupleT(^[$13...])|FunctionT(^[$13,$13,$13...])>>])>,^$111<SExpr<$121<VExpr<Var(^string)|$131<Fn(^[^string,$125<^Expr<$111|$131|$166<Value<Null|Tuple(^[^$166...])|Bool<True|False>|Num(^real)|String(^string)|Set(^{^$166...})>>|Tuple(^[$125...])|$208<BExpr<$10|$121|Bool<True|False>|And(^{^$208...})|Or(^{^$208...})|Not(^$208)|Equals(^[$13,^{|$125,$125|}[$125,$125]])|Inequality(^[^AType<IntT|RealT>,$231<^AExpr<$121|Num(^real)|Sum(^[^real,^{|$231...|}[$231...]])|Mul(^[^real,^{|$231...|}[$231...]])|Div(^[$231,$231])>>])|Equation(^[^AType<IntT|RealT>,$231])|ForAll(^[^{^[^Var(^string),$13]...},^$208])|Exists(^[^{^[^Var(^string),$13]...},^$208])>>|AExpr<$121|Num(^real)|Sum(^[^real,^{|$231...|}[$231...]])|Mul(^[^real,^{|$231...|}[$231...]])|Div(^[$231,$231])>>>...])>|Load(^[$125,^int])|LengthOf($125)>>|Set(^{$125...})>>,^$111])>
	private static Type type34 = Runtime.Type("PI35IKbNnK5S446GIK5SJdHMJCKGs0bReZdB2Eysn7SwID7dHHYcYHggZ9RF3Kt0MOewq7Cxo7SVKDOdXLYgnLgk4G0GrQhGZIjG6KowZRJGJFiG5KZGKSklLOJGONJSiC5SdxaQJ4MMz_TsTVUoUgcg0QYsJQhs5OF8rQoxaQewOBmMtlXTWgrbl5wCXMxpXUJ4KSW8rPYZ6AtZNcXXl7ehNk1Yl7C_r7SsNZnYW9N5YgIa0AP5loNgOwSg0bl7spOoXb0G0tLTJC0e0Ad5JtJSgl5KIgPk1f0KLxLPZGp3i5gwPF_Fjx5QJCGi0Au53_ZQoGp3w5goQF_J_45QJClj0A76oC4Sm_aQbGp396ggRFZKW86KeZl7C6D6gwRFNsoQh_aQWl5KYZSsRkXqGZWeGf0iliWjGm0n0qlql5R6YVNoSoXrl7Ux3Ac6Ywo9jcTcmul7clTkHvl7dlTkmvl7ElHDt6ecUBXPv6gkUBmIECmIy6twUc1Xm7f_ckXX1KLK3Tk86CIK5SWgegNhWYm7xwco1a1CL4aRZNZQ3loQWGLBh9x9wIQodFNkJOiS5ScxZOWsdsEh0em7B9d9hceBXaXn0Ag93K3Tk8b9OAIsRBmf1iHDt9ecfBmami1Aw9JOKNgKMOJGKSklLOJ8JGs0bR0pfVskucxgGm1K0K3Tk8M79AeHQkg3HaHnm5DAYsewgo1q1GDK6QgCWq1AQA38oQjl5CDKMQZC4Sm_aQbd1Xn7cAgZIuX9eAYwfgik1vHJRAhAPDSDUDQsiB1um9jVjcHym7C9uAggj3mv1zm5xAYsfsjomz1GJ8MS_CGX2A9DJOJNgCMOIkskHYI7ADDDQwsBHr1aIAODecl7TAQDgktBmrXn0ATDYwekHDcDeZuBmjXe2AfDo3ZQZGmImGYIjG6O44MSWlqRWhectVycykyszgGi2dGHiKLRp45QdGMT3544MSWGMPjtL7EHCIQov3XiYjn5zDWk3mn58EZOoQm43QgGLGs_qRoCM7fIhIQow3XmYnn5EEYVgVxoHqY9PEYgxgmAREeoxBHfYr2AUEYsusxkHun7jDQEggy7mfmfm7SoyVYvY9jEYw3yn7SZzZYyY9vEYVvkzkHz2K0GKTkKa9QHec9C1XJXo7Sc7_nXZ9BHYgvo7lXYJ7y586QV8CmzIaJAPHoBKShGIIpl5C3_aSGheotgApAhBhlbo7AAcHhZ9CHXo9sg9d1fo7QDhHYoWfJDjHeVAC1bJi3AuHYo8_Al1jo78H8HYoWjJDzHeVBCXbJm3A9IYkvo7l1nZ9h9YsBxo7SwB_2qZ9OIYcChmAQIekCCHroqn7SsC_nrZ9cIYgwZDlXuo7BEdIgkDdm5YwesDCH6jItVEdHyo7R9uIggECmbmf1AxIYwegmAzIeVNCHYHX4A9L0I");
	// Atom<NotT($3<^Proton<TupleT(^[$3...])|SetT(^[^bool,$3])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$3...])|SetT(^[^bool,$3])|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>
	private static Type type35 = Runtime.Type("xGJFoxLQZ0_RjGrQiGZIjG6Kesq7wo2Ay3mEih0HYcIHhc3KGKMNmh5OJK6RgK5KYo2AtsZ9ECHINlHL3CKOoG_9RB1MxBH6S_YMewp7QW5Ad4YLetPglPYg2Qho5G0tLTJClQgV6KDK6QgGp3ulmTJOpQdG5KIo6AyG_Fjx5QJC0X0A853_ZQoGp3A5gkNF_J_45QJCWY0AE5oC4Sm_aQbGp3O5gcOFZKW86KeZl7R5S5gsOFNsoQh_aQWl5KYVPoOkHeGZGTwxbXGY0alalbWel5f5Yk3fGAh5lHE");

	// =========================================================================
	// Patterns
	// =========================================================================

	private final static Pattern.Term pattern0 = new Pattern.Term("NotT",
		new Pattern.Leaf(type0),
		null);
	private final static Pattern.Term pattern1 = new Pattern.Term("NotT",
		new Pattern.Leaf(type1),
		null);
	private final static Pattern.Term pattern2 = new Pattern.Term("NotT",
		new Pattern.Term("NotT",
			new Pattern.Leaf(type2),
			"t"),
		null);
	private final static Pattern.Term pattern3 = new Pattern.Term("NotT",
		new Pattern.Term("OrT",
			new Pattern.Set(true, new Pair[]{
				new Pair(new Pattern.Leaf(type2), "es")}),
			null),
		null);
	private final static Pattern.Term pattern4 = new Pattern.Term("NotT",
		new Pattern.Term("AndT",
			new Pattern.Set(true, new Pair[]{
				new Pair(new Pattern.Leaf(type2), "es")}),
			null),
		null);
	private final static Pattern.Term pattern5 = new Pattern.Term("AndT",
		new Pattern.Set(false, new Pair[]{}),
		null);
	private final static Pattern.Term pattern6 = new Pattern.Term("AndT",
		new Pattern.Set(false, new Pair[]{
			new Pair(new Pattern.Leaf(type2), "t")}),
		null);
	private final static Pattern.Term pattern7 = new Pattern.Term("AndT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("AndT",
				new Pattern.Set(true, new Pair[]{
					new Pair(new Pattern.Leaf(type2), "xs")}),
				null),null), 
			new Pair(new Pattern.Leaf(type2), "ys")}),
		null);
	private final static Pattern.Term pattern8 = new Pattern.Term("AndT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("OrT",
				new Pattern.Set(true, new Pair[]{
					new Pair(new Pattern.Leaf(type2), "xs")}),
				null),null), 
			new Pair(new Pattern.Leaf(type2), "ys")}),
		null);
	private final static Pattern.Term pattern9 = new Pattern.Term("OrT",
		new Pattern.Set(false, new Pair[]{}),
		null);
	private final static Pattern.Term pattern10 = new Pattern.Term("OrT",
		new Pattern.Set(false, new Pair[]{
			new Pair(new Pattern.Leaf(type2), "t")}),
		null);
	private final static Pattern.Term pattern11 = new Pattern.Term("OrT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("OrT",
				new Pattern.Set(true, new Pair[]{
					new Pair(new Pattern.Leaf(type2), "xs")}),
				null),null), 
			new Pair(new Pattern.Leaf(type2), "ys")}),
		null);
	private final static Pattern.Term pattern12 = new Pattern.Term("TupleT",
		new Pattern.List(true, new Pair[]{
			new Pair(new Pattern.Leaf(type2), "ts")}),
		null);
	private final static Pattern.Term pattern13 = new Pattern.Term("TupleT",
		new Pattern.List(true, new Pair[]{
			new Pair(new Pattern.Leaf(type2), "ts")}),
		null);
	private final static Pattern.Term pattern14 = new Pattern.Term("TupleT",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type2), "t")}),
		null);
	private final static Pattern.Term pattern15 = new Pattern.Term("AndT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("TupleT",
				new Pattern.List(true, new Pair[]{
					new Pair(new Pattern.Leaf(type2), "t1s")}),
				null),null), 
			new Pair(new Pattern.Term("TupleT",
				new Pattern.List(true, new Pair[]{
					new Pair(new Pattern.Leaf(type2), "t2s")}),
				null),null), 
			new Pair(new Pattern.Leaf(type2), "ts")}),
		null);
	private final static Pattern.Term pattern16 = new Pattern.Term("AndT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("TupleT",
				new Pattern.List(true, new Pair[]{
					new Pair(new Pattern.Leaf(type2), "t1s")}),
				null), "t1"), 
			new Pair(new Pattern.Term("NotT",
				new Pattern.Term("TupleT",
					new Pattern.List(true, new Pair[]{
						new Pair(new Pattern.Leaf(type2), "t2s")}),
					null),
				null),null), 
			new Pair(new Pattern.Leaf(type2), "ts")}),
		null);
	private final static Pattern.Term pattern17 = new Pattern.Term("SetT",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type3), "b"), 
			new Pair(new Pattern.Leaf(type1),null)}),
		null);
	private final static Pattern.Term pattern18 = new Pattern.Term("AndT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("SetT",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type3), "b1"), 
					new Pair(new Pattern.Leaf(type2), "t1")}),
				null),null), 
			new Pair(new Pattern.Term("SetT",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type3), "b2"), 
					new Pair(new Pattern.Leaf(type2), "t2")}),
				null),null), 
			new Pair(new Pattern.Leaf(type2), "ts")}),
		null);
	private final static Pattern.Term pattern19 = new Pattern.Term("AndT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("SetT",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type3), "b1"), 
					new Pair(new Pattern.Leaf(type2), "t1")}),
				null),null), 
			new Pair(new Pattern.Term("NotT",
				new Pattern.Term("SetT",
					new Pattern.List(false, new Pair[]{
						new Pair(new Pattern.Leaf(type3), "b2"), 
						new Pair(new Pattern.Leaf(type2), "t2")}),
					null),
				null),null), 
			new Pair(new Pattern.Leaf(type2), "ts")}),
		null);
	private final static Pattern.Term pattern20 = new Pattern.Term("AndT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("SetT",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type3),null), 
					new Pair(new Pattern.Leaf(type2),null)}),
				null), "s"), 
			new Pair(new Pattern.Leaf(type4), "p"), 
			new Pair(new Pattern.Leaf(type2), "ts")}),
		null);
	private final static Pattern.Term pattern21 = new Pattern.Term("OrT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("SetT",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type3), "b1"), 
					new Pair(new Pattern.Leaf(type2), "t1")}),
				null), "s1"), 
			new Pair(new Pattern.Term("SetT",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type3), "b2"), 
					new Pair(new Pattern.Leaf(type2), "t2")}),
				null), "s2"), 
			new Pair(new Pattern.Leaf(type2), "ts")}),
		null);
	private final static Pattern.Term pattern22 = new Pattern.Term("AndT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Leaf(type1),null), 
			new Pair(new Pattern.Leaf(type2), "xs")}),
		null);
	private final static Pattern.Term pattern23 = new Pattern.Term("AndT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Leaf(type0),null), 
			new Pair(new Pattern.Leaf(type2), "xs")}),
		null);
	private final static Pattern.Term pattern24 = new Pattern.Term("AndT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Leaf(type6), "a1"), 
			new Pair(new Pattern.Leaf(type4), "a2"), 
			new Pair(new Pattern.Leaf(type2), "ts")}),
		null);
	private final static Pattern.Term pattern25 = new Pattern.Term("AndT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Leaf(type6), "a1"), 
			new Pair(new Pattern.Term("NotT",
				new Pattern.Leaf(type4),
				"a2"),null), 
			new Pair(new Pattern.Leaf(type2), "ts")}),
		null);
	private final static Pattern.Term pattern26 = new Pattern.Term("OrT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Leaf(type0),null), 
			new Pair(new Pattern.Leaf(type2), "xs")}),
		null);
	private final static Pattern.Term pattern27 = new Pattern.Term("OrT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Leaf(type1),null), 
			new Pair(new Pattern.Leaf(type2), "xs")}),
		null);
	private final static Pattern.Term pattern28 = new Pattern.Term("Load",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Term("Tuple",
				new Pattern.List(true, new Pair[]{
					new Pair(new Pattern.Leaf(type7), "ls")}),
				null),null), 
			new Pair(new Pattern.Leaf(type8), "idx")}),
		null);
	private final static Pattern.Term pattern29 = new Pattern.Term("LengthOf",
		new Pattern.Term("Tuple",
			new Pattern.List(true, new Pair[]{
				new Pair(new Pattern.Leaf(type7), "xs")}),
			null),
		null);
	private final static Pattern.Term pattern30 = new Pattern.Term("Equals",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Term("TupleT",
				new Pattern.List(true, new Pair[]{
					new Pair(new Pattern.Leaf(type2), "ts")}),
				null),null), 
			new Pair(new Pattern.Bag(false, new Pair[]{
				new Pair(new Pattern.Term("Tuple",
					new Pattern.List(true, new Pair[]{
						new Pair(new Pattern.Leaf(type7), "xs")}),
					null),null), 
				new Pair(new Pattern.Term("Tuple",
					new Pattern.List(true, new Pair[]{
						new Pair(new Pattern.Leaf(type7), "ys")}),
					null),null)}),null)}),
		null);
	private final static Pattern.Term pattern31 = new Pattern.Term("And",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("Equals",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type2), "t"), 
					new Pair(new Pattern.Bag(false, new Pair[]{
						new Pair(new Pattern.Leaf(type9), "x"), 
						new Pair(new Pattern.Leaf(type10), "y")}),null)}),
				null), "eq"), 
			new Pair(new Pattern.Leaf(type11), "bs")}),
		null);
	private final static Pattern.Term pattern32 = new Pattern.Term("Not",
		new Pattern.Leaf(type12),
		"b");
	private final static Pattern.Term pattern33 = new Pattern.Term("Not",
		new Pattern.Term("Not",
			new Pattern.Leaf(type13),
			"x"),
		null);
	private final static Pattern.Term pattern34 = new Pattern.Term("Not",
		new Pattern.Term("And",
			new Pattern.Set(true, new Pair[]{
				new Pair(new Pattern.Leaf(type11), "xs")}),
			null),
		null);
	private final static Pattern.Term pattern35 = new Pattern.Term("Not",
		new Pattern.Term("Or",
			new Pattern.Set(true, new Pair[]{
				new Pair(new Pattern.Leaf(type11), "xs")}),
			null),
		null);
	private final static Pattern.Term pattern36 = new Pattern.Term("And",
		new Pattern.Set(false, new Pair[]{
			new Pair(new Pattern.Leaf(type11), "x")}),
		null);
	private final static Pattern.Term pattern37 = new Pattern.Term("And",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Leaf(type14),null), 
			new Pair(new Pattern.Leaf(type11), "xs")}),
		null);
	private final static Pattern.Term pattern38 = new Pattern.Term("And",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Leaf(type15),null), 
			new Pair(new Pattern.Leaf(type11), "xs")}),
		null);
	private final static Pattern.Term pattern39 = new Pattern.Term("And",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("And",
				new Pattern.Set(true, new Pair[]{
					new Pair(new Pattern.Leaf(type11), "xs")}),
				null),null), 
			new Pair(new Pattern.Leaf(type11), "ys")}),
		null);
	private final static Pattern.Term pattern40 = new Pattern.Term("And",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("Not",
				new Pattern.Leaf(type11),
				"x"),null), 
			new Pair(new Pattern.Leaf(type11), "y"), 
			new Pair(new Pattern.Leaf(type11), "ys")}),
		null);
	private final static Pattern.Term pattern41 = new Pattern.Term("And",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("Or",
				new Pattern.Set(true, new Pair[]{
					new Pair(new Pattern.Leaf(type11), "xs")}),
				null),null), 
			new Pair(new Pattern.Leaf(type11), "ys")}),
		null);
	private final static Pattern.Term pattern42 = new Pattern.Term("Or",
		new Pattern.Set(false, new Pair[]{
			new Pair(new Pattern.Leaf(type11), "x")}),
		null);
	private final static Pattern.Term pattern43 = new Pattern.Term("Or",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Leaf(type15),null), 
			new Pair(new Pattern.Leaf(type11), "xs")}),
		null);
	private final static Pattern.Term pattern44 = new Pattern.Term("Or",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Leaf(type14),null), 
			new Pair(new Pattern.Leaf(type11), "xs")}),
		null);
	private final static Pattern.Term pattern45 = new Pattern.Term("Or",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("Not",
				new Pattern.Leaf(type11),
				"x"),null), 
			new Pair(new Pattern.Leaf(type11), "y"), 
			new Pair(new Pattern.Leaf(type11), "ys")}),
		null);
	private final static Pattern.Term pattern46 = new Pattern.Term("Or",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("Or",
				new Pattern.Set(true, new Pair[]{
					new Pair(new Pattern.Leaf(type11), "xs")}),
				null),null), 
			new Pair(new Pattern.Leaf(type11), "ys")}),
		null);
	private final static Pattern.Term pattern47 = new Pattern.Term("Equals",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type2), "t"), 
			new Pair(new Pattern.Bag(false, new Pair[]{
				new Pair(new Pattern.Leaf(type7), "x"), 
				new Pair(new Pattern.Leaf(type7), "y")}),null)}),
		null);
	private final static Pattern.Term pattern48 = new Pattern.Term("And",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("Equals",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type2), "t"), 
					new Pair(new Pattern.Bag(false, new Pair[]{
						new Pair(new Pattern.Leaf(type9), "x"), 
						new Pair(new Pattern.Leaf(type17), "y")}),null)}),
				null), "eq"), 
			new Pair(new Pattern.Leaf(type11), "bs")}),
		null);
	private final static Pattern.Term pattern49 = new Pattern.Term("And",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("Equals",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type2), "t"), 
					new Pair(new Pattern.Bag(false, new Pair[]{
						new Pair(new Pattern.Leaf(type9),null), 
						new Pair(new Pattern.Leaf(type9),null)}), "vs")}),
				null), "eq"), 
			new Pair(new Pattern.Leaf(type11), "bs")}),
		null);
	private final static Pattern.Term pattern50 = new Pattern.Term("Mul",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type18), "n"), 
			new Pair(new Pattern.Bag(true, new Pair[]{
				new Pair(new Pattern.Leaf(type19), "rest")}),null)}),
		null);
	private final static Pattern.Term pattern51 = new Pattern.Term("Mul",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type18), "x"), 
			new Pair(new Pattern.Bag(true, new Pair[]{
				new Pair(new Pattern.Term("Num",
					new Pattern.Leaf(type18),
					"y"),null), 
				new Pair(new Pattern.Leaf(type19), "rest")}),null)}),
		null);
	private final static Pattern.Term pattern52 = new Pattern.Term("Mul",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type18), "n1"), 
			new Pair(new Pattern.Bag(true, new Pair[]{
				new Pair(new Pattern.Term("Mul",
					new Pattern.List(false, new Pair[]{
						new Pair(new Pattern.Leaf(type18), "n2"), 
						new Pair(new Pattern.Bag(true, new Pair[]{
							new Pair(new Pattern.Leaf(type19), "xs")}),null)}),
					null),null), 
				new Pair(new Pattern.Leaf(type19), "ys")}),null)}),
		null);
	private final static Pattern.Term pattern53 = new Pattern.Term("Mul",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type18), "n1"), 
			new Pair(new Pattern.Bag(true, new Pair[]{
				new Pair(new Pattern.Term("Sum",
					new Pattern.List(false, new Pair[]{
						new Pair(new Pattern.Leaf(type18), "n2"), 
						new Pair(new Pattern.Bag(true, new Pair[]{
							new Pair(new Pattern.Leaf(type19), "xs")}),null)}),
					null),null), 
				new Pair(new Pattern.Leaf(type19), "ys")}),null)}),
		null);
	private final static Pattern.Term pattern54 = new Pattern.Term("Div",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Term("Num",
				new Pattern.Leaf(type18),
				"x"),null), 
			new Pair(new Pattern.Term("Num",
				new Pattern.Leaf(type18),
				"y"),null)}),
		null);
	private final static Pattern.Term pattern55 = new Pattern.Term("Div",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type19), "x"), 
			new Pair(new Pattern.Term("Div",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type19), "y"), 
					new Pair(new Pattern.Leaf(type19), "z")}),
				null),null)}),
		null);
	private final static Pattern.Term pattern56 = new Pattern.Term("Div",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Term("Div",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type19), "x"), 
					new Pair(new Pattern.Leaf(type19), "y")}),
				null),null), 
			new Pair(new Pattern.Leaf(type19), "z")}),
		null);
	private final static Pattern.Term pattern57 = new Pattern.Term("Div",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type19), "x"), 
			new Pair(new Pattern.Term("Num",
				new Pattern.Leaf(type18),
				"n"),null)}),
		null);
	private final static Pattern.Term pattern58 = new Pattern.Term("Div",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Term("Mul",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type18), "n"), 
					new Pair(new Pattern.Bag(true, new Pair[]{
						new Pair(new Pattern.Leaf(type19), "x"), 
						new Pair(new Pattern.Leaf(type19), "xs")}),null)}),
				null),null), 
			new Pair(new Pattern.Leaf(type19), "y")}),
		null);
	private final static Pattern.Term pattern59 = new Pattern.Term("Div",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Term("Sum",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type18), "n"), 
					new Pair(new Pattern.Bag(true, new Pair[]{
						new Pair(new Pattern.Leaf(type19), "xs")}),null)}),
				null),null), 
			new Pair(new Pattern.Leaf(type19), "y")}),
		null);
	private final static Pattern.Term pattern60 = new Pattern.Term("Div",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Term("Mul",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type18), "n"), 
					new Pair(new Pattern.Bag(true, new Pair[]{
						new Pair(new Pattern.Leaf(type19), "xs")}),null)}),
				null),null), 
			new Pair(new Pattern.Leaf(type19), "y")}),
		null);
	private final static Pattern.Term pattern61 = new Pattern.Term("Sum",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type18), "n"), 
			new Pair(new Pattern.Bag(false, new Pair[]{}),null)}),
		null);
	private final static Pattern.Term pattern62 = new Pattern.Term("Sum",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type18), "n"), 
			new Pair(new Pattern.Bag(false, new Pair[]{
				new Pair(new Pattern.Term("Mul",
					new Pattern.List(false, new Pair[]{
						new Pair(new Pattern.Leaf(type18), "m"), 
						new Pair(new Pattern.Bag(false, new Pair[]{
							new Pair(new Pattern.Leaf(type9), "x")}),null)}),
					null),null)}),null)}),
		null);
	private final static Pattern.Term pattern63 = new Pattern.Term("Sum",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type18), "n"), 
			new Pair(new Pattern.Bag(true, new Pair[]{
				new Pair(new Pattern.Leaf(type19), "x"), 
				new Pair(new Pattern.Leaf(type19), "rest")}),null)}),
		null);
	private final static Pattern.Term pattern64 = new Pattern.Term("Sum",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type18), "x"), 
			new Pair(new Pattern.Bag(true, new Pair[]{
				new Pair(new Pattern.Term("Num",
					new Pattern.Leaf(type18),
					"y"),null), 
				new Pair(new Pattern.Leaf(type19), "rest")}),null)}),
		null);
	private final static Pattern.Term pattern65 = new Pattern.Term("Sum",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type18), "n"), 
			new Pair(new Pattern.Bag(true, new Pair[]{
				new Pair(new Pattern.Term("Mul",
					new Pattern.List(false, new Pair[]{
						new Pair(new Pattern.Leaf(type18), "x"), 
						new Pair(new Pattern.Bag(true, new Pair[]{
							new Pair(new Pattern.Leaf(type19),null)}), "xs")}),
					null),null), 
				new Pair(new Pattern.Term("Mul",
					new Pattern.List(false, new Pair[]{
						new Pair(new Pattern.Leaf(type18), "y"), 
						new Pair(new Pattern.Bag(true, new Pair[]{
							new Pair(new Pattern.Leaf(type19),null)}), "ys")}),
					null),null), 
				new Pair(new Pattern.Leaf(type19), "zs")}),null)}),
		null);
	private final static Pattern.Term pattern66 = new Pattern.Term("Sum",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type18), "x"), 
			new Pair(new Pattern.Bag(true, new Pair[]{
				new Pair(new Pattern.Term("Sum",
					new Pattern.List(false, new Pair[]{
						new Pair(new Pattern.Leaf(type18), "y"), 
						new Pair(new Pattern.Bag(true, new Pair[]{
							new Pair(new Pattern.Leaf(type19), "ys")}),null)}),
					null),null), 
				new Pair(new Pattern.Leaf(type19), "xs")}),null)}),
		null);
	private final static Pattern.Term pattern67 = new Pattern.Term("Equation",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type23),null), 
			new Pair(new Pattern.Term("Num",
				new Pattern.Leaf(type18),
				"v"),null)}),
		null);
	private final static Pattern.Term pattern68 = new Pattern.Term("Equation",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type23), "t"), 
			new Pair(new Pattern.Term("Sum",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type18), "n"), 
					new Pair(new Pattern.Bag(false, new Pair[]{
						new Pair(new Pattern.Term("Mul",
							new Pattern.List(false, new Pair[]{
								new Pair(new Pattern.Leaf(type18), "m"), 
								new Pair(new Pattern.Bag(true, new Pair[]{
									new Pair(new Pattern.Leaf(type19), "xs")}),null)}),
							null),null)}),null)}),
				null),null)}),
		null);
	private final static Pattern.Term pattern69 = new Pattern.Term("Equation",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type23), "t"), 
			new Pair(new Pattern.Term("Sum",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type18), "n"), 
					new Pair(new Pattern.Bag(true, new Pair[]{
						new Pair(new Pattern.Leaf(type24), "xs")}), "ms")}),
				null),null)}),
		null);
	private final static Pattern.Term pattern70 = new Pattern.Term("And",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("Equation",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type23), "t"), 
					new Pair(new Pattern.Term("Sum",
						new Pattern.List(false, new Pair[]{
							new Pair(new Pattern.Leaf(type18), "c"), 
							new Pair(new Pattern.Bag(true, new Pair[]{
								new Pair(new Pattern.Term("Mul",
									new Pattern.List(false, new Pair[]{
										new Pair(new Pattern.Leaf(type18), "vc"), 
										new Pair(new Pattern.Bag(false, new Pair[]{
											new Pair(new Pattern.Leaf(type19), "v")}),null)}),
									null),null), 
								new Pair(new Pattern.Leaf(type24), "ms")}), "xs")}),
						null),null)}),
				null), "eq"), 
			new Pair(new Pattern.Leaf(type11), "bs")}),
		null);
	private final static Pattern.Term pattern71 = new Pattern.Term("And",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("Equation",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type23), "t"), 
					new Pair(new Pattern.Leaf(type9), "v")}),
				null), "eq"), 
			new Pair(new Pattern.Leaf(type11), "bs")}),
		null);
	private final static Pattern.Term pattern72 = new Pattern.Term("Not",
		new Pattern.Term("Equation",
			new Pattern.List(false, new Pair[]{
				new Pair(new Pattern.Leaf(type25), "t"), 
				new Pair(new Pattern.Leaf(type19), "e")}),
			null),
		null);
	private final static Pattern.Term pattern73 = new Pattern.Term("Not",
		new Pattern.Term("Equation",
			new Pattern.List(false, new Pair[]{
				new Pair(new Pattern.Leaf(type26), "t"), 
				new Pair(new Pattern.Leaf(type19), "e")}),
			null),
		null);
	private final static Pattern.Term pattern74 = new Pattern.Term("Equals",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type23), "t"), 
			new Pair(new Pattern.Bag(false, new Pair[]{
				new Pair(new Pattern.Leaf(type19), "e1"), 
				new Pair(new Pattern.Leaf(type19), "e2")}),null)}),
		null);
	private final static Pattern.Term pattern75 = new Pattern.Term("Inequality",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type23), "t"), 
			new Pair(new Pattern.Term("Num",
				new Pattern.Leaf(type18),
				"v"),null)}),
		null);
	private final static Pattern.Term pattern76 = new Pattern.Term("Not",
		new Pattern.Term("Inequality",
			new Pattern.List(false, new Pair[]{
				new Pair(new Pattern.Leaf(type25), "t"), 
				new Pair(new Pattern.Leaf(type19), "e")}),
			null),
		null);
	private final static Pattern.Term pattern77 = new Pattern.Term("Inequality",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type23), "t"), 
			new Pair(new Pattern.Term("Sum",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type18), "n"), 
					new Pair(new Pattern.Bag(true, new Pair[]{
						new Pair(new Pattern.Leaf(type24), "xs")}), "ms")}),
				null),null)}),
		null);
	private final static Pattern.Term pattern78 = new Pattern.Term("And",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("Inequality",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type25),null), 
					new Pair(new Pattern.Term("Sum",
						new Pattern.List(false, new Pair[]{
							new Pair(new Pattern.Leaf(type18), "x1"), 
							new Pair(new Pattern.Bag(false, new Pair[]{
								new Pair(new Pattern.Term("Mul",
									new Pattern.List(false, new Pair[]{
										new Pair(new Pattern.Leaf(type18), "x2"), 
										new Pair(new Pattern.Bag(true, new Pair[]{
											new Pair(new Pattern.Leaf(type19), "v1s")}),null)}),
									null), "xs")}),null)}),
						null), "s1")}),
				null), "ieq1"), 
			new Pair(new Pattern.Term("Inequality",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type25),null), 
					new Pair(new Pattern.Term("Sum",
						new Pattern.List(false, new Pair[]{
							new Pair(new Pattern.Leaf(type18), "y1"), 
							new Pair(new Pattern.Bag(false, new Pair[]{
								new Pair(new Pattern.Term("Mul",
									new Pattern.List(false, new Pair[]{
										new Pair(new Pattern.Leaf(type18), "y2"), 
										new Pair(new Pattern.Bag(true, new Pair[]{
											new Pair(new Pattern.Leaf(type19), "v2s")}),null)}),
									null), "ys")}),null)}),
						null), "s2")}),
				null), "ieq2"), 
			new Pair(new Pattern.Leaf(type11), "rest")}),
		null);
	private final static Pattern.Term pattern79 = new Pattern.Term("And",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("Inequality",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type25),null), 
					new Pair(new Pattern.Leaf(type9), "v1")}),
				null), "ieq1"), 
			new Pair(new Pattern.Term("Inequality",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type25),null), 
					new Pair(new Pattern.Term("Sum",
						new Pattern.List(false, new Pair[]{
							new Pair(new Pattern.Leaf(type18), "y1"), 
							new Pair(new Pattern.Bag(false, new Pair[]{
								new Pair(new Pattern.Term("Mul",
									new Pattern.List(false, new Pair[]{
										new Pair(new Pattern.Leaf(type18), "y2"), 
										new Pair(new Pattern.Bag(false, new Pair[]{
											new Pair(new Pattern.Leaf(type19), "v2")}),null)}),
									null), "ys")}),null)}),
						null), "s2")}),
				null), "ieq2"), 
			new Pair(new Pattern.Leaf(type11), "rest")}),
		null);
	private final static Pattern.Term pattern80 = new Pattern.Term("And",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("Inequality",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type23), "t1"), 
					new Pair(new Pattern.Term("Sum",
						new Pattern.List(false, new Pair[]{
							new Pair(new Pattern.Leaf(type18), "x1"), 
							new Pair(new Pattern.Bag(true, new Pair[]{
								new Pair(new Pattern.Term("Mul",
									new Pattern.List(false, new Pair[]{
										new Pair(new Pattern.Leaf(type18), "x2"), 
										new Pair(new Pattern.Bag(false, new Pair[]{
											new Pair(new Pattern.Leaf(type19), "v1")}),null)}),
									null),null), 
								new Pair(new Pattern.Leaf(type24), "xs")}), "xxs")}),
						null), "s1")}),
				null), "eq1"), 
			new Pair(new Pattern.Term("Inequality",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type23), "t2"), 
					new Pair(new Pattern.Term("Sum",
						new Pattern.List(false, new Pair[]{
							new Pair(new Pattern.Leaf(type18), "y1"), 
							new Pair(new Pattern.Bag(true, new Pair[]{
								new Pair(new Pattern.Term("Mul",
									new Pattern.List(false, new Pair[]{
										new Pair(new Pattern.Leaf(type18), "y2"), 
										new Pair(new Pattern.Bag(false, new Pair[]{
											new Pair(new Pattern.Leaf(type19), "v2")}),null)}),
									null),null), 
								new Pair(new Pattern.Leaf(type24), "ys")}), "yys")}),
						null), "s2")}),
				null), "eq2"), 
			new Pair(new Pattern.Leaf(type11), "rest")}),
		null);
	private final static Pattern.Term pattern81 = new Pattern.Term("And",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("Inequality",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type23), "t1"), 
					new Pair(new Pattern.Term("Sum",
						new Pattern.List(false, new Pair[]{
							new Pair(new Pattern.Leaf(type18), "x1"), 
							new Pair(new Pattern.Bag(true, new Pair[]{
								new Pair(new Pattern.Term("Mul",
									new Pattern.List(false, new Pair[]{
										new Pair(new Pattern.Leaf(type18), "x2"), 
										new Pair(new Pattern.Bag(false, new Pair[]{
											new Pair(new Pattern.Leaf(type19), "v1")}),null)}),
									null),null), 
								new Pair(new Pattern.Leaf(type24), "xs")}), "xxs")}),
						null), "s1")}),
				null), "eq1"), 
			new Pair(new Pattern.Term("Inequality",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type23), "t2"), 
					new Pair(new Pattern.Leaf(type9), "v2")}),
				null), "eq2"), 
			new Pair(new Pattern.Leaf(type11), "rest")}),
		null);
	private final static Pattern.Term pattern82 = new Pattern.Term("Equals",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type2), "t"), 
			new Pair(new Pattern.Bag(false, new Pair[]{
				new Pair(new Pattern.Term("Set",
					new Pattern.Set(true, new Pair[]{
						new Pair(new Pattern.Leaf(type7), "xs")}),
					null),null), 
				new Pair(new Pattern.Term("Set",
					new Pattern.Set(true, new Pair[]{
						new Pair(new Pattern.Leaf(type7), "ys")}),
					null),null)}),null)}),
		null);
	private final static Pattern.Term pattern83 = new Pattern.Term("And",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("Equals",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type2), "t"), 
					new Pair(new Pattern.Bag(false, new Pair[]{
						new Pair(new Pattern.Leaf(type9), "x"), 
						new Pair(new Pattern.Leaf(type27), "y")}),null)}),
				null), "eq"), 
			new Pair(new Pattern.Leaf(type11), "bs")}),
		null);
	private final static Pattern.Term pattern84 = new Pattern.Term("LengthOf",
		new Pattern.Term("Set",
			new Pattern.Set(true, new Pair[]{
				new Pair(new Pattern.Leaf(type17), "xs")}),
			null),
		null);
	private final static Pattern.Term pattern85 = new Pattern.Term("Equals",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type25),null), 
			new Pair(new Pattern.Bag(false, new Pair[]{
				new Pair(new Pattern.Term("LengthOf",
					new Pattern.Leaf(type28),
					"x"),null), 
				new Pair(new Pattern.Term("Num",
					new Pattern.Leaf(type18),
					"y"),null)}),null)}),
		null);
	private final static Pattern.Term pattern86 = new Pattern.Term("Equation",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type25),null), 
			new Pair(new Pattern.Term("LengthOf",
				new Pattern.Leaf(type28),
				"x"),null)}),
		null);
	private final static Pattern.Term pattern87 = new Pattern.Term("SubsetEq",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type29), "t"), 
			new Pair(new Pattern.Term("Set",
				new Pattern.Set(true, new Pair[]{
					new Pair(new Pattern.Leaf(type7), "xs")}),
				null), "s1"), 
			new Pair(new Pattern.Term("Set",
				new Pattern.Set(true, new Pair[]{
					new Pair(new Pattern.Leaf(type7), "ys")}),
				null), "s2")}),
		null);
	private final static Pattern.Term pattern88 = new Pattern.Term("SubsetEq",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type29), "t"), 
			new Pair(new Pattern.Leaf(type28), "x"), 
			new Pair(new Pattern.Leaf(type28), "y")}),
		null);
	private final static Pattern.Term pattern89 = new Pattern.Term("SubsetEq",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Term("SetT",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type3), "b"), 
					new Pair(new Pattern.Leaf(type2), "e")}),
				null), "t"), 
			new Pair(new Pattern.Term("Set",
				new Pattern.Set(true, new Pair[]{
					new Pair(new Pattern.Leaf(type7), "x"), 
					new Pair(new Pattern.Leaf(type7), "xs")}),
				null), "s1"), 
			new Pair(new Pattern.Term("Set",
				new Pattern.Set(true, new Pair[]{
					new Pair(new Pattern.Leaf(type7), "ys")}),
				null), "s2")}),
		null);
	private final static Pattern.Term pattern90 = new Pattern.Term("And",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("SubsetEq",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Term("SetT",
						new Pattern.List(false, new Pair[]{
							new Pair(new Pattern.Leaf(type3), "b1"), 
							new Pair(new Pattern.Leaf(type2), "e1")}),
						null),null), 
					new Pair(new Pattern.Term("Set",
						new Pattern.Set(true, new Pair[]{
							new Pair(new Pattern.Leaf(type7), "xs")}),
						null),null), 
					new Pair(new Pattern.Leaf(type13), "x")}),
				null),null), 
			new Pair(new Pattern.Term("SubsetEq",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Term("SetT",
						new Pattern.List(false, new Pair[]{
							new Pair(new Pattern.Leaf(type3), "b2"), 
							new Pair(new Pattern.Leaf(type2), "e2")}),
						null),null), 
					new Pair(new Pattern.Term("Set",
						new Pattern.Set(true, new Pair[]{
							new Pair(new Pattern.Leaf(type7), "ys")}),
						null),null), 
					new Pair(new Pattern.Leaf(type28), "y")}),
				null),null), 
			new Pair(new Pattern.Leaf(type11), "rest")}),
		null);
	private final static Pattern.Term pattern91 = new Pattern.Term("And",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("SubsetEq",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Term("SetT",
						new Pattern.List(false, new Pair[]{
							new Pair(new Pattern.Leaf(type3), "b1"), 
							new Pair(new Pattern.Leaf(type2), "e1")}),
						null),null), 
					new Pair(new Pattern.Leaf(type28), "x"), 
					new Pair(new Pattern.Term("Set",
						new Pattern.Set(true, new Pair[]{
							new Pair(new Pattern.Leaf(type7), "xs")}),
						null),null)}),
				null),null), 
			new Pair(new Pattern.Term("SubsetEq",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Term("SetT",
						new Pattern.List(false, new Pair[]{
							new Pair(new Pattern.Leaf(type3), "b2"), 
							new Pair(new Pattern.Leaf(type2), "e2")}),
						null),null), 
					new Pair(new Pattern.Leaf(type28), "y"), 
					new Pair(new Pattern.Term("Set",
						new Pattern.Set(true, new Pair[]{
							new Pair(new Pattern.Leaf(type7), "ys")}),
						null),null)}),
				null),null), 
			new Pair(new Pattern.Leaf(type11), "rest")}),
		null);
	private final static Pattern.Term pattern92 = new Pattern.Term("And",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("SubsetEq",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type29), "t1"), 
					new Pair(new Pattern.Leaf(type28), "x"), 
					new Pair(new Pattern.Leaf(type28), "y")}),
				null), "s1"), 
			new Pair(new Pattern.Term("SubsetEq",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type29), "t2"), 
					new Pair(new Pattern.Leaf(type28), "u"), 
					new Pair(new Pattern.Leaf(type28), "v")}),
				null), "s2"), 
			new Pair(new Pattern.Leaf(type11), "rest")}),
		null);
	private final static Pattern.Term pattern93 = new Pattern.Term("And",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("SubsetEq",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type29), "t1"), 
					new Pair(new Pattern.Leaf(type28), "x"), 
					new Pair(new Pattern.Leaf(type28), "y")}),
				null), "s1"), 
			new Pair(new Pattern.Term("SubsetEq",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type29), "t2"), 
					new Pair(new Pattern.Leaf(type28), "u"), 
					new Pair(new Pattern.Leaf(type28), "v")}),
				null), "s2"), 
			new Pair(new Pattern.Leaf(type11), "rest")}),
		null);
	private final static Pattern.Term pattern94 = new Pattern.Term("ForAll",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Set(true, new Pair[]{
				new Pair(new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type32),null), 
					new Pair(new Pattern.Leaf(type2),null)}), "qs")}),null), 
			new Pair(new Pattern.Leaf(type11), "be")}),
		null);
	private final static Pattern.Term pattern95 = new Pattern.Term("Not",
		new Pattern.Term("ForAll",
			new Pattern.List(false, new Pair[]{
				new Pair(new Pattern.Set(true, new Pair[]{
					new Pair(new Pattern.List(false, new Pair[]{
						new Pair(new Pattern.Leaf(type32),null), 
						new Pair(new Pattern.Leaf(type2),null)}),null)}), "vars"), 
				new Pair(new Pattern.Leaf(type11), "be")}),
			null),
		null);
	private final static Pattern.Term pattern96 = new Pattern.Term("ForAll",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Set(true, new Pair[]{
				new Pair(new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type32),null), 
					new Pair(new Pattern.Leaf(type2),null)}),null)}), "xs"), 
			new Pair(new Pattern.Term("ForAll",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Set(true, new Pair[]{
						new Pair(new Pattern.List(false, new Pair[]{
							new Pair(new Pattern.Leaf(type32),null), 
							new Pair(new Pattern.Leaf(type2),null)}),null)}), "ys"), 
					new Pair(new Pattern.Leaf(type11), "e")}),
				null),null)}),
		null);
	private final static Pattern.Term pattern97 = new Pattern.Term("ForAll",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Set(true, new Pair[]{
				new Pair(new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type32), "v"), 
					new Pair(new Pattern.Leaf(type2),null)}),null), 
				new Pair(new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type32),null), 
					new Pair(new Pattern.Leaf(type2),null)}), "xs")}),null), 
			new Pair(new Pattern.Leaf(type11), "e")}),
		null);
	private final static Pattern.Term pattern98 = new Pattern.Term("And",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Leaf(type34), "e1"), 
			new Pair(new Pattern.Term("ForAll",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Set(true, new Pair[]{
						new Pair(new Pattern.List(false, new Pair[]{
							new Pair(new Pattern.Leaf(type32),null), 
							new Pair(new Pattern.Leaf(type2),null)}),null), 
						new Pair(new Pattern.List(false, new Pair[]{
							new Pair(new Pattern.Leaf(type32),null), 
							new Pair(new Pattern.Leaf(type2),null)}),null)}), "vs"), 
					new Pair(new Pattern.Leaf(type11), "e2")}),
				null), "qf"), 
			new Pair(new Pattern.Leaf(type11), "es")}),
		null);
	private final static Pattern.Term pattern99 = new Pattern.Term("And",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("Not",
				new Pattern.Leaf(type34),
				"e1"), "ne1"), 
			new Pair(new Pattern.Term("ForAll",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Set(true, new Pair[]{
						new Pair(new Pattern.List(false, new Pair[]{
							new Pair(new Pattern.Leaf(type32),null), 
							new Pair(new Pattern.Leaf(type2),null)}),null), 
						new Pair(new Pattern.List(false, new Pair[]{
							new Pair(new Pattern.Leaf(type32),null), 
							new Pair(new Pattern.Leaf(type2),null)}),null)}), "vs"), 
					new Pair(new Pattern.Leaf(type11), "e2")}),
				null), "qf"), 
			new Pair(new Pattern.Leaf(type11), "es")}),
		null);
	private final static Pattern.Term pattern100 = new Pattern.Term("Exists",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Set(true, new Pair[]{
				new Pair(new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type32),null), 
					new Pair(new Pattern.Leaf(type2),null)}), "qs")}),null), 
			new Pair(new Pattern.Leaf(type11), "be")}),
		null);
	private final static Pattern.Term pattern101 = new Pattern.Term("Not",
		new Pattern.Term("Exists",
			new Pattern.List(false, new Pair[]{
				new Pair(new Pattern.Set(true, new Pair[]{
					new Pair(new Pattern.List(false, new Pair[]{
						new Pair(new Pattern.Leaf(type32),null), 
						new Pair(new Pattern.Leaf(type2),null)}),null)}), "vars"), 
				new Pair(new Pattern.Leaf(type11), "be")}),
			null),
		null);
	private final static Pattern.Term pattern102 = new Pattern.Term("Exists",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Set(true, new Pair[]{
				new Pair(new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type32),null), 
					new Pair(new Pattern.Leaf(type2),null)}),null)}), "xs"), 
			new Pair(new Pattern.Term("Exists",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Set(true, new Pair[]{
						new Pair(new Pattern.List(false, new Pair[]{
							new Pair(new Pattern.Leaf(type32),null), 
							new Pair(new Pattern.Leaf(type2),null)}),null)}), "ys"), 
					new Pair(new Pattern.Leaf(type11), "e")}),
				null),null)}),
		null);
	private final static Pattern.Term pattern103 = new Pattern.Term("And",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("Exists",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Set(true, new Pair[]{
						new Pair(new Pattern.List(false, new Pair[]{
							new Pair(new Pattern.Leaf(type32),null), 
							new Pair(new Pattern.Leaf(type2),null)}),null)}), "vs"), 
					new Pair(new Pattern.Leaf(type11), "e")}),
				null),null), 
			new Pair(new Pattern.Leaf(type11), "es")}),
		null);
	private final static Pattern.Term pattern104 = new Pattern.Term("Inhabited",
		new Pattern.Leaf(type35),
		"t");
	private final static Pattern.Term pattern105 = new Pattern.Term("Inhabited",
		new Pattern.Term("AndT",
			new Pattern.Set(true, new Pair[]{
				new Pair(new Pattern.Term("NotT",
					new Pattern.Leaf(type4),
					null), "ts")}),
			null),
		null);
	private final static Pattern.Term pattern106 = new Pattern.Term("Inhabited",
		new Pattern.Term("SetT",
			new Pattern.List(false, new Pair[]{
				new Pair(new Pattern.Leaf(type3), "b1"), 
				new Pair(new Pattern.Leaf(type2), "t")}),
			null),
		null);
	private final static Pattern.Term pattern107 = new Pattern.Term("Is",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type7), "e"), 
			new Pair(new Pattern.Leaf(type1),null)}),
		null);
	private final static Pattern.Term pattern108 = new Pattern.Term("Not",
		new Pattern.Term("Is",
			new Pattern.List(false, new Pair[]{
				new Pair(new Pattern.Leaf(type7), "e"), 
				new Pair(new Pattern.Leaf(type2), "t")}),
			null),
		null);
	private final static Pattern.Term pattern109 = new Pattern.Term("And",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("Is",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type7), "e1"), 
					new Pair(new Pattern.Leaf(type2), "t1")}),
				null),null), 
			new Pair(new Pattern.Term("Is",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type7), "e2"), 
					new Pair(new Pattern.Leaf(type2), "t2")}),
				null),null), 
			new Pair(new Pattern.Leaf(type11), "bs")}),
		null);
	// =========================================================================
	// rules
	// =========================================================================

	public static final InferenceRule[] inferences = new InferenceRule[]{
		new Inference_0(pattern49),
		new Inference_1(pattern70),
		new Inference_2(pattern71),
		new Inference_3(pattern80),
		new Inference_4(pattern81),
		new Inference_5(pattern93),
		new Inference_6(pattern98),
		new Inference_7(pattern99)
	};
	public static final ReductionRule[] reductions = new ReductionRule[]{
		new Reduction_0(pattern0),
		new Reduction_1(pattern1),
		new Reduction_2(pattern2),
		new Reduction_3(pattern3),
		new Reduction_4(pattern4),
		new Reduction_5(pattern5),
		new Reduction_6(pattern6),
		new Reduction_7(pattern7),
		new Reduction_8(pattern8),
		new Reduction_9(pattern9),
		new Reduction_10(pattern10),
		new Reduction_11(pattern11),
		new Reduction_12(pattern12),
		new Reduction_13(pattern13),
		new Reduction_14(pattern14),
		new Reduction_15(pattern15),
		new Reduction_16(pattern16),
		new Reduction_17(pattern17),
		new Reduction_18(pattern18),
		new Reduction_19(pattern19),
		new Reduction_20(pattern20),
		new Reduction_21(pattern21),
		new Reduction_22(pattern22),
		new Reduction_23(pattern23),
		new Reduction_24(pattern24),
		new Reduction_25(pattern25),
		new Reduction_26(pattern26),
		new Reduction_27(pattern27),
		new Reduction_28(pattern28),
		new Reduction_29(pattern29),
		new Reduction_30(pattern30),
		new Reduction_31(pattern31),
		new Reduction_32(pattern32),
		new Reduction_33(pattern33),
		new Reduction_34(pattern34),
		new Reduction_35(pattern35),
		new Reduction_36(pattern36),
		new Reduction_37(pattern37),
		new Reduction_38(pattern38),
		new Reduction_39(pattern39),
		new Reduction_40(pattern40),
		new Reduction_41(pattern41),
		new Reduction_42(pattern42),
		new Reduction_43(pattern43),
		new Reduction_44(pattern44),
		new Reduction_45(pattern45),
		new Reduction_46(pattern46),
		new Reduction_47(pattern47),
		new Reduction_48(pattern48),
		new Reduction_49(pattern50),
		new Reduction_50(pattern51),
		new Reduction_51(pattern52),
		new Reduction_52(pattern53),
		new Reduction_53(pattern54),
		new Reduction_54(pattern55),
		new Reduction_55(pattern56),
		new Reduction_56(pattern57),
		new Reduction_57(pattern58),
		new Reduction_58(pattern59),
		new Reduction_59(pattern60),
		new Reduction_60(pattern61),
		new Reduction_61(pattern62),
		new Reduction_62(pattern63),
		new Reduction_63(pattern64),
		new Reduction_64(pattern65),
		new Reduction_65(pattern66),
		new Reduction_66(pattern67),
		new Reduction_67(pattern68),
		new Reduction_68(pattern69),
		new Reduction_69(pattern72),
		new Reduction_70(pattern73),
		new Reduction_71(pattern74),
		new Reduction_72(pattern75),
		new Reduction_73(pattern76),
		new Reduction_74(pattern77),
		new Reduction_75(pattern78),
		new Reduction_76(pattern79),
		new Reduction_77(pattern82),
		new Reduction_78(pattern83),
		new Reduction_79(pattern84),
		new Reduction_80(pattern85),
		new Reduction_81(pattern86),
		new Reduction_82(pattern87),
		new Reduction_83(pattern88),
		new Reduction_84(pattern89),
		new Reduction_85(pattern90),
		new Reduction_86(pattern91),
		new Reduction_87(pattern92),
		new Reduction_88(pattern94),
		new Reduction_89(pattern95),
		new Reduction_90(pattern96),
		new Reduction_91(pattern97),
		new Reduction_92(pattern100),
		new Reduction_93(pattern101),
		new Reduction_94(pattern102),
		new Reduction_95(pattern103),
		new Reduction_96(pattern104),
		new Reduction_97(pattern105),
		new Reduction_98(pattern106),
		new Reduction_99(pattern107),
		new Reduction_100(pattern108),
		new Reduction_101(pattern109)
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
			IterativeRewriter.Strategy<InferenceRule> inferenceStrategy = new SimpleRewriteStrategy<InferenceRule>(automaton, inferences);
			IterativeRewriter.Strategy<ReductionRule> reductionStrategy = new SimpleRewriteStrategy<ReductionRule>(automaton, reductions);
			IterativeRewriter rw = new IterativeRewriter(automaton,inferenceStrategy, reductionStrategy, SCHEMA);
			rw.apply();
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
