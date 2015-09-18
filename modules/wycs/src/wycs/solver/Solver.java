package wycs.solver;

import java.io.*;
import java.util.*;
import java.math.BigInteger;
import wyautl.util.BigRational;
import wyautl.io.*;
import wyautl.core.*;
import wyrw.core.*;
import wyrl.core.*;
import wyrl.util.Runtime;
import wyrl.util.Pair;
import wyrl.util.AbstractRewriteRule;

public final class Solver {
	// term $4<NotT($2<^Type<$4|Atom<NotT($16<^Proton<TupleT(^[$16...])|ArrayT($16)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$16...])|ArrayT($16)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|OrT(^{$2...})|AndT(^{$2...})|ArrayT($2)|TupleT(^[$2...])|FunctionT(^[$2,$2,$2...])>>)>
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
	// term $7<AndT($5<^{$2<^Type<$7|Atom<NotT($19<^Proton<TupleT(^[$19...])|ArrayT($19)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$19...])|ArrayT($19)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($2)|OrT($5)|ArrayT($2)|TupleT(^[$2...])|FunctionT(^[$2,$2,$2...])>>...}>)>
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
	// term $7<OrT($5<^{$2<^Type<$7|Atom<NotT($19<^Proton<TupleT(^[$19...])|ArrayT($19)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$19...])|ArrayT($19)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($2)|AndT($5)|ArrayT($2)|TupleT(^[$2...])|FunctionT(^[$2,$2,$2...])>>...}>)>
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
	// term $7<TupleT(^[$2<^Type<$7|Atom<NotT($19<^Proton<TupleT(^[$19...])|ArrayT($19)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$19...])|ArrayT($19)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($2)|OrT(^{$2...})|AndT(^{$2...})|ArrayT($2)|FunctionT(^[$2,$2,$2...])>>...])>
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
	// TupleType_4
	private final static class Reduction_17 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_17(Pattern.Term pattern) { super(pattern); }

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
									if(s8.kind == K_ArrayT) {
										Automaton.Term t8 = (Automaton.Term) s8;
										int r9 = t8.contents;
										int[] state = {r0, r1, r2, r3, r4, 0, r6, r7, r8, r9, 0};
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
			int r7 = state[7];
			Automaton.Collection s1 = (Automaton.Collection) automaton.get(state[1]);
			int[] s1children = new int[s1.size() - 2];
			for(int s1i=0, s1j=0; s1i != s1.size();++s1i) {
				if(s1i == r3 || s1i == r7) { continue; }
				s1children[s1j++] = s1.get(s1i);
			}
			Automaton.Set r10 = new Automaton.Set(s1children);
			Automaton.Set r11 = new Automaton.Set(r2); // {t1}
			Automaton.Set r12 = r11.append(r10); // {t1} append ts
			int r13 = automaton.add(r12);
			Automaton.Term r14 = new Automaton.Term(K_AndT, r13);
			int r15 = automaton.add(r14);
			if(r0 != r15) {
				return automaton.rewrite(r0, r15);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "TupleType_4"; }
		public final int rank() { return 2; }

		public final int minimum() { return 6; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// term $4<ArrayT($2<^Type<$4|Atom<NotT($16<^Proton<TupleT(^[$16...])|ArrayT($16)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$16...])|ArrayT($16)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($2)|OrT(^{$2...})|AndT(^{$2...})|TupleT(^[$2...])|FunctionT(^[$2,$2,$2...])>>)>
	public final static int K_ArrayT = 4;
	public final static int ArrayT(Automaton automaton, int r0) {
		return automaton.add(new Automaton.Term(K_ArrayT, r0));
	}

	// ArrayType_1
	private final static class Reduction_18 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_18(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_ArrayT) {
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
			Automaton.Term r2 = VoidT;
			int r3 = automaton.add(r2);
			if(r0 != r3) {
				return automaton.rewrite(r0, r3);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "ArrayType_1"; }
		public final int rank() { return 0; }

		public final int minimum() { return 1; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// ArrayType_2
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
						if(s2.kind == K_ArrayT) {
							Automaton.Term t2 = (Automaton.Term) s2;
							int r4 = t2.contents;
							for(int r6=0;r6!=c1.size();++r6) {
								if(r6 == r3) { continue; }
								int r5 = c1.get(r6);
								Automaton.State s5 = automaton.get(r5);
								if(s5.kind == K_ArrayT) {
									Automaton.Term t5 = (Automaton.Term) s5;
									int r7 = t5.contents;
									int[] state = {r0, r1, r2, r3, r4, r5, r6, r7, 0};
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
			int r4 = state[4]; // t1
			int r6 = state[6];
			int r7 = state[7]; // t2
			Automaton.Collection s1 = (Automaton.Collection) automaton.get(state[1]);
			int[] s1children = new int[s1.size() - 2];
			for(int s1i=0, s1j=0; s1i != s1.size();++s1i) {
				if(s1i == r3 || s1i == r6) { continue; }
				s1children[s1j++] = s1.get(s1i);
			}
			Automaton.Set r8 = new Automaton.Set(s1children);
			Automaton.Set r9 = new Automaton.Set(r4, r7); // {t1t2}
			int r10 = automaton.add(r9);
			Automaton.Term r11 = new Automaton.Term(K_AndT, r10);
			int r12 = automaton.add(r11);
			Automaton.Term r13 = new Automaton.Term(K_ArrayT, r12);
			int r14 = automaton.add(r13);
			Automaton.Set r15 = r8.appendFront(r14); // ArrayT(AndT({t1t2})) append ts
			int r16 = automaton.add(r15);
			Automaton.Term r17 = new Automaton.Term(K_AndT, r16);
			int r18 = automaton.add(r17);
			if(r0 != r18) {
				return automaton.rewrite(r0, r18);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "ArrayType_2"; }
		public final int rank() { return 2; }

		public final int minimum() { return 5; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// ArrayType_3
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
						if(s2.kind == K_ArrayT) {
							Automaton.Term t2 = (Automaton.Term) s2;
							int r4 = t2.contents;
							for(int r6=0;r6!=c1.size();++r6) {
								if(r6 == r3) { continue; }
								int r5 = c1.get(r6);
								Automaton.State s5 = automaton.get(r5);
								if(s5.kind == K_NotT) {
									Automaton.Term t5 = (Automaton.Term) s5;
									int r7 = t5.contents;
									Automaton.State s7 = automaton.get(r7);
									if(s7.kind == K_ArrayT) {
										Automaton.Term t7 = (Automaton.Term) s7;
										int r8 = t7.contents;
										int[] state = {r0, r1, r2, r3, r4, r5, r6, r7, r8, 0};
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
			int r4 = state[4]; // t1
			int r6 = state[6];
			int r8 = state[8]; // t2
			Automaton.Collection s1 = (Automaton.Collection) automaton.get(state[1]);
			int[] s1children = new int[s1.size() - 2];
			for(int s1i=0, s1j=0; s1i != s1.size();++s1i) {
				if(s1i == r3 || s1i == r6) { continue; }
				s1children[s1j++] = s1.get(s1i);
			}
			Automaton.Set r9 = new Automaton.Set(s1children);
			Automaton.Term r10 = new Automaton.Term(K_NotT, r8);
			int r11 = automaton.add(r10);
			Automaton.Set r12 = new Automaton.Set(r4, r11); // {t1NotT(t2)}
			int r13 = automaton.add(r12);
			Automaton.Term r14 = new Automaton.Term(K_AndT, r13);
			int r15 = automaton.add(r14);
			Automaton.Term r16 = new Automaton.Term(K_ArrayT, r15);
			int r17 = automaton.add(r16);
			Automaton.Set r18 = r9.appendFront(r17); // ArrayT(AndT({t1NotT(t2)})) append ts
			int r19 = automaton.add(r18);
			Automaton.Term r20 = new Automaton.Term(K_AndT, r19);
			int r21 = automaton.add(r20);
			if(r0 != r21) {
				return automaton.rewrite(r0, r21);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "ArrayType_3"; }
		public final int rank() { return 2; }

		public final int minimum() { return 6; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// ArrayType_3b
	private final static class Reduction_21 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_21(Pattern.Term pattern) { super(pattern); }

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
						if(s2.kind == K_ArrayT) {
							Automaton.Term t2 = (Automaton.Term) s2;
							int r4 = t2.contents;
							for(int r6=0;r6!=c1.size();++r6) {
								if(r6 == r3) { continue; }
								int r5 = c1.get(r6);
								Automaton.State s5 = automaton.get(r5);
								if(s5.kind == K_NotT) {
									Automaton.Term t5 = (Automaton.Term) s5;
									int r7 = t5.contents;
									Automaton.State s7 = automaton.get(r7);
									if(s7.kind == K_TupleT) {
										Automaton.Term t7 = (Automaton.Term) s7;
										int r8 = t7.contents;
										Automaton.State s8 = automaton.get(r8);
										Automaton.List l8 = (Automaton.List) s8;
										int[] state = {r0, r1, r2, r3, r4, r5, r6, r7, r8, 0, 0};
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
			int r6 = state[6];
			Automaton.Collection s1 = (Automaton.Collection) automaton.get(state[1]);
			int[] s1children = new int[s1.size() - 2];
			for(int s1i=0, s1j=0; s1i != s1.size();++s1i) {
				if(s1i == r3 || s1i == r6) { continue; }
				s1children[s1j++] = s1.get(s1i);
			}
			Automaton.Set r10 = new Automaton.Set(s1children);
			Automaton.Set r11 = new Automaton.Set(r2); // {t1}
			Automaton.Set r12 = r11.append(r10); // {t1} append ts
			int r13 = automaton.add(r12);
			Automaton.Term r14 = new Automaton.Term(K_AndT, r13);
			int r15 = automaton.add(r14);
			if(r0 != r15) {
				return automaton.rewrite(r0, r15);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "ArrayType_3b"; }
		public final int rank() { return 2; }

		public final int minimum() { return 6; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// ArrayType_4
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
				if(c1.size() >= 2) {
					for(int r3=0;r3!=c1.size();++r3) {
						int r2 = c1.get(r3);
						Automaton.State s2 = automaton.get(r2);
						if(s2.kind == K_ArrayT) {
							Automaton.Term t2 = (Automaton.Term) s2;
							int r4 = t2.contents;
							for(int r6=0;r6!=c1.size();++r6) {
								if(r6 == r3) { continue; }
								int r5 = c1.get(r6);
								if(Runtime.accepts(type3,automaton,automaton.get(r5), SCHEMA)) {
									int[] state = {r0, r1, r2, r3, r4, r5, r6, 0};
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
			int r5 = state[5]; // p
			int r6 = state[6];
			Automaton.Collection s1 = (Automaton.Collection) automaton.get(state[1]);
			int[] s1children = new int[s1.size() - 2];
			for(int s1i=0, s1j=0; s1i != s1.size();++s1i) {
				if(s1i == r3 || s1i == r6) { continue; }
				s1children[s1j++] = s1.get(s1i);
			}
			Automaton.Set r7 = new Automaton.Set(s1children);
			boolean r8 = Runtime.accepts(type4, automaton, r5, SCHEMA); // p is ^AnyT
			boolean r9 = !r8;              // !p is ^AnyT
			if(r9) {
				Automaton.Term r10 = VoidT;
				int r11 = automaton.add(r10);
				if(r0 != r11) {
					return automaton.rewrite(r0, r11);
				}
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "ArrayType_4"; }
		public final int rank() { return 1; }

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// ArrayType_5
	private final static class Reduction_23 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_23(Pattern.Term pattern) { super(pattern); }

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
						if(s2.kind == K_ArrayT) {
							Automaton.Term t2 = (Automaton.Term) s2;
							int r4 = t2.contents;
							for(int r6=0;r6!=c1.size();++r6) {
								if(r6 == r3) { continue; }
								int r5 = c1.get(r6);
								Automaton.State s5 = automaton.get(r5);
								if(s5.kind == K_ArrayT) {
									Automaton.Term t5 = (Automaton.Term) s5;
									int r7 = t5.contents;
									int[] state = {r0, r1, r2, r3, r4, r5, r6, r7, 0};
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
			int r4 = state[4]; // t1
			int r5 = state[5]; // s2
			int r6 = state[6];
			int r7 = state[7]; // t2
			Automaton.Collection s1 = (Automaton.Collection) automaton.get(state[1]);
			int[] s1children = new int[s1.size() - 2];
			for(int s1i=0, s1j=0; s1i != s1.size();++s1i) {
				if(s1i == r3 || s1i == r6) { continue; }
				s1children[s1j++] = s1.get(s1i);
			}
			Automaton.Set r8 = new Automaton.Set(s1children);
			boolean r9 = r4 == r7;         // t1 eq t2
			if(r9) {
				Automaton.Set r10 = new Automaton.Set(r2); // {s1}
				Automaton.Set r11 = r10.append(r8); // {s1} append ts
				int r12 = automaton.add(r11);
				Automaton.Term r13 = new Automaton.Term(K_OrT, r12);
				int r14 = automaton.add(r13);
				if(r0 != r14) {
					return automaton.rewrite(r0, r14);
				}
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "ArrayType_5"; }
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
	private final static class Reduction_26 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_26(Pattern.Term pattern) { super(pattern); }

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
						if(Runtime.accepts(type5,automaton,automaton.get(r2), SCHEMA)) {
							for(int r5=0;r5!=c1.size();++r5) {
								if(r5 == r3) { continue; }
								int r4 = c1.get(r5);
								if(Runtime.accepts(type3,automaton,automaton.get(r4), SCHEMA)) {
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
	private final static class Reduction_27 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_27(Pattern.Term pattern) { super(pattern); }

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
						if(Runtime.accepts(type5,automaton,automaton.get(r2), SCHEMA)) {
							for(int r5=0;r5!=c1.size();++r5) {
								if(r5 == r3) { continue; }
								int r4 = c1.get(r5);
								Automaton.State s4 = automaton.get(r4);
								if(s4.kind == K_NotT) {
									Automaton.Term t4 = (Automaton.Term) s4;
									int r6 = t4.contents;
									if(Runtime.accepts(type3,automaton,automaton.get(r6), SCHEMA)) {
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
	private final static class Reduction_28 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_28(Pattern.Term pattern) { super(pattern); }

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
	private final static class Reduction_29 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_29(Pattern.Term pattern) { super(pattern); }

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
	// term $8<FunctionT(^[$2<^Type<$8|Atom<NotT($20<^Proton<TupleT(^[$20...])|ArrayT($20)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$20...])|ArrayT($20)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($2)|OrT(^{$2...})|AndT(^{$2...})|ArrayT($2)|TupleT(^[$2...])>>,$2,$2...])>
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

	// term $7<Tuple($5<^[$2<^Expr<$7|$40<Value<Null|Tuple(^[^$40...])|Bool<True|False>|Num(^real)|String(^string)|Array(^[^$40...])>>|$77<BExpr<Bool<True|False>|VExpr<Var(^string)|Fn(^[^string,$2...])|Load(^[$2,^int])|LengthOf($2)|IndexOf(^[$2,$2])>|And(^{^$77...})|Or(^{^$77...})|Not(^$77)|Equals(^[$123<^Type<Atom<NotT($146<^Proton<TupleT(^[$146...])|ArrayT($146)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$146...])|ArrayT($146)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($123)|OrT(^{$123...})|AndT(^{$123...})|ArrayT($123)|TupleT(^[$123...])|FunctionT(^[$123,$123,$123...])>>,^{|$2,$2|}[$2,$2]])|Inequality(^[^AType<IntT|RealT>,$220<^AExpr<Num(^real)|VExpr<Var(^string)|Fn(^[^string,$2...])|Load(^[$2,^int])|LengthOf($2)|IndexOf(^[$2,$2])>|Sum(^[^real,^{|$220...|}[$220...]])|Mul(^[^real,^{|$220...|}[$220...]])|Div(^[$220,$220])>>])|Equation(^[^AType<IntT|RealT>,$220])|ForAll(^[^{^[^Var(^string),$123]...},^$77])|Exists(^[^{^[^Var(^string),$123]...},^$77])>>|AExpr<Num(^real)|VExpr<Var(^string)|Fn(^[^string,$2...])|Load(^[$2,^int])|LengthOf($2)|IndexOf(^[$2,$2])>|Sum(^[^real,^{|$220...|}[$220...]])|Mul(^[^real,^{|$220...|}[$220...]])|Div(^[$220,$220])>|SExpr<VExpr<Var(^string)|Fn(^[^string,$2...])|Load(^[$2,^int])|LengthOf($2)|IndexOf(^[$2,$2])>|Array($5)>>>...]>)>
	public final static int K_Tuple = 20;
	public final static int Tuple(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_Tuple, r1));
	}
	public final static int Tuple(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_Tuple, r1));
	}

	// term $9<Load(^[$2<^Expr<$43<Value<Null|Tuple(^[^$43...])|Bool<True|False>|Num(^real)|String(^string)|Array(^[^$43...])>>|Tuple(^[$2...])|$85<BExpr<Bool<True|False>|VExpr<$9|Var(^string)|Fn(^[^string,$2...])|LengthOf($2)|IndexOf(^[$2,$2])>|And(^{^$85...})|Or(^{^$85...})|Not(^$85)|Equals(^[$123<^Type<Atom<NotT($146<^Proton<TupleT(^[$146...])|ArrayT($146)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$146...])|ArrayT($146)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($123)|OrT(^{$123...})|AndT(^{$123...})|ArrayT($123)|TupleT(^[$123...])|FunctionT(^[$123,$123,$123...])>>,^{|$2,$2|}[$2,$2]])|Inequality(^[^AType<IntT|RealT>,$220<^AExpr<Num(^real)|VExpr<$9|Var(^string)|Fn(^[^string,$2...])|LengthOf($2)|IndexOf(^[$2,$2])>|Sum(^[^real,^{|$220...|}[$220...]])|Mul(^[^real,^{|$220...|}[$220...]])|Div(^[$220,$220])>>])|Equation(^[^AType<IntT|RealT>,$220])|ForAll(^[^{^[^Var(^string),$123]...},^$85])|Exists(^[^{^[^Var(^string),$123]...},^$85])>>|AExpr<Num(^real)|VExpr<$9|Var(^string)|Fn(^[^string,$2...])|LengthOf($2)|IndexOf(^[$2,$2])>|Sum(^[^real,^{|$220...|}[$220...]])|Mul(^[^real,^{|$220...|}[$220...]])|Div(^[$220,$220])>|SExpr<VExpr<$9|Var(^string)|Fn(^[^string,$2...])|LengthOf($2)|IndexOf(^[$2,$2])>|Array(^[$2...])>>>,^int])>
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
	private final static class Reduction_30 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_30(Pattern.Term pattern) { super(pattern); }

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
	// term $4<LengthOf($2<^Expr<$38<Value<Null|Tuple(^[^$38...])|Bool<True|False>|Num(^real)|String(^string)|Array(^[^$38...])>>|Tuple(^[$2...])|$80<BExpr<Bool<True|False>|VExpr<$4|Var(^string)|Fn(^[^string,$2...])|Load(^[$2,^int])|IndexOf(^[$2,$2])>|And(^{^$80...})|Or(^{^$80...})|Not(^$80)|Equals(^[$123<^Type<Atom<NotT($146<^Proton<TupleT(^[$146...])|ArrayT($146)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$146...])|ArrayT($146)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($123)|OrT(^{$123...})|AndT(^{$123...})|ArrayT($123)|TupleT(^[$123...])|FunctionT(^[$123,$123,$123...])>>,^{|$2,$2|}[$2,$2]])|Inequality(^[^AType<IntT|RealT>,$220<^AExpr<Num(^real)|VExpr<$4|Var(^string)|Fn(^[^string,$2...])|Load(^[$2,^int])|IndexOf(^[$2,$2])>|Sum(^[^real,^{|$220...|}[$220...]])|Mul(^[^real,^{|$220...|}[$220...]])|Div(^[$220,$220])>>])|Equation(^[^AType<IntT|RealT>,$220])|ForAll(^[^{^[^Var(^string),$123]...},^$80])|Exists(^[^{^[^Var(^string),$123]...},^$80])>>|AExpr<Num(^real)|VExpr<$4|Var(^string)|Fn(^[^string,$2...])|Load(^[$2,^int])|IndexOf(^[$2,$2])>|Sum(^[^real,^{|$220...|}[$220...]])|Mul(^[^real,^{|$220...|}[$220...]])|Div(^[$220,$220])>|SExpr<VExpr<$4|Var(^string)|Fn(^[^string,$2...])|Load(^[$2,^int])|IndexOf(^[$2,$2])>|Array(^[$2...])>>>)>
	public final static int K_LengthOf = 22;
	public final static int LengthOf(Automaton automaton, int r0) {
		return automaton.add(new Automaton.Term(K_LengthOf, r0));
	}

	// LengthOf_1
	private final static class Reduction_31 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_31(Pattern.Term pattern) { super(pattern); }

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
	private final static class Reduction_32 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_32(Pattern.Term pattern) { super(pattern); }

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
	private final static class Reduction_33 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_33(Pattern.Term pattern) { super(pattern); }

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
								if(Runtime.accepts(type8,automaton,automaton.get(r7), SCHEMA)) {
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
	// term $9<Fn(^[^string,$3<^Expr<$43<Value<Null|Tuple(^[^$43...])|Bool<True|False>|Num(^real)|String(^string)|Array(^[^$43...])>>|Tuple(^[$3...])|$84<BExpr<Bool<True|False>|VExpr<$9|Var(^string)|Load(^[$3,^int])|LengthOf($3)|IndexOf(^[$3,$3])>|And(^{^$84...})|Or(^{^$84...})|Not(^$84)|Equals(^[$123<^Type<Atom<NotT($146<^Proton<TupleT(^[$146...])|ArrayT($146)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$146...])|ArrayT($146)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($123)|OrT(^{$123...})|AndT(^{$123...})|ArrayT($123)|TupleT(^[$123...])|FunctionT(^[$123,$123,$123...])>>,^{|$3,$3|}[$3,$3]])|Inequality(^[^AType<IntT|RealT>,$220<^AExpr<Num(^real)|VExpr<$9|Var(^string)|Load(^[$3,^int])|LengthOf($3)|IndexOf(^[$3,$3])>|Sum(^[^real,^{|$220...|}[$220...]])|Mul(^[^real,^{|$220...|}[$220...]])|Div(^[$220,$220])>>])|Equation(^[^AType<IntT|RealT>,$220])|ForAll(^[^{^[^Var(^string),$123]...},^$84])|Exists(^[^{^[^Var(^string),$123]...},^$84])>>|AExpr<Num(^real)|VExpr<$9|Var(^string)|Load(^[$3,^int])|LengthOf($3)|IndexOf(^[$3,$3])>|Sum(^[^real,^{|$220...|}[$220...]])|Mul(^[^real,^{|$220...|}[$220...]])|Div(^[$220,$220])>|SExpr<VExpr<$9|Var(^string)|Load(^[$3,^int])|LengthOf($3)|IndexOf(^[$3,$3])>|Array(^[$3...])>>>...])>
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

	// term $4<Not($2<^$25<BExpr<$4|$36<VExpr<Var(^string)|Fn(^[^string,$41<^Expr<$25|$79<Value<Null|Tuple(^[^$79...])|Bool<True|False>|Num(^real)|String(^string)|Array(^[^$79...])>>|Tuple(^[$41...])|$106<AExpr<$36|Num(^real)|Sum(^[^real,^{|^$106...|}[^$106...]])|Mul(^[^real,^{|^$106...|}[^$106...]])|Div(^[^$106,^$106])>>|SExpr<$36|Array(^[$41...])>>>...])|Load(^[$41,^int])|LengthOf($41)|IndexOf(^[$41,$41])>>|Bool<True|False>|And(^{$2...})|Or(^{$2...})|Equals(^[$154<^Type<Atom<NotT($177<^Proton<TupleT(^[$177...])|ArrayT($177)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$177...])|ArrayT($177)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($154)|OrT(^{$154...})|AndT(^{$154...})|ArrayT($154)|TupleT(^[$154...])|FunctionT(^[$154,$154,$154...])>>,^{|$41,$41|}[$41,$41]])|Inequality(^[^AType<IntT|RealT>,^$106])|Equation(^[^AType<IntT|RealT>,^$106])|ForAll(^[^{^[^Var(^string),$154]...},$2])|Exists(^[^{^[^Var(^string),$154]...},$2])>>>)>
	public final static int K_Not = 25;
	public final static int Not(Automaton automaton, int r0) {
		return automaton.add(new Automaton.Term(K_Not, r0));
	}

	// Not_1
	private final static class Reduction_34 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_34(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Not) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				if(Runtime.accepts(type11,automaton,automaton.get(r1), SCHEMA)) {
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
	private final static class Reduction_35 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_35(Pattern.Term pattern) { super(pattern); }

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
	private final static class Reduction_36 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_36(Pattern.Term pattern) { super(pattern); }

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
	private final static class Reduction_37 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_37(Pattern.Term pattern) { super(pattern); }

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
	// term $7<And($5<^{$2<^$28<BExpr<$7|$39<VExpr<Var(^string)|Fn(^[^string,$44<^Expr<$28|$82<Value<Null|Tuple(^[^$82...])|Bool<True|False>|Num(^real)|String(^string)|Array(^[^$82...])>>|Tuple(^[$44...])|$109<AExpr<$39|Num(^real)|Sum(^[^real,^{|^$109...|}[^$109...]])|Mul(^[^real,^{|^$109...|}[^$109...]])|Div(^[^$109,^$109])>>|SExpr<$39|Array(^[$44...])>>>...])|Load(^[$44,^int])|LengthOf($44)|IndexOf(^[$44,$44])>>|Bool<True|False>|Or($5)|Not($2)|Equals(^[$154<^Type<Atom<NotT($177<^Proton<TupleT(^[$177...])|ArrayT($177)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$177...])|ArrayT($177)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($154)|OrT(^{$154...})|AndT(^{$154...})|ArrayT($154)|TupleT(^[$154...])|FunctionT(^[$154,$154,$154...])>>,^{|$44,$44|}[$44,$44]])|Inequality(^[^AType<IntT|RealT>,^$109])|Equation(^[^AType<IntT|RealT>,^$109])|ForAll(^[^{^[^Var(^string),$154]...},$2])|Exists(^[^{^[^Var(^string),$154]...},$2])>>>...}>)>
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
						if(Runtime.accepts(type13,automaton,automaton.get(r2), SCHEMA)) {
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
	private final static class Reduction_42 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_42(Pattern.Term pattern) { super(pattern); }

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
	private final static class Reduction_43 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_43(Pattern.Term pattern) { super(pattern); }

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
	// term $7<Or($5<^{$2<^$28<BExpr<$7|$39<VExpr<Var(^string)|Fn(^[^string,$44<^Expr<$28|$82<Value<Null|Tuple(^[^$82...])|Bool<True|False>|Num(^real)|String(^string)|Array(^[^$82...])>>|Tuple(^[$44...])|$109<AExpr<$39|Num(^real)|Sum(^[^real,^{|^$109...|}[^$109...]])|Mul(^[^real,^{|^$109...|}[^$109...]])|Div(^[^$109,^$109])>>|SExpr<$39|Array(^[$44...])>>>...])|Load(^[$44,^int])|LengthOf($44)|IndexOf(^[$44,$44])>>|Bool<True|False>|And($5)|Not($2)|Equals(^[$154<^Type<Atom<NotT($177<^Proton<TupleT(^[$177...])|ArrayT($177)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$177...])|ArrayT($177)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($154)|OrT(^{$154...})|AndT(^{$154...})|ArrayT($154)|TupleT(^[$154...])|FunctionT(^[$154,$154,$154...])>>,^{|$44,$44|}[$44,$44]])|Inequality(^[^AType<IntT|RealT>,^$109])|Equation(^[^AType<IntT|RealT>,^$109])|ForAll(^[^{^[^Var(^string),$154]...},$2])|Exists(^[^{^[^Var(^string),$154]...},$2])>>>...}>)>
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
						if(Runtime.accepts(type13,automaton,automaton.get(r2), SCHEMA)) {
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
	private final static class Reduction_47 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_47(Pattern.Term pattern) { super(pattern); }

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
	private final static class Reduction_48 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_48(Pattern.Term pattern) { super(pattern); }

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
	// term $14<Equals(^[$2<^Type<Atom<NotT($27<^Proton<TupleT(^[$27...])|ArrayT($27)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$27...])|ArrayT($27)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($2)|OrT(^{$2...})|AndT(^{$2...})|ArrayT($2)|TupleT(^[$2...])|FunctionT(^[$2,$2,$2...])>>,^{|$4<^Expr<$133<Value<Null|Tuple(^[^$133...])|Bool<True|False>|Num(^real)|String(^string)|Array(^[^$133...])>>|Tuple(^[$4...])|$173<BExpr<$14|Bool<True|False>|VExpr<Var(^string)|Fn(^[^string,$4...])|Load(^[$4,^int])|LengthOf($4)|IndexOf(^[$4,$4])>|And(^{^$173...})|Or(^{^$173...})|Not(^$173)|Inequality(^[^AType<IntT|RealT>,$220<^AExpr<Num(^real)|VExpr<Var(^string)|Fn(^[^string,$4...])|Load(^[$4,^int])|LengthOf($4)|IndexOf(^[$4,$4])>|Sum(^[^real,^{|$220...|}[$220...]])|Mul(^[^real,^{|$220...|}[$220...]])|Div(^[$220,$220])>>])|Equation(^[^AType<IntT|RealT>,$220])|ForAll(^[^{^[^Var(^string),$2]...},^$173])|Exists(^[^{^[^Var(^string),$2]...},^$173])>>|AExpr<Num(^real)|VExpr<Var(^string)|Fn(^[^string,$4...])|Load(^[$4,^int])|LengthOf($4)|IndexOf(^[$4,$4])>|Sum(^[^real,^{|$220...|}[$220...]])|Mul(^[^real,^{|$220...|}[$220...]])|Div(^[$220,$220])>|SExpr<VExpr<Var(^string)|Fn(^[^string,$4...])|Load(^[$4,^int])|LengthOf($4)|IndexOf(^[$4,$4])>|Array(^[$4...])>>>,$4|}[$4<^Expr<$133<Value<Null|Tuple(^[^$133...])|Bool<True|False>|Num(^real)|String(^string)|Array(^[^$133...])>>|Tuple(^[$4...])|$173<BExpr<$14|Bool<True|False>|VExpr<Var(^string)|Fn(^[^string,$4...])|Load(^[$4,^int])|LengthOf($4)|IndexOf(^[$4,$4])>|And(^{^$173...})|Or(^{^$173...})|Not(^$173)|Inequality(^[^AType<IntT|RealT>,$220<^AExpr<Num(^real)|VExpr<Var(^string)|Fn(^[^string,$4...])|Load(^[$4,^int])|LengthOf($4)|IndexOf(^[$4,$4])>|Sum(^[^real,^{|$220...|}[$220...]])|Mul(^[^real,^{|$220...|}[$220...]])|Div(^[$220,$220])>>])|Equation(^[^AType<IntT|RealT>,$220])|ForAll(^[^{^[^Var(^string),$2]...},^$173])|Exists(^[^{^[^Var(^string),$2]...},^$173])>>|AExpr<Num(^real)|VExpr<Var(^string)|Fn(^[^string,$4...])|Load(^[$4,^int])|LengthOf($4)|IndexOf(^[$4,$4])>|Sum(^[^real,^{|$220...|}[$220...]])|Mul(^[^real,^{|$220...|}[$220...]])|Div(^[$220,$220])>|SExpr<VExpr<Var(^string)|Fn(^[^string,$4...])|Load(^[$4,^int])|LengthOf($4)|IndexOf(^[$4,$4])>|Array(^[$4...])>>>,$4]])>
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
	private final static class Reduction_49 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_49(Pattern.Term pattern) { super(pattern); }

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
			boolean r12 = false;           // x neq y && x is $1<^Value<Null|Tuple(^[$1...])|Bool<True|False>|Num(^real)|String(^string)|Array(^[$1...])>> && y is $1<^Value<Null|Tuple(^[$1...])|Bool<True|False>|Num(^real)|String(^string)|Array(^[$1...])>>
			if(r11) {
				boolean r13 = Runtime.accepts(type15, automaton, r4, SCHEMA); // x is $1<^Value<Null|Tuple(^[$1...])|Bool<True|False>|Num(^real)|String(^string)|Array(^[$1...])>>
				boolean r14 = false;           // x is $1<^Value<Null|Tuple(^[$1...])|Bool<True|False>|Num(^real)|String(^string)|Array(^[$1...])>> && y is $1<^Value<Null|Tuple(^[$1...])|Bool<True|False>|Num(^real)|String(^string)|Array(^[$1...])>>
				if(r13) {
					boolean r15 = Runtime.accepts(type15, automaton, r6, SCHEMA); // y is $1<^Value<Null|Tuple(^[$1...])|Bool<True|False>|Num(^real)|String(^string)|Array(^[$1...])>>
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
	private final static class Reduction_50 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_50(Pattern.Term pattern) { super(pattern); }

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
								if(Runtime.accepts(type8,automaton,automaton.get(r7), SCHEMA)) {
									for(int r10=0;r10!=c6.size();++r10) {
										if(r10 == r8) { continue; }
										int r9 = c6.get(r10);
										if(Runtime.accepts(type16,automaton,automaton.get(r9), SCHEMA)) {
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
								if(Runtime.accepts(type8,automaton,automaton.get(r7), SCHEMA)) {
									for(int r10=0;r10!=c6.size();++r10) {
										if(r10 == r8) { continue; }
										int r9 = c6.get(r10);
										if(Runtime.accepts(type8,automaton,automaton.get(r9), SCHEMA)) {
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
	// term $12<Mul($10<^[^real,^{|$3<^$20<AExpr<$12|Num(^real)|Sum($10)|Div(^[$3,$3])|$41<VExpr<Var(^string)|Fn(^[^string,$46<^Expr<$20|$84<Value<Num(^real)|Null|Tuple(^[^$84...])|Bool<True|False>|String(^string)|Array(^[^$84...])>>|Tuple(^[$46...])|$121<BExpr<$41|Bool<True|False>|And(^{^$121...})|Or(^{^$121...})|Not(^$121)|Equals(^[$133<^Type<Atom<NotT($156<^Proton<TupleT(^[$156...])|ArrayT($156)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$156...])|ArrayT($156)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($133)|OrT(^{$133...})|AndT(^{$133...})|ArrayT($133)|TupleT(^[$133...])|FunctionT(^[$133,$133,$133...])>>,^{|$46,$46|}[$46,$46]])|Inequality(^[^AType<IntT|RealT>,$3])|Equation(^[^AType<IntT|RealT>,$3])|ForAll(^[^{^[^Var(^string),$133]...},^$121])|Exists(^[^{^[^Var(^string),$133]...},^$121])>>|SExpr<$41|Array(^[$46...])>>>...])|Load(^[$46,^int])|LengthOf($46)|IndexOf(^[$46,$46])>>>>>...|}[$3<^$20<AExpr<$12|Num(^real)|Sum($10)|Div(^[$3,$3])|$41<VExpr<Var(^string)|Fn(^[^string,$46<^Expr<$20|$84<Value<Num(^real)|Null|Tuple(^[^$84...])|Bool<True|False>|String(^string)|Array(^[^$84...])>>|Tuple(^[$46...])|$121<BExpr<$41|Bool<True|False>|And(^{^$121...})|Or(^{^$121...})|Not(^$121)|Equals(^[$133<^Type<Atom<NotT($156<^Proton<TupleT(^[$156...])|ArrayT($156)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$156...])|ArrayT($156)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($133)|OrT(^{$133...})|AndT(^{$133...})|ArrayT($133)|TupleT(^[$133...])|FunctionT(^[$133,$133,$133...])>>,^{|$46,$46|}[$46,$46]])|Inequality(^[^AType<IntT|RealT>,$3])|Equation(^[^AType<IntT|RealT>,$3])|ForAll(^[^{^[^Var(^string),$133]...},^$121])|Exists(^[^{^[^Var(^string),$133]...},^$121])>>|SExpr<$41|Array(^[$46...])>>>...])|Load(^[$46,^int])|LengthOf($46)|IndexOf(^[$46,$46])>>>>>...]]>)>
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
	private final static class Reduction_53 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_53(Pattern.Term pattern) { super(pattern); }

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
	private final static class Reduction_54 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_54(Pattern.Term pattern) { super(pattern); }

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
	// term $8<Div(^[$2<^$16<AExpr<$8|Num(^real)|Sum(^[^real,^{|$2...|}[$2...]])|Mul(^[^real,^{|$2...|}[$2...]])|$41<VExpr<Var(^string)|Fn(^[^string,$46<^Expr<$16|$84<Value<Num(^real)|Null|Tuple(^[^$84...])|Bool<True|False>|String(^string)|Array(^[^$84...])>>|Tuple(^[$46...])|$121<BExpr<$41|Bool<True|False>|And(^{^$121...})|Or(^{^$121...})|Not(^$121)|Equals(^[$133<^Type<Atom<NotT($156<^Proton<TupleT(^[$156...])|ArrayT($156)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$156...])|ArrayT($156)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($133)|OrT(^{$133...})|AndT(^{$133...})|ArrayT($133)|TupleT(^[$133...])|FunctionT(^[$133,$133,$133...])>>,^{|$46,$46|}[$46,$46]])|Inequality(^[^AType<IntT|RealT>,$2])|Equation(^[^AType<IntT|RealT>,$2])|ForAll(^[^{^[^Var(^string),$133]...},^$121])|Exists(^[^{^[^Var(^string),$133]...},^$121])>>|SExpr<$41|Array(^[$46...])>>>...])|Load(^[$46,^int])|LengthOf($46)|IndexOf(^[$46,$46])>>>>>,$2])>
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
			boolean r16 = Runtime.accepts(type19, automaton, r9, SCHEMA); // y is ^Num(^real)
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
	private final static class Reduction_60 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_60(Pattern.Term pattern) { super(pattern); }

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
	private final static class Reduction_61 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_61(Pattern.Term pattern) { super(pattern); }

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
	// term $12<Sum($10<^[^real,^{|$3<^$20<AExpr<$12|Num(^real)|Mul($10)|Div(^[$3,$3])|$41<VExpr<Var(^string)|Fn(^[^string,$46<^Expr<$20|$84<Value<Num(^real)|Null|Tuple(^[^$84...])|Bool<True|False>|String(^string)|Array(^[^$84...])>>|Tuple(^[$46...])|$121<BExpr<$41|Bool<True|False>|And(^{^$121...})|Or(^{^$121...})|Not(^$121)|Equals(^[$133<^Type<Atom<NotT($156<^Proton<TupleT(^[$156...])|ArrayT($156)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$156...])|ArrayT($156)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($133)|OrT(^{$133...})|AndT(^{$133...})|ArrayT($133)|TupleT(^[$133...])|FunctionT(^[$133,$133,$133...])>>,^{|$46,$46|}[$46,$46]])|Inequality(^[^AType<IntT|RealT>,$3])|Equation(^[^AType<IntT|RealT>,$3])|ForAll(^[^{^[^Var(^string),$133]...},^$121])|Exists(^[^{^[^Var(^string),$133]...},^$121])>>|SExpr<$41|Array(^[$46...])>>>...])|Load(^[$46,^int])|LengthOf($46)|IndexOf(^[$46,$46])>>>>>...|}[$3<^$20<AExpr<$12|Num(^real)|Mul($10)|Div(^[$3,$3])|$41<VExpr<Var(^string)|Fn(^[^string,$46<^Expr<$20|$84<Value<Num(^real)|Null|Tuple(^[^$84...])|Bool<True|False>|String(^string)|Array(^[^$84...])>>|Tuple(^[$46...])|$121<BExpr<$41|Bool<True|False>|And(^{^$121...})|Or(^{^$121...})|Not(^$121)|Equals(^[$133<^Type<Atom<NotT($156<^Proton<TupleT(^[$156...])|ArrayT($156)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$156...])|ArrayT($156)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($133)|OrT(^{$133...})|AndT(^{$133...})|ArrayT($133)|TupleT(^[$133...])|FunctionT(^[$133,$133,$133...])>>,^{|$46,$46|}[$46,$46]])|Inequality(^[^AType<IntT|RealT>,$3])|Equation(^[^AType<IntT|RealT>,$3])|ForAll(^[^{^[^Var(^string),$133]...},^$121])|Exists(^[^{^[^Var(^string),$133]...},^$121])>>|SExpr<$41|Array(^[$46...])>>>...])|Load(^[$46,^int])|LengthOf($46)|IndexOf(^[$46,$46])>>>>>...]]>)>
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
									if(Runtime.accepts(type8,automaton,automaton.get(r9), SCHEMA)) {
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
			boolean r7 = Runtime.accepts(type19, automaton, r4, SCHEMA); // x is ^Num(^real)
			boolean r8 = Runtime.accepts(type20, automaton, r4, SCHEMA); // x is ^$13<Sum($11<^[^real,^{|$4<^$21<AExpr<$13|Num(^real)|Mul($11)|Div(^[$4,$4])|$42<VExpr<Var(^string)|Fn(^[^string,$47<^Expr<$21|$85<Value<Num(^real)|Null|Tuple(^[^$85...])|Bool<True|False>|String(^string)|Array(^[^$85...])>>|Tuple(^[$47...])|$122<BExpr<$42|Bool<True|False>|And(^{^$122...})|Or(^{^$122...})|Not(^$122)|Equals(^[$134<^Type<Atom<NotT($157<^Proton<TupleT(^[$157...])|ArrayT($157)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$157...])|ArrayT($157)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($134)|OrT(^{$134...})|AndT(^{$134...})|ArrayT($134)|TupleT(^[$134...])|FunctionT(^[$134,$134,$134...])>>,^{|$47,$47|}[$47,$47]])|Inequality(^[^AType<IntT|RealT>,$4])|Equation(^[^AType<IntT|RealT>,$4])|ForAll(^[^{^[^Var(^string),$134]...},^$122])|Exists(^[^{^[^Var(^string),$134]...},^$122])>>|SExpr<$42|Array(^[$47...])>>>...])|Load(^[$47,^int])|LengthOf($47)|IndexOf(^[$47,$47])>>>>>...|}[$4<^$21<AExpr<$13|Num(^real)|Mul($11)|Div(^[$4,$4])|$42<VExpr<Var(^string)|Fn(^[^string,$47<^Expr<$21|$85<Value<Num(^real)|Null|Tuple(^[^$85...])|Bool<True|False>|String(^string)|Array(^[^$85...])>>|Tuple(^[$47...])|$122<BExpr<$42|Bool<True|False>|And(^{^$122...})|Or(^{^$122...})|Not(^$122)|Equals(^[$134<^Type<Atom<NotT($157<^Proton<TupleT(^[$157...])|ArrayT($157)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$157...])|ArrayT($157)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($134)|OrT(^{$134...})|AndT(^{$134...})|ArrayT($134)|TupleT(^[$134...])|FunctionT(^[$134,$134,$134...])>>,^{|$47,$47|}[$47,$47]])|Inequality(^[^AType<IntT|RealT>,$4])|Equation(^[^AType<IntT|RealT>,$4])|ForAll(^[^{^[^Var(^string),$134]...},^$122])|Exists(^[^{^[^Var(^string),$134]...},^$122])>>|SExpr<$42|Array(^[$47...])>>>...])|Load(^[$47,^int])|LengthOf($47)|IndexOf(^[$47,$47])>>>>>...]]>)>
			boolean r9 = Runtime.accepts(type21, automaton, r4, SCHEMA); // x is ^$13<Mul($11<^[^real,^{|$4<^$21<AExpr<$13|Num(^real)|Sum($11)|Div(^[$4,$4])|$42<VExpr<Var(^string)|Fn(^[^string,$47<^Expr<$21|$85<Value<Num(^real)|Null|Tuple(^[^$85...])|Bool<True|False>|String(^string)|Array(^[^$85...])>>|Tuple(^[$47...])|$122<BExpr<$42|Bool<True|False>|And(^{^$122...})|Or(^{^$122...})|Not(^$122)|Equals(^[$134<^Type<Atom<NotT($157<^Proton<TupleT(^[$157...])|ArrayT($157)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$157...])|ArrayT($157)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($134)|OrT(^{$134...})|AndT(^{$134...})|ArrayT($134)|TupleT(^[$134...])|FunctionT(^[$134,$134,$134...])>>,^{|$47,$47|}[$47,$47]])|Inequality(^[^AType<IntT|RealT>,$4])|Equation(^[^AType<IntT|RealT>,$4])|ForAll(^[^{^[^Var(^string),$134]...},^$122])|Exists(^[^{^[^Var(^string),$134]...},^$122])>>|SExpr<$42|Array(^[$47...])>>>...])|Load(^[$47,^int])|LengthOf($47)|IndexOf(^[$47,$47])>>>>>...|}[$4<^$21<AExpr<$13|Num(^real)|Sum($11)|Div(^[$4,$4])|$42<VExpr<Var(^string)|Fn(^[^string,$47<^Expr<$21|$85<Value<Num(^real)|Null|Tuple(^[^$85...])|Bool<True|False>|String(^string)|Array(^[^$85...])>>|Tuple(^[$47...])|$122<BExpr<$42|Bool<True|False>|And(^{^$122...})|Or(^{^$122...})|Not(^$122)|Equals(^[$134<^Type<Atom<NotT($157<^Proton<TupleT(^[$157...])|ArrayT($157)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$157...])|ArrayT($157)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($134)|OrT(^{$134...})|AndT(^{$134...})|ArrayT($134)|TupleT(^[$134...])|FunctionT(^[$134,$134,$134...])>>,^{|$47,$47|}[$47,$47]])|Inequality(^[^AType<IntT|RealT>,$4])|Equation(^[^AType<IntT|RealT>,$4])|ForAll(^[^{^[^Var(^string),$134]...},^$122])|Exists(^[^{^[^Var(^string),$134]...},^$122])>>|SExpr<$42|Array(^[$47...])>>>...])|Load(^[$47,^int])|LengthOf($47)|IndexOf(^[$47,$47])>>>>>...]]>)>
			boolean r10 = r8 || r9;        // x is ^$13<Sum($11<^[^real,^{|$4<^$21<AExpr<$13|Num(^real)|Mul($11)|Div(^[$4,$4])|$42<VExpr<Var(^string)|Fn(^[^string,$47<^Expr<$21|$85<Value<Num(^real)|Null|Tuple(^[^$85...])|Bool<True|False>|String(^string)|Array(^[^$85...])>>|Tuple(^[$47...])|$122<BExpr<$42|Bool<True|False>|And(^{^$122...})|Or(^{^$122...})|Not(^$122)|Equals(^[$134<^Type<Atom<NotT($157<^Proton<TupleT(^[$157...])|ArrayT($157)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$157...])|ArrayT($157)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($134)|OrT(^{$134...})|AndT(^{$134...})|ArrayT($134)|TupleT(^[$134...])|FunctionT(^[$134,$134,$134...])>>,^{|$47,$47|}[$47,$47]])|Inequality(^[^AType<IntT|RealT>,$4])|Equation(^[^AType<IntT|RealT>,$4])|ForAll(^[^{^[^Var(^string),$134]...},^$122])|Exists(^[^{^[^Var(^string),$134]...},^$122])>>|SExpr<$42|Array(^[$47...])>>>...])|Load(^[$47,^int])|LengthOf($47)|IndexOf(^[$47,$47])>>>>>...|}[$4<^$21<AExpr<$13|Num(^real)|Mul($11)|Div(^[$4,$4])|$42<VExpr<Var(^string)|Fn(^[^string,$47<^Expr<$21|$85<Value<Num(^real)|Null|Tuple(^[^$85...])|Bool<True|False>|String(^string)|Array(^[^$85...])>>|Tuple(^[$47...])|$122<BExpr<$42|Bool<True|False>|And(^{^$122...})|Or(^{^$122...})|Not(^$122)|Equals(^[$134<^Type<Atom<NotT($157<^Proton<TupleT(^[$157...])|ArrayT($157)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$157...])|ArrayT($157)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($134)|OrT(^{$134...})|AndT(^{$134...})|ArrayT($134)|TupleT(^[$134...])|FunctionT(^[$134,$134,$134...])>>,^{|$47,$47|}[$47,$47]])|Inequality(^[^AType<IntT|RealT>,$4])|Equation(^[^AType<IntT|RealT>,$4])|ForAll(^[^{^[^Var(^string),$134]...},^$122])|Exists(^[^{^[^Var(^string),$134]...},^$122])>>|SExpr<$42|Array(^[$47...])>>>...])|Load(^[$47,^int])|LengthOf($47)|IndexOf(^[$47,$47])>>>>>...]]>)> || x is ^$13<Mul($11<^[^real,^{|$4<^$21<AExpr<$13|Num(^real)|Sum($11)|Div(^[$4,$4])|$42<VExpr<Var(^string)|Fn(^[^string,$47<^Expr<$21|$85<Value<Num(^real)|Null|Tuple(^[^$85...])|Bool<True|False>|String(^string)|Array(^[^$85...])>>|Tuple(^[$47...])|$122<BExpr<$42|Bool<True|False>|And(^{^$122...})|Or(^{^$122...})|Not(^$122)|Equals(^[$134<^Type<Atom<NotT($157<^Proton<TupleT(^[$157...])|ArrayT($157)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$157...])|ArrayT($157)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($134)|OrT(^{$134...})|AndT(^{$134...})|ArrayT($134)|TupleT(^[$134...])|FunctionT(^[$134,$134,$134...])>>,^{|$47,$47|}[$47,$47]])|Inequality(^[^AType<IntT|RealT>,$4])|Equation(^[^AType<IntT|RealT>,$4])|ForAll(^[^{^[^Var(^string),$134]...},^$122])|Exists(^[^{^[^Var(^string),$134]...},^$122])>>|SExpr<$42|Array(^[$47...])>>>...])|Load(^[$47,^int])|LengthOf($47)|IndexOf(^[$47,$47])>>>>>...|}[$4<^$21<AExpr<$13|Num(^real)|Sum($11)|Div(^[$4,$4])|$42<VExpr<Var(^string)|Fn(^[^string,$47<^Expr<$21|$85<Value<Num(^real)|Null|Tuple(^[^$85...])|Bool<True|False>|String(^string)|Array(^[^$85...])>>|Tuple(^[$47...])|$122<BExpr<$42|Bool<True|False>|And(^{^$122...})|Or(^{^$122...})|Not(^$122)|Equals(^[$134<^Type<Atom<NotT($157<^Proton<TupleT(^[$157...])|ArrayT($157)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$157...])|ArrayT($157)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($134)|OrT(^{$134...})|AndT(^{$134...})|ArrayT($134)|TupleT(^[$134...])|FunctionT(^[$134,$134,$134...])>>,^{|$47,$47|}[$47,$47]])|Inequality(^[^AType<IntT|RealT>,$4])|Equation(^[^AType<IntT|RealT>,$4])|ForAll(^[^{^[^Var(^string),$134]...},^$122])|Exists(^[^{^[^Var(^string),$134]...},^$122])>>|SExpr<$42|Array(^[$47...])>>>...])|Load(^[$47,^int])|LengthOf($47)|IndexOf(^[$47,$47])>>>>>...]]>)>
			boolean r11 = r7 || r10;       // x is ^Num(^real) || x is ^$13<Sum($11<^[^real,^{|$4<^$21<AExpr<$13|Num(^real)|Mul($11)|Div(^[$4,$4])|$42<VExpr<Var(^string)|Fn(^[^string,$47<^Expr<$21|$85<Value<Num(^real)|Null|Tuple(^[^$85...])|Bool<True|False>|String(^string)|Array(^[^$85...])>>|Tuple(^[$47...])|$122<BExpr<$42|Bool<True|False>|And(^{^$122...})|Or(^{^$122...})|Not(^$122)|Equals(^[$134<^Type<Atom<NotT($157<^Proton<TupleT(^[$157...])|ArrayT($157)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$157...])|ArrayT($157)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($134)|OrT(^{$134...})|AndT(^{$134...})|ArrayT($134)|TupleT(^[$134...])|FunctionT(^[$134,$134,$134...])>>,^{|$47,$47|}[$47,$47]])|Inequality(^[^AType<IntT|RealT>,$4])|Equation(^[^AType<IntT|RealT>,$4])|ForAll(^[^{^[^Var(^string),$134]...},^$122])|Exists(^[^{^[^Var(^string),$134]...},^$122])>>|SExpr<$42|Array(^[$47...])>>>...])|Load(^[$47,^int])|LengthOf($47)|IndexOf(^[$47,$47])>>>>>...|}[$4<^$21<AExpr<$13|Num(^real)|Mul($11)|Div(^[$4,$4])|$42<VExpr<Var(^string)|Fn(^[^string,$47<^Expr<$21|$85<Value<Num(^real)|Null|Tuple(^[^$85...])|Bool<True|False>|String(^string)|Array(^[^$85...])>>|Tuple(^[$47...])|$122<BExpr<$42|Bool<True|False>|And(^{^$122...})|Or(^{^$122...})|Not(^$122)|Equals(^[$134<^Type<Atom<NotT($157<^Proton<TupleT(^[$157...])|ArrayT($157)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$157...])|ArrayT($157)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($134)|OrT(^{$134...})|AndT(^{$134...})|ArrayT($134)|TupleT(^[$134...])|FunctionT(^[$134,$134,$134...])>>,^{|$47,$47|}[$47,$47]])|Inequality(^[^AType<IntT|RealT>,$4])|Equation(^[^AType<IntT|RealT>,$4])|ForAll(^[^{^[^Var(^string),$134]...},^$122])|Exists(^[^{^[^Var(^string),$134]...},^$122])>>|SExpr<$42|Array(^[$47...])>>>...])|Load(^[$47,^int])|LengthOf($47)|IndexOf(^[$47,$47])>>>>>...]]>)> || x is ^$13<Mul($11<^[^real,^{|$4<^$21<AExpr<$13|Num(^real)|Sum($11)|Div(^[$4,$4])|$42<VExpr<Var(^string)|Fn(^[^string,$47<^Expr<$21|$85<Value<Num(^real)|Null|Tuple(^[^$85...])|Bool<True|False>|String(^string)|Array(^[^$85...])>>|Tuple(^[$47...])|$122<BExpr<$42|Bool<True|False>|And(^{^$122...})|Or(^{^$122...})|Not(^$122)|Equals(^[$134<^Type<Atom<NotT($157<^Proton<TupleT(^[$157...])|ArrayT($157)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$157...])|ArrayT($157)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($134)|OrT(^{$134...})|AndT(^{$134...})|ArrayT($134)|TupleT(^[$134...])|FunctionT(^[$134,$134,$134...])>>,^{|$47,$47|}[$47,$47]])|Inequality(^[^AType<IntT|RealT>,$4])|Equation(^[^AType<IntT|RealT>,$4])|ForAll(^[^{^[^Var(^string),$134]...},^$122])|Exists(^[^{^[^Var(^string),$134]...},^$122])>>|SExpr<$42|Array(^[$47...])>>>...])|Load(^[$47,^int])|LengthOf($47)|IndexOf(^[$47,$47])>>>>>...|}[$4<^$21<AExpr<$13|Num(^real)|Sum($11)|Div(^[$4,$4])|$42<VExpr<Var(^string)|Fn(^[^string,$47<^Expr<$21|$85<Value<Num(^real)|Null|Tuple(^[^$85...])|Bool<True|False>|String(^string)|Array(^[^$85...])>>|Tuple(^[$47...])|$122<BExpr<$42|Bool<True|False>|And(^{^$122...})|Or(^{^$122...})|Not(^$122)|Equals(^[$134<^Type<Atom<NotT($157<^Proton<TupleT(^[$157...])|ArrayT($157)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$157...])|ArrayT($157)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($134)|OrT(^{$134...})|AndT(^{$134...})|ArrayT($134)|TupleT(^[$134...])|FunctionT(^[$134,$134,$134...])>>,^{|$47,$47|}[$47,$47]])|Inequality(^[^AType<IntT|RealT>,$4])|Equation(^[^AType<IntT|RealT>,$4])|ForAll(^[^{^[^Var(^string),$134]...},^$122])|Exists(^[^{^[^Var(^string),$134]...},^$122])>>|SExpr<$42|Array(^[$47...])>>>...])|Load(^[$47,^int])|LengthOf($47)|IndexOf(^[$47,$47])>>>>>...]]>)>
			boolean r12 = !r11;            // !x is ^Num(^real) || x is ^$13<Sum($11<^[^real,^{|$4<^$21<AExpr<$13|Num(^real)|Mul($11)|Div(^[$4,$4])|$42<VExpr<Var(^string)|Fn(^[^string,$47<^Expr<$21|$85<Value<Num(^real)|Null|Tuple(^[^$85...])|Bool<True|False>|String(^string)|Array(^[^$85...])>>|Tuple(^[$47...])|$122<BExpr<$42|Bool<True|False>|And(^{^$122...})|Or(^{^$122...})|Not(^$122)|Equals(^[$134<^Type<Atom<NotT($157<^Proton<TupleT(^[$157...])|ArrayT($157)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$157...])|ArrayT($157)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($134)|OrT(^{$134...})|AndT(^{$134...})|ArrayT($134)|TupleT(^[$134...])|FunctionT(^[$134,$134,$134...])>>,^{|$47,$47|}[$47,$47]])|Inequality(^[^AType<IntT|RealT>,$4])|Equation(^[^AType<IntT|RealT>,$4])|ForAll(^[^{^[^Var(^string),$134]...},^$122])|Exists(^[^{^[^Var(^string),$134]...},^$122])>>|SExpr<$42|Array(^[$47...])>>>...])|Load(^[$47,^int])|LengthOf($47)|IndexOf(^[$47,$47])>>>>>...|}[$4<^$21<AExpr<$13|Num(^real)|Mul($11)|Div(^[$4,$4])|$42<VExpr<Var(^string)|Fn(^[^string,$47<^Expr<$21|$85<Value<Num(^real)|Null|Tuple(^[^$85...])|Bool<True|False>|String(^string)|Array(^[^$85...])>>|Tuple(^[$47...])|$122<BExpr<$42|Bool<True|False>|And(^{^$122...})|Or(^{^$122...})|Not(^$122)|Equals(^[$134<^Type<Atom<NotT($157<^Proton<TupleT(^[$157...])|ArrayT($157)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$157...])|ArrayT($157)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($134)|OrT(^{$134...})|AndT(^{$134...})|ArrayT($134)|TupleT(^[$134...])|FunctionT(^[$134,$134,$134...])>>,^{|$47,$47|}[$47,$47]])|Inequality(^[^AType<IntT|RealT>,$4])|Equation(^[^AType<IntT|RealT>,$4])|ForAll(^[^{^[^Var(^string),$134]...},^$122])|Exists(^[^{^[^Var(^string),$134]...},^$122])>>|SExpr<$42|Array(^[$47...])>>>...])|Load(^[$47,^int])|LengthOf($47)|IndexOf(^[$47,$47])>>>>>...]]>)> || x is ^$13<Mul($11<^[^real,^{|$4<^$21<AExpr<$13|Num(^real)|Sum($11)|Div(^[$4,$4])|$42<VExpr<Var(^string)|Fn(^[^string,$47<^Expr<$21|$85<Value<Num(^real)|Null|Tuple(^[^$85...])|Bool<True|False>|String(^string)|Array(^[^$85...])>>|Tuple(^[$47...])|$122<BExpr<$42|Bool<True|False>|And(^{^$122...})|Or(^{^$122...})|Not(^$122)|Equals(^[$134<^Type<Atom<NotT($157<^Proton<TupleT(^[$157...])|ArrayT($157)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$157...])|ArrayT($157)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($134)|OrT(^{$134...})|AndT(^{$134...})|ArrayT($134)|TupleT(^[$134...])|FunctionT(^[$134,$134,$134...])>>,^{|$47,$47|}[$47,$47]])|Inequality(^[^AType<IntT|RealT>,$4])|Equation(^[^AType<IntT|RealT>,$4])|ForAll(^[^{^[^Var(^string),$134]...},^$122])|Exists(^[^{^[^Var(^string),$134]...},^$122])>>|SExpr<$42|Array(^[$47...])>>>...])|Load(^[$47,^int])|LengthOf($47)|IndexOf(^[$47,$47])>>>>>...|}[$4<^$21<AExpr<$13|Num(^real)|Sum($11)|Div(^[$4,$4])|$42<VExpr<Var(^string)|Fn(^[^string,$47<^Expr<$21|$85<Value<Num(^real)|Null|Tuple(^[^$85...])|Bool<True|False>|String(^string)|Array(^[^$85...])>>|Tuple(^[$47...])|$122<BExpr<$42|Bool<True|False>|And(^{^$122...})|Or(^{^$122...})|Not(^$122)|Equals(^[$134<^Type<Atom<NotT($157<^Proton<TupleT(^[$157...])|ArrayT($157)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$157...])|ArrayT($157)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($134)|OrT(^{$134...})|AndT(^{$134...})|ArrayT($134)|TupleT(^[$134...])|FunctionT(^[$134,$134,$134...])>>,^{|$47,$47|}[$47,$47]])|Inequality(^[^AType<IntT|RealT>,$4])|Equation(^[^AType<IntT|RealT>,$4])|ForAll(^[^{^[^Var(^string),$134]...},^$122])|Exists(^[^{^[^Var(^string),$134]...},^$122])>>|SExpr<$42|Array(^[$47...])>>>...])|Load(^[$47,^int])|LengthOf($47)|IndexOf(^[$47,$47])>>>>>...]]>)>
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
	private final static class Reduction_66 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_66(Pattern.Term pattern) { super(pattern); }

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
	private final static class Reduction_67 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_67(Pattern.Term pattern) { super(pattern); }

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
	// term $10<Equation($8<^[^AType<IntT|RealT>,$4<^$29<AExpr<Num(^real)|Sum(^[^real,^{|$4...|}[$4...]])|Mul(^[^real,^{|$4...|}[$4...]])|Div(^[$4,$4])|$60<VExpr<Var(^string)|Fn(^[^string,$65<^Expr<$29|$103<Value<Num(^real)|Null|Tuple(^[^$103...])|Bool<True|False>|String(^string)|Array(^[^$103...])>>|Tuple(^[$65...])|$139<BExpr<$60|Bool<True|False>|And(^{^$139...})|Or(^{^$139...})|Not(^$139)|Equals(^[$151<^Type<Atom<NotT($174<^Proton<TupleT(^[$174...])|ArrayT($174)|Quark<IntT|RealT|AnyT|NullT|VoidT|BoolT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$174...])|ArrayT($174)|Quark<IntT|RealT|AnyT|NullT|VoidT|BoolT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($151)|OrT(^{$151...})|AndT(^{$151...})|ArrayT($151)|TupleT(^[$151...])|FunctionT(^[$151,$151,$151...])>>,^{|$65,$65|}[$65,$65]])|$10|Inequality($8)|ForAll(^[^{^[^Var(^string),$151]...},^$139])|Exists(^[^{^[^Var(^string),$151]...},^$139])>>|SExpr<$60|Array(^[$65...])>>>...])|Load(^[$65,^int])|LengthOf($65)|IndexOf(^[$65,$65])>>>>>]>)>
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
	private final static class Reduction_69 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_69(Pattern.Term pattern) { super(pattern); }

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
	private final static class Reduction_70 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_70(Pattern.Term pattern) { super(pattern); }

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
						if(Runtime.accepts(type23,automaton,automaton.get(r7), SCHEMA)) {
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
														if(Runtime.accepts(type23,automaton,automaton.get(r17), SCHEMA)) {
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
							if(Runtime.accepts(type8,automaton,automaton.get(r6), SCHEMA)) {
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
	private final static class Reduction_71 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_71(Pattern.Term pattern) { super(pattern); }

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
					if(Runtime.accepts(type24,automaton,automaton.get(r3), SCHEMA)) {
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
	private final static class Reduction_72 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_72(Pattern.Term pattern) { super(pattern); }

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
	private final static class Reduction_73 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_73(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Equals) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.List l1 = (Automaton.List) s1;
				int r2 = l1.get(0);
				if(Runtime.accepts(type22,automaton,automaton.get(r2), SCHEMA)) {
					int r3 = l1.get(1);
					Automaton.State s3 = automaton.get(r3);
					Automaton.Collection c3 = (Automaton.Collection) s3;
					for(int r5=0;r5!=c3.size();++r5) {
						int r4 = c3.get(r5);
						if(Runtime.accepts(type18,automaton,automaton.get(r4), SCHEMA)) {
							for(int r7=0;r7!=c3.size();++r7) {
								if(r7 == r5) { continue; }
								int r6 = c3.get(r7);
								if(Runtime.accepts(type18,automaton,automaton.get(r6), SCHEMA)) {
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
	// term $10<Inequality($8<^[^AType<IntT|RealT>,$4<^$29<AExpr<Num(^real)|Sum(^[^real,^{|$4...|}[$4...]])|Mul(^[^real,^{|$4...|}[$4...]])|Div(^[$4,$4])|$60<VExpr<Var(^string)|Fn(^[^string,$65<^Expr<$29|$103<Value<Num(^real)|Null|Tuple(^[^$103...])|Bool<True|False>|String(^string)|Array(^[^$103...])>>|Tuple(^[$65...])|$139<BExpr<$60|Bool<True|False>|And(^{^$139...})|Or(^{^$139...})|Not(^$139)|Equals(^[$151<^Type<Atom<NotT($174<^Proton<TupleT(^[$174...])|ArrayT($174)|Quark<IntT|RealT|AnyT|NullT|VoidT|BoolT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$174...])|ArrayT($174)|Quark<IntT|RealT|AnyT|NullT|VoidT|BoolT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($151)|OrT(^{$151...})|AndT(^{$151...})|ArrayT($151)|TupleT(^[$151...])|FunctionT(^[$151,$151,$151...])>>,^{|$65,$65|}[$65,$65]])|$10|Equation($8)|ForAll(^[^{^[^Var(^string),$151]...},^$139])|Exists(^[^{^[^Var(^string),$151]...},^$139])>>|SExpr<$60|Array(^[$65...])>>>...])|Load(^[$65,^int])|LengthOf($65)|IndexOf(^[$65,$65])>>>>>]>)>
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
	private final static class Reduction_75 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_75(Pattern.Term pattern) { super(pattern); }

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
					if(Runtime.accepts(type24,automaton,automaton.get(r3), SCHEMA)) {
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
	private final static class Reduction_76 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_76(Pattern.Term pattern) { super(pattern); }

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
						if(Runtime.accepts(type23,automaton,automaton.get(r7), SCHEMA)) {
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
	// Inequality_2a
	private final static class Reduction_77 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_77(Pattern.Term pattern) { super(pattern); }

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
							if(Runtime.accepts(type24,automaton,automaton.get(r5), SCHEMA)) {
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
									if(c9.size() == 2) {
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
														for(int r18=0;r18!=c9.size();++r18) {
															if(r18 == r11) { continue; }
															int r17 = c9.get(r18);
															Automaton.State s17 = automaton.get(r17);
															if(s17.kind == K_Mul) {
																Automaton.Term t17 = (Automaton.Term) s17;
																int r19 = t17.contents;
																Automaton.State s19 = automaton.get(r19);
																Automaton.List l19 = (Automaton.List) s19;
																int r20 = l19.get(0);
																int r21 = l19.get(1);
																Automaton.State s21 = automaton.get(r21);
																Automaton.Collection c21 = (Automaton.Collection) s21;
																if(c21.size() == 1) {
																	for(int r23=0;r23!=c21.size();++r23) {
																		int r22 = c21.get(r23);
																		for(int r25=0;r25!=c1.size();++r25) {
																			if(r25 == r3) { continue; }
																			int r24 = c1.get(r25);
																			Automaton.State s24 = automaton.get(r24);
																			if(s24.kind == K_Inequality) {
																				Automaton.Term t24 = (Automaton.Term) s24;
																				int r26 = t24.contents;
																				Automaton.State s26 = automaton.get(r26);
																				Automaton.List l26 = (Automaton.List) s26;
																				int r27 = l26.get(0);
																				if(Runtime.accepts(type24,automaton,automaton.get(r27), SCHEMA)) {
																					int r28 = l26.get(1);
																					Automaton.State s28 = automaton.get(r28);
																					if(s28.kind == K_Sum) {
																						Automaton.Term t28 = (Automaton.Term) s28;
																						int r29 = t28.contents;
																						Automaton.State s29 = automaton.get(r29);
																						Automaton.List l29 = (Automaton.List) s29;
																						int r30 = l29.get(0);
																						int r31 = l29.get(1);
																						Automaton.State s31 = automaton.get(r31);
																						Automaton.Collection c31 = (Automaton.Collection) s31;
																						if(c31.size() == 2) {
																							for(int r33=0;r33!=c31.size();++r33) {
																								int r32 = c31.get(r33);
																								Automaton.State s32 = automaton.get(r32);
																								if(s32.kind == K_Mul) {
																									Automaton.Term t32 = (Automaton.Term) s32;
																									int r34 = t32.contents;
																									Automaton.State s34 = automaton.get(r34);
																									Automaton.List l34 = (Automaton.List) s34;
																									int r35 = l34.get(0);
																									int r36 = l34.get(1);
																									Automaton.State s36 = automaton.get(r36);
																									Automaton.Collection c36 = (Automaton.Collection) s36;
																									if(c36.size() == 1) {
																										for(int r38=0;r38!=c36.size();++r38) {
																											int r37 = c36.get(r38);
																											for(int r40=0;r40!=c31.size();++r40) {
																												if(r40 == r33) { continue; }
																												int r39 = c31.get(r40);
																												Automaton.State s39 = automaton.get(r39);
																												if(s39.kind == K_Mul) {
																													Automaton.Term t39 = (Automaton.Term) s39;
																													int r41 = t39.contents;
																													Automaton.State s41 = automaton.get(r41);
																													Automaton.List l41 = (Automaton.List) s41;
																													int r42 = l41.get(0);
																													int r43 = l41.get(1);
																													Automaton.State s43 = automaton.get(r43);
																													Automaton.Collection c43 = (Automaton.Collection) s43;
																													if(c43.size() == 1) {
																														for(int r45=0;r45!=c43.size();++r45) {
																															int r44 = c43.get(r45);
																															int[] state = {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17, r18, r19, r20, r21, r22, r23, r24, r25, r26, r27, r28, r29, r30, r31, r32, r33, r34, r35, r36, r37, r38, r39, r40, r41, r42, r43, r44, r45, 0};
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
			int r11 = state[11];
			int r13 = state[13]; // x2
			int r15 = state[15]; // vx1
			int r16 = state[16];
			int r18 = state[18];
			int r20 = state[20]; // x3
			int r22 = state[22]; // vx2
			int r23 = state[23];
			int r24 = state[24]; // ieq2
			int r25 = state[25];
			int r28 = state[28]; // s2
			int r30 = state[30]; // y1
			int r33 = state[33];
			int r35 = state[35]; // y2
			int r37 = state[37]; // vy1
			int r38 = state[38];
			int r40 = state[40];
			int r42 = state[42]; // y3
			int r44 = state[44]; // vy2
			int r45 = state[45];
			Automaton.Collection s1 = (Automaton.Collection) automaton.get(state[1]);
			int[] s1children = new int[s1.size() - 2];
			for(int s1i=0, s1j=0; s1i != s1.size();++s1i) {
				if(s1i == r3 || s1i == r25) { continue; }
				s1children[s1j++] = s1.get(s1i);
			}
			Automaton.Set r46 = new Automaton.Set(s1children);
			Automaton.Real r47 = (Automaton.Real) automaton.get(r30);
			Automaton.Real r48 = r47.negate(); // -y1
			Automaton.Real r49 = (Automaton.Real) automaton.get(r8);
			boolean r50 = r49.equals(r48); // x1 eq -y1
			boolean r51 = false;           // x1 eq -y1 && x2 eq -y2 && x3 eq -y3 && vx1 eq vy1 && vx2 eq vy2
			if(r50) {
				Automaton.Real r52 = (Automaton.Real) automaton.get(r35);
				Automaton.Real r53 = r52.negate(); // -y2
				Automaton.Real r54 = (Automaton.Real) automaton.get(r13);
				boolean r55 = r54.equals(r53); // x2 eq -y2
				boolean r56 = false;           // x2 eq -y2 && x3 eq -y3 && vx1 eq vy1 && vx2 eq vy2
				if(r55) {
					Automaton.Real r57 = (Automaton.Real) automaton.get(r42);
					Automaton.Real r58 = r57.negate(); // -y3
					Automaton.Real r59 = (Automaton.Real) automaton.get(r20);
					boolean r60 = r59.equals(r58); // x3 eq -y3
					boolean r61 = false;           // x3 eq -y3 && vx1 eq vy1 && vx2 eq vy2
					if(r60) {
						boolean r62 = r15 == r37;      // vx1 eq vy1
						boolean r63 = false;           // vx1 eq vy1 && vx2 eq vy2
						if(r62) {
							boolean r64 = r22 == r44;      // vx2 eq vy2
							r63 = r64;
						}
						r61 = r63;
					}
					r56 = r61;
				}
				r51 = r56;
			}
			if(r51) {
				Automaton.Term r65 = IntT;
				int r66 = automaton.add(r65);
				Automaton.List r67 = new Automaton.List(r66, r6); // [IntTs1]
				int r68 = automaton.add(r67);
				Automaton.Term r69 = new Automaton.Term(K_Equation, r68);
				int r70 = automaton.add(r69);
				Automaton.Set r71 = r46.appendFront(r70); // Equation([IntTs1]) append rest
				int r72 = automaton.add(r71);
				Automaton.Term r73 = new Automaton.Term(K_And, r72);
				int r74 = automaton.add(r73);
				if(r0 != r74) {
					return automaton.rewrite(r0, r74);
				}
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Inequality_2a"; }
		public final int rank() { return 1; }

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
														if(Runtime.accepts(type23,automaton,automaton.get(r17), SCHEMA)) {
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
																							if(Runtime.accepts(type23,automaton,automaton.get(r33), SCHEMA)) {
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
														if(Runtime.accepts(type23,automaton,automaton.get(r17), SCHEMA)) {
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
																if(Runtime.accepts(type8,automaton,automaton.get(r22), SCHEMA)) {
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
	// term $7<Array($5<^[$2<^Expr<$40<Value<Null|Tuple(^[^$40...])|Bool<True|False>|Num(^real)|String(^string)|Array(^[^$40...])>>|Tuple($5)|$79<BExpr<Bool<True|False>|VExpr<Var(^string)|Fn(^[^string,$2...])|Load(^[$2,^int])|LengthOf($2)|IndexOf(^[$2,$2])>|And(^{^$79...})|Or(^{^$79...})|Not(^$79)|Equals(^[$125<^Type<Atom<NotT($148<^Proton<TupleT(^[$148...])|ArrayT($148)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$148...])|ArrayT($148)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($125)|OrT(^{$125...})|AndT(^{$125...})|ArrayT($125)|TupleT(^[$125...])|FunctionT(^[$125,$125,$125...])>>,^{|$2,$2|}[$2,$2]])|Inequality(^[^AType<IntT|RealT>,$222<^AExpr<Num(^real)|VExpr<Var(^string)|Fn(^[^string,$2...])|Load(^[$2,^int])|LengthOf($2)|IndexOf(^[$2,$2])>|Sum(^[^real,^{|$222...|}[$222...]])|Mul(^[^real,^{|$222...|}[$222...]])|Div(^[$222,$222])>>])|Equation(^[^AType<IntT|RealT>,$222])|ForAll(^[^{^[^Var(^string),$125]...},^$79])|Exists(^[^{^[^Var(^string),$125]...},^$79])>>|AExpr<Num(^real)|VExpr<Var(^string)|Fn(^[^string,$2...])|Load(^[$2,^int])|LengthOf($2)|IndexOf(^[$2,$2])>|Sum(^[^real,^{|$222...|}[$222...]])|Mul(^[^real,^{|$222...|}[$222...]])|Div(^[$222,$222])>|SExpr<$7|VExpr<Var(^string)|Fn(^[^string,$2...])|Load(^[$2,^int])|LengthOf($2)|IndexOf(^[$2,$2])>>>>...]>)>
	public final static int K_Array = 34;
	public final static int Array(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_Array, r1));
	}
	public final static int Array(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_Array, r1));
	}

	// 
	private final static class Reduction_78 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_78(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_LengthOf) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				if(s1.kind == K_Array) {
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
		public final String name() { return ""; }
		public final int rank() { return 0; }

		public final int minimum() { return 2; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// term $8<IndexOf(^[$2<^Expr<$42<Value<Null|Tuple(^[^$42...])|Bool<True|False>|Num(^real)|String(^string)|Array(^[^$42...])>>|Tuple(^[$2...])|$84<BExpr<Bool<True|False>|VExpr<$8|Var(^string)|Fn(^[^string,$2...])|Load(^[$2,^int])|LengthOf($2)>|And(^{^$84...})|Or(^{^$84...})|Not(^$84)|Equals(^[$123<^Type<Atom<NotT($146<^Proton<TupleT(^[$146...])|ArrayT($146)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$146...])|ArrayT($146)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($123)|OrT(^{$123...})|AndT(^{$123...})|ArrayT($123)|TupleT(^[$123...])|FunctionT(^[$123,$123,$123...])>>,^{|$2,$2|}[$2,$2]])|Inequality(^[^AType<IntT|RealT>,$220<^AExpr<Num(^real)|VExpr<$8|Var(^string)|Fn(^[^string,$2...])|Load(^[$2,^int])|LengthOf($2)>|Sum(^[^real,^{|$220...|}[$220...]])|Mul(^[^real,^{|$220...|}[$220...]])|Div(^[$220,$220])>>])|Equation(^[^AType<IntT|RealT>,$220])|ForAll(^[^{^[^Var(^string),$123]...},^$84])|Exists(^[^{^[^Var(^string),$123]...},^$84])>>|AExpr<Num(^real)|VExpr<$8|Var(^string)|Fn(^[^string,$2...])|Load(^[$2,^int])|LengthOf($2)>|Sum(^[^real,^{|$220...|}[$220...]])|Mul(^[^real,^{|$220...|}[$220...]])|Div(^[$220,$220])>|SExpr<VExpr<$8|Var(^string)|Fn(^[^string,$2...])|Load(^[$2,^int])|LengthOf($2)>|Array(^[$2...])>>>,$2])>
	public final static int K_IndexOf = 35;
	public final static int IndexOf(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_IndexOf, r1));
	}
	public final static int IndexOf(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_IndexOf, r1));
	}

	// 
	private final static class Reduction_79 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_79(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_IndexOf) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.List l1 = (Automaton.List) s1;
				int r2 = l1.get(0);
				Automaton.State s2 = automaton.get(r2);
				if(s2.kind == K_Array) {
					Automaton.Term t2 = (Automaton.Term) s2;
					int r3 = t2.contents;
					Automaton.State s3 = automaton.get(r3);
					Automaton.List l3 = (Automaton.List) s3;
					int r5 = l1.get(1);
					Automaton.State s5 = automaton.get(r5);
					if(s5.kind == K_Num) {
						Automaton.Term t5 = (Automaton.Term) s5;
						int r6 = t5.contents;
						int[] state = {r0, r1, r2, r3, 0, r5, r6};
						activations.add(new Activation(this,null,state));
					}
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			Automaton.List r4 = ((Automaton.List) automaton.get(state[3])).sublist(0);
			int r6 = state[6]; // i
			Automaton.Real r7 = (Automaton.Real) automaton.get(r6);
			Automaton.Int r8 = r7.numerator(); // |i|
			Automaton.Int r9 = new Automaton.Int(0); // 0
			boolean r10 = r8.compareTo(r9)>=0; // j ge 0
			boolean r11 = false;           // j ge 0 && j lt |xs|
			if(r10) {
				Automaton.Int r12 = r4.lengthOf(); // |xs|
				boolean r13 = r8.compareTo(r12)<0; // j lt |xs|
				r11 = r13;
			}
			if(r11) {
				int r14 = r4.indexOf(r8);      // xs[j]
				if(r0 != r14) {
					return automaton.rewrite(r0, r14);
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
	// term $19<ForAll($17<^[^{^[^Var(^string),$4<^Type<Atom<NotT($35<^Proton<TupleT(^[$35...])|ArrayT($35)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$35...])|ArrayT($35)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($4)|OrT(^{$4...})|AndT(^{$4...})|ArrayT($4)|TupleT(^[$4...])|FunctionT(^[$4,$4,$4...])>>]...},$13<^$127<BExpr<$137<VExpr<Var(^string)|Fn(^[^string,$139<^Expr<$127|$177<Value<Null|Tuple(^[^$177...])|Bool<True|False>|Num(^real)|String(^string)|Array(^[^$177...])>>|Tuple(^[$139...])|$204<AExpr<$137|Num(^real)|Sum(^[^real,^{|^$204...|}[^$204...]])|Mul(^[^real,^{|^$204...|}[^$204...]])|Div(^[^$204,^$204])>>|SExpr<$137|Array(^[$139...])>>>...])|Load(^[$139,^int])|LengthOf($139)|IndexOf(^[$139,$139])>>|Bool<True|False>|And(^{$13...})|Or(^{$13...})|Not($13)|Equals(^[$4,^{|$139,$139|}[$139,$139]])|Inequality(^[^AType<IntT|RealT>,^$204])|Equation(^[^AType<IntT|RealT>,^$204])|$19|Exists($17)>>>]>)>
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
	private final static class Reduction_80 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_80(Pattern.Term pattern) { super(pattern); }

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
			boolean r5 = Runtime.accepts(type27, automaton, r4, SCHEMA); // be is ^Bool<True|False>
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
	private final static class Reduction_81 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_81(Pattern.Term pattern) { super(pattern); }

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
	private final static class Reduction_82 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_82(Pattern.Term pattern) { super(pattern); }

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
	private final static class Reduction_83 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_83(Pattern.Term pattern) { super(pattern); }

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
			boolean r17 = Runtime.accepts(type28, automaton, r2, SCHEMA); // e1 is ^$20<ForAll($18<^[^{^[^Var(^string),$5<^Type<Atom<NotT($36<^Proton<TupleT(^[$36...])|ArrayT($36)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$36...])|ArrayT($36)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($5)|OrT(^{$5...})|AndT(^{$5...})|ArrayT($5)|TupleT(^[$5...])|FunctionT(^[$5,$5,$5...])>>]...},$14<^$128<BExpr<$138<VExpr<Var(^string)|Fn(^[^string,$140<^Expr<$128|$178<Value<Null|Tuple(^[^$178...])|Bool<True|False>|Num(^real)|String(^string)|Array(^[^$178...])>>|Tuple(^[$140...])|$205<AExpr<$138|Num(^real)|Sum(^[^real,^{|^$205...|}[^$205...]])|Mul(^[^real,^{|^$205...|}[^$205...]])|Div(^[^$205,^$205])>>|SExpr<$138|Array(^[$140...])>>>...])|Load(^[$140,^int])|LengthOf($140)|IndexOf(^[$140,$140])>>|Bool<True|False>|And(^{$14...})|Or(^{$14...})|Not($14)|Equals(^[$5,^{|$140,$140|}[$140,$140]])|Inequality(^[^AType<IntT|RealT>,^$205])|Equation(^[^AType<IntT|RealT>,^$205])|$20|Exists($18)>>>]>)>
			boolean r18 = !r17;            // !e1 is ^$20<ForAll($18<^[^{^[^Var(^string),$5<^Type<Atom<NotT($36<^Proton<TupleT(^[$36...])|ArrayT($36)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$36...])|ArrayT($36)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($5)|OrT(^{$5...})|AndT(^{$5...})|ArrayT($5)|TupleT(^[$5...])|FunctionT(^[$5,$5,$5...])>>]...},$14<^$128<BExpr<$138<VExpr<Var(^string)|Fn(^[^string,$140<^Expr<$128|$178<Value<Null|Tuple(^[^$178...])|Bool<True|False>|Num(^real)|String(^string)|Array(^[^$178...])>>|Tuple(^[$140...])|$205<AExpr<$138|Num(^real)|Sum(^[^real,^{|^$205...|}[^$205...]])|Mul(^[^real,^{|^$205...|}[^$205...]])|Div(^[^$205,^$205])>>|SExpr<$138|Array(^[$140...])>>>...])|Load(^[$140,^int])|LengthOf($140)|IndexOf(^[$140,$140])>>|Bool<True|False>|And(^{$14...})|Or(^{$14...})|Not($14)|Equals(^[$5,^{|$140,$140|}[$140,$140]])|Inequality(^[^AType<IntT|RealT>,^$205])|Equation(^[^AType<IntT|RealT>,^$205])|$20|Exists($18)>>>]>)>
			boolean r19 = false;           // !e1 is ^$20<ForAll($18<^[^{^[^Var(^string),$5<^Type<Atom<NotT($36<^Proton<TupleT(^[$36...])|ArrayT($36)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$36...])|ArrayT($36)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($5)|OrT(^{$5...})|AndT(^{$5...})|ArrayT($5)|TupleT(^[$5...])|FunctionT(^[$5,$5,$5...])>>]...},$14<^$128<BExpr<$138<VExpr<Var(^string)|Fn(^[^string,$140<^Expr<$128|$178<Value<Null|Tuple(^[^$178...])|Bool<True|False>|Num(^real)|String(^string)|Array(^[^$178...])>>|Tuple(^[$140...])|$205<AExpr<$138|Num(^real)|Sum(^[^real,^{|^$205...|}[^$205...]])|Mul(^[^real,^{|^$205...|}[^$205...]])|Div(^[^$205,^$205])>>|SExpr<$138|Array(^[$140...])>>>...])|Load(^[$140,^int])|LengthOf($140)|IndexOf(^[$140,$140])>>|Bool<True|False>|And(^{$14...})|Or(^{$14...})|Not($14)|Equals(^[$5,^{|$140,$140|}[$140,$140]])|Inequality(^[^AType<IntT|RealT>,^$205])|Equation(^[^AType<IntT|RealT>,^$205])|$20|Exists($18)>>>]>)> && |instantiations| gt 0
			if(r18) {
				Automaton.Int r20 = r16.lengthOf(); // |instantiations|
				Automaton.Int r21 = new Automaton.Int(0); // 0
				boolean r22 = r20.compareTo(r21)>0; // |instantiations| gt 0
				r19 = r22;
			}
			if(r19) {
				Automaton.Set r23 = new Automaton.Set(r2, r4); // {e1qf}
				Automaton.Set r24 = r14.append(r16); // es append instantiations
				Automaton.Set r25 = r23.append(r24); // {e1qf} append es append instantiations
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
		public final String name() { return "ForAll_5"; }
		public final int rank() { return 3; }

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// term $19<Exists($17<^[^{^[^Var(^string),$4<^Type<Atom<NotT($35<^Proton<TupleT(^[$35...])|ArrayT($35)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$35...])|ArrayT($35)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($4)|OrT(^{$4...})|AndT(^{$4...})|ArrayT($4)|TupleT(^[$4...])|FunctionT(^[$4,$4,$4...])>>]...},$13<^$127<BExpr<$137<VExpr<Var(^string)|Fn(^[^string,$139<^Expr<$127|$177<Value<Null|Tuple(^[^$177...])|Bool<True|False>|Num(^real)|String(^string)|Array(^[^$177...])>>|Tuple(^[$139...])|$204<AExpr<$137|Num(^real)|Sum(^[^real,^{|^$204...|}[^$204...]])|Mul(^[^real,^{|^$204...|}[^$204...]])|Div(^[^$204,^$204])>>|SExpr<$137|Array(^[$139...])>>>...])|Load(^[$139,^int])|LengthOf($139)|IndexOf(^[$139,$139])>>|Bool<True|False>|And(^{$13...})|Or(^{$13...})|Not($13)|Equals(^[$4,^{|$139,$139|}[$139,$139]])|Inequality(^[^AType<IntT|RealT>,^$204])|Equation(^[^AType<IntT|RealT>,^$204])|$19|ForAll($17)>>>]>)>
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
	private final static class Reduction_84 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_84(Pattern.Term pattern) { super(pattern); }

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
			boolean r5 = Runtime.accepts(type27, automaton, r4, SCHEMA); // be is ^Bool<True|False>
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
	private final static class Reduction_85 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_85(Pattern.Term pattern) { super(pattern); }

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
	private final static class Reduction_86 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_86(Pattern.Term pattern) { super(pattern); }

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
	// term Inhabited($2<^Type<Atom<NotT($17<^Proton<TupleT(^[$17...])|ArrayT($17)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$17...])|ArrayT($17)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($2)|OrT(^{$2...})|AndT(^{$2...})|ArrayT($2)|TupleT(^[$2...])|FunctionT(^[$2,$2,$2...])>>)
	public final static int K_Inhabited = 38;
	public final static int Inhabited(Automaton automaton, int r0) {
		return automaton.add(new Automaton.Term(K_Inhabited, r0));
	}

	// Inhabited_1
	private final static class Reduction_88 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_88(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Inhabited) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				if(Runtime.accepts(type29,automaton,automaton.get(r1), SCHEMA)) {
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
	private final static class Reduction_89 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_89(Pattern.Term pattern) { super(pattern); }

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
							if(Runtime.accepts(type3,automaton,automaton.get(r4), SCHEMA)) {
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
	private final static class Reduction_90 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_90(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Inhabited) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				if(s1.kind == K_ArrayT) {
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
			Automaton.Term r3 = new Automaton.Term(K_Inhabited, r2);
			int r4 = automaton.add(r3);
			if(r0 != r4) {
				return automaton.rewrite(r0, r4);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return "Inhabited_3"; }
		public final int rank() { return 0; }

		public final int minimum() { return 2; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// term Is(^[$2<^Expr<$44<Value<Null|Tuple(^[^$44...])|Bool<True|False>|Num(^real)|String(^string)|Array(^[^$44...])>>|Tuple(^[$2...])|$86<BExpr<Bool<True|False>|VExpr<Var(^string)|Fn(^[^string,$2...])|Load(^[$2,^int])|LengthOf($2)|IndexOf(^[$2,$2])>|And(^{^$86...})|Or(^{^$86...})|Not(^$86)|Equals(^[$4<^Type<Atom<NotT($153<^Proton<TupleT(^[$153...])|ArrayT($153)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$153...])|ArrayT($153)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($4)|OrT(^{$4...})|AndT(^{$4...})|ArrayT($4)|TupleT(^[$4...])|FunctionT(^[$4,$4,$4...])>>,^{|$2,$2|}[$2,$2]])|Inequality(^[^AType<IntT|RealT>,$227<^AExpr<Num(^real)|VExpr<Var(^string)|Fn(^[^string,$2...])|Load(^[$2,^int])|LengthOf($2)|IndexOf(^[$2,$2])>|Sum(^[^real,^{|$227...|}[$227...]])|Mul(^[^real,^{|$227...|}[$227...]])|Div(^[$227,$227])>>])|Equation(^[^AType<IntT|RealT>,$227])|ForAll(^[^{^[^Var(^string),$4]...},^$86])|Exists(^[^{^[^Var(^string),$4]...},^$86])>>|AExpr<Num(^real)|VExpr<Var(^string)|Fn(^[^string,$2...])|Load(^[$2,^int])|LengthOf($2)|IndexOf(^[$2,$2])>|Sum(^[^real,^{|$227...|}[$227...]])|Mul(^[^real,^{|$227...|}[$227...]])|Div(^[$227,$227])>|SExpr<VExpr<Var(^string)|Fn(^[^string,$2...])|Load(^[$2,^int])|LengthOf($2)|IndexOf(^[$2,$2])>|Array(^[$2...])>>>,$4])
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
	private final static class Reduction_91 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_91(Pattern.Term pattern) { super(pattern); }

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
	private final static class Reduction_92 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_92(Pattern.Term pattern) { super(pattern); }

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
	private final static class Reduction_93 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_93(Pattern.Term pattern) { super(pattern); }

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
		// $4<NotT($2<^Type<$4|Atom<NotT($16<^Proton<TupleT(^[$16...])|ArrayT($16)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$16...])|ArrayT($16)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|OrT(^{$2...})|AndT(^{$2...})|ArrayT($2)|TupleT(^[$2...])|FunctionT(^[$2,$2,$2...])>>)>
		Schema.Term("NotT",Schema.Or(Schema.Any, Schema.Or(Schema.Term("NotT",Schema.Or(Schema.Term("TupleT",Schema.List(true)), Schema.Term("ArrayT",Schema.Any), Schema.Or(Schema.Term("AnyT"), Schema.Term("NullT"), Schema.Term("VoidT"), Schema.Term("BoolT"), Schema.Term("IntT"), Schema.Term("RealT"), Schema.Term("StringT"), Schema.Term("VarT",Schema.String), Schema.Term("NominalT",Schema.Any)))), Schema.Any), Schema.Term("OrT",Schema.Set(true)), Schema.Term("AndT",Schema.Any), Schema.Term("ArrayT",Schema.Any), Schema.Term("TupleT",Schema.List(true)), Schema.Term("FunctionT",Schema.List(true,Schema.Any,Schema.Any)))),
		// $7<AndT($5<^{$2<^Type<$7|Atom<NotT($19<^Proton<TupleT(^[$19...])|ArrayT($19)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$19...])|ArrayT($19)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($2)|OrT($5)|ArrayT($2)|TupleT(^[$2...])|FunctionT(^[$2,$2,$2...])>>...}>)>
		Schema.Term("AndT",Schema.Set(true)),
		// $7<OrT($5<^{$2<^Type<$7|Atom<NotT($19<^Proton<TupleT(^[$19...])|ArrayT($19)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$19...])|ArrayT($19)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($2)|AndT($5)|ArrayT($2)|TupleT(^[$2...])|FunctionT(^[$2,$2,$2...])>>...}>)>
		Schema.Term("OrT",Schema.Set(true)),
		// $7<TupleT(^[$2<^Type<$7|Atom<NotT($19<^Proton<TupleT(^[$19...])|ArrayT($19)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$19...])|ArrayT($19)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($2)|OrT(^{$2...})|AndT(^{$2...})|ArrayT($2)|FunctionT(^[$2,$2,$2...])>>...])>
		Schema.Term("TupleT",Schema.List(true)),
		// $4<ArrayT($2<^Type<$4|Atom<NotT($16<^Proton<TupleT(^[$16...])|ArrayT($16)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$16...])|ArrayT($16)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($2)|OrT(^{$2...})|AndT(^{$2...})|TupleT(^[$2...])|FunctionT(^[$2,$2,$2...])>>)>
		Schema.Term("ArrayT",Schema.Or(Schema.Any, Schema.Or(Schema.Term("NotT",Schema.Or(Schema.Term("TupleT",Schema.List(true)), Schema.Term("ArrayT",Schema.Any), Schema.Or(Schema.Term("AnyT"), Schema.Term("NullT"), Schema.Term("VoidT"), Schema.Term("BoolT"), Schema.Term("IntT"), Schema.Term("RealT"), Schema.Term("StringT"), Schema.Term("VarT",Schema.String), Schema.Term("NominalT",Schema.Any)))), Schema.Any), Schema.Term("NotT",Schema.Any), Schema.Term("OrT",Schema.Set(true)), Schema.Term("AndT",Schema.Any), Schema.Term("TupleT",Schema.List(true)), Schema.Term("FunctionT",Schema.List(true,Schema.Any,Schema.Any)))),
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
		// $8<FunctionT(^[$2<^Type<$8|Atom<NotT($20<^Proton<TupleT(^[$20...])|ArrayT($20)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$20...])|ArrayT($20)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($2)|OrT(^{$2...})|AndT(^{$2...})|ArrayT($2)|TupleT(^[$2...])>>,$2,$2...])>
		Schema.Term("FunctionT",Schema.List(true,Schema.Or(Schema.Any, Schema.Or(Schema.Term("NotT",Schema.Or(Schema.Term("TupleT",Schema.List(true)), Schema.Term("ArrayT",Schema.Any), Schema.Or(Schema.Term("AnyT"), Schema.Term("NullT"), Schema.Term("VoidT"), Schema.Term("BoolT"), Schema.Term("IntT"), Schema.Term("RealT"), Schema.Term("StringT"), Schema.Term("VarT",Schema.String), Schema.Term("NominalT",Schema.Any)))), Schema.Any), Schema.Term("NotT",Schema.Any), Schema.Term("OrT",Schema.Set(true)), Schema.Term("AndT",Schema.Any), Schema.Term("ArrayT",Schema.Any), Schema.Term("TupleT",Schema.List(true))),Schema.Any)),
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
		// $7<Tuple($5<^[$2<^Expr<$7|$40<Value<Null|Tuple(^[^$40...])|Bool<True|False>|Num(^real)|String(^string)|Array(^[^$40...])>>|$77<BExpr<Bool<True|False>|VExpr<Var(^string)|Fn(^[^string,$2...])|Load(^[$2,^int])|LengthOf($2)|IndexOf(^[$2,$2])>|And(^{^$77...})|Or(^{^$77...})|Not(^$77)|Equals(^[$123<^Type<Atom<NotT($146<^Proton<TupleT(^[$146...])|ArrayT($146)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$146...])|ArrayT($146)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($123)|OrT(^{$123...})|AndT(^{$123...})|ArrayT($123)|TupleT(^[$123...])|FunctionT(^[$123,$123,$123...])>>,^{|$2,$2|}[$2,$2]])|Inequality(^[^AType<IntT|RealT>,$220<^AExpr<Num(^real)|VExpr<Var(^string)|Fn(^[^string,$2...])|Load(^[$2,^int])|LengthOf($2)|IndexOf(^[$2,$2])>|Sum(^[^real,^{|$220...|}[$220...]])|Mul(^[^real,^{|$220...|}[$220...]])|Div(^[$220,$220])>>])|Equation(^[^AType<IntT|RealT>,$220])|ForAll(^[^{^[^Var(^string),$123]...},^$77])|Exists(^[^{^[^Var(^string),$123]...},^$77])>>|AExpr<Num(^real)|VExpr<Var(^string)|Fn(^[^string,$2...])|Load(^[$2,^int])|LengthOf($2)|IndexOf(^[$2,$2])>|Sum(^[^real,^{|$220...|}[$220...]])|Mul(^[^real,^{|$220...|}[$220...]])|Div(^[$220,$220])>|SExpr<VExpr<Var(^string)|Fn(^[^string,$2...])|Load(^[$2,^int])|LengthOf($2)|IndexOf(^[$2,$2])>|Array($5)>>>...]>)>
		Schema.Term("Tuple",Schema.List(true)),
		// $9<Load(^[$2<^Expr<$43<Value<Null|Tuple(^[^$43...])|Bool<True|False>|Num(^real)|String(^string)|Array(^[^$43...])>>|Tuple(^[$2...])|$85<BExpr<Bool<True|False>|VExpr<$9|Var(^string)|Fn(^[^string,$2...])|LengthOf($2)|IndexOf(^[$2,$2])>|And(^{^$85...})|Or(^{^$85...})|Not(^$85)|Equals(^[$123<^Type<Atom<NotT($146<^Proton<TupleT(^[$146...])|ArrayT($146)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$146...])|ArrayT($146)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($123)|OrT(^{$123...})|AndT(^{$123...})|ArrayT($123)|TupleT(^[$123...])|FunctionT(^[$123,$123,$123...])>>,^{|$2,$2|}[$2,$2]])|Inequality(^[^AType<IntT|RealT>,$220<^AExpr<Num(^real)|VExpr<$9|Var(^string)|Fn(^[^string,$2...])|LengthOf($2)|IndexOf(^[$2,$2])>|Sum(^[^real,^{|$220...|}[$220...]])|Mul(^[^real,^{|$220...|}[$220...]])|Div(^[$220,$220])>>])|Equation(^[^AType<IntT|RealT>,$220])|ForAll(^[^{^[^Var(^string),$123]...},^$85])|Exists(^[^{^[^Var(^string),$123]...},^$85])>>|AExpr<Num(^real)|VExpr<$9|Var(^string)|Fn(^[^string,$2...])|LengthOf($2)|IndexOf(^[$2,$2])>|Sum(^[^real,^{|$220...|}[$220...]])|Mul(^[^real,^{|$220...|}[$220...]])|Div(^[$220,$220])>|SExpr<VExpr<$9|Var(^string)|Fn(^[^string,$2...])|LengthOf($2)|IndexOf(^[$2,$2])>|Array(^[$2...])>>>,^int])>
		Schema.Term("Load",Schema.List(true,Schema.Or(Schema.Or(Schema.Or(Schema.Or(Schema.Or(Schema.Term("Null"), Schema.Term("Tuple",Schema.List(true)), Schema.Or(Schema.Term("True"), Schema.Term("False")), Schema.Term("Num",Schema.Real), Schema.Term("String",Schema.String)), Schema.Term("Array",Schema.Any)), Schema.Term("Tuple",Schema.List(true)), Schema.Or(Schema.Or(Schema.Or(Schema.Any, Schema.Or(Schema.Or(Schema.Any, Schema.Term("Var",Schema.Any), Schema.Term("Fn",Schema.List(true,Schema.Any)), Schema.Term("LengthOf",Schema.Any)), Schema.Term("IndexOf",Schema.List(true,Schema.Any,Schema.Any))), Schema.Term("And",Schema.Set(true)), Schema.Term("Or",Schema.Any), Schema.Term("Not",Schema.Any), Schema.Term("Equals",Schema.List(true,Schema.Or(Schema.Or(Schema.Term("NotT",Schema.Or(Schema.Term("TupleT",Schema.List(true)), Schema.Term("ArrayT",Schema.Any), Schema.Or(Schema.Term("AnyT"), Schema.Term("NullT"), Schema.Term("VoidT"), Schema.Term("BoolT"), Schema.Term("IntT"), Schema.Term("RealT"), Schema.Term("StringT"), Schema.Term("VarT",Schema.Any), Schema.Term("NominalT",Schema.Any)))), Schema.Any), Schema.Term("NotT",Schema.Any), Schema.Term("OrT",Schema.Set(true)), Schema.Term("AndT",Schema.Any), Schema.Term("ArrayT",Schema.Any), Schema.Term("TupleT",Schema.List(true)), Schema.Term("FunctionT",Schema.List(true,Schema.Any,Schema.Any))),Schema.Bag(true,Schema.Any,Schema.Any)))), Schema.Or(Schema.Term("Inequality",Schema.List(true,Schema.Or(Schema.Any, Schema.Any),Schema.Or(Schema.Any, Schema.Any, Schema.Term("Sum",Schema.List(true,Schema.Any,Schema.Bag(true))), Schema.Term("Mul",Schema.Any), Schema.Term("Div",Schema.List(true,Schema.Any,Schema.Any))))), Schema.Term("Equation",Schema.Any))), Schema.Or(Schema.Term("ForAll",Schema.List(true,Schema.Set(true),Schema.Any)), Schema.Term("Exists",Schema.Any)))), Schema.Any), Schema.Or(Schema.Any, Schema.Term("Array",Schema.Any))),Schema.Int)),
		// $4<LengthOf($2<^Expr<$38<Value<Null|Tuple(^[^$38...])|Bool<True|False>|Num(^real)|String(^string)|Array(^[^$38...])>>|Tuple(^[$2...])|$80<BExpr<Bool<True|False>|VExpr<$4|Var(^string)|Fn(^[^string,$2...])|Load(^[$2,^int])|IndexOf(^[$2,$2])>|And(^{^$80...})|Or(^{^$80...})|Not(^$80)|Equals(^[$123<^Type<Atom<NotT($146<^Proton<TupleT(^[$146...])|ArrayT($146)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$146...])|ArrayT($146)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($123)|OrT(^{$123...})|AndT(^{$123...})|ArrayT($123)|TupleT(^[$123...])|FunctionT(^[$123,$123,$123...])>>,^{|$2,$2|}[$2,$2]])|Inequality(^[^AType<IntT|RealT>,$220<^AExpr<Num(^real)|VExpr<$4|Var(^string)|Fn(^[^string,$2...])|Load(^[$2,^int])|IndexOf(^[$2,$2])>|Sum(^[^real,^{|$220...|}[$220...]])|Mul(^[^real,^{|$220...|}[$220...]])|Div(^[$220,$220])>>])|Equation(^[^AType<IntT|RealT>,$220])|ForAll(^[^{^[^Var(^string),$123]...},^$80])|Exists(^[^{^[^Var(^string),$123]...},^$80])>>|AExpr<Num(^real)|VExpr<$4|Var(^string)|Fn(^[^string,$2...])|Load(^[$2,^int])|IndexOf(^[$2,$2])>|Sum(^[^real,^{|$220...|}[$220...]])|Mul(^[^real,^{|$220...|}[$220...]])|Div(^[$220,$220])>|SExpr<VExpr<$4|Var(^string)|Fn(^[^string,$2...])|Load(^[$2,^int])|IndexOf(^[$2,$2])>|Array(^[$2...])>>>)>
		Schema.Term("LengthOf",Schema.Or(Schema.Or(Schema.Or(Schema.Or(Schema.Or(Schema.Term("Null"), Schema.Term("Tuple",Schema.List(true)), Schema.Or(Schema.Term("True"), Schema.Term("False")), Schema.Term("Num",Schema.Real), Schema.Term("String",Schema.String)), Schema.Term("Array",Schema.Any)), Schema.Term("Tuple",Schema.List(true)), Schema.Or(Schema.Or(Schema.Or(Schema.Any, Schema.Or(Schema.Or(Schema.Any, Schema.Term("Var",Schema.Any), Schema.Term("Fn",Schema.List(true,Schema.Any)), Schema.Term("Load",Schema.List(true,Schema.Any,Schema.Int))), Schema.Term("IndexOf",Schema.List(true,Schema.Any,Schema.Any))), Schema.Term("And",Schema.Set(true)), Schema.Term("Or",Schema.Any), Schema.Term("Not",Schema.Any), Schema.Term("Equals",Schema.List(true,Schema.Or(Schema.Or(Schema.Term("NotT",Schema.Or(Schema.Term("TupleT",Schema.List(true)), Schema.Term("ArrayT",Schema.Any), Schema.Or(Schema.Term("AnyT"), Schema.Term("NullT"), Schema.Term("VoidT"), Schema.Term("BoolT"), Schema.Term("IntT"), Schema.Term("RealT"), Schema.Term("StringT"), Schema.Term("VarT",Schema.Any), Schema.Term("NominalT",Schema.Any)))), Schema.Any), Schema.Term("NotT",Schema.Any), Schema.Term("OrT",Schema.Set(true)), Schema.Term("AndT",Schema.Any), Schema.Term("ArrayT",Schema.Any), Schema.Term("TupleT",Schema.List(true)), Schema.Term("FunctionT",Schema.List(true,Schema.Any,Schema.Any))),Schema.Bag(true,Schema.Any,Schema.Any)))), Schema.Or(Schema.Term("Inequality",Schema.List(true,Schema.Or(Schema.Any, Schema.Any),Schema.Or(Schema.Any, Schema.Any, Schema.Term("Sum",Schema.List(true,Schema.Any,Schema.Bag(true))), Schema.Term("Mul",Schema.Any), Schema.Term("Div",Schema.List(true,Schema.Any,Schema.Any))))), Schema.Term("Equation",Schema.Any))), Schema.Or(Schema.Term("ForAll",Schema.List(true,Schema.Set(true),Schema.Any)), Schema.Term("Exists",Schema.Any)))), Schema.Any), Schema.Or(Schema.Any, Schema.Term("Array",Schema.Any)))),
		// $9<Fn(^[^string,$3<^Expr<$43<Value<Null|Tuple(^[^$43...])|Bool<True|False>|Num(^real)|String(^string)|Array(^[^$43...])>>|Tuple(^[$3...])|$84<BExpr<Bool<True|False>|VExpr<$9|Var(^string)|Load(^[$3,^int])|LengthOf($3)|IndexOf(^[$3,$3])>|And(^{^$84...})|Or(^{^$84...})|Not(^$84)|Equals(^[$123<^Type<Atom<NotT($146<^Proton<TupleT(^[$146...])|ArrayT($146)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$146...])|ArrayT($146)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($123)|OrT(^{$123...})|AndT(^{$123...})|ArrayT($123)|TupleT(^[$123...])|FunctionT(^[$123,$123,$123...])>>,^{|$3,$3|}[$3,$3]])|Inequality(^[^AType<IntT|RealT>,$220<^AExpr<Num(^real)|VExpr<$9|Var(^string)|Load(^[$3,^int])|LengthOf($3)|IndexOf(^[$3,$3])>|Sum(^[^real,^{|$220...|}[$220...]])|Mul(^[^real,^{|$220...|}[$220...]])|Div(^[$220,$220])>>])|Equation(^[^AType<IntT|RealT>,$220])|ForAll(^[^{^[^Var(^string),$123]...},^$84])|Exists(^[^{^[^Var(^string),$123]...},^$84])>>|AExpr<Num(^real)|VExpr<$9|Var(^string)|Load(^[$3,^int])|LengthOf($3)|IndexOf(^[$3,$3])>|Sum(^[^real,^{|$220...|}[$220...]])|Mul(^[^real,^{|$220...|}[$220...]])|Div(^[$220,$220])>|SExpr<VExpr<$9|Var(^string)|Load(^[$3,^int])|LengthOf($3)|IndexOf(^[$3,$3])>|Array(^[$3...])>>>...])>
		Schema.Term("Fn",Schema.List(true,Schema.String)),
		// String(^string)
		Schema.Term("String",Schema.String),
		// $4<Not($2<^$25<BExpr<$4|$36<VExpr<Var(^string)|Fn(^[^string,$41<^Expr<$25|$79<Value<Null|Tuple(^[^$79...])|Bool<True|False>|Num(^real)|String(^string)|Array(^[^$79...])>>|Tuple(^[$41...])|$106<AExpr<$36|Num(^real)|Sum(^[^real,^{|^$106...|}[^$106...]])|Mul(^[^real,^{|^$106...|}[^$106...]])|Div(^[^$106,^$106])>>|SExpr<$36|Array(^[$41...])>>>...])|Load(^[$41,^int])|LengthOf($41)|IndexOf(^[$41,$41])>>|Bool<True|False>|And(^{$2...})|Or(^{$2...})|Equals(^[$154<^Type<Atom<NotT($177<^Proton<TupleT(^[$177...])|ArrayT($177)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$177...])|ArrayT($177)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($154)|OrT(^{$154...})|AndT(^{$154...})|ArrayT($154)|TupleT(^[$154...])|FunctionT(^[$154,$154,$154...])>>,^{|$41,$41|}[$41,$41]])|Inequality(^[^AType<IntT|RealT>,^$106])|Equation(^[^AType<IntT|RealT>,^$106])|ForAll(^[^{^[^Var(^string),$154]...},$2])|Exists(^[^{^[^Var(^string),$154]...},$2])>>>)>
		Schema.Term("Not",Schema.Or(Schema.Or(Schema.Or(Schema.Any, Schema.Or(Schema.Or(Schema.Term("Var",Schema.String), Schema.Term("Fn",Schema.List(true,Schema.Any)), Schema.Term("Load",Schema.List(true,Schema.Or(Schema.Or(Schema.Or(Schema.Any, Schema.Or(Schema.Or(Schema.Term("Null"), Schema.Term("Tuple",Schema.List(true)), Schema.Or(Schema.Term("True"), Schema.Term("False")), Schema.Term("Num",Schema.Real), Schema.Term("String",Schema.Any)), Schema.Term("Array",Schema.Any)), Schema.Term("Tuple",Schema.List(true))), Schema.Or(Schema.Any, Schema.Any, Schema.Term("Sum",Schema.List(true,Schema.Any,Schema.Bag(true))), Schema.Term("Mul",Schema.Any), Schema.Term("Div",Schema.List(true,Schema.Any,Schema.Any)))), Schema.Or(Schema.Any, Schema.Term("Array",Schema.Any))),Schema.Int)), Schema.Term("LengthOf",Schema.Any)), Schema.Term("IndexOf",Schema.List(true,Schema.Any,Schema.Any))), Schema.Any, Schema.Term("And",Schema.Set(true)), Schema.Term("Or",Schema.Any), Schema.Term("Equals",Schema.List(true,Schema.Or(Schema.Or(Schema.Term("NotT",Schema.Or(Schema.Term("TupleT",Schema.List(true)), Schema.Term("ArrayT",Schema.Any), Schema.Or(Schema.Term("AnyT"), Schema.Term("NullT"), Schema.Term("VoidT"), Schema.Term("BoolT"), Schema.Term("IntT"), Schema.Term("RealT"), Schema.Term("StringT"), Schema.Term("VarT",Schema.Any), Schema.Term("NominalT",Schema.Any)))), Schema.Any), Schema.Term("NotT",Schema.Any), Schema.Term("OrT",Schema.Set(true)), Schema.Term("AndT",Schema.Any), Schema.Term("ArrayT",Schema.Any), Schema.Term("TupleT",Schema.List(true)), Schema.Term("FunctionT",Schema.List(true,Schema.Any,Schema.Any))),Schema.Bag(true,Schema.Any,Schema.Any)))), Schema.Or(Schema.Term("Inequality",Schema.List(true,Schema.Or(Schema.Any, Schema.Any),Schema.Any)), Schema.Term("Equation",Schema.Any))), Schema.Or(Schema.Term("ForAll",Schema.List(true,Schema.Set(true),Schema.Any)), Schema.Term("Exists",Schema.Any)))),
		// $7<And($5<^{$2<^$28<BExpr<$7|$39<VExpr<Var(^string)|Fn(^[^string,$44<^Expr<$28|$82<Value<Null|Tuple(^[^$82...])|Bool<True|False>|Num(^real)|String(^string)|Array(^[^$82...])>>|Tuple(^[$44...])|$109<AExpr<$39|Num(^real)|Sum(^[^real,^{|^$109...|}[^$109...]])|Mul(^[^real,^{|^$109...|}[^$109...]])|Div(^[^$109,^$109])>>|SExpr<$39|Array(^[$44...])>>>...])|Load(^[$44,^int])|LengthOf($44)|IndexOf(^[$44,$44])>>|Bool<True|False>|Or($5)|Not($2)|Equals(^[$154<^Type<Atom<NotT($177<^Proton<TupleT(^[$177...])|ArrayT($177)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$177...])|ArrayT($177)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($154)|OrT(^{$154...})|AndT(^{$154...})|ArrayT($154)|TupleT(^[$154...])|FunctionT(^[$154,$154,$154...])>>,^{|$44,$44|}[$44,$44]])|Inequality(^[^AType<IntT|RealT>,^$109])|Equation(^[^AType<IntT|RealT>,^$109])|ForAll(^[^{^[^Var(^string),$154]...},$2])|Exists(^[^{^[^Var(^string),$154]...},$2])>>>...}>)>
		Schema.Term("And",Schema.Set(true)),
		// $7<Or($5<^{$2<^$28<BExpr<$7|$39<VExpr<Var(^string)|Fn(^[^string,$44<^Expr<$28|$82<Value<Null|Tuple(^[^$82...])|Bool<True|False>|Num(^real)|String(^string)|Array(^[^$82...])>>|Tuple(^[$44...])|$109<AExpr<$39|Num(^real)|Sum(^[^real,^{|^$109...|}[^$109...]])|Mul(^[^real,^{|^$109...|}[^$109...]])|Div(^[^$109,^$109])>>|SExpr<$39|Array(^[$44...])>>>...])|Load(^[$44,^int])|LengthOf($44)|IndexOf(^[$44,$44])>>|Bool<True|False>|And($5)|Not($2)|Equals(^[$154<^Type<Atom<NotT($177<^Proton<TupleT(^[$177...])|ArrayT($177)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$177...])|ArrayT($177)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($154)|OrT(^{$154...})|AndT(^{$154...})|ArrayT($154)|TupleT(^[$154...])|FunctionT(^[$154,$154,$154...])>>,^{|$44,$44|}[$44,$44]])|Inequality(^[^AType<IntT|RealT>,^$109])|Equation(^[^AType<IntT|RealT>,^$109])|ForAll(^[^{^[^Var(^string),$154]...},$2])|Exists(^[^{^[^Var(^string),$154]...},$2])>>>...}>)>
		Schema.Term("Or",Schema.Set(true)),
		// $14<Equals(^[$2<^Type<Atom<NotT($27<^Proton<TupleT(^[$27...])|ArrayT($27)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$27...])|ArrayT($27)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($2)|OrT(^{$2...})|AndT(^{$2...})|ArrayT($2)|TupleT(^[$2...])|FunctionT(^[$2,$2,$2...])>>,^{|$4<^Expr<$133<Value<Null|Tuple(^[^$133...])|Bool<True|False>|Num(^real)|String(^string)|Array(^[^$133...])>>|Tuple(^[$4...])|$173<BExpr<$14|Bool<True|False>|VExpr<Var(^string)|Fn(^[^string,$4...])|Load(^[$4,^int])|LengthOf($4)|IndexOf(^[$4,$4])>|And(^{^$173...})|Or(^{^$173...})|Not(^$173)|Inequality(^[^AType<IntT|RealT>,$220<^AExpr<Num(^real)|VExpr<Var(^string)|Fn(^[^string,$4...])|Load(^[$4,^int])|LengthOf($4)|IndexOf(^[$4,$4])>|Sum(^[^real,^{|$220...|}[$220...]])|Mul(^[^real,^{|$220...|}[$220...]])|Div(^[$220,$220])>>])|Equation(^[^AType<IntT|RealT>,$220])|ForAll(^[^{^[^Var(^string),$2]...},^$173])|Exists(^[^{^[^Var(^string),$2]...},^$173])>>|AExpr<Num(^real)|VExpr<Var(^string)|Fn(^[^string,$4...])|Load(^[$4,^int])|LengthOf($4)|IndexOf(^[$4,$4])>|Sum(^[^real,^{|$220...|}[$220...]])|Mul(^[^real,^{|$220...|}[$220...]])|Div(^[$220,$220])>|SExpr<VExpr<Var(^string)|Fn(^[^string,$4...])|Load(^[$4,^int])|LengthOf($4)|IndexOf(^[$4,$4])>|Array(^[$4...])>>>,$4|}[$4<^Expr<$133<Value<Null|Tuple(^[^$133...])|Bool<True|False>|Num(^real)|String(^string)|Array(^[^$133...])>>|Tuple(^[$4...])|$173<BExpr<$14|Bool<True|False>|VExpr<Var(^string)|Fn(^[^string,$4...])|Load(^[$4,^int])|LengthOf($4)|IndexOf(^[$4,$4])>|And(^{^$173...})|Or(^{^$173...})|Not(^$173)|Inequality(^[^AType<IntT|RealT>,$220<^AExpr<Num(^real)|VExpr<Var(^string)|Fn(^[^string,$4...])|Load(^[$4,^int])|LengthOf($4)|IndexOf(^[$4,$4])>|Sum(^[^real,^{|$220...|}[$220...]])|Mul(^[^real,^{|$220...|}[$220...]])|Div(^[$220,$220])>>])|Equation(^[^AType<IntT|RealT>,$220])|ForAll(^[^{^[^Var(^string),$2]...},^$173])|Exists(^[^{^[^Var(^string),$2]...},^$173])>>|AExpr<Num(^real)|VExpr<Var(^string)|Fn(^[^string,$4...])|Load(^[$4,^int])|LengthOf($4)|IndexOf(^[$4,$4])>|Sum(^[^real,^{|$220...|}[$220...]])|Mul(^[^real,^{|$220...|}[$220...]])|Div(^[$220,$220])>|SExpr<VExpr<Var(^string)|Fn(^[^string,$4...])|Load(^[$4,^int])|LengthOf($4)|IndexOf(^[$4,$4])>|Array(^[$4...])>>>,$4]])>
		Schema.Term("Equals",Schema.List(true,Schema.Or(Schema.Or(Schema.Term("NotT",Schema.Or(Schema.Term("TupleT",Schema.List(true)), Schema.Term("ArrayT",Schema.Any), Schema.Or(Schema.Term("AnyT"), Schema.Term("NullT"), Schema.Term("VoidT"), Schema.Term("BoolT"), Schema.Term("IntT"), Schema.Term("RealT"), Schema.Term("StringT"), Schema.Term("VarT",Schema.String), Schema.Term("NominalT",Schema.Any)))), Schema.Any), Schema.Term("NotT",Schema.Any), Schema.Term("OrT",Schema.Set(true)), Schema.Term("AndT",Schema.Any), Schema.Term("ArrayT",Schema.Any), Schema.Term("TupleT",Schema.List(true)), Schema.Term("FunctionT",Schema.List(true,Schema.Any,Schema.Any))),Schema.Bag(true,Schema.Or(Schema.Or(Schema.Or(Schema.Or(Schema.Or(Schema.Term("Null"), Schema.Term("Tuple",Schema.List(true)), Schema.Or(Schema.Term("True"), Schema.Term("False")), Schema.Term("Num",Schema.Real), Schema.Term("String",Schema.Any)), Schema.Term("Array",Schema.Any)), Schema.Term("Tuple",Schema.List(true)), Schema.Or(Schema.Or(Schema.Or(Schema.Any, Schema.Any, Schema.Or(Schema.Or(Schema.Term("Var",Schema.Any), Schema.Term("Fn",Schema.List(true,Schema.Any)), Schema.Term("Load",Schema.List(true,Schema.Any,Schema.Int)), Schema.Term("LengthOf",Schema.Any)), Schema.Term("IndexOf",Schema.List(true,Schema.Any,Schema.Any))), Schema.Term("And",Schema.Set(true)), Schema.Term("Or",Schema.Any), Schema.Term("Not",Schema.Any)), Schema.Or(Schema.Term("Inequality",Schema.List(true,Schema.Or(Schema.Any, Schema.Any),Schema.Or(Schema.Any, Schema.Any, Schema.Term("Sum",Schema.List(true,Schema.Any,Schema.Bag(true))), Schema.Term("Mul",Schema.Any), Schema.Term("Div",Schema.List(true,Schema.Any,Schema.Any))))), Schema.Term("Equation",Schema.Any))), Schema.Or(Schema.Term("ForAll",Schema.List(true,Schema.Set(true),Schema.Any)), Schema.Term("Exists",Schema.Any)))), Schema.Any), Schema.Or(Schema.Any, Schema.Term("Array",Schema.Any))),Schema.Any))),
		// $12<Mul($10<^[^real,^{|$3<^$20<AExpr<$12|Num(^real)|Sum($10)|Div(^[$3,$3])|$41<VExpr<Var(^string)|Fn(^[^string,$46<^Expr<$20|$84<Value<Num(^real)|Null|Tuple(^[^$84...])|Bool<True|False>|String(^string)|Array(^[^$84...])>>|Tuple(^[$46...])|$121<BExpr<$41|Bool<True|False>|And(^{^$121...})|Or(^{^$121...})|Not(^$121)|Equals(^[$133<^Type<Atom<NotT($156<^Proton<TupleT(^[$156...])|ArrayT($156)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$156...])|ArrayT($156)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($133)|OrT(^{$133...})|AndT(^{$133...})|ArrayT($133)|TupleT(^[$133...])|FunctionT(^[$133,$133,$133...])>>,^{|$46,$46|}[$46,$46]])|Inequality(^[^AType<IntT|RealT>,$3])|Equation(^[^AType<IntT|RealT>,$3])|ForAll(^[^{^[^Var(^string),$133]...},^$121])|Exists(^[^{^[^Var(^string),$133]...},^$121])>>|SExpr<$41|Array(^[$46...])>>>...])|Load(^[$46,^int])|LengthOf($46)|IndexOf(^[$46,$46])>>>>>...|}[$3<^$20<AExpr<$12|Num(^real)|Sum($10)|Div(^[$3,$3])|$41<VExpr<Var(^string)|Fn(^[^string,$46<^Expr<$20|$84<Value<Num(^real)|Null|Tuple(^[^$84...])|Bool<True|False>|String(^string)|Array(^[^$84...])>>|Tuple(^[$46...])|$121<BExpr<$41|Bool<True|False>|And(^{^$121...})|Or(^{^$121...})|Not(^$121)|Equals(^[$133<^Type<Atom<NotT($156<^Proton<TupleT(^[$156...])|ArrayT($156)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$156...])|ArrayT($156)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($133)|OrT(^{$133...})|AndT(^{$133...})|ArrayT($133)|TupleT(^[$133...])|FunctionT(^[$133,$133,$133...])>>,^{|$46,$46|}[$46,$46]])|Inequality(^[^AType<IntT|RealT>,$3])|Equation(^[^AType<IntT|RealT>,$3])|ForAll(^[^{^[^Var(^string),$133]...},^$121])|Exists(^[^{^[^Var(^string),$133]...},^$121])>>|SExpr<$41|Array(^[$46...])>>>...])|Load(^[$46,^int])|LengthOf($46)|IndexOf(^[$46,$46])>>>>>...]]>)>
		Schema.Term("Mul",Schema.List(true,Schema.Real,Schema.Bag(true))),
		// $8<Div(^[$2<^$16<AExpr<$8|Num(^real)|Sum(^[^real,^{|$2...|}[$2...]])|Mul(^[^real,^{|$2...|}[$2...]])|$41<VExpr<Var(^string)|Fn(^[^string,$46<^Expr<$16|$84<Value<Num(^real)|Null|Tuple(^[^$84...])|Bool<True|False>|String(^string)|Array(^[^$84...])>>|Tuple(^[$46...])|$121<BExpr<$41|Bool<True|False>|And(^{^$121...})|Or(^{^$121...})|Not(^$121)|Equals(^[$133<^Type<Atom<NotT($156<^Proton<TupleT(^[$156...])|ArrayT($156)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$156...])|ArrayT($156)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($133)|OrT(^{$133...})|AndT(^{$133...})|ArrayT($133)|TupleT(^[$133...])|FunctionT(^[$133,$133,$133...])>>,^{|$46,$46|}[$46,$46]])|Inequality(^[^AType<IntT|RealT>,$2])|Equation(^[^AType<IntT|RealT>,$2])|ForAll(^[^{^[^Var(^string),$133]...},^$121])|Exists(^[^{^[^Var(^string),$133]...},^$121])>>|SExpr<$41|Array(^[$46...])>>>...])|Load(^[$46,^int])|LengthOf($46)|IndexOf(^[$46,$46])>>>>>,$2])>
		Schema.Term("Div",Schema.List(true,Schema.Or(Schema.Any, Schema.Term("Num",Schema.Real), Schema.Term("Sum",Schema.List(true,Schema.Any,Schema.Bag(true))), Schema.Term("Mul",Schema.Any), Schema.Or(Schema.Or(Schema.Term("Var",Schema.String), Schema.Term("Fn",Schema.List(true,Schema.Any)), Schema.Term("Load",Schema.List(true,Schema.Or(Schema.Or(Schema.Any, Schema.Or(Schema.Or(Schema.Or(Schema.Any, Schema.Term("Null"), Schema.Term("Tuple",Schema.List(true)), Schema.Or(Schema.Term("True"), Schema.Term("False")), Schema.Term("String",Schema.Any)), Schema.Term("Array",Schema.Any)), Schema.Term("Tuple",Schema.List(true)), Schema.Or(Schema.Or(Schema.Or(Schema.Any, Schema.Any, Schema.Term("And",Schema.Set(true)), Schema.Term("Or",Schema.Any), Schema.Term("Not",Schema.Any), Schema.Term("Equals",Schema.List(true,Schema.Or(Schema.Or(Schema.Term("NotT",Schema.Or(Schema.Term("TupleT",Schema.List(true)), Schema.Term("ArrayT",Schema.Any), Schema.Or(Schema.Term("AnyT"), Schema.Term("NullT"), Schema.Term("VoidT"), Schema.Term("BoolT"), Schema.Term("IntT"), Schema.Term("RealT"), Schema.Term("StringT"), Schema.Term("VarT",Schema.Any), Schema.Term("NominalT",Schema.Any)))), Schema.Any), Schema.Term("NotT",Schema.Any), Schema.Term("OrT",Schema.Set(true)), Schema.Term("AndT",Schema.Any), Schema.Term("ArrayT",Schema.Any), Schema.Term("TupleT",Schema.List(true)), Schema.Term("FunctionT",Schema.List(true,Schema.Any,Schema.Any))),Schema.Bag(true,Schema.Any,Schema.Any)))), Schema.Or(Schema.Term("Inequality",Schema.List(true,Schema.Or(Schema.Any, Schema.Any),Schema.Any)), Schema.Term("Equation",Schema.Any))), Schema.Or(Schema.Term("ForAll",Schema.List(true,Schema.Set(true),Schema.Any)), Schema.Term("Exists",Schema.Any))))), Schema.Or(Schema.Any, Schema.Term("Array",Schema.Any))),Schema.Int)), Schema.Term("LengthOf",Schema.Any)), Schema.Term("IndexOf",Schema.List(true,Schema.Any,Schema.Any)))),Schema.Any)),
		// $12<Sum($10<^[^real,^{|$3<^$20<AExpr<$12|Num(^real)|Mul($10)|Div(^[$3,$3])|$41<VExpr<Var(^string)|Fn(^[^string,$46<^Expr<$20|$84<Value<Num(^real)|Null|Tuple(^[^$84...])|Bool<True|False>|String(^string)|Array(^[^$84...])>>|Tuple(^[$46...])|$121<BExpr<$41|Bool<True|False>|And(^{^$121...})|Or(^{^$121...})|Not(^$121)|Equals(^[$133<^Type<Atom<NotT($156<^Proton<TupleT(^[$156...])|ArrayT($156)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$156...])|ArrayT($156)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($133)|OrT(^{$133...})|AndT(^{$133...})|ArrayT($133)|TupleT(^[$133...])|FunctionT(^[$133,$133,$133...])>>,^{|$46,$46|}[$46,$46]])|Inequality(^[^AType<IntT|RealT>,$3])|Equation(^[^AType<IntT|RealT>,$3])|ForAll(^[^{^[^Var(^string),$133]...},^$121])|Exists(^[^{^[^Var(^string),$133]...},^$121])>>|SExpr<$41|Array(^[$46...])>>>...])|Load(^[$46,^int])|LengthOf($46)|IndexOf(^[$46,$46])>>>>>...|}[$3<^$20<AExpr<$12|Num(^real)|Mul($10)|Div(^[$3,$3])|$41<VExpr<Var(^string)|Fn(^[^string,$46<^Expr<$20|$84<Value<Num(^real)|Null|Tuple(^[^$84...])|Bool<True|False>|String(^string)|Array(^[^$84...])>>|Tuple(^[$46...])|$121<BExpr<$41|Bool<True|False>|And(^{^$121...})|Or(^{^$121...})|Not(^$121)|Equals(^[$133<^Type<Atom<NotT($156<^Proton<TupleT(^[$156...])|ArrayT($156)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$156...])|ArrayT($156)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($133)|OrT(^{$133...})|AndT(^{$133...})|ArrayT($133)|TupleT(^[$133...])|FunctionT(^[$133,$133,$133...])>>,^{|$46,$46|}[$46,$46]])|Inequality(^[^AType<IntT|RealT>,$3])|Equation(^[^AType<IntT|RealT>,$3])|ForAll(^[^{^[^Var(^string),$133]...},^$121])|Exists(^[^{^[^Var(^string),$133]...},^$121])>>|SExpr<$41|Array(^[$46...])>>>...])|Load(^[$46,^int])|LengthOf($46)|IndexOf(^[$46,$46])>>>>>...]]>)>
		Schema.Term("Sum",Schema.List(true,Schema.Real,Schema.Bag(true))),
		// $10<Equation($8<^[^AType<IntT|RealT>,$4<^$29<AExpr<Num(^real)|Sum(^[^real,^{|$4...|}[$4...]])|Mul(^[^real,^{|$4...|}[$4...]])|Div(^[$4,$4])|$60<VExpr<Var(^string)|Fn(^[^string,$65<^Expr<$29|$103<Value<Num(^real)|Null|Tuple(^[^$103...])|Bool<True|False>|String(^string)|Array(^[^$103...])>>|Tuple(^[$65...])|$139<BExpr<$60|Bool<True|False>|And(^{^$139...})|Or(^{^$139...})|Not(^$139)|Equals(^[$151<^Type<Atom<NotT($174<^Proton<TupleT(^[$174...])|ArrayT($174)|Quark<IntT|RealT|AnyT|NullT|VoidT|BoolT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$174...])|ArrayT($174)|Quark<IntT|RealT|AnyT|NullT|VoidT|BoolT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($151)|OrT(^{$151...})|AndT(^{$151...})|ArrayT($151)|TupleT(^[$151...])|FunctionT(^[$151,$151,$151...])>>,^{|$65,$65|}[$65,$65]])|$10|Inequality($8)|ForAll(^[^{^[^Var(^string),$151]...},^$139])|Exists(^[^{^[^Var(^string),$151]...},^$139])>>|SExpr<$60|Array(^[$65...])>>>...])|Load(^[$65,^int])|LengthOf($65)|IndexOf(^[$65,$65])>>>>>]>)>
		Schema.Term("Equation",Schema.List(true,Schema.Or(Schema.Term("IntT"), Schema.Term("RealT")),Schema.Or(Schema.Term("Num",Schema.Real), Schema.Term("Sum",Schema.List(true,Schema.Any,Schema.Bag(true))), Schema.Term("Mul",Schema.Any), Schema.Term("Div",Schema.List(true,Schema.Any,Schema.Any)), Schema.Or(Schema.Or(Schema.Term("Var",Schema.String), Schema.Term("Fn",Schema.List(true,Schema.Any)), Schema.Term("Load",Schema.List(true,Schema.Or(Schema.Or(Schema.Any, Schema.Or(Schema.Or(Schema.Or(Schema.Any, Schema.Term("Null"), Schema.Term("Tuple",Schema.List(true)), Schema.Or(Schema.Term("True"), Schema.Term("False")), Schema.Term("String",Schema.Any)), Schema.Term("Array",Schema.Any)), Schema.Term("Tuple",Schema.List(true)), Schema.Or(Schema.Or(Schema.Or(Schema.Any, Schema.Any, Schema.Term("And",Schema.Set(true)), Schema.Term("Or",Schema.Any), Schema.Term("Not",Schema.Any), Schema.Term("Equals",Schema.List(true,Schema.Or(Schema.Or(Schema.Term("NotT",Schema.Or(Schema.Term("TupleT",Schema.List(true)), Schema.Term("ArrayT",Schema.Any), Schema.Or(Schema.Any, Schema.Any, Schema.Term("AnyT"), Schema.Term("NullT"), Schema.Term("VoidT"), Schema.Term("BoolT"), Schema.Term("StringT"), Schema.Term("VarT",Schema.Any), Schema.Term("NominalT",Schema.Any)))), Schema.Any), Schema.Term("NotT",Schema.Any), Schema.Term("OrT",Schema.Set(true)), Schema.Term("AndT",Schema.Any), Schema.Term("ArrayT",Schema.Any), Schema.Term("TupleT",Schema.List(true)), Schema.Term("FunctionT",Schema.List(true,Schema.Any,Schema.Any))),Schema.Bag(true,Schema.Any,Schema.Any)))), Schema.Or(Schema.Any, Schema.Term("Inequality",Schema.Any))), Schema.Or(Schema.Term("ForAll",Schema.List(true,Schema.Set(true),Schema.Any)), Schema.Term("Exists",Schema.Any))))), Schema.Or(Schema.Any, Schema.Term("Array",Schema.Any))),Schema.Int)), Schema.Term("LengthOf",Schema.Any)), Schema.Term("IndexOf",Schema.List(true,Schema.Any,Schema.Any)))))),
		// $10<Inequality($8<^[^AType<IntT|RealT>,$4<^$29<AExpr<Num(^real)|Sum(^[^real,^{|$4...|}[$4...]])|Mul(^[^real,^{|$4...|}[$4...]])|Div(^[$4,$4])|$60<VExpr<Var(^string)|Fn(^[^string,$65<^Expr<$29|$103<Value<Num(^real)|Null|Tuple(^[^$103...])|Bool<True|False>|String(^string)|Array(^[^$103...])>>|Tuple(^[$65...])|$139<BExpr<$60|Bool<True|False>|And(^{^$139...})|Or(^{^$139...})|Not(^$139)|Equals(^[$151<^Type<Atom<NotT($174<^Proton<TupleT(^[$174...])|ArrayT($174)|Quark<IntT|RealT|AnyT|NullT|VoidT|BoolT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$174...])|ArrayT($174)|Quark<IntT|RealT|AnyT|NullT|VoidT|BoolT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($151)|OrT(^{$151...})|AndT(^{$151...})|ArrayT($151)|TupleT(^[$151...])|FunctionT(^[$151,$151,$151...])>>,^{|$65,$65|}[$65,$65]])|$10|Equation($8)|ForAll(^[^{^[^Var(^string),$151]...},^$139])|Exists(^[^{^[^Var(^string),$151]...},^$139])>>|SExpr<$60|Array(^[$65...])>>>...])|Load(^[$65,^int])|LengthOf($65)|IndexOf(^[$65,$65])>>>>>]>)>
		Schema.Term("Inequality",Schema.List(true,Schema.Or(Schema.Term("IntT"), Schema.Term("RealT")),Schema.Or(Schema.Term("Num",Schema.Real), Schema.Term("Sum",Schema.List(true,Schema.Any,Schema.Bag(true))), Schema.Term("Mul",Schema.Any), Schema.Term("Div",Schema.List(true,Schema.Any,Schema.Any)), Schema.Or(Schema.Or(Schema.Term("Var",Schema.String), Schema.Term("Fn",Schema.List(true,Schema.Any)), Schema.Term("Load",Schema.List(true,Schema.Or(Schema.Or(Schema.Any, Schema.Or(Schema.Or(Schema.Or(Schema.Any, Schema.Term("Null"), Schema.Term("Tuple",Schema.List(true)), Schema.Or(Schema.Term("True"), Schema.Term("False")), Schema.Term("String",Schema.Any)), Schema.Term("Array",Schema.Any)), Schema.Term("Tuple",Schema.List(true)), Schema.Or(Schema.Or(Schema.Or(Schema.Any, Schema.Any, Schema.Term("And",Schema.Set(true)), Schema.Term("Or",Schema.Any), Schema.Term("Not",Schema.Any), Schema.Term("Equals",Schema.List(true,Schema.Or(Schema.Or(Schema.Term("NotT",Schema.Or(Schema.Term("TupleT",Schema.List(true)), Schema.Term("ArrayT",Schema.Any), Schema.Or(Schema.Any, Schema.Any, Schema.Term("AnyT"), Schema.Term("NullT"), Schema.Term("VoidT"), Schema.Term("BoolT"), Schema.Term("StringT"), Schema.Term("VarT",Schema.Any), Schema.Term("NominalT",Schema.Any)))), Schema.Any), Schema.Term("NotT",Schema.Any), Schema.Term("OrT",Schema.Set(true)), Schema.Term("AndT",Schema.Any), Schema.Term("ArrayT",Schema.Any), Schema.Term("TupleT",Schema.List(true)), Schema.Term("FunctionT",Schema.List(true,Schema.Any,Schema.Any))),Schema.Bag(true,Schema.Any,Schema.Any)))), Schema.Or(Schema.Any, Schema.Term("Equation",Schema.Any))), Schema.Or(Schema.Term("ForAll",Schema.List(true,Schema.Set(true),Schema.Any)), Schema.Term("Exists",Schema.Any))))), Schema.Or(Schema.Any, Schema.Term("Array",Schema.Any))),Schema.Int)), Schema.Term("LengthOf",Schema.Any)), Schema.Term("IndexOf",Schema.List(true,Schema.Any,Schema.Any)))))),
		// $7<Array($5<^[$2<^Expr<$40<Value<Null|Tuple(^[^$40...])|Bool<True|False>|Num(^real)|String(^string)|Array(^[^$40...])>>|Tuple($5)|$79<BExpr<Bool<True|False>|VExpr<Var(^string)|Fn(^[^string,$2...])|Load(^[$2,^int])|LengthOf($2)|IndexOf(^[$2,$2])>|And(^{^$79...})|Or(^{^$79...})|Not(^$79)|Equals(^[$125<^Type<Atom<NotT($148<^Proton<TupleT(^[$148...])|ArrayT($148)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$148...])|ArrayT($148)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($125)|OrT(^{$125...})|AndT(^{$125...})|ArrayT($125)|TupleT(^[$125...])|FunctionT(^[$125,$125,$125...])>>,^{|$2,$2|}[$2,$2]])|Inequality(^[^AType<IntT|RealT>,$222<^AExpr<Num(^real)|VExpr<Var(^string)|Fn(^[^string,$2...])|Load(^[$2,^int])|LengthOf($2)|IndexOf(^[$2,$2])>|Sum(^[^real,^{|$222...|}[$222...]])|Mul(^[^real,^{|$222...|}[$222...]])|Div(^[$222,$222])>>])|Equation(^[^AType<IntT|RealT>,$222])|ForAll(^[^{^[^Var(^string),$125]...},^$79])|Exists(^[^{^[^Var(^string),$125]...},^$79])>>|AExpr<Num(^real)|VExpr<Var(^string)|Fn(^[^string,$2...])|Load(^[$2,^int])|LengthOf($2)|IndexOf(^[$2,$2])>|Sum(^[^real,^{|$222...|}[$222...]])|Mul(^[^real,^{|$222...|}[$222...]])|Div(^[$222,$222])>|SExpr<$7|VExpr<Var(^string)|Fn(^[^string,$2...])|Load(^[$2,^int])|LengthOf($2)|IndexOf(^[$2,$2])>>>>...]>)>
		Schema.Term("Array",Schema.List(true)),
		// $8<IndexOf(^[$2<^Expr<$42<Value<Null|Tuple(^[^$42...])|Bool<True|False>|Num(^real)|String(^string)|Array(^[^$42...])>>|Tuple(^[$2...])|$84<BExpr<Bool<True|False>|VExpr<$8|Var(^string)|Fn(^[^string,$2...])|Load(^[$2,^int])|LengthOf($2)>|And(^{^$84...})|Or(^{^$84...})|Not(^$84)|Equals(^[$123<^Type<Atom<NotT($146<^Proton<TupleT(^[$146...])|ArrayT($146)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$146...])|ArrayT($146)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($123)|OrT(^{$123...})|AndT(^{$123...})|ArrayT($123)|TupleT(^[$123...])|FunctionT(^[$123,$123,$123...])>>,^{|$2,$2|}[$2,$2]])|Inequality(^[^AType<IntT|RealT>,$220<^AExpr<Num(^real)|VExpr<$8|Var(^string)|Fn(^[^string,$2...])|Load(^[$2,^int])|LengthOf($2)>|Sum(^[^real,^{|$220...|}[$220...]])|Mul(^[^real,^{|$220...|}[$220...]])|Div(^[$220,$220])>>])|Equation(^[^AType<IntT|RealT>,$220])|ForAll(^[^{^[^Var(^string),$123]...},^$84])|Exists(^[^{^[^Var(^string),$123]...},^$84])>>|AExpr<Num(^real)|VExpr<$8|Var(^string)|Fn(^[^string,$2...])|Load(^[$2,^int])|LengthOf($2)>|Sum(^[^real,^{|$220...|}[$220...]])|Mul(^[^real,^{|$220...|}[$220...]])|Div(^[$220,$220])>|SExpr<VExpr<$8|Var(^string)|Fn(^[^string,$2...])|Load(^[$2,^int])|LengthOf($2)>|Array(^[$2...])>>>,$2])>
		Schema.Term("IndexOf",Schema.List(true,Schema.Or(Schema.Or(Schema.Or(Schema.Or(Schema.Or(Schema.Term("Null"), Schema.Term("Tuple",Schema.List(true)), Schema.Or(Schema.Term("True"), Schema.Term("False")), Schema.Term("Num",Schema.Real), Schema.Term("String",Schema.String)), Schema.Term("Array",Schema.Any)), Schema.Term("Tuple",Schema.List(true)), Schema.Or(Schema.Or(Schema.Or(Schema.Any, Schema.Or(Schema.Any, Schema.Or(Schema.Term("Var",Schema.Any), Schema.Term("Fn",Schema.List(true,Schema.Any)), Schema.Term("Load",Schema.List(true,Schema.Any,Schema.Int)), Schema.Term("LengthOf",Schema.Any))), Schema.Term("And",Schema.Set(true)), Schema.Term("Or",Schema.Any), Schema.Term("Not",Schema.Any), Schema.Term("Equals",Schema.List(true,Schema.Or(Schema.Or(Schema.Term("NotT",Schema.Or(Schema.Term("TupleT",Schema.List(true)), Schema.Term("ArrayT",Schema.Any), Schema.Or(Schema.Term("AnyT"), Schema.Term("NullT"), Schema.Term("VoidT"), Schema.Term("BoolT"), Schema.Term("IntT"), Schema.Term("RealT"), Schema.Term("StringT"), Schema.Term("VarT",Schema.Any), Schema.Term("NominalT",Schema.Any)))), Schema.Any), Schema.Term("NotT",Schema.Any), Schema.Term("OrT",Schema.Set(true)), Schema.Term("AndT",Schema.Any), Schema.Term("ArrayT",Schema.Any), Schema.Term("TupleT",Schema.List(true)), Schema.Term("FunctionT",Schema.List(true,Schema.Any,Schema.Any))),Schema.Bag(true,Schema.Any,Schema.Any)))), Schema.Or(Schema.Term("Inequality",Schema.List(true,Schema.Or(Schema.Any, Schema.Any),Schema.Or(Schema.Any, Schema.Any, Schema.Term("Sum",Schema.List(true,Schema.Any,Schema.Bag(true))), Schema.Term("Mul",Schema.Any), Schema.Term("Div",Schema.List(true,Schema.Any,Schema.Any))))), Schema.Term("Equation",Schema.Any))), Schema.Or(Schema.Term("ForAll",Schema.List(true,Schema.Set(true),Schema.Any)), Schema.Term("Exists",Schema.Any)))), Schema.Any), Schema.Or(Schema.Any, Schema.Term("Array",Schema.Any))),Schema.Any)),
		// $19<ForAll($17<^[^{^[^Var(^string),$4<^Type<Atom<NotT($35<^Proton<TupleT(^[$35...])|ArrayT($35)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$35...])|ArrayT($35)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($4)|OrT(^{$4...})|AndT(^{$4...})|ArrayT($4)|TupleT(^[$4...])|FunctionT(^[$4,$4,$4...])>>]...},$13<^$127<BExpr<$137<VExpr<Var(^string)|Fn(^[^string,$139<^Expr<$127|$177<Value<Null|Tuple(^[^$177...])|Bool<True|False>|Num(^real)|String(^string)|Array(^[^$177...])>>|Tuple(^[$139...])|$204<AExpr<$137|Num(^real)|Sum(^[^real,^{|^$204...|}[^$204...]])|Mul(^[^real,^{|^$204...|}[^$204...]])|Div(^[^$204,^$204])>>|SExpr<$137|Array(^[$139...])>>>...])|Load(^[$139,^int])|LengthOf($139)|IndexOf(^[$139,$139])>>|Bool<True|False>|And(^{$13...})|Or(^{$13...})|Not($13)|Equals(^[$4,^{|$139,$139|}[$139,$139]])|Inequality(^[^AType<IntT|RealT>,^$204])|Equation(^[^AType<IntT|RealT>,^$204])|$19|Exists($17)>>>]>)>
		Schema.Term("ForAll",Schema.List(true,Schema.Set(true),Schema.Or(Schema.Or(Schema.Or(Schema.Or(Schema.Or(Schema.Term("Var",Schema.String), Schema.Term("Fn",Schema.List(true,Schema.Any)), Schema.Term("Load",Schema.List(true,Schema.Or(Schema.Or(Schema.Or(Schema.Any, Schema.Or(Schema.Or(Schema.Term("Null"), Schema.Term("Tuple",Schema.List(true)), Schema.Or(Schema.Term("True"), Schema.Term("False")), Schema.Term("Num",Schema.Real), Schema.Term("String",Schema.Any)), Schema.Term("Array",Schema.Any)), Schema.Term("Tuple",Schema.List(true))), Schema.Or(Schema.Any, Schema.Any, Schema.Term("Sum",Schema.List(true,Schema.Any,Schema.Bag(true))), Schema.Term("Mul",Schema.Any), Schema.Term("Div",Schema.List(true,Schema.Any,Schema.Any)))), Schema.Or(Schema.Any, Schema.Term("Array",Schema.Any))),Schema.Int)), Schema.Term("LengthOf",Schema.Any)), Schema.Term("IndexOf",Schema.List(true,Schema.Any,Schema.Any))), Schema.Any, Schema.Term("And",Schema.Set(true)), Schema.Term("Or",Schema.Any), Schema.Term("Not",Schema.Any), Schema.Term("Equals",Schema.List(true,Schema.Or(Schema.Or(Schema.Term("NotT",Schema.Or(Schema.Term("TupleT",Schema.List(true)), Schema.Term("ArrayT",Schema.Any), Schema.Or(Schema.Term("AnyT"), Schema.Term("NullT"), Schema.Term("VoidT"), Schema.Term("BoolT"), Schema.Term("IntT"), Schema.Term("RealT"), Schema.Term("StringT"), Schema.Term("VarT",Schema.Any), Schema.Term("NominalT",Schema.Any)))), Schema.Any), Schema.Term("NotT",Schema.Any), Schema.Term("OrT",Schema.Set(true)), Schema.Term("AndT",Schema.Any), Schema.Term("ArrayT",Schema.Any), Schema.Term("TupleT",Schema.List(true)), Schema.Term("FunctionT",Schema.List(true,Schema.Any,Schema.Any))),Schema.Bag(true,Schema.Any,Schema.Any)))), Schema.Or(Schema.Term("Inequality",Schema.List(true,Schema.Or(Schema.Any, Schema.Any),Schema.Any)), Schema.Term("Equation",Schema.Any))), Schema.Or(Schema.Any, Schema.Term("Exists",Schema.Any))))),
		// $19<Exists($17<^[^{^[^Var(^string),$4<^Type<Atom<NotT($35<^Proton<TupleT(^[$35...])|ArrayT($35)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$35...])|ArrayT($35)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($4)|OrT(^{$4...})|AndT(^{$4...})|ArrayT($4)|TupleT(^[$4...])|FunctionT(^[$4,$4,$4...])>>]...},$13<^$127<BExpr<$137<VExpr<Var(^string)|Fn(^[^string,$139<^Expr<$127|$177<Value<Null|Tuple(^[^$177...])|Bool<True|False>|Num(^real)|String(^string)|Array(^[^$177...])>>|Tuple(^[$139...])|$204<AExpr<$137|Num(^real)|Sum(^[^real,^{|^$204...|}[^$204...]])|Mul(^[^real,^{|^$204...|}[^$204...]])|Div(^[^$204,^$204])>>|SExpr<$137|Array(^[$139...])>>>...])|Load(^[$139,^int])|LengthOf($139)|IndexOf(^[$139,$139])>>|Bool<True|False>|And(^{$13...})|Or(^{$13...})|Not($13)|Equals(^[$4,^{|$139,$139|}[$139,$139]])|Inequality(^[^AType<IntT|RealT>,^$204])|Equation(^[^AType<IntT|RealT>,^$204])|$19|ForAll($17)>>>]>)>
		Schema.Term("Exists",Schema.List(true,Schema.Set(true),Schema.Or(Schema.Or(Schema.Or(Schema.Or(Schema.Or(Schema.Term("Var",Schema.String), Schema.Term("Fn",Schema.List(true,Schema.Any)), Schema.Term("Load",Schema.List(true,Schema.Or(Schema.Or(Schema.Or(Schema.Any, Schema.Or(Schema.Or(Schema.Term("Null"), Schema.Term("Tuple",Schema.List(true)), Schema.Or(Schema.Term("True"), Schema.Term("False")), Schema.Term("Num",Schema.Real), Schema.Term("String",Schema.Any)), Schema.Term("Array",Schema.Any)), Schema.Term("Tuple",Schema.List(true))), Schema.Or(Schema.Any, Schema.Any, Schema.Term("Sum",Schema.List(true,Schema.Any,Schema.Bag(true))), Schema.Term("Mul",Schema.Any), Schema.Term("Div",Schema.List(true,Schema.Any,Schema.Any)))), Schema.Or(Schema.Any, Schema.Term("Array",Schema.Any))),Schema.Int)), Schema.Term("LengthOf",Schema.Any)), Schema.Term("IndexOf",Schema.List(true,Schema.Any,Schema.Any))), Schema.Any, Schema.Term("And",Schema.Set(true)), Schema.Term("Or",Schema.Any), Schema.Term("Not",Schema.Any), Schema.Term("Equals",Schema.List(true,Schema.Or(Schema.Or(Schema.Term("NotT",Schema.Or(Schema.Term("TupleT",Schema.List(true)), Schema.Term("ArrayT",Schema.Any), Schema.Or(Schema.Term("AnyT"), Schema.Term("NullT"), Schema.Term("VoidT"), Schema.Term("BoolT"), Schema.Term("IntT"), Schema.Term("RealT"), Schema.Term("StringT"), Schema.Term("VarT",Schema.Any), Schema.Term("NominalT",Schema.Any)))), Schema.Any), Schema.Term("NotT",Schema.Any), Schema.Term("OrT",Schema.Set(true)), Schema.Term("AndT",Schema.Any), Schema.Term("ArrayT",Schema.Any), Schema.Term("TupleT",Schema.List(true)), Schema.Term("FunctionT",Schema.List(true,Schema.Any,Schema.Any))),Schema.Bag(true,Schema.Any,Schema.Any)))), Schema.Or(Schema.Term("Inequality",Schema.List(true,Schema.Or(Schema.Any, Schema.Any),Schema.Any)), Schema.Term("Equation",Schema.Any))), Schema.Or(Schema.Any, Schema.Term("ForAll",Schema.Any))))),
		// Inhabited($2<^Type<Atom<NotT($17<^Proton<TupleT(^[$17...])|ArrayT($17)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$17...])|ArrayT($17)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($2)|OrT(^{$2...})|AndT(^{$2...})|ArrayT($2)|TupleT(^[$2...])|FunctionT(^[$2,$2,$2...])>>)
		Schema.Term("Inhabited",Schema.Or(Schema.Or(Schema.Term("NotT",Schema.Or(Schema.Term("TupleT",Schema.List(true)), Schema.Term("ArrayT",Schema.Any), Schema.Or(Schema.Term("AnyT"), Schema.Term("NullT"), Schema.Term("VoidT"), Schema.Term("BoolT"), Schema.Term("IntT"), Schema.Term("RealT"), Schema.Term("StringT"), Schema.Term("VarT",Schema.String), Schema.Term("NominalT",Schema.Any)))), Schema.Any), Schema.Term("NotT",Schema.Any), Schema.Term("OrT",Schema.Set(true)), Schema.Term("AndT",Schema.Any), Schema.Term("ArrayT",Schema.Any), Schema.Term("TupleT",Schema.List(true)), Schema.Term("FunctionT",Schema.List(true,Schema.Any,Schema.Any)))),
		// Is(^[$2<^Expr<$44<Value<Null|Tuple(^[^$44...])|Bool<True|False>|Num(^real)|String(^string)|Array(^[^$44...])>>|Tuple(^[$2...])|$86<BExpr<Bool<True|False>|VExpr<Var(^string)|Fn(^[^string,$2...])|Load(^[$2,^int])|LengthOf($2)|IndexOf(^[$2,$2])>|And(^{^$86...})|Or(^{^$86...})|Not(^$86)|Equals(^[$4<^Type<Atom<NotT($153<^Proton<TupleT(^[$153...])|ArrayT($153)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$153...])|ArrayT($153)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($4)|OrT(^{$4...})|AndT(^{$4...})|ArrayT($4)|TupleT(^[$4...])|FunctionT(^[$4,$4,$4...])>>,^{|$2,$2|}[$2,$2]])|Inequality(^[^AType<IntT|RealT>,$227<^AExpr<Num(^real)|VExpr<Var(^string)|Fn(^[^string,$2...])|Load(^[$2,^int])|LengthOf($2)|IndexOf(^[$2,$2])>|Sum(^[^real,^{|$227...|}[$227...]])|Mul(^[^real,^{|$227...|}[$227...]])|Div(^[$227,$227])>>])|Equation(^[^AType<IntT|RealT>,$227])|ForAll(^[^{^[^Var(^string),$4]...},^$86])|Exists(^[^{^[^Var(^string),$4]...},^$86])>>|AExpr<Num(^real)|VExpr<Var(^string)|Fn(^[^string,$2...])|Load(^[$2,^int])|LengthOf($2)|IndexOf(^[$2,$2])>|Sum(^[^real,^{|$227...|}[$227...]])|Mul(^[^real,^{|$227...|}[$227...]])|Div(^[$227,$227])>|SExpr<VExpr<Var(^string)|Fn(^[^string,$2...])|Load(^[$2,^int])|LengthOf($2)|IndexOf(^[$2,$2])>|Array(^[$2...])>>>,$4])
		Schema.Term("Is",Schema.List(true,Schema.Or(Schema.Or(Schema.Or(Schema.Or(Schema.Or(Schema.Term("Null"), Schema.Term("Tuple",Schema.List(true)), Schema.Or(Schema.Term("True"), Schema.Term("False")), Schema.Term("Num",Schema.Real), Schema.Term("String",Schema.String)), Schema.Term("Array",Schema.Any)), Schema.Term("Tuple",Schema.List(true)), Schema.Or(Schema.Or(Schema.Or(Schema.Any, Schema.Or(Schema.Or(Schema.Term("Var",Schema.Any), Schema.Term("Fn",Schema.List(true,Schema.Any)), Schema.Term("Load",Schema.List(true,Schema.Any,Schema.Int)), Schema.Term("LengthOf",Schema.Any)), Schema.Term("IndexOf",Schema.List(true,Schema.Any,Schema.Any))), Schema.Term("And",Schema.Set(true)), Schema.Term("Or",Schema.Any), Schema.Term("Not",Schema.Any), Schema.Term("Equals",Schema.List(true,Schema.Or(Schema.Or(Schema.Term("NotT",Schema.Or(Schema.Term("TupleT",Schema.List(true)), Schema.Term("ArrayT",Schema.Any), Schema.Or(Schema.Term("AnyT"), Schema.Term("NullT"), Schema.Term("VoidT"), Schema.Term("BoolT"), Schema.Term("IntT"), Schema.Term("RealT"), Schema.Term("StringT"), Schema.Term("VarT",Schema.Any), Schema.Term("NominalT",Schema.Any)))), Schema.Any), Schema.Term("NotT",Schema.Any), Schema.Term("OrT",Schema.Set(true)), Schema.Term("AndT",Schema.Any), Schema.Term("ArrayT",Schema.Any), Schema.Term("TupleT",Schema.List(true)), Schema.Term("FunctionT",Schema.List(true,Schema.Any,Schema.Any))),Schema.Bag(true,Schema.Any,Schema.Any)))), Schema.Or(Schema.Term("Inequality",Schema.List(true,Schema.Or(Schema.Any, Schema.Any),Schema.Or(Schema.Any, Schema.Any, Schema.Term("Sum",Schema.List(true,Schema.Any,Schema.Bag(true))), Schema.Term("Mul",Schema.Any), Schema.Term("Div",Schema.List(true,Schema.Any,Schema.Any))))), Schema.Term("Equation",Schema.Any))), Schema.Or(Schema.Term("ForAll",Schema.List(true,Schema.Set(true),Schema.Any)), Schema.Term("Exists",Schema.Any)))), Schema.Any), Schema.Or(Schema.Any, Schema.Term("Array",Schema.Any))),Schema.Any))
	});

	// =========================================================================
	// Types
	// =========================================================================

	// AnyT
	private static Type type0 = Runtime.Type("2G0tLTJCWDggIk2");
	// VoidT
	private static Type type1 = Runtime.Type("2KLxLPZGp3ukmD0E");
	// $11<Type<Atom<NotT($13<^Proton<TupleT(^[$13...])|ArrayT($13)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$13...])|ArrayT($13)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT(^$11)|OrT(^{^$11...})|AndT(^{^$11...})|ArrayT(^$11)|TupleT(^[^$11...])|FunctionT(^[^$11,^$11,^$11...])>>
	private static Type type2 = Runtime.Type("j53GKTkK5G0GrQhGZIjG6KowZRJGJFiG5KZ4ZRm4LTJG5Kp06Q_G4_WGptqNo_qQiGKRSlQZRgRoRcSVTgWHYcnHhk3OF8rQoxaQeZr7ww3AN4HLthWLYgnLhk4KGKMNmhq7ElHDUd1PYVJPgcq7zw3Ag4nPh_QgWQYsoQhV6G0tLTJCWTgg6KDK6QgGp3xlXUJOpQdG5KIVNkHX0K1xqQgGp3A5gkNFJHiG6KIsNkmY0KHKLNgGp3O5gcOFrJo8MPiS5KIkOkHb0GL4aRJdH5YwOVPkHe0WWIjpLPi45QJCme0e0Ag5G5wxbXGY0alaWbWeGfl5i5YspfGAs5eoo7wcQkmil7u5fwHjW9y5Yonj0A76Ysnj0A96YwYi0AB6YcQkHDD6ewRB1HN6gZSBXiWil7u5Q6tkScHrl78tSkmrGo3");
	// $15<Proton<TupleT(^[^$15...])|ArrayT(^$15)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>
	private static Type type3 = Runtime.Type("cG5Jmx5Sjt5KGKMNmh5OJK6RgK5KeZp7xkHDycmEYk2HgZ3O08bRW_6KYgJEgkJB9pJal5DCXDEp1L34ZQtGp3PlmLJtJSgl5KIo4ATG_Kj_5OJC0PgZ5K1xqQgGp3fl1Q3_ZQoGp3ilmQJ8KOWl5KIZ6AuGrJo8MPiS5KIk6AxGZKW86KeZl7zWNkHX0WWIjpLPi45QJCmX0X0AB5G5Rx_PhWrTydNoNgWYl7vwNo1aGZ4");
	// ^AnyT
	private static Type type4 = Runtime.Type("3G0tLTJCWDggY9w3x$");
	// Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>
	private static Type type5 = Runtime.Type("8GKJp4aRfGJFi_6KIg2AwF_Ipl5QJCWEgw2KLxLPZGp38lXHJ8oQjl5KIk3ACGJHiG6KIw3ANG_J_45QJCWLgg4SIGbRdtqOJCGMgs4GL4aRJdH5YVLPgc5WWIjpLPi45QJC1QdlHQG5xVoHD_4MUhaQQwq7uVMAt4ux");
	// $13<Expr<$34<Value<Null|Tuple(^[^$34...])|Bool<True|False>|Num(^real)|String(^string)|Array(^[^$34...])>>|Tuple(^[^$13...])|$77<BExpr<Bool<True|False>|VExpr<Var(^string)|Fn(^[^string,^$13...])|Load(^[^$13,^int])|LengthOf(^$13)|IndexOf(^[^$13,^$13])>|And(^{^$77...})|Or(^{^$77...})|Not(^$77)|Equals(^[$123<^Type<Atom<NotT($146<^Proton<TupleT(^[$146...])|ArrayT($146)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$146...])|ArrayT($146)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($123)|OrT(^{$123...})|AndT(^{$123...})|ArrayT($123)|TupleT(^[$123...])|FunctionT(^[$123,$123,$123...])>>,^{|^$13,^$13|}[^$13,^$13]])|Inequality(^[^AType<IntT|RealT>,$220<^AExpr<Num(^real)|VExpr<Var(^string)|Fn(^[^string,^$13...])|Load(^[^$13,^int])|LengthOf(^$13)|IndexOf(^[^$13,^$13])>|Sum(^[^real,^{|$220...|}[$220...]])|Mul(^[^real,^{|$220...|}[$220...]])|Div(^[$220,$220])>>])|Equation(^[^AType<IntT|RealT>,$220])|ForAll(^[^{^[^Var(^string),$123]...},^$77])|Exists(^[^{^[^Var(^string),$123]...},^$77])>>|AExpr<Num(^real)|VExpr<Var(^string)|Fn(^[^string,^$13...])|Load(^[^$13,^int])|LengthOf(^$13)|IndexOf(^[^$13,^$13])>|Sum(^[^real,^{|$220...|}[$220...]])|Mul(^[^real,^{|$220...|}[$220...]])|Div(^[$220,$220])>|SExpr<VExpr<Var(^string)|Fn(^[^string,^$13...])|Load(^[^$13,^int])|LengthOf(^$13)|IndexOf(^[^$13,^$13])>|Array(^[^$13...])>>>
	private static Type type6 = Runtime.Type("jH3K3Tk86KL45QpK5KJK6RgK5K1K3Tk8MBwdPwRgWEJ4JGs0bRWwnYo58GpJ4W6Rm4XHTIQko7uoJADGZIpl5QIV4AOGZFjx5QosJShGqJo8MPiSa9wCXMgZnMeVq7wZ5Ae4_LftNZOkOg0QJ4ZRm4LTYsLPgwL7hWr5tCmDupmT3G_RpKq3xlXUJOJNgCMOIVNkHXG7zdNglXl7QlNoHYW9PB1ME5gVOcH5Yo_a0AQ5ewo7S5gZYbW9U5Yk2e0Ad5JOKGs0bRo3ZQZGmImGYIjG6O44MSWlqRWtNcTwdZegewfg0i0dGHiKLRp45QdGMT3544MSWGMPjtL7wEuHQkQ3HiGjl5y5ZOoQm43QgGLGs_qRoCM7NIPIQcR3mjlml5B6YoInGAD6oNKNmGXGiG3Ij45O35BKaQbG6PEOLFg6u689A9QkSFMHiGLOsxZOWoSZdglrl7f5c6hZTB1qWa0Af6IcOBHbGvGDi6ewTBHq0y0At6egl7S5v6Yo0zGDx6esUBXqlz0A79YgSoOkXXm7S5S5Yo0YHDC9escBXrlY1AN9ewRBXam9jgdc1bm7g5S9gsdBHfGb1Ac9YsPcdkXe1GJ_6R_dXqX7S5S5YoWf1Dj9eVfBHfHim7ScfZniX9w9YwPofkXj1G0GrQhGZIjG6KowZRJGJFiG5KZ4ZRm4LTJG5Kp06Q_G4_WGptqNo_qQiGKReAzDBEDENESEfEQwgB1f1qHAOAZ0_RjGrQidXzm78ARAgoh3XrXzm5UAYVgVioHu1KGKMNmhq7RAgZ2vX9hAYogsikmvm7BARAgZj32yXyHjn5vAYghkjoHz1G0tLTJClz1A7DJtJSgl5KIcskmX2KLxLPZGp3CDgssF_Fjx5QJC0a2AOD3_ZQoGp3QDgktF_J_45QJCWb2AUDoC4Sm_aQbGp3dDgcuFZKW86KYkucOkHf2WWIjpLPi45QJCmfYa0AsDG58DBDEDPDSDcDfDiDtDQcvBmumiIAwDYZgoekXjn7h9fw1mY98EYcgcwkmmn7AA9EgowB1nHf1AEEYoekHDOEecxBHnmq2AREYoeoeBHfXrIDUEeVyBXnHu2AeEJ43Kt0MOeV7dmYo7hEiEYolvIDsEeZzBXiWy2AvEWotVugGzn7gEyEhwzFnJpp5CCK6QoFJPq4KaWu0eZe3io5BHYVJYJADHYsyg1DNHeZ8CmYWao7Sg8_2bZ9SHYZ7t8lmbo79HTHgZ9CXvYvn7Sg9_2fZ9hHYg7t9lmfo7v5uEgZAd1vl7vHh9Yo0jJDxHesACmjo9jVBdHmo79IP9YolmJDBIeoBC1mWn3AEIYZRsBlHqJ7e6cIQgCCmHRIhoCCXQc5gwC4Ex");
	// int
	private static Type type7 = Runtime.Type("Fg0");
	// $11<VExpr<Var(^string)|Fn(^[^string,$16<^Expr<$56<Value<Null|Tuple(^[^$56...])|Bool<True|False>|Num(^real)|String(^string)|Array(^[^$56...])>>|Tuple(^[$16...])|$96<BExpr<$11|Bool<True|False>|And(^{^$96...})|Or(^{^$96...})|Not(^$96)|Equals(^[$108<^Type<Atom<NotT($131<^Proton<TupleT(^[$131...])|ArrayT($131)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$131...])|ArrayT($131)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($108)|OrT(^{$108...})|AndT(^{$108...})|ArrayT($108)|TupleT(^[$108...])|FunctionT(^[$108,$108,$108...])>>,^{|$16,$16|}[$16,$16]])|Inequality(^[^AType<IntT|RealT>,$205<^AExpr<$11|Num(^real)|Sum(^[^real,^{|$205...|}[$205...]])|Mul(^[^real,^{|$205...|}[$205...]])|Div(^[$205,$205])>>])|Equation(^[^AType<IntT|RealT>,$205])|ForAll(^[^{^[^Var(^string),$108]...},^$96])|Exists(^[^{^[^Var(^string),$108]...},^$96])>>|AExpr<$11|Num(^real)|Sum(^[^real,^{|$205...|}[$205...]])|Mul(^[^real,^{|$205...|}[$205...]])|Div(^[$205,$205])>|SExpr<$11|Array(^[$16...])>>>...])|Load(^[$16,^int])|LengthOf($16)|IndexOf(^[$16,$16])>>
	private static Type type8 = Runtime.Type("jHJOKGs0bRoNKNmGXGiG3Ij45O35BKaQbG6PEOLFNW5qZqo5zFMHiGLOsxZOWV3uo59CXDAp1IeZl7vs3AEGJGs0bReor3DCXLQ_2Meop7ws4AUG_KWlLS_G4Kp06Q_G_F4W6Rm4YeWnWyl5gGKF4W6Rm4HQsEQw5KIK3Tk8M7sxAhWTYZpThk6GDK6QgCWUgw6G1xqQgGYIpp5OIGbRdtqOecPB1Y0AtoNcXYl7exNk1aGJ75O5w5z586QcOFKFm8MNtC1blY0AS5WgOsOglbl7dWPoHe0GJ8MS_Cle0Ag5JOJNgCMOIsPkmfG7h5s5QZQBHXWiGAv5ecl795x5gsQBmXWIgVRBXLgZYmW9A6Yc5n0AC6o3ZQZGmImGYIjG6O44MSWlqRWp3j0XXX1Y1em5Q6Z58tLOlKMNg_5StGNJJRp45SdxaQWoxg8hlrG7R6c6QZTFaGj8MFgl5O4WMPnGrRWZAhAhGvG7e6i6QwTBmPs6hZUcXyl7v6fw1zW9x6YwRsUkmzl7N6y6gZcBHqly0AA93GKTkKa9v9Xc_LYolY1DN9eZdBXYXam7SgdZ2bX9S9YcSsdkmb1G0GrQhGZIjG6KowZRJGJFiG5KZ4ZRm4LTJG5Kp06Q_G4_WGptqNo_qQiGKRAAcDhDjDtDyDBEQVfBHYHiHAu9Z0_RjGrQidmrm7e9x9gsf3mjmrm57AYZeZgoXm1KGKMNmhq7x9gZInX9DAYsewgk1qm7h9x9gch3IqmqXbn5RAYkfohoXr1G0tLTJC0u1AdAJtJSgl5KIgik1v1KLxLPZGp3iAgwiF_Fjx5QJCGy1AuA3_ZQoGp3wAgojF_J_45QJClz1A7DoC4Sm_aQbGp39DggsFZKW86KYoss3ADD35DxLQdtLNgGp7NDDlHaIZWuHv1ymyXzHX2YnYYan5QDYkgktoHbn7e9D9gwtBXYm9jZucXen7f9fDgkuB1fme2AiDYoesck1in7D9gZYiY9vDYsekvkHjn7D9D9YscwvZ2mY98EYwecwkmm2K0GKTkKa9dEeVzBXnnnn7SVxZIqY9PEYoSgxk1rI7yA8DQsxBHnnrIAcEoBKShGIIpl5C3_aSGpojGXoXJao5hEYsavIAjEYwwg1DtEeczBHjlyn7SkzZIzY9yEYcywzk1Xo7fEzEgc7Cmnnnn7Sk7_IYZ9DHYkyw7l1ao7T6QEgc8d1LYk8tcBH6SHts8dmbo7cHfwHeZ9eHYg9hUBH6gHto9dXfo7f6jHgVAC1vlf3AuHWoJmo5wHYZMjJAyHYkOkRk1mZ9QBXL9IYolmJDBIeoBCHEDIgwBCXEPlHqo7Pdp7SgC_2rZ9SIYZZr3AUIGI");
	// $7<Tuple($5<^[$2<^Expr<$7|$40<Value<Null|Tuple(^[^$40...])|Bool<True|False>|Num(^real)|String(^string)|Array(^[^$40...])>>|$77<BExpr<Bool<True|False>|VExpr<Var(^string)|Fn(^[^string,$2...])|Load(^[$2,^int])|LengthOf($2)|IndexOf(^[$2,$2])>|And(^{^$77...})|Or(^{^$77...})|Not(^$77)|Equals(^[$123<^Type<Atom<NotT($146<^Proton<TupleT(^[$146...])|ArrayT($146)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$146...])|ArrayT($146)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($123)|OrT(^{$123...})|AndT(^{$123...})|ArrayT($123)|TupleT(^[$123...])|FunctionT(^[$123,$123,$123...])>>,^{|$2,$2|}[$2,$2]])|Inequality(^[^AType<IntT|RealT>,$220<^AExpr<Num(^real)|VExpr<Var(^string)|Fn(^[^string,$2...])|Load(^[$2,^int])|LengthOf($2)|IndexOf(^[$2,$2])>|Sum(^[^real,^{|$220...|}[$220...]])|Mul(^[^real,^{|$220...|}[$220...]])|Div(^[$220,$220])>>])|Equation(^[^AType<IntT|RealT>,$220])|ForAll(^[^{^[^Var(^string),$123]...},^$77])|Exists(^[^{^[^Var(^string),$123]...},^$77])>>|AExpr<Num(^real)|VExpr<Var(^string)|Fn(^[^string,$2...])|Load(^[$2,^int])|LengthOf($2)|IndexOf(^[$2,$2])>|Sum(^[^real,^{|$220...|}[$220...]])|Mul(^[^real,^{|$220...|}[$220...]])|Div(^[$220,$220])>|SExpr<VExpr<Var(^string)|Fn(^[^string,$2...])|Load(^[$2,^int])|LengthOf($2)|IndexOf(^[$2,$2])>|Array($5)>>>...]>)>
	private static Type type9 = Runtime.Type("jHJGKSklLO3K3Tk8b9SC1EgZIEesn7uw2A7G_KWlLS_G_F4W6Rm4IH95E6Qk3K0K3Tk8M7Cx7hlIJCKGs0bRWV_ro5PCmDQp1M3tJSglq3TlmM38oQjl5CDKMQZC4Sm_aQbdXXl7glHDhdXQYcnQgVMJc_6blbWel5uGKFm8MNtC1UjlHUWgbUQwr79WNoHX0GJ8MS_ClX0AB5JOJNgCMOIsNkmYG7C5N5QZOBHPP5hgOcX5YcLb0AT5eZl7fWPkHe0KLK3Tk86C0t5OZwZRosoQoGLGlKMNgCMNR5e6U9d9f9z9QVQFPZZQ_4MSWlLPo_6WGGlKMNo_qQi41zYio5w5WZQoQgWj0O5xaR0l5QZK3TdC6Sn41qZqo596WwQgRg0nl7ApRoXn0CL4aRZNZQ3loQWG5W0I_tqOoWqIa43vWyGXmXm5R6o_ZQZK5TEOL7S6O9QwSBme0uGAd6YVSVPkmul3c5YkIvGDi6ewTBHq0y0At6egl7wgUBH6w6toUcXzl7P6z6gVcBmq0EgccB1EwBH6B9toccXYm7T6E9gVdcmnl7P9fwmaX9R9YkPodkXbm7h5S9gVeBXfWa1Ae93GKTkKa9PAXk2EYoWf1Dj9eVfBHfHim7ScfZniX9w9YwPofkXj1G0GrQhGZIjG6KowZRJGJFiG5KZ4ZRm4LTJG5Kp06Q_G4_WGptqNo_qQiGKReAzDBEDENESEfEQwgB1f1qHAOAZ0_RjGrQidXzm78ARAgoh3XrXzm5UAYVgVioHu1KGKMNmhq7RAgZ2vX9hAYogsikmvm7BARAgZj32yXyHjn5vAYghkjoHz1G0tLTJClz1A7DJtJSgl5KIcskmX2KLxLPZGp3CDgssF_Fjx5QJC0a2AOD3_ZQoGp3QDgktF_J_45QJCWb2AUDoC4Sm_aQbGp3dDgcuFZKW86KYkuVPkHf2WWIjpLPi45QJCmf2e0AsDG58DBDEDPDSDcDfDiDtDQcvBmumiIAwDYZgoekXjn7h9fw1mY98EYcgcwkmmn7AA9EgowB1nHf1AEEYoekHDOEecxBHnmq2AREYoeoeBHfXrIDUEeVyBXnHu2AeEJ43Kt0MOeV7dmYo7hEiEYolvIDsEeZzBXiWy2AvEWotVugGzn7gEyEhwzFnJpp5CCK6QoFJPq4pbWu0eZe3io5BHYsJYJADHYsyg1DNHeZ8CHbWao7Sg8_2bZ9SHYZ7t8lmbo79HTHgZ9CXvYvn7Sg9_2fZ9hHYg7t9lmfo7v5uEgZAd1vl7vHh9Yo0jJDxHesACmjo9jVBdHmo79IP9YolmJDBIeoBC1mWn3AEIYZRsBlHqJ7e6cIQgCCHLRIhoCC1UzkmrJZ3");
	// $22<BExpr<$33<VExpr<Var(^string)|Fn(^[^string,$38<^Expr<$22|$76<Value<Null|Tuple(^[^$76...])|Bool<True|False>|Num(^real)|String(^string)|Array(^[^$76...])>>|Tuple(^[$38...])|$103<AExpr<$33|Num(^real)|Sum(^[^real,^{|^$103...|}[^$103...]])|Mul(^[^real,^{|^$103...|}[^$103...]])|Div(^[^$103,^$103])>>|SExpr<$33|Array(^[$38...])>>>...])|Load(^[$38,^int])|LengthOf($38)|IndexOf(^[$38,$38])>>|Bool<True|False>|And(^{^$22...})|Or(^{^$22...})|Not(^$22)|Equals(^[$154<^Type<Atom<NotT($177<^Proton<TupleT(^[$177...])|ArrayT($177)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$177...])|ArrayT($177)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($154)|OrT(^{$154...})|AndT(^{$154...})|ArrayT($154)|TupleT(^[$154...])|FunctionT(^[$154,$154,$154...])>>,^{|$38,$38|}[$38,$38]])|Inequality(^[^AType<IntT|RealT>,^$103])|Equation(^[^AType<IntT|RealT>,^$103])|ForAll(^[^{^[^Var(^string),$154]...},^$22])|Exists(^[^{^[^Var(^string),$154]...},^$22])>>
	private static Type type10 = Runtime.Type("jHJ8JGs0bRJOKGs0bR38oQjl5C0t5OZwZRosoQoGLGlKMNgCMNvWTshVicisjgGHZ58tLOlKMNg_5StGNJJRp45SdxaQWcAWBhGIWcZIQw3O5xaR0l5QZK3TdC6Sn4Xr3uo5Q41LRhGMYcYMhw4CL4aRZNZQ3loQWG5W0I_tqOoWqIa4ZUD57A9AQo5S8t5O_WrIa4XQNAQVr7vZMAudH5YZ5Ugo6G4W6RmdXel3wC1XGXGD95egNBXPB5goNF_KWlLS_G4Kp06Q_42PD6u6QZOFKF4W6Rm4XaGXm5R5JCKGs0bRWoOweglbl7zWPoHe0GDK6QgCle0Ag5osJShGqJo8MPiSa9D6YVQkHDt5ecQB1ali0Aw5GpPoQVTgToTgWj0K08bRW_r776v5gZR3mjWml5A6YwNkRoHn0GJ8MS_Cln0AN6JOJNgCMOIcSkmqG7O6R6QoSB1ET6hwScX5YsPZTkXul7j5wl1vl775gZYvW9j6YVOVUkHy0CIKMQooJSgG2GdOMJvhTgdodgegWzl7Q5z6hVccHXm799fVnXX9B9YZTocBH6D9twcc1am7v6O9gcdB1zGa1AR9YccccBH6T9twdc1em7x6d9gce3mTt9QkeBXbGfHAi9YVRVUk1iX9QB1XWim7SgfZ2jX9x9Ygaj1Az9Yk5X0A8AYVNVNBH6AAtkgcHnm7jtgkmnX9cCHqm9jchcmqm7xkhkHrm7ykhkmrm7zZhkHu1GJ_6R_dHaY77575YoGv1DiAewiB1v1ym7SZjZYyX9vAYV3z1AxA343Sjp5GDx5SJGnImG4G0t5OJGLFm8MNtG4OJK6RgK5KJ55KbQYGMPjt5Kl_uszg7p7x7l8d9hWYn7fAEDhVtF5Jmx5Sjta9xDYVsgtk1bI7SDxDQstBmzmbIAcDJ4KSW8rPYgtkHDfDekuB1YIf2AiDYgsgtk1iIBjDtDwEQcvBXaniIAwD34ZQtGp3yDgwvF_Ipl5QJCGm2A9EJOpQdG5KIkwkHn2K1xqQgGp3EEgVxFJHiG6KIcxkmq2KHKLNgGp3SEgsxFrJo8MPiS5KIVykHu2GL4aRJCmu2UgkyFNsoQh_aQWl5KYsyk6AjEG57EAEDEOEREUEeEhEsEQZzBXeYyIAvEYVskikHzn7gAfwmzY97HYZsZ7lXXo79D8Hgk7CmX2v1ADHYkikHDNHeZ8C1YYa3AQHYkikiB1vHbJDTHew8CHY2e3AdHJ43Kt0MOesAC1fZXm7So9_YfZ9jHYg3i3AtHWkxwxglio7fHwHhoAC1IsHgwAdXUYZBliBH69ItgBd1no7CIfwXnZ9EIYVC_hBH6OItcCdmqo7OlClHro7PlClmrJVq2");
	// Bool<True|False>
	private static Type type11 = Runtime.Type("QFZFjx5Q3G_RpKq3vk1EJOJNgCMOIs2Az3HE7hGHYcYHhgJko2");
	// any
	private static Type type12 = Runtime.Type("Fs0");
	// False
	private static Type type13 = Runtime.Type("2K545QnKq3ukmD0E");
	// True
	private static Type type14 = Runtime.Type("2GJ8MS_CWDggIk2");
	// $1<^Value<Null|Tuple(^[$1...])|Bool<True|False>|Num(^real)|String(^string)|Array(^[$1...])>>
	private static Type type15 = Runtime.Type("EG_KWlLS_d1P3tJSglq3wkHE38oQjl5CDKMQZC4Sm_aQbG4Kp06Q_CmDgZnHeko79p3AD4_EEdMU75QV4K08bRW_r7Pp3AQ4HLRhGMYcYMhw4GJ8MS_CGPgc5K545QnKq3glHQWgaQQwq7zVMAtdX5YVoTgkb9OBHHylmUlD");
	// $22<Value<Null|Tuple(^[^$22...])|Bool<True|False>|Num(^real)|String(^string)|Array(^[^$22...])>>
	private static Type type16 = Runtime.Type("EG_KWlLS_GZIpl5QIg2AwFZFjx5QosJShGqJo8MPiS5KJK6RgKa9cCXHgZnHeko78p3AD4KEEdMU75QV4K08bRW_r7Pp3AQ4HLRhGMYcYMhw4GJ8MS_CGPgc5K545QnKq3glHQWgaQQwq7yVMAtdX5YwnTgkb9OB1HylmU0P");
	// real
	private static Type type17 = Runtime.Type("Fc0");
	// $9<AExpr<Num(^real)|Sum(^[^real,^{|^$9...|}[^$9...]])|Mul(^[^real,^{|^$9...|}[^$9...]])|Div(^[^$9,^$9])|$41<VExpr<Var(^string)|Fn(^[^string,$46<^Expr<$9|$84<Value<Num(^real)|Null|Tuple(^[^$84...])|Bool<True|False>|String(^string)|Array(^[^$84...])>>|Tuple(^[$46...])|$121<BExpr<$41|Bool<True|False>|And(^{^$121...})|Or(^{^$121...})|Not(^$121)|Equals(^[$133<^Type<Atom<NotT($156<^Proton<TupleT(^[$156...])|ArrayT($156)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$156...])|ArrayT($156)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($133)|OrT(^{$133...})|AndT(^{$133...})|ArrayT($133)|TupleT(^[$133...])|FunctionT(^[$133,$133,$133...])>>,^{|$46,$46|}[$46,$46]])|Inequality(^[^AType<IntT|RealT>,^$9])|Equation(^[^AType<IntT|RealT>,^$9])|ForAll(^[^{^[^Var(^string),$133]...},^$121])|Exists(^[^{^[^Var(^string),$133]...},^$121])>>|SExpr<$41|Array(^[$46...])>>>...])|Load(^[$46,^int])|LengthOf($46)|IndexOf(^[$46,$46])>>>>
	private static Type type18 = Runtime.Type("jHJ4JGs0bRosJShGnJpp5CCK6QoFJPqG_K4W6Rm4_Icd5TA5QVo7uZJA9dX5Yg2IgoZ9ACmIfV2LeZp7Bdp7SgKDRdHMYkYMgwp7xs4AdCmIECH6f_2Qeoq7ys5AjGYKW8685t5GBxLNZGNkJOiS5ScxZO0tNsOVCdChGUo_ZQZK5TEOL7yWDh0Xl7zZNoXXW9OBHTB5goNFJGs0bRecQB0Yl7N5O5tcOcmal7ulOkHb0KL45QpK5KJK6RgK5K1K3Tk8MBT6z6f9QcP3mHf5QkPFpJ4W6Rm4Hfljo5j5YwNVQoHi0GDK6QgCli0Aw538oQjl5OIGbRdtqOesSB1m0AtZRcXml7c5A6gkR3_Ix5C6s6u6QsRFKFm8MNtC1qlm0AO6WwRcSglql7U5R6hoSF3KmKMOIwSk1u0K545QnKq3e6ggT3Hu0vl5h6YsQsTomvl7z5B5gZUB1a0AtgUc1zl7c5x6gsUFIFiG58E86CDx5SZKJRp45Qn4qX0yGimiHjHqm5B9Z58tLOlKMNg_5StGNJJRp45SdxaQWo7h8h0aH7C9O9QcdFaGj8MFgl5O4WMPnGrRWZAhAhWbH7Q9U9QVeBHeGeHAe9egeB1fm9joecXfm779j9gVfBHXmf1Au9Ycckek1j1GJ_6R_d1vX7N5N5Yo0m1D8AecgBmjmmm7SkgZInX9DAYgcwgk1q1G0GrQhGZIjG6KowZRJGJFiG5KZ4ZRm4LTJG5Kp06Q_G4_WGptqNo_qQiGKRwAOETEcEeEjExEQZiBXjXuHAfAZ0_RjGrQid1an7QAiAgwi31y1an5tAYchcjomy1KGKMNmhq7iAgZYzX9zAYwhVskHXn7TAiAggs3YX2Ynnn5CDYoissomY2G0tLTJCGa2APDJtJSgl5KIktkHb2KLxLPZGp3UDgVuF_Fjx5QJCWe2AfD3_ZQoGp3hDgsuF_J_45QJC0i2AtDoC4Sm_aQbGp3vDgkvFZKW86KYsvkNkmj2WWIjpLPi45QJCHm2Y0A9EG5QDTDdDgDjDuDxD7EAEQkwBHzHnIADEYghwfk1qn7z9fwXqY9QEYkhkxkHrn7SAREgwxBXrmj1AdEYwfkHDfEekyBmrHv2AiEYwfwfBmj1yIDtEeczB1umy2AwEJ43Kt0MOeZ8CmznIYo0XJD8Hec7CXYmX3ABHWwucvgWYo7yEEHhV8CmYmX3APHesNB1bojm7So8_YbZ9UHYV9hmAdHec9Cme3fm7Sk9_IfZ9iHYkdw9l1io7S9jHgcA4mXGmo5wHYsPoApXjo7N6x6gVBdm5YVOcBCH6AItkBdHno7vtBlmno7wWOkHqo7N5N5YolqJDRIeoCCmUTIgwC4A0");
	// ^Num(^real)
	private static Type type19 = Runtime.Type("4CDKMQesY9PBXDwkHElD");
	// ^$13<Sum($11<^[^real,^{|$4<^$21<AExpr<$13|Num(^real)|Mul($11)|Div(^[$4,$4])|$42<VExpr<Var(^string)|Fn(^[^string,$47<^Expr<$21|$85<Value<Num(^real)|Null|Tuple(^[^$85...])|Bool<True|False>|String(^string)|Array(^[^$85...])>>|Tuple(^[$47...])|$122<BExpr<$42|Bool<True|False>|And(^{^$122...})|Or(^{^$122...})|Not(^$122)|Equals(^[$134<^Type<Atom<NotT($157<^Proton<TupleT(^[$157...])|ArrayT($157)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$157...])|ArrayT($157)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($134)|OrT(^{$134...})|AndT(^{$134...})|ArrayT($134)|TupleT(^[$134...])|FunctionT(^[$134,$134,$134...])>>,^{|$47,$47|}[$47,$47]])|Inequality(^[^AType<IntT|RealT>,$4])|Equation(^[^AType<IntT|RealT>,$4])|ForAll(^[^{^[^Var(^string),$134]...},^$122])|Exists(^[^{^[^Var(^string),$134]...},^$122])>>|SExpr<$42|Array(^[$47...])>>>...])|Load(^[$47,^int])|LengthOf($47)|IndexOf(^[$47,$47])>>>>>...|}[$4<^$21<AExpr<$13|Num(^real)|Mul($11)|Div(^[$4,$4])|$42<VExpr<Var(^string)|Fn(^[^string,$47<^Expr<$21|$85<Value<Num(^real)|Null|Tuple(^[^$85...])|Bool<True|False>|String(^string)|Array(^[^$85...])>>|Tuple(^[$47...])|$122<BExpr<$42|Bool<True|False>|And(^{^$122...})|Or(^{^$122...})|Not(^$122)|Equals(^[$134<^Type<Atom<NotT($157<^Proton<TupleT(^[$157...])|ArrayT($157)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$157...])|ArrayT($157)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($134)|OrT(^{$134...})|AndT(^{$134...})|ArrayT($134)|TupleT(^[$134...])|FunctionT(^[$134,$134,$134...])>>,^{|$47,$47|}[$47,$47]])|Inequality(^[^AType<IntT|RealT>,$4])|Equation(^[^AType<IntT|RealT>,$4])|ForAll(^[^{^[^Var(^string),$134]...},^$122])|Exists(^[^{^[^Var(^string),$134]...},^$122])>>|SExpr<$42|Array(^[$47...])>>>...])|Load(^[$47,^int])|LengthOf($47)|IndexOf(^[$47,$47])>>>>>...]]>)>
	private static Type type20 = Runtime.Type("sHoBKShdmIec0K0K3Tk8b9UCXEfVnEeVo7wZo7ScJDAd1IYcIIgs3CDKMQooJSgG2GdO6KLK3Tk8MJE_qPtlNg0MYoIMhsp7Nl2AcCHLClXPYsYEYo0Qtoa9iCXLjl1ToNKNmGXGiG3Ij45O35BKaQbG6PEOLFE5U5OIQIQs6S8t5O_WrIa4mUdIQZNBmL95hgNcH5YcMY0AD53K3Tk8b9v5IoNBHaWaGDQ5ekOBmTS5gsOF_KWlLS_G4Kp06Q_G_F4W6Rm4nr0X1fm5f5Ww4fl5h5JCKGs0bRWsPVBh0il7N5t5hcQFZIpl5QIkQkHj0G1xqQgGqJo8MPiSa9U6YZRkHD96egRBHe0n0AC6G_ajWnGylyl5E6J4ZRm4LTYZSkRkXqG7N6Q6QkSB1eGrGAT63G_RpKq3c6gZTF_GWlqR_Clu0Ag6WcToTgWvl7z5j6hVUB1mGY0Au6YZOkHDw6eoUBHeWz0Az6o3ZQZGmImGYIjG6O44MSWlqRWlNZUcfkfsfchgGY1dGHiKLRp45QdGMT3544MSWGMPjtL7DHRHQZd3XYXam5Q9ZOoQm43QgGLGs_qRoCM7uHwHQwd31b1em5d9YcPceomeX9g9YoegmAi9eweBHX1i1At9YccVfkmim7A9h9gofF3Kt0MOeoi7HaGal7SZgVYmX9AAYVgkgBH6CAtsgcmnm7B9NAgZhFJFoxLQ3toQoG4CE86K34ZQZG4O08bRW_6KZGKSklLOJGONJSiC5SdxaQJ4MzXqnrIunu2yYzn5eAYwfgio1v1OF8rQoxaQeZtB1rmv1AsAWZjZtgWym7QAvAhkjFKJp4aRfCmv1Atwjc1Xn7cA8DgcsBmrmv1ABDlgsosVxgWYn7iAEDhVtFJFi_6KIctkma2KDK6QgGp3SDgstF_Kj_5OJC0e2AdDJ8oQjl5KIguk1f2G8t5SJCWf2AjDJ8KOWl5KIZvkXi2SIGbRdtqOJC0j2AxD3OKNmGp7zDC5gVwFNsoQh_aQWl5KYcwoNkmmIZ0bnbYeIf2iniYjIm2nn5CEYsjswomnn7RA7AgZxB1mm9jgxc1rn7SASEgsxBXrHr2AcEYwhVgkXun77AgZ2vY9hEYVisykmvn77A7AYVgZzZYyY9vEYZikzkHz2K0GKTkKa9PHYV7tn7SZ7_YXZ9AHYwck7lHYJ7sDvDQw7Cmz2aJAOHYVdk7lmaZ9E5Yo8WgBH6THtw8d1eo7dHfwXeZ9fHYk9peBH6hHts9dmfo7S9sHgZACXb1i3AvHWkNcBhGjo7j5yHhwACHqWz0A8Iegl7O5AIYo0nJDCIesBC1UEIgVCCHUO5gcCCHaGal7SkC_IrZ9TIYVNwCl1uJgn2");
	// ^$13<Mul($11<^[^real,^{|$4<^$21<AExpr<$13|Num(^real)|Sum($11)|Div(^[$4,$4])|$42<VExpr<Var(^string)|Fn(^[^string,$47<^Expr<$21|$85<Value<Num(^real)|Null|Tuple(^[^$85...])|Bool<True|False>|String(^string)|Array(^[^$85...])>>|Tuple(^[$47...])|$122<BExpr<$42|Bool<True|False>|And(^{^$122...})|Or(^{^$122...})|Not(^$122)|Equals(^[$134<^Type<Atom<NotT($157<^Proton<TupleT(^[$157...])|ArrayT($157)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$157...])|ArrayT($157)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($134)|OrT(^{$134...})|AndT(^{$134...})|ArrayT($134)|TupleT(^[$134...])|FunctionT(^[$134,$134,$134...])>>,^{|$47,$47|}[$47,$47]])|Inequality(^[^AType<IntT|RealT>,$4])|Equation(^[^AType<IntT|RealT>,$4])|ForAll(^[^{^[^Var(^string),$134]...},^$122])|Exists(^[^{^[^Var(^string),$134]...},^$122])>>|SExpr<$42|Array(^[$47...])>>>...])|Load(^[$47,^int])|LengthOf($47)|IndexOf(^[$47,$47])>>>>>...|}[$4<^$21<AExpr<$13|Num(^real)|Sum($11)|Div(^[$4,$4])|$42<VExpr<Var(^string)|Fn(^[^string,$47<^Expr<$21|$85<Value<Num(^real)|Null|Tuple(^[^$85...])|Bool<True|False>|String(^string)|Array(^[^$85...])>>|Tuple(^[$47...])|$122<BExpr<$42|Bool<True|False>|And(^{^$122...})|Or(^{^$122...})|Not(^$122)|Equals(^[$134<^Type<Atom<NotT($157<^Proton<TupleT(^[$157...])|ArrayT($157)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$157...])|ArrayT($157)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($134)|OrT(^{$134...})|AndT(^{$134...})|ArrayT($134)|TupleT(^[$134...])|FunctionT(^[$134,$134,$134...])>>,^{|$47,$47|}[$47,$47]])|Inequality(^[^AType<IntT|RealT>,$4])|Equation(^[^AType<IntT|RealT>,$4])|ForAll(^[^{^[^Var(^string),$134]...},^$122])|Exists(^[^{^[^Var(^string),$134]...},^$122])>>|SExpr<$42|Array(^[$47...])>>>...])|Load(^[$47,^int])|LengthOf($47)|IndexOf(^[$47,$47])>>>>>...]]>)>
	private static Type type21 = Runtime.Type("sHooJSgdmIec0K0K3Tk8b9UCXEfVnEeVo7wZo7ScJDAd1IYcIIgs3CDKMQoBKShG2GdO6KLK3Tk8MJE_qPtlNg0MYoIMhsp7Nl2AcCHLClXPYsYEYo0Qtoa9iCXLjl1ToNKNmGXGiG3Ij45O35BKaQbG6PEOLFE5U5OIQIQs6S8t5O_WrIa4mUdIQZNBmL95hgNcH5YcMY0AD53K3Tk8b9v5IoNBHaWaGDQ5ekOBmTS5gsOF_KWlLS_G4Kp06Q_G_F4W6Rm4nr0X1fm5f5Ww4fl5h5JCKGs0bRWsPVBh0il7N5t5hcQFZIpl5QIkQkHj0G1xqQgGqJo8MPiSa9U6YZRkHD96egRBHe0n0AC6G_ajWnGylyl5E6J4ZRm4LTYZSkRkXqG7N6Q6QkSB1eGrGAT63G_RpKq3c6gZTF_GWlqR_Clu0Ag6WcToTgWvl7z5j6hVUB1mGY0Au6YZOkHDw6eoUBHeWz0Az6o3ZQZGmImGYIjG6O44MSWlqRWlNZUcfkfsfchgGY1dGHiKLRp45QdGMT3544MSWGMPjtL7DHRHQZd3XYXam5Q9ZOoQm43QgGLGs_qRoCM7uHwHQwd31b1em5d9YcPceomeX9g9YoegmAi9eweBHX1i1At9YccVfkmim7A9h9gofF3Kt0MOeoi7HaGal7SZgVYmX9AAYVgkgBH6CAtsgcmnm7B9NAgZhFJFoxLQ3toQoG4CE86K34ZQZG4O08bRW_6KZGKSklLOJGONJSiC5SdxaQJ4MzXqnrIunu2yYzn5eAYwfgio1v1OF8rQoxaQeZtB1rmv1AsAWZjZtgWym7QAvAhkjFKJp4aRfCmv1Atwjc1Xn7cA8DgcsBmrmv1ABDlgsosVxgWYn7iAEDhVtFJFi_6KIctkma2KDK6QgGp3SDgstF_Kj_5OJC0e2AdDJ8oQjl5KIguk1f2G8t5SJCWf2AjDJ8KOWl5KIZvkXi2SIGbRdtqOJC0j2AxD3OKNmGp7zDC5gVwFNsoQh_aQWl5KYcwoNkmmIZ0bnbYeIf2iniYjIm2nn5CEYsjswomnn7RA7AgZxB1mm9jgxc1rn7SASEgsxBXrHr2AcEYwhVgkXun77AgZ2vY9hEYVisykmvn77A7AYVgZzZYyY9vEYZikzkHz2K0GKTkKa9PHYV7tn7SZ7_YXZ9AHYwck7lHYJ7sDvDQw7Cmz2aJAOHYVdk7lmaZ9E5Yo8WgBH6THtw8d1eo7dHfwXeZ9fHYk9peBH6hHts9dmfo7S9sHgZACXb1i3AvHWkNcBhGjo7j5yHhwACHqWz0A8Iegl7O5AIYo0nJDCIesBC1UEIgVCCHUO5gcCCHaGal7SkC_IrZ9TIYVNwCl1uJgn2");
	// AType<IntT|RealT>
	private static Type type22 = Runtime.Type("QFKFJ_6R_GJHiG6KIg2AwF_J_45QJCWEgwI7xVo58CXD9pmH0IE");
	// $12<Mul($10<^[^real,^{|$3<^$20<AExpr<$12|Num(^real)|Sum($10)|Div(^[$3,$3])|$41<VExpr<Var(^string)|Fn(^[^string,$46<^Expr<$20|$84<Value<Num(^real)|Null|Tuple(^[^$84...])|Bool<True|False>|String(^string)|Array(^[^$84...])>>|Tuple(^[$46...])|$121<BExpr<$41|Bool<True|False>|And(^{^$121...})|Or(^{^$121...})|Not(^$121)|Equals(^[$133<^Type<Atom<NotT($156<^Proton<TupleT(^[$156...])|ArrayT($156)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$156...])|ArrayT($156)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($133)|OrT(^{$133...})|AndT(^{$133...})|ArrayT($133)|TupleT(^[$133...])|FunctionT(^[$133,$133,$133...])>>,^{|$46,$46|}[$46,$46]])|Inequality(^[^AType<IntT|RealT>,$3])|Equation(^[^AType<IntT|RealT>,$3])|ForAll(^[^{^[^Var(^string),$133]...},^$121])|Exists(^[^{^[^Var(^string),$133]...},^$121])>>|SExpr<$41|Array(^[$46...])>>>...])|Load(^[$46,^int])|LengthOf($46)|IndexOf(^[$46,$46])>>>>>...|}[$3<^$20<AExpr<$12|Num(^real)|Sum($10)|Div(^[$3,$3])|$41<VExpr<Var(^string)|Fn(^[^string,$46<^Expr<$20|$84<Value<Num(^real)|Null|Tuple(^[^$84...])|Bool<True|False>|String(^string)|Array(^[^$84...])>>|Tuple(^[$46...])|$121<BExpr<$41|Bool<True|False>|And(^{^$121...})|Or(^{^$121...})|Not(^$121)|Equals(^[$133<^Type<Atom<NotT($156<^Proton<TupleT(^[$156...])|ArrayT($156)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$156...])|ArrayT($156)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($133)|OrT(^{$133...})|AndT(^{$133...})|ArrayT($133)|TupleT(^[$133...])|FunctionT(^[$133,$133,$133...])>>,^{|$46,$46|}[$46,$46]])|Inequality(^[^AType<IntT|RealT>,$3])|Equation(^[^AType<IntT|RealT>,$3])|ForAll(^[^{^[^Var(^string),$133]...},^$121])|Exists(^[^{^[^Var(^string),$133]...},^$121])>>|SExpr<$41|Array(^[$46...])>>>...])|Load(^[$46,^int])|LengthOf($46)|IndexOf(^[$46,$46])>>>>>...]]>)>
	private static Type type23 = Runtime.Type("jHooJSgdX5J4JGs0bResp7xg1DycmEYg2HYoGHtcZ9ACXDBlHIosJShGnJpp5C3_aSJOKGs0bRGt3PeWrXl5QC1ERpHMYwoDgwp7Nl3AdCHExBH6f_2Qeoq7Ot5AjGYKW8685t5GBxLNZGNkJOiS5ScxZO0tNsOVCdChGUo_ZQZK5TEOL7yWDh0Xl7P_NoXXW9OBHTB5goNFJGs0bRecQB0Yl7N5O5tcOcmal7ulOkHb0KL45QpK5KJK6RgK5K1K3Tk8MBT6z6f9QcP3XMf5QkPFpJ4W6Rm4Hfljo5j5YwNVQoHi0GDK6QgCli0Aw538oQjl5OIGbRdtqOesSB1m0AtZRcXml7c5A6gkR34Px5C6s6u6QsRFKFm8MNtC1qlm0AO6WwRcSglql7U5R6hoSF3KmKMOIwSk1u0K545QnKq3e6ggT3Hu0vl5h6YsQsTomvl7z5B5gZUB1a0AtgUc1zl7c5x6gsUFIFiG58E86CDx5SZKJRp45Qn4qX0yGimiHjHqm5B9Z58tLOlKMNg_5StGNJJRp45SdxaQWo7h8h0aH7C9O9QcdFaGj8MFgl5O4WMPnGrRWZAhAhWbH7Q9U9QVeBHeGeHAe9egeB1fm9joecXfm779j9gVfBHXmf1Au9Ycckek1j1GJ_6R_d1vX7N5N5Yo0m1D8AecgBmjmmm7SkgZInX9DAYgcwgk1q1G0GrQhGZIjG6KowZRJGJFiG5KZ4ZRm4LTJG5Kp06Q_G4_WGptqNo_qQiGKRwAOETEcEeEjExEQZiBXjXuHAfAZ0_RjGrQid1an7QAiAgwi31y1an5tAYchcjomy1KGKMNmhq7iAgZYzX9zAYwhVskHXn7TAiAggs3YX2Ynnn5CDYoissomY2G0tLTJCGa2APDJtJSgl5KIktkHb2KLxLPZGp3UDgVuF_Fjx5QJCWe2AfD3_ZQoGp3hDgsuF_J_45QJC0i2AtDoC4Sm_aQbGp3vDgkvFZKW86KYsvkNkmj2WWIjpLPi45QJCHm2Y0A9EG5QDTDdDgDjDuDxD7EAEQkwBHzHnIADEYghwfk1qn7z9fwXqY9QEYkhkxkHrn7SAREgwxBXrmj1AdEYwfkHDfEekyBmrHv2AiEYwfwfBmj1yIDtEeczB1umy2AwEJ43Kt0MOeZ8CmzIEYo0XJD8Hec7CXYmX3ABHWwucvgWYo7yEEHhV8CmYmX3APHesNB1bojm7So8_YbZ9UHYV9hmAdHec9Cme3fm7Sk9_IfZ9iHYkdw9l1io7S9jHgcA4mXGmo5wHYsPoApXjo7N6x6gVBdm5YVOcBCH6AItkBdHno7vtBlmno7wWOkHqo7N5N5YolqJDRIeoCCmUTIgwC4D0");
	// IntT
	private static Type type24 = Runtime.Type("2G8t5SJCWDggIk2");
	// RealT
	private static Type type25 = Runtime.Type("2KHKLNgGp3ukmD0E");
	// Var(^string)
	private static Type type26 = Runtime.Type("3CL4aReZl7ug2Aw3x$");
	// ^Bool<True|False>
	private static Type type27 = Runtime.Type("RFZFjx5Qeo3GJ8MS_C0Ego2K545QnKq3zk1HWsIHQco7ugJAB4vw");
	// ^$20<ForAll($18<^[^{^[^Var(^string),$5<^Type<Atom<NotT($36<^Proton<TupleT(^[$36...])|ArrayT($36)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$36...])|ArrayT($36)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>|NotT($5)|OrT(^{$5...})|AndT(^{$5...})|ArrayT($5)|TupleT(^[$5...])|FunctionT(^[$5,$5,$5...])>>]...},$14<^$128<BExpr<$138<VExpr<Var(^string)|Fn(^[^string,$140<^Expr<$128|$178<Value<Null|Tuple(^[^$178...])|Bool<True|False>|Num(^real)|String(^string)|Array(^[^$178...])>>|Tuple(^[$140...])|$205<AExpr<$138|Num(^real)|Sum(^[^real,^{|^$205...|}[^$205...]])|Mul(^[^real,^{|^$205...|}[^$205...]])|Div(^[^$205,^$205])>>|SExpr<$138|Array(^[$140...])>>>...])|Load(^[$140,^int])|LengthOf($140)|IndexOf(^[$140,$140])>>|Bool<True|False>|And(^{$14...})|Or(^{$14...})|Not($14)|Equals(^[$5,^{|$140,$140|}[$140,$140]])|Inequality(^[^AType<IntT|RealT>,^$205])|Equation(^[^AType<IntT|RealT>,^$205])|$20|Exists($18)>>>]>)>
	private static Type type28 = Runtime.Type("sHZOoQm43QgdXMoNKNmdHP3GKTkKa9wCHEzBH67_IHeco7AhmABdHIJ8JGs0bRecfBXINCH6O_YLegp7uk4ASdH5YknMgV5G0GrQhGZIjG6KowZRJGJFiG5KZ4ZRm4LTJG5Kp06Q_G4_WGptqNo_qQiGKRB5d6i6s6u6z6C9QZr7ycMAvG5Jmx5Sjta9c5YgaUgwM775c5QZNBXP95hgNFKJp4aRfCXUgZYYW9E5Yw5a0AO5YsaUggO3Ya0blrl5S5YobbGAU534ZQtGp3d5gcPF_Ipl5QJC0f0Ah5JOpQdG5KIwPk1i0K1xqQgGp3u5ggQFJHiG6KIoQkXj0KHKLNgGp376gZRFrJo8MPiS5KIgRk1n0GL4aRJCXnlMgwRFNsoQh_aQWl5KYZSw4AP6G5f5i5t5w5z596C6N6Q6QkSBHYGrGAT6YgqEgVTBmEfwXuW9f6Yk5v0Ah6Yo5v0Aj6YsqEgZUBmEgZnyW9w6YwLz0Ay6YwnEYw2XHD89eccB1TA9gkcF_K4W6RmGZFjx5Qo3ZQZGmImGYIjG6O44MSWlqRWlgsug9p9x9_Bh0b1dGHiKLRp45QdGMT3544MSWGMPjtL7OIUIQVe3HbHem5e9ZK3TdC6Sn4XMdIQoe3meXfm5j9Yw3iHAt9ZNZQ3loQWG5W0I_tqOoWqIa4JPRADHNHQsfFMHiGLOsxZOWwfs8hGmm7D99AhggFJGs0bReVjBlMYsgwgZ2qX9OAYgfchkmq1KL45QpK5KJK6RgKLBu9RD7EQwhFKF4W6Rm41umnn5eAJCKGs0bRWgiozgGvm7CAiAhwiFZIpl5QIZjkXy1CDKMQZC4Sm_aQbd1bn7yAgZnzX97DYshZskXXIJvAADiDtDvDQksFKFm8MNtCXYIX2AEDWosVtgGan7SAPDhgtF3KmKMOIotkXb2K545QnKq3cDgZu3mbYen5fDYwckuoHfY9PB1zmf2AsDYojw4AuDYsgkHDwDeovBXrXj2AzDoBKShGIIpl5C3_aSGlgZvZygyZzg0nn7dACEhswcmnn7NEfVIqY9PEYwugxBH6REtoxcXrn78EUEgVyBXmnr2AeEYVxVxBH6gEtoycXvn7AEjEgVz31nmzn5uEYkigzo1zn7DDyDgszcm5YsgV7CH68Htc7dmXo7w9BHgo7CHjXn1AEHYsgsgBH6OHtc8dmao77ARHgo8C1LfwmbZ9cHYVdZ9lXeo7O9dHgk9CXa1Lgs98XnXnm7SVAWIiZ9uHYwnio7SkA_IjZ9yHYgdwAl1m3K0GKTkKa9SIYgBWxBH6BItoBdXno7T9EIgVC4mjWml5PIYcBhCp1ro7U9EIgsCC1f1MgVD4vw");
	// Atom<NotT($3<^Proton<TupleT(^[$3...])|ArrayT($3)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>)|Proton<TupleT(^[$3...])|ArrayT($3)|Quark<AnyT|NullT|VoidT|BoolT|IntT|RealT|StringT|VarT(^string)|NominalT(^string)>>>
	private static Type type29 = Runtime.Type("sGJFoxLQZ0_RjGrQiGZIjG6KeZq7wo2Ay3mEdh0HYcIHhc3KGKMNmh5OJK6RgK5KYo2AtsZ9ECHINlHLZ4ZRm4LTJCmLxk1MlcKMd5Qsp7vwKAcGJFi_6KIc5AfG_Ipl5QJCGQgs5KLxLPZGp3slHTJ8oQjl5KIg6AwGJHiG6KIs6AzG_J_45QJCGX0A95oC4Sm_aQbGp3B5goNFZKW86KeZl7E5N5gZOFNsoQh_aQWl5KYgOVOk1bGZ0QjdMU75A5D5P5S5QsOB1IU5hVP3A0");

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
	private final static Pattern.Term pattern17 = new Pattern.Term("AndT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("TupleT",
				new Pattern.List(true, new Pair[]{
					new Pair(new Pattern.Leaf(type2),null)}),
				null), "t1"), 
			new Pair(new Pattern.Term("NotT",
				new Pattern.Term("ArrayT",
					new Pattern.Leaf(type2),
					null),
				null),null), 
			new Pair(new Pattern.Leaf(type2), "ts")}),
		null);
	private final static Pattern.Term pattern18 = new Pattern.Term("ArrayT",
		new Pattern.Leaf(type1),
		null);
	private final static Pattern.Term pattern19 = new Pattern.Term("AndT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("ArrayT",
				new Pattern.Leaf(type2),
				"t1"),null), 
			new Pair(new Pattern.Term("ArrayT",
				new Pattern.Leaf(type2),
				"t2"),null), 
			new Pair(new Pattern.Leaf(type2), "ts")}),
		null);
	private final static Pattern.Term pattern20 = new Pattern.Term("AndT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("ArrayT",
				new Pattern.Leaf(type2),
				"t1"),null), 
			new Pair(new Pattern.Term("NotT",
				new Pattern.Term("ArrayT",
					new Pattern.Leaf(type2),
					"t2"),
				null),null), 
			new Pair(new Pattern.Leaf(type2), "ts")}),
		null);
	private final static Pattern.Term pattern21 = new Pattern.Term("AndT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("ArrayT",
				new Pattern.Leaf(type2),
				null), "t1"), 
			new Pair(new Pattern.Term("NotT",
				new Pattern.Term("TupleT",
					new Pattern.List(true, new Pair[]{
						new Pair(new Pattern.Leaf(type2),null)}),
					null),
				null),null), 
			new Pair(new Pattern.Leaf(type2), "ts")}),
		null);
	private final static Pattern.Term pattern22 = new Pattern.Term("AndT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("ArrayT",
				new Pattern.Leaf(type2),
				null), "s"), 
			new Pair(new Pattern.Leaf(type3), "p"), 
			new Pair(new Pattern.Leaf(type2), "ts")}),
		null);
	private final static Pattern.Term pattern23 = new Pattern.Term("OrT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("ArrayT",
				new Pattern.Leaf(type2),
				"t1"), "s1"), 
			new Pair(new Pattern.Term("ArrayT",
				new Pattern.Leaf(type2),
				"t2"), "s2"), 
			new Pair(new Pattern.Leaf(type2), "ts")}),
		null);
	private final static Pattern.Term pattern24 = new Pattern.Term("AndT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Leaf(type1),null), 
			new Pair(new Pattern.Leaf(type2), "xs")}),
		null);
	private final static Pattern.Term pattern25 = new Pattern.Term("AndT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Leaf(type0),null), 
			new Pair(new Pattern.Leaf(type2), "xs")}),
		null);
	private final static Pattern.Term pattern26 = new Pattern.Term("AndT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Leaf(type5), "a1"), 
			new Pair(new Pattern.Leaf(type3), "a2"), 
			new Pair(new Pattern.Leaf(type2), "ts")}),
		null);
	private final static Pattern.Term pattern27 = new Pattern.Term("AndT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Leaf(type5), "a1"), 
			new Pair(new Pattern.Term("NotT",
				new Pattern.Leaf(type3),
				"a2"),null), 
			new Pair(new Pattern.Leaf(type2), "ts")}),
		null);
	private final static Pattern.Term pattern28 = new Pattern.Term("OrT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Leaf(type0),null), 
			new Pair(new Pattern.Leaf(type2), "xs")}),
		null);
	private final static Pattern.Term pattern29 = new Pattern.Term("OrT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Leaf(type1),null), 
			new Pair(new Pattern.Leaf(type2), "xs")}),
		null);
	private final static Pattern.Term pattern30 = new Pattern.Term("Load",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Term("Tuple",
				new Pattern.List(true, new Pair[]{
					new Pair(new Pattern.Leaf(type6), "ls")}),
				null),null), 
			new Pair(new Pattern.Leaf(type7), "idx")}),
		null);
	private final static Pattern.Term pattern31 = new Pattern.Term("LengthOf",
		new Pattern.Term("Tuple",
			new Pattern.List(true, new Pair[]{
				new Pair(new Pattern.Leaf(type6), "xs")}),
			null),
		null);
	private final static Pattern.Term pattern32 = new Pattern.Term("Equals",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Term("TupleT",
				new Pattern.List(true, new Pair[]{
					new Pair(new Pattern.Leaf(type2), "ts")}),
				null),null), 
			new Pair(new Pattern.Bag(false, new Pair[]{
				new Pair(new Pattern.Term("Tuple",
					new Pattern.List(true, new Pair[]{
						new Pair(new Pattern.Leaf(type6), "xs")}),
					null),null), 
				new Pair(new Pattern.Term("Tuple",
					new Pattern.List(true, new Pair[]{
						new Pair(new Pattern.Leaf(type6), "ys")}),
					null),null)}),null)}),
		null);
	private final static Pattern.Term pattern33 = new Pattern.Term("And",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("Equals",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type2), "t"), 
					new Pair(new Pattern.Bag(false, new Pair[]{
						new Pair(new Pattern.Leaf(type8), "x"), 
						new Pair(new Pattern.Leaf(type9), "y")}),null)}),
				null), "eq"), 
			new Pair(new Pattern.Leaf(type10), "bs")}),
		null);
	private final static Pattern.Term pattern34 = new Pattern.Term("Not",
		new Pattern.Leaf(type11),
		"b");
	private final static Pattern.Term pattern35 = new Pattern.Term("Not",
		new Pattern.Term("Not",
			new Pattern.Leaf(type12),
			"x"),
		null);
	private final static Pattern.Term pattern36 = new Pattern.Term("Not",
		new Pattern.Term("And",
			new Pattern.Set(true, new Pair[]{
				new Pair(new Pattern.Leaf(type10), "xs")}),
			null),
		null);
	private final static Pattern.Term pattern37 = new Pattern.Term("Not",
		new Pattern.Term("Or",
			new Pattern.Set(true, new Pair[]{
				new Pair(new Pattern.Leaf(type10), "xs")}),
			null),
		null);
	private final static Pattern.Term pattern38 = new Pattern.Term("And",
		new Pattern.Set(false, new Pair[]{
			new Pair(new Pattern.Leaf(type10), "x")}),
		null);
	private final static Pattern.Term pattern39 = new Pattern.Term("And",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Leaf(type13),null), 
			new Pair(new Pattern.Leaf(type10), "xs")}),
		null);
	private final static Pattern.Term pattern40 = new Pattern.Term("And",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Leaf(type14),null), 
			new Pair(new Pattern.Leaf(type10), "xs")}),
		null);
	private final static Pattern.Term pattern41 = new Pattern.Term("And",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("And",
				new Pattern.Set(true, new Pair[]{
					new Pair(new Pattern.Leaf(type10), "xs")}),
				null),null), 
			new Pair(new Pattern.Leaf(type10), "ys")}),
		null);
	private final static Pattern.Term pattern42 = new Pattern.Term("And",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("Not",
				new Pattern.Leaf(type10),
				"x"),null), 
			new Pair(new Pattern.Leaf(type10), "y"), 
			new Pair(new Pattern.Leaf(type10), "ys")}),
		null);
	private final static Pattern.Term pattern43 = new Pattern.Term("And",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("Or",
				new Pattern.Set(true, new Pair[]{
					new Pair(new Pattern.Leaf(type10), "xs")}),
				null),null), 
			new Pair(new Pattern.Leaf(type10), "ys")}),
		null);
	private final static Pattern.Term pattern44 = new Pattern.Term("Or",
		new Pattern.Set(false, new Pair[]{
			new Pair(new Pattern.Leaf(type10), "x")}),
		null);
	private final static Pattern.Term pattern45 = new Pattern.Term("Or",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Leaf(type14),null), 
			new Pair(new Pattern.Leaf(type10), "xs")}),
		null);
	private final static Pattern.Term pattern46 = new Pattern.Term("Or",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Leaf(type13),null), 
			new Pair(new Pattern.Leaf(type10), "xs")}),
		null);
	private final static Pattern.Term pattern47 = new Pattern.Term("Or",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("Not",
				new Pattern.Leaf(type10),
				"x"),null), 
			new Pair(new Pattern.Leaf(type10), "y"), 
			new Pair(new Pattern.Leaf(type10), "ys")}),
		null);
	private final static Pattern.Term pattern48 = new Pattern.Term("Or",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("Or",
				new Pattern.Set(true, new Pair[]{
					new Pair(new Pattern.Leaf(type10), "xs")}),
				null),null), 
			new Pair(new Pattern.Leaf(type10), "ys")}),
		null);
	private final static Pattern.Term pattern49 = new Pattern.Term("Equals",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type2), "t"), 
			new Pair(new Pattern.Bag(false, new Pair[]{
				new Pair(new Pattern.Leaf(type6), "x"), 
				new Pair(new Pattern.Leaf(type6), "y")}),null)}),
		null);
	private final static Pattern.Term pattern50 = new Pattern.Term("And",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("Equals",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type2), "t"), 
					new Pair(new Pattern.Bag(false, new Pair[]{
						new Pair(new Pattern.Leaf(type8), "x"), 
						new Pair(new Pattern.Leaf(type16), "y")}),null)}),
				null), "eq"), 
			new Pair(new Pattern.Leaf(type10), "bs")}),
		null);
	private final static Pattern.Term pattern51 = new Pattern.Term("And",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("Equals",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type2), "t"), 
					new Pair(new Pattern.Bag(false, new Pair[]{
						new Pair(new Pattern.Leaf(type8),null), 
						new Pair(new Pattern.Leaf(type8),null)}), "vs")}),
				null), "eq"), 
			new Pair(new Pattern.Leaf(type10), "bs")}),
		null);
	private final static Pattern.Term pattern52 = new Pattern.Term("Mul",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type17), "n"), 
			new Pair(new Pattern.Bag(true, new Pair[]{
				new Pair(new Pattern.Leaf(type18), "rest")}),null)}),
		null);
	private final static Pattern.Term pattern53 = new Pattern.Term("Mul",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type17), "x"), 
			new Pair(new Pattern.Bag(true, new Pair[]{
				new Pair(new Pattern.Term("Num",
					new Pattern.Leaf(type17),
					"y"),null), 
				new Pair(new Pattern.Leaf(type18), "rest")}),null)}),
		null);
	private final static Pattern.Term pattern54 = new Pattern.Term("Mul",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type17), "n1"), 
			new Pair(new Pattern.Bag(true, new Pair[]{
				new Pair(new Pattern.Term("Mul",
					new Pattern.List(false, new Pair[]{
						new Pair(new Pattern.Leaf(type17), "n2"), 
						new Pair(new Pattern.Bag(true, new Pair[]{
							new Pair(new Pattern.Leaf(type18), "xs")}),null)}),
					null),null), 
				new Pair(new Pattern.Leaf(type18), "ys")}),null)}),
		null);
	private final static Pattern.Term pattern55 = new Pattern.Term("Mul",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type17), "n1"), 
			new Pair(new Pattern.Bag(true, new Pair[]{
				new Pair(new Pattern.Term("Sum",
					new Pattern.List(false, new Pair[]{
						new Pair(new Pattern.Leaf(type17), "n2"), 
						new Pair(new Pattern.Bag(true, new Pair[]{
							new Pair(new Pattern.Leaf(type18), "xs")}),null)}),
					null),null), 
				new Pair(new Pattern.Leaf(type18), "ys")}),null)}),
		null);
	private final static Pattern.Term pattern56 = new Pattern.Term("Div",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Term("Num",
				new Pattern.Leaf(type17),
				"x"),null), 
			new Pair(new Pattern.Term("Num",
				new Pattern.Leaf(type17),
				"y"),null)}),
		null);
	private final static Pattern.Term pattern57 = new Pattern.Term("Div",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type18), "x"), 
			new Pair(new Pattern.Term("Div",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type18), "y"), 
					new Pair(new Pattern.Leaf(type18), "z")}),
				null),null)}),
		null);
	private final static Pattern.Term pattern58 = new Pattern.Term("Div",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Term("Div",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type18), "x"), 
					new Pair(new Pattern.Leaf(type18), "y")}),
				null),null), 
			new Pair(new Pattern.Leaf(type18), "z")}),
		null);
	private final static Pattern.Term pattern59 = new Pattern.Term("Div",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type18), "x"), 
			new Pair(new Pattern.Term("Num",
				new Pattern.Leaf(type17),
				"n"),null)}),
		null);
	private final static Pattern.Term pattern60 = new Pattern.Term("Div",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Term("Mul",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type17), "n"), 
					new Pair(new Pattern.Bag(true, new Pair[]{
						new Pair(new Pattern.Leaf(type18), "x"), 
						new Pair(new Pattern.Leaf(type18), "xs")}),null)}),
				null),null), 
			new Pair(new Pattern.Leaf(type18), "y")}),
		null);
	private final static Pattern.Term pattern61 = new Pattern.Term("Div",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Term("Sum",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type17), "n"), 
					new Pair(new Pattern.Bag(true, new Pair[]{
						new Pair(new Pattern.Leaf(type18), "xs")}),null)}),
				null),null), 
			new Pair(new Pattern.Leaf(type18), "y")}),
		null);
	private final static Pattern.Term pattern62 = new Pattern.Term("Div",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Term("Mul",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type17), "n"), 
					new Pair(new Pattern.Bag(true, new Pair[]{
						new Pair(new Pattern.Leaf(type18), "xs")}),null)}),
				null),null), 
			new Pair(new Pattern.Leaf(type18), "y")}),
		null);
	private final static Pattern.Term pattern63 = new Pattern.Term("Sum",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type17), "n"), 
			new Pair(new Pattern.Bag(false, new Pair[]{}),null)}),
		null);
	private final static Pattern.Term pattern64 = new Pattern.Term("Sum",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type17), "n"), 
			new Pair(new Pattern.Bag(false, new Pair[]{
				new Pair(new Pattern.Term("Mul",
					new Pattern.List(false, new Pair[]{
						new Pair(new Pattern.Leaf(type17), "m"), 
						new Pair(new Pattern.Bag(false, new Pair[]{
							new Pair(new Pattern.Leaf(type8), "x")}),null)}),
					null),null)}),null)}),
		null);
	private final static Pattern.Term pattern65 = new Pattern.Term("Sum",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type17), "n"), 
			new Pair(new Pattern.Bag(true, new Pair[]{
				new Pair(new Pattern.Leaf(type18), "x"), 
				new Pair(new Pattern.Leaf(type18), "rest")}),null)}),
		null);
	private final static Pattern.Term pattern66 = new Pattern.Term("Sum",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type17), "x"), 
			new Pair(new Pattern.Bag(true, new Pair[]{
				new Pair(new Pattern.Term("Num",
					new Pattern.Leaf(type17),
					"y"),null), 
				new Pair(new Pattern.Leaf(type18), "rest")}),null)}),
		null);
	private final static Pattern.Term pattern67 = new Pattern.Term("Sum",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type17), "n"), 
			new Pair(new Pattern.Bag(true, new Pair[]{
				new Pair(new Pattern.Term("Mul",
					new Pattern.List(false, new Pair[]{
						new Pair(new Pattern.Leaf(type17), "x"), 
						new Pair(new Pattern.Bag(true, new Pair[]{
							new Pair(new Pattern.Leaf(type18),null)}), "xs")}),
					null),null), 
				new Pair(new Pattern.Term("Mul",
					new Pattern.List(false, new Pair[]{
						new Pair(new Pattern.Leaf(type17), "y"), 
						new Pair(new Pattern.Bag(true, new Pair[]{
							new Pair(new Pattern.Leaf(type18),null)}), "ys")}),
					null),null), 
				new Pair(new Pattern.Leaf(type18), "zs")}),null)}),
		null);
	private final static Pattern.Term pattern68 = new Pattern.Term("Sum",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type17), "x"), 
			new Pair(new Pattern.Bag(true, new Pair[]{
				new Pair(new Pattern.Term("Sum",
					new Pattern.List(false, new Pair[]{
						new Pair(new Pattern.Leaf(type17), "y"), 
						new Pair(new Pattern.Bag(true, new Pair[]{
							new Pair(new Pattern.Leaf(type18), "ys")}),null)}),
					null),null), 
				new Pair(new Pattern.Leaf(type18), "xs")}),null)}),
		null);
	private final static Pattern.Term pattern69 = new Pattern.Term("Equation",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type22),null), 
			new Pair(new Pattern.Term("Num",
				new Pattern.Leaf(type17),
				"v"),null)}),
		null);
	private final static Pattern.Term pattern70 = new Pattern.Term("Equation",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type22), "t"), 
			new Pair(new Pattern.Term("Sum",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type17), "n"), 
					new Pair(new Pattern.Bag(false, new Pair[]{
						new Pair(new Pattern.Term("Mul",
							new Pattern.List(false, new Pair[]{
								new Pair(new Pattern.Leaf(type17), "m"), 
								new Pair(new Pattern.Bag(true, new Pair[]{
									new Pair(new Pattern.Leaf(type18), "xs")}),null)}),
							null),null)}),null)}),
				null),null)}),
		null);
	private final static Pattern.Term pattern71 = new Pattern.Term("Equation",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type22), "t"), 
			new Pair(new Pattern.Term("Sum",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type17), "n"), 
					new Pair(new Pattern.Bag(true, new Pair[]{
						new Pair(new Pattern.Leaf(type23), "xs")}), "ms")}),
				null),null)}),
		null);
	private final static Pattern.Term pattern72 = new Pattern.Term("And",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("Equation",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type22), "t"), 
					new Pair(new Pattern.Term("Sum",
						new Pattern.List(false, new Pair[]{
							new Pair(new Pattern.Leaf(type17), "c"), 
							new Pair(new Pattern.Bag(true, new Pair[]{
								new Pair(new Pattern.Term("Mul",
									new Pattern.List(false, new Pair[]{
										new Pair(new Pattern.Leaf(type17), "vc"), 
										new Pair(new Pattern.Bag(false, new Pair[]{
											new Pair(new Pattern.Leaf(type18), "v")}),null)}),
									null),null), 
								new Pair(new Pattern.Leaf(type23), "ms")}), "xs")}),
						null),null)}),
				null), "eq"), 
			new Pair(new Pattern.Leaf(type10), "bs")}),
		null);
	private final static Pattern.Term pattern73 = new Pattern.Term("And",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("Equation",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type22), "t"), 
					new Pair(new Pattern.Leaf(type8), "v")}),
				null), "eq"), 
			new Pair(new Pattern.Leaf(type10), "bs")}),
		null);
	private final static Pattern.Term pattern74 = new Pattern.Term("Not",
		new Pattern.Term("Equation",
			new Pattern.List(false, new Pair[]{
				new Pair(new Pattern.Leaf(type24), "t"), 
				new Pair(new Pattern.Leaf(type18), "e")}),
			null),
		null);
	private final static Pattern.Term pattern75 = new Pattern.Term("Not",
		new Pattern.Term("Equation",
			new Pattern.List(false, new Pair[]{
				new Pair(new Pattern.Leaf(type25), "t"), 
				new Pair(new Pattern.Leaf(type18), "e")}),
			null),
		null);
	private final static Pattern.Term pattern76 = new Pattern.Term("Equals",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type22), "t"), 
			new Pair(new Pattern.Bag(false, new Pair[]{
				new Pair(new Pattern.Leaf(type18), "e1"), 
				new Pair(new Pattern.Leaf(type18), "e2")}),null)}),
		null);
	private final static Pattern.Term pattern77 = new Pattern.Term("Inequality",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type22), "t"), 
			new Pair(new Pattern.Term("Num",
				new Pattern.Leaf(type17),
				"v"),null)}),
		null);
	private final static Pattern.Term pattern78 = new Pattern.Term("Not",
		new Pattern.Term("Inequality",
			new Pattern.List(false, new Pair[]{
				new Pair(new Pattern.Leaf(type24), "t"), 
				new Pair(new Pattern.Leaf(type18), "e")}),
			null),
		null);
	private final static Pattern.Term pattern79 = new Pattern.Term("Inequality",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type22), "t"), 
			new Pair(new Pattern.Term("Sum",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type17), "n"), 
					new Pair(new Pattern.Bag(true, new Pair[]{
						new Pair(new Pattern.Leaf(type23), "xs")}), "ms")}),
				null),null)}),
		null);
	private final static Pattern.Term pattern80 = new Pattern.Term("And",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("Inequality",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type24),null), 
					new Pair(new Pattern.Term("Sum",
						new Pattern.List(false, new Pair[]{
							new Pair(new Pattern.Leaf(type17), "x1"), 
							new Pair(new Pattern.Bag(false, new Pair[]{
								new Pair(new Pattern.Term("Mul",
									new Pattern.List(false, new Pair[]{
										new Pair(new Pattern.Leaf(type17), "x2"), 
										new Pair(new Pattern.Bag(false, new Pair[]{
											new Pair(new Pattern.Leaf(type18), "vx1")}),null)}),
									null),null), 
								new Pair(new Pattern.Term("Mul",
									new Pattern.List(false, new Pair[]{
										new Pair(new Pattern.Leaf(type17), "x3"), 
										new Pair(new Pattern.Bag(false, new Pair[]{
											new Pair(new Pattern.Leaf(type18), "vx2")}),null)}),
									null),null)}),null)}),
						null), "s1")}),
				null), "ieq1"), 
			new Pair(new Pattern.Term("Inequality",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type24),null), 
					new Pair(new Pattern.Term("Sum",
						new Pattern.List(false, new Pair[]{
							new Pair(new Pattern.Leaf(type17), "y1"), 
							new Pair(new Pattern.Bag(false, new Pair[]{
								new Pair(new Pattern.Term("Mul",
									new Pattern.List(false, new Pair[]{
										new Pair(new Pattern.Leaf(type17), "y2"), 
										new Pair(new Pattern.Bag(false, new Pair[]{
											new Pair(new Pattern.Leaf(type18), "vy1")}),null)}),
									null),null), 
								new Pair(new Pattern.Term("Mul",
									new Pattern.List(false, new Pair[]{
										new Pair(new Pattern.Leaf(type17), "y3"), 
										new Pair(new Pattern.Bag(false, new Pair[]{
											new Pair(new Pattern.Leaf(type18), "vy2")}),null)}),
									null),null)}),null)}),
						null), "s2")}),
				null), "ieq2"), 
			new Pair(new Pattern.Leaf(type10), "rest")}),
		null);
	private final static Pattern.Term pattern81 = new Pattern.Term("And",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("Inequality",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type22), "t1"), 
					new Pair(new Pattern.Term("Sum",
						new Pattern.List(false, new Pair[]{
							new Pair(new Pattern.Leaf(type17), "x1"), 
							new Pair(new Pattern.Bag(true, new Pair[]{
								new Pair(new Pattern.Term("Mul",
									new Pattern.List(false, new Pair[]{
										new Pair(new Pattern.Leaf(type17), "x2"), 
										new Pair(new Pattern.Bag(false, new Pair[]{
											new Pair(new Pattern.Leaf(type18), "v1")}),null)}),
									null),null), 
								new Pair(new Pattern.Leaf(type23), "xs")}), "xxs")}),
						null), "s1")}),
				null), "eq1"), 
			new Pair(new Pattern.Term("Inequality",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type22), "t2"), 
					new Pair(new Pattern.Term("Sum",
						new Pattern.List(false, new Pair[]{
							new Pair(new Pattern.Leaf(type17), "y1"), 
							new Pair(new Pattern.Bag(true, new Pair[]{
								new Pair(new Pattern.Term("Mul",
									new Pattern.List(false, new Pair[]{
										new Pair(new Pattern.Leaf(type17), "y2"), 
										new Pair(new Pattern.Bag(false, new Pair[]{
											new Pair(new Pattern.Leaf(type18), "v2")}),null)}),
									null),null), 
								new Pair(new Pattern.Leaf(type23), "ys")}), "yys")}),
						null), "s2")}),
				null), "eq2"), 
			new Pair(new Pattern.Leaf(type10), "rest")}),
		null);
	private final static Pattern.Term pattern82 = new Pattern.Term("And",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("Inequality",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type22), "t1"), 
					new Pair(new Pattern.Term("Sum",
						new Pattern.List(false, new Pair[]{
							new Pair(new Pattern.Leaf(type17), "x1"), 
							new Pair(new Pattern.Bag(true, new Pair[]{
								new Pair(new Pattern.Term("Mul",
									new Pattern.List(false, new Pair[]{
										new Pair(new Pattern.Leaf(type17), "x2"), 
										new Pair(new Pattern.Bag(false, new Pair[]{
											new Pair(new Pattern.Leaf(type18), "v1")}),null)}),
									null),null), 
								new Pair(new Pattern.Leaf(type23), "xs")}), "xxs")}),
						null), "s1")}),
				null), "eq1"), 
			new Pair(new Pattern.Term("Inequality",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type22), "t2"), 
					new Pair(new Pattern.Leaf(type8), "v2")}),
				null), "eq2"), 
			new Pair(new Pattern.Leaf(type10), "rest")}),
		null);
	private final static Pattern.Term pattern83 = new Pattern.Term("LengthOf",
		new Pattern.Term("Array",
			new Pattern.List(true, new Pair[]{
				new Pair(new Pattern.Leaf(type6), "xs")}),
			null),
		null);
	private final static Pattern.Term pattern84 = new Pattern.Term("IndexOf",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Term("Array",
				new Pattern.List(true, new Pair[]{
					new Pair(new Pattern.Leaf(type6), "xs")}),
				null),null), 
			new Pair(new Pattern.Term("Num",
				new Pattern.Leaf(type17),
				"i"),null)}),
		null);
	private final static Pattern.Term pattern85 = new Pattern.Term("ForAll",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Set(true, new Pair[]{
				new Pair(new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type26),null), 
					new Pair(new Pattern.Leaf(type2),null)}), "qs")}),null), 
			new Pair(new Pattern.Leaf(type10), "be")}),
		null);
	private final static Pattern.Term pattern86 = new Pattern.Term("Not",
		new Pattern.Term("ForAll",
			new Pattern.List(false, new Pair[]{
				new Pair(new Pattern.Set(true, new Pair[]{
					new Pair(new Pattern.List(false, new Pair[]{
						new Pair(new Pattern.Leaf(type26),null), 
						new Pair(new Pattern.Leaf(type2),null)}),null)}), "vars"), 
				new Pair(new Pattern.Leaf(type10), "be")}),
			null),
		null);
	private final static Pattern.Term pattern87 = new Pattern.Term("ForAll",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Set(true, new Pair[]{
				new Pair(new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type26),null), 
					new Pair(new Pattern.Leaf(type2),null)}),null)}), "xs"), 
			new Pair(new Pattern.Term("ForAll",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Set(true, new Pair[]{
						new Pair(new Pattern.List(false, new Pair[]{
							new Pair(new Pattern.Leaf(type26),null), 
							new Pair(new Pattern.Leaf(type2),null)}),null)}), "ys"), 
					new Pair(new Pattern.Leaf(type10), "e")}),
				null),null)}),
		null);
	private final static Pattern.Term pattern88 = new Pattern.Term("ForAll",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Set(true, new Pair[]{
				new Pair(new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type26), "v"), 
					new Pair(new Pattern.Leaf(type2),null)}),null), 
				new Pair(new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type26),null), 
					new Pair(new Pattern.Leaf(type2),null)}), "xs")}),null), 
			new Pair(new Pattern.Leaf(type10), "e")}),
		null);
	private final static Pattern.Term pattern89 = new Pattern.Term("And",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Leaf(type10), "e1"), 
			new Pair(new Pattern.Term("ForAll",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Set(true, new Pair[]{
						new Pair(new Pattern.List(false, new Pair[]{
							new Pair(new Pattern.Leaf(type26),null), 
							new Pair(new Pattern.Leaf(type2),null)}),null), 
						new Pair(new Pattern.List(false, new Pair[]{
							new Pair(new Pattern.Leaf(type26),null), 
							new Pair(new Pattern.Leaf(type2),null)}),null)}), "vs"), 
					new Pair(new Pattern.Leaf(type10), "e2")}),
				null), "qf"), 
			new Pair(new Pattern.Leaf(type10), "es")}),
		null);
	private final static Pattern.Term pattern90 = new Pattern.Term("Exists",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Set(true, new Pair[]{
				new Pair(new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type26),null), 
					new Pair(new Pattern.Leaf(type2),null)}), "qs")}),null), 
			new Pair(new Pattern.Leaf(type10), "be")}),
		null);
	private final static Pattern.Term pattern91 = new Pattern.Term("Not",
		new Pattern.Term("Exists",
			new Pattern.List(false, new Pair[]{
				new Pair(new Pattern.Set(true, new Pair[]{
					new Pair(new Pattern.List(false, new Pair[]{
						new Pair(new Pattern.Leaf(type26),null), 
						new Pair(new Pattern.Leaf(type2),null)}),null)}), "vars"), 
				new Pair(new Pattern.Leaf(type10), "be")}),
			null),
		null);
	private final static Pattern.Term pattern92 = new Pattern.Term("Exists",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Set(true, new Pair[]{
				new Pair(new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type26),null), 
					new Pair(new Pattern.Leaf(type2),null)}),null)}), "xs"), 
			new Pair(new Pattern.Term("Exists",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Set(true, new Pair[]{
						new Pair(new Pattern.List(false, new Pair[]{
							new Pair(new Pattern.Leaf(type26),null), 
							new Pair(new Pattern.Leaf(type2),null)}),null)}), "ys"), 
					new Pair(new Pattern.Leaf(type10), "e")}),
				null),null)}),
		null);
	private final static Pattern.Term pattern93 = new Pattern.Term("And",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("Exists",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Set(true, new Pair[]{
						new Pair(new Pattern.List(false, new Pair[]{
							new Pair(new Pattern.Leaf(type26),null), 
							new Pair(new Pattern.Leaf(type2),null)}),null)}), "vs"), 
					new Pair(new Pattern.Leaf(type10), "e")}),
				null),null), 
			new Pair(new Pattern.Leaf(type10), "es")}),
		null);
	private final static Pattern.Term pattern94 = new Pattern.Term("Inhabited",
		new Pattern.Leaf(type29),
		"t");
	private final static Pattern.Term pattern95 = new Pattern.Term("Inhabited",
		new Pattern.Term("AndT",
			new Pattern.Set(true, new Pair[]{
				new Pair(new Pattern.Term("NotT",
					new Pattern.Leaf(type3),
					null), "ts")}),
			null),
		null);
	private final static Pattern.Term pattern96 = new Pattern.Term("Inhabited",
		new Pattern.Term("ArrayT",
			new Pattern.Leaf(type2),
			"t"),
		null);
	private final static Pattern.Term pattern97 = new Pattern.Term("Is",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type6), "e"), 
			new Pair(new Pattern.Leaf(type1),null)}),
		null);
	private final static Pattern.Term pattern98 = new Pattern.Term("Not",
		new Pattern.Term("Is",
			new Pattern.List(false, new Pair[]{
				new Pair(new Pattern.Leaf(type6), "e"), 
				new Pair(new Pattern.Leaf(type2), "t")}),
			null),
		null);
	private final static Pattern.Term pattern99 = new Pattern.Term("And",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("Is",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type6), "e1"), 
					new Pair(new Pattern.Leaf(type2), "t1")}),
				null),null), 
			new Pair(new Pattern.Term("Is",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type6), "e2"), 
					new Pair(new Pattern.Leaf(type2), "t2")}),
				null),null), 
			new Pair(new Pattern.Leaf(type10), "bs")}),
		null);
	// =========================================================================
	// rules
	// =========================================================================

	public static final InferenceRule[] inferences = new InferenceRule[]{
		new Inference_0(pattern51),
		new Inference_1(pattern72),
		new Inference_2(pattern73),
		new Inference_3(pattern81),
		new Inference_4(pattern82),
		new Inference_5(pattern89)
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
		new Reduction_49(pattern49),
		new Reduction_50(pattern50),
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
		new Reduction_69(pattern70),
		new Reduction_70(pattern71),
		new Reduction_71(pattern74),
		new Reduction_72(pattern75),
		new Reduction_73(pattern76),
		new Reduction_74(pattern77),
		new Reduction_75(pattern78),
		new Reduction_76(pattern79),
		new Reduction_77(pattern80),
		new Reduction_78(pattern83),
		new Reduction_79(pattern84),
		new Reduction_80(pattern85),
		new Reduction_81(pattern86),
		new Reduction_82(pattern87),
		new Reduction_83(pattern88),
		new Reduction_84(pattern90),
		new Reduction_85(pattern91),
		new Reduction_86(pattern92),
		new Reduction_87(pattern93),
		new Reduction_88(pattern94),
		new Reduction_89(pattern95),
		new Reduction_90(pattern96),
		new Reduction_91(pattern97),
		new Reduction_92(pattern98),
		new Reduction_93(pattern99)
	};


	// =========================================================================
	// Main Method
	// =========================================================================

	public static void main(String[] args) throws IOException {
		new wyrl.ConsoleRewriter(SCHEMA,inferences,reductions).readEvaluatePrintLoop();
	}
}
