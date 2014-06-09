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
	// term $4<NotT($2<^Type>)>
	public final static int K_NotT = 0;
	public final static int NotT(Automaton automaton, int r0) {
		return automaton.add(new Automaton.Term(K_NotT, r0));
	}

	// NotT(AnyT)
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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
			int r0 = state[0];
			Automaton.Term r2 = VoidT;
			int r3 = automaton.add(r2);
			if(r0 != r3) {
				automaton.rewrite(r0, r3);
				return true;
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 1; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// NotT(VoidT)
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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
			int r0 = state[0];
			Automaton.Term r2 = AnyT;
			int r3 = automaton.add(r2);
			if(r0 != r3) {
				automaton.rewrite(r0, r3);
				return true;
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 1; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// NotT(OrT({$11<Type> es...}))
	private final static class Reduction_2 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_2(Pattern.Term pattern) { super(pattern); }

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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
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
				automaton.rewrite(r0, r10);
				return true;
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 2; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// NotT(AndT({$11<Type> es...}))
	private final static class Reduction_3 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_3(Pattern.Term pattern) { super(pattern); }

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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
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
				automaton.rewrite(r0, r10);
				return true;
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 2; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// term $7<AndT($5<^{$2<^Type>...}>)>
	public final static int K_AndT = 1;
	public final static int AndT(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.Set(r0));
		return automaton.add(new Automaton.Term(K_AndT, r1));
	}
	public final static int AndT(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.Set(r0));
		return automaton.add(new Automaton.Term(K_AndT, r1));
	}

	// AndT({})
	private final static class Reduction_4 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_4(Pattern.Term pattern) { super(pattern); }

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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
			int r0 = state[0];
			Automaton.Term r2 = VoidT;
			int r3 = automaton.add(r2);
			if(r0 != r3) {
				automaton.rewrite(r0, r3);
				return true;
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 1; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// AndT({$11<Type> t})
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
			int r2 = state[2]; // t
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
	// AndT({AndT({$11<Type> xs...}), $11<Type> ys...})
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
			Automaton.Term r9 = new Automaton.Term(K_AndT, r8);
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
	// AndT({OrT({$11<Type> xs...}), $11<Type> ys...})
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
				automaton.rewrite(r0, r15);
				return true;
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 3; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// term $7<OrT($5<^{$2<^Type>...}>)>
	public final static int K_OrT = 2;
	public final static int OrT(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.Set(r0));
		return automaton.add(new Automaton.Term(K_OrT, r1));
	}
	public final static int OrT(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.Set(r0));
		return automaton.add(new Automaton.Term(K_OrT, r1));
	}

	// OrT({})
	private final static class Reduction_8 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_8(Pattern.Term pattern) { super(pattern); }

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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
			int r0 = state[0];
			Automaton.Term r2 = VoidT;
			int r3 = automaton.add(r2);
			if(r0 != r3) {
				automaton.rewrite(r0, r3);
				return true;
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 1; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// OrT({$11<Type> t})
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
			int r2 = state[2]; // t
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
	// OrT({OrT({$11<Type> xs...}), $11<Type> ys...})
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
			Automaton.Term r9 = new Automaton.Term(K_OrT, r8);
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
	// term $7<TupleT(^[$2<^Type>...])>
	public final static int K_TupleT = 3;
	public final static int TupleT(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_TupleT, r1));
	}
	public final static int TupleT(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_TupleT, r1));
	}

	// TupleT([$11<Type> ts...])
	private final static class Reduction_11 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_11(Pattern.Term pattern) { super(pattern); }

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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
			int r0 = state[0];
			Automaton.List r2 = ((Automaton.List) automaton.get(state[1])).sublist(0);
			Automaton.Term r3 = VoidT;
			int r4 = automaton.add(r3);
			boolean r5 = r2.contains(r4);  // VoidT in ts
			if(r5) {
				Automaton.Term r6 = VoidT;
				int r7 = automaton.add(r6);
				if(r0 != r7) {
					automaton.rewrite(r0, r7);
					return true;
				}
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// AndT({TupleT([$11<Type> t1s...]), TupleT([$11<Type> t2s...]), $11<Type> ts...})
	private final static class Reduction_12 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_12(Pattern.Term pattern) { super(pattern); }

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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
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
					automaton.rewrite(r0, r15);
					return true;
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
				automaton.rewrite(r0, r33);
				return true;
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 5; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// AndT({TupleT([$11<Type> t1s...]) t1, NotT(TupleT([$11<Type> t2s...])), $11<Type> ts...})
	private final static class Reduction_13 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_13(Pattern.Term pattern) { super(pattern); }

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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
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
					automaton.rewrite(r0, r18);
					return true;
				}
			}
			Automaton.Int r19 = r5.lengthOf(); // |t1s|
			Automaton.Int r20 = new Automaton.Int(0); // 0
			boolean r21 = r19.equals(r20); // |t1s| eq 0
			if(r21) {
				Automaton.Term r22 = VoidT;
				int r23 = automaton.add(r22);
				if(r0 != r23) {
					automaton.rewrite(r0, r23);
					return true;
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
				automaton.rewrite(r0, r43);
				return true;
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 6; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// term $9<SetT(^[^bool,$3<^Type>])>
	public final static int K_SetT = 4;
	public final static int SetT(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_SetT, r1));
	}
	public final static int SetT(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_SetT, r1));
	}

	// SetT([bool b, VoidT])
	private final static class Reduction_14 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_14(Pattern.Term pattern) { super(pattern); }

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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
			int r0 = state[0];
			int r2 = state[2]; // b
			boolean r4 = ((Automaton.Bool)automaton.get(r2)).value;
			boolean r5 = !r4;              // !b
			if(r5) {
				Automaton.Term r6 = VoidT;
				int r7 = automaton.add(r6);
				if(r0 != r7) {
					automaton.rewrite(r0, r7);
					return true;
				}
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// AndT({SetT([bool b1, $11<Type> t1]), SetT([bool b2, $11<Type> t2]), $11<Type> ts...})
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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
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
				automaton.rewrite(r0, r28);
				return true;
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 9; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// AndT({SetT([bool b1, $11<Type> t1]), NotT(SetT([bool b2, $11<Type> t2])), $11<Type> ts...})
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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
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
				automaton.rewrite(r0, r32);
				return true;
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 10; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// AndT({SetT([bool, $11<Type>]) s, $33<Proton> p, $11<Type> ts...})
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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
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
					automaton.rewrite(r0, r13);
					return true;
				}
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// OrT({SetT([bool b1, $11<Type> t1]) s1, SetT([bool b2, $11<Type> t2]) s2, $11<Type> ts...})
	private final static class Reduction_18 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_18(Pattern.Term pattern) { super(pattern); }

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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
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
	// term AnyT
	public final static int K_AnyT = 5;
	public final static Automaton.Term AnyT = new Automaton.Term(K_AnyT);

	// term VoidT
	public final static int K_VoidT = 6;
	public final static Automaton.Term VoidT = new Automaton.Term(K_VoidT);

	// term BoolT
	public final static int K_BoolT = 7;
	public final static Automaton.Term BoolT = new Automaton.Term(K_BoolT);

	// term IntT
	public final static int K_IntT = 8;
	public final static Automaton.Term IntT = new Automaton.Term(K_IntT);

	// term RealT
	public final static int K_RealT = 9;
	public final static Automaton.Term RealT = new Automaton.Term(K_RealT);

	// term StringT
	public final static int K_StringT = 10;
	public final static Automaton.Term StringT = new Automaton.Term(K_StringT);

	// term VarT(^string)
	public final static int K_VarT = 11;
	public final static int VarT(Automaton automaton, String r0) {
		int r1 = automaton.add(new Automaton.Strung(r0));
		return automaton.add(new Automaton.Term(K_VarT, r1));
	}

	// AndT({VoidT, $11<Type> xs...})
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
				automaton.rewrite(r0, r6);
				return true;
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 2; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// AndT({AnyT, $11<Type> xs...})
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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
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
				automaton.rewrite(r0, r7);
				return true;
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 2; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// AndT({$33<Proton> a1, $33<Proton> a2, $11<Type> ts...})
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
						if(Runtime.accepts(type4,automaton,automaton.get(r2), SCHEMA)) {
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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
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
			boolean r8 = false;            // a1 neq a2 && !a2 is ^AnyT
			if(r7) {
				boolean r9 = Runtime.accepts(type5, automaton, r4, SCHEMA); // a2 is ^AnyT
				boolean r10 = !r9;             // !a2 is ^AnyT
				r8 = r10;
			}
			if(r8) {
				Automaton.Term r11 = VoidT;
				int r12 = automaton.add(r11);
				if(r0 != r12) {
					automaton.rewrite(r0, r12);
					return true;
				}
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// AndT({$33<Proton> a1, NotT($33<Proton> a2), $11<Type> ts...})
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
						if(Runtime.accepts(type4,automaton,automaton.get(r2), SCHEMA)) {
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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
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
					automaton.rewrite(r0, r10);
					return true;
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
					automaton.rewrite(r0, r17);
					return true;
				}
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// OrT({AnyT, $11<Type> xs...})
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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
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
				automaton.rewrite(r0, r6);
				return true;
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 2; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// OrT({VoidT, $11<Type> xs...})
	private final static class Reduction_24 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_24(Pattern.Term pattern) { super(pattern); }

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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
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
				automaton.rewrite(r0, r7);
				return true;
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 2; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// term $8<FunctionT(^[$2<^Type>,$2,$2...])>
	public final static int K_FunctionT = 12;
	public final static int FunctionT(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_FunctionT, r1));
	}
	public final static int FunctionT(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_FunctionT, r1));
	}

	// term True
	public final static int K_True = 13;
	public final static Automaton.Term True = new Automaton.Term(K_True);

	// term False
	public final static int K_False = 14;
	public final static Automaton.Term False = new Automaton.Term(K_False);

	// term Num(^real)
	public final static int K_Num = 15;
	public final static int Num(Automaton automaton, long r0) {
		int r1 = automaton.add(new Automaton.Real(r0));
		return automaton.add(new Automaton.Term(K_Num, r1));
	}
	public final static int Num(Automaton automaton, BigRational r0) {
		int r1 = automaton.add(new Automaton.Real(r0));
		return automaton.add(new Automaton.Term(K_Num, r1));
	}

	// term Var(^string)
	public final static int K_Var = 16;
	public final static int Var(Automaton automaton, String r0) {
		int r1 = automaton.add(new Automaton.Strung(r0));
		return automaton.add(new Automaton.Term(K_Var, r1));
	}

	// term $7<Tuple(^[$2<^Expr>...])>
	public final static int K_Tuple = 17;
	public final static int Tuple(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_Tuple, r1));
	}
	public final static int Tuple(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_Tuple, r1));
	}

	// term $9<Load(^[$2<^Expr>,^int])>
	public final static int K_Load = 18;
	public final static int Load(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_Load, r1));
	}
	public final static int Load(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_Load, r1));
	}

	// Load([Tuple([$14<Expr> ls...]), int idx])
	private final static class Reduction_25 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_25(Pattern.Term pattern) { super(pattern); }

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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
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
					automaton.rewrite(r0, r14);
					return true;
				}
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// term $4<LengthOf($2<^Expr>)>
	public final static int K_LengthOf = 19;
	public final static int LengthOf(Automaton automaton, int r0) {
		return automaton.add(new Automaton.Term(K_LengthOf, r0));
	}

	// LengthOf(Tuple([$14<Expr> xs...]))
	private final static class Reduction_26 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_26(Pattern.Term pattern) { super(pattern); }

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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
			int r0 = state[0];
			Automaton.List r3 = ((Automaton.List) automaton.get(state[2])).sublist(0);
			Automaton.Int r4 = r3.lengthOf(); // |xs|
			Automaton.Real r5 = new Automaton.Real(r4.value);
			int r6 = automaton.add(r5);
			Automaton.Term r7 = new Automaton.Term(K_Num, r6);
			int r8 = automaton.add(r7);
			if(r0 != r8) {
				automaton.rewrite(r0, r8);
				return true;
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 2; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Equals([TupleT([$11<Type> ts...]), {|Tuple([$14<Expr> xs...]), Tuple([$14<Expr> ys...])|}])
	private final static class Reduction_27 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_27(Pattern.Term pattern) { super(pattern); }

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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
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
					automaton.rewrite(r0, r18);
					return true;
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
				automaton.rewrite(r0, r35);
				return true;
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 8; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// And({Equals([$11<Type> t, {|$10<VExpr> x, $7<Tuple(^[$2<^Expr>...])> y|}]) eq, $25<BExpr> bs...})
	private final static class Reduction_28 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_28(Pattern.Term pattern) { super(pattern); }

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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
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
				automaton.rewrite(r0, r18);
				return true;
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 8; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// term $9<Fn(^[^string,$3<^Expr>...])>
	public final static int K_Fn = 20;
	public final static int Fn(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_Fn, r1));
	}
	public final static int Fn(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_Fn, r1));
	}

	// term String(^string)
	public final static int K_String = 21;
	public final static int String(Automaton automaton, String r0) {
		int r1 = automaton.add(new Automaton.Strung(r0));
		return automaton.add(new Automaton.Term(K_String, r1));
	}

	// term $4<Not($2<^$28<BExpr>>)>
	public final static int K_Not = 22;
	public final static int Not(Automaton automaton, int r0) {
		return automaton.add(new Automaton.Term(K_Not, r0));
	}

	// Not(Bool b)
	private final static class Reduction_29 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_29(Pattern.Term pattern) { super(pattern); }

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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
			int r0 = state[0];
			int r1 = state[1]; // b
			Automaton.Term r2 = True;
			Object r3 = (Object) automaton.get(r1);
			boolean r4 = r3.equals(r2);    // b eq True
			if(r4) {
				Automaton.Term r5 = False;
				int r6 = automaton.add(r5);
				if(r0 != r6) {
					automaton.rewrite(r0, r6);
					return true;
				}
			}
			Automaton.Term r7 = True;
			int r8 = automaton.add(r7);
			if(r0 != r8) {
				automaton.rewrite(r0, r8);
				return true;
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 1; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Not(Not(any x))
	private final static class Reduction_30 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_30(Pattern.Term pattern) { super(pattern); }

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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
			int r0 = state[0];
			int r2 = state[2]; // x
			if(r0 != r2) {
				automaton.rewrite(r0, r2);
				return true;
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 1; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Not(And({$25<BExpr> xs...}))
	private final static class Reduction_31 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_31(Pattern.Term pattern) { super(pattern); }

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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
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
				automaton.rewrite(r0, r10);
				return true;
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 2; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Not(Or({$25<BExpr> xs...}))
	private final static class Reduction_32 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_32(Pattern.Term pattern) { super(pattern); }

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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
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
				automaton.rewrite(r0, r10);
				return true;
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 2; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// term $7<And($5<^{$2<^$31<BExpr>>...}>)>
	public final static int K_And = 23;
	public final static int And(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.Set(r0));
		return automaton.add(new Automaton.Term(K_And, r1));
	}
	public final static int And(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.Set(r0));
		return automaton.add(new Automaton.Term(K_And, r1));
	}

	// And({$25<BExpr> x})
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
	// And({False, $25<BExpr> xs...})
	private final static class Reduction_34 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_34(Pattern.Term pattern) { super(pattern); }

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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
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
				automaton.rewrite(r0, r6);
				return true;
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 2; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// And({True, $25<BExpr> xs...})
	private final static class Reduction_35 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_35(Pattern.Term pattern) { super(pattern); }

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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
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
			Automaton.Term r6 = new Automaton.Term(K_And, r5);
			int r7 = automaton.add(r6);
			if(r0 != r7) {
				automaton.rewrite(r0, r7);
				return true;
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 2; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// And({And({$25<BExpr> xs...}), $25<BExpr> ys...})
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
	// And({Not($25<BExpr> x), $25<BExpr> y, $25<BExpr> ys...})
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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
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
					automaton.rewrite(r0, r10);
					return true;
				}
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// And({Or({$25<BExpr> xs...}), $25<BExpr> ys...})
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
				automaton.rewrite(r0, r15);
				return true;
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 3; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// term $7<Or($5<^{$2<^$31<BExpr>>...}>)>
	public final static int K_Or = 24;
	public final static int Or(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.Set(r0));
		return automaton.add(new Automaton.Term(K_Or, r1));
	}
	public final static int Or(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.Set(r0));
		return automaton.add(new Automaton.Term(K_Or, r1));
	}

	// Or({$25<BExpr> x})
	private final static class Reduction_38 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_38(Pattern.Term pattern) { super(pattern); }

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
	// Or({True, $25<BExpr> xs...})
	private final static class Reduction_39 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_39(Pattern.Term pattern) { super(pattern); }

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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
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
				automaton.rewrite(r0, r6);
				return true;
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 2; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Or({False, $25<BExpr> xs...})
	private final static class Reduction_40 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_40(Pattern.Term pattern) { super(pattern); }

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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
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
			Automaton.Term r6 = new Automaton.Term(K_Or, r5);
			int r7 = automaton.add(r6);
			if(r0 != r7) {
				automaton.rewrite(r0, r7);
				return true;
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 2; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Or({Not($25<BExpr> x), $25<BExpr> y, $25<BExpr> ys...})
	private final static class Reduction_41 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_41(Pattern.Term pattern) { super(pattern); }

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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
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
					automaton.rewrite(r0, r10);
					return true;
				}
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Or({Or({$25<BExpr> xs...}), $25<BExpr> ys...})
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
			Automaton.Term r9 = new Automaton.Term(K_Or, r8);
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
	// term $14<Equals(^[$2<^Type>,^{|$4<^Expr>,$4|}[$4<^Expr>,$4]])>
	public final static int K_Equals = 25;
	public final static int Equals(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_Equals, r1));
	}
	public final static int Equals(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_Equals, r1));
	}

	// Equals([$11<Type> t, {|$14<Expr> x, $14<Expr> y|}])
	private final static class Reduction_43 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_43(Pattern.Term pattern) { super(pattern); }

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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
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
					automaton.rewrite(r0, r10);
					return true;
				}
			}
			boolean r11 = r4 != r6;        // x neq y
			boolean r12 = false;           // x neq y && x is $1<^Value> && y is $1<^Value>
			if(r11) {
				boolean r13 = Runtime.accepts(type15, automaton, r4, SCHEMA); // x is $1<^Value>
				boolean r14 = false;           // x is $1<^Value> && y is $1<^Value>
				if(r13) {
					boolean r15 = Runtime.accepts(type15, automaton, r6, SCHEMA); // y is $1<^Value>
					r14 = r15;
				}
				r12 = r14;
			}
			if(r12) {
				Automaton.Term r16 = False;
				int r17 = automaton.add(r16);
				if(r0 != r17) {
					automaton.rewrite(r0, r17);
					return true;
				}
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// And({Equals([$11<Type> t, {|$10<VExpr> x, $22<Value> y|}]) eq, $25<BExpr> bs...})
	private final static class Reduction_44 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_44(Pattern.Term pattern) { super(pattern); }

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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
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
				automaton.rewrite(r0, r18);
				return true;
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 8; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// And({Equals([$11<Type> t, {|$10<VExpr>, $10<VExpr>|} vs]) eq, $25<BExpr> bs...})
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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
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
			Automaton.List t14 = new Automaton.List();
			for(int i15=0;i15<r11.size();i15++) {
				int r15 = (int) r11.get(i15);
				int r16 = automaton.add(r12);
				int r17 = automaton.add(r13);
				int r18 = automaton.substitute(r15, r16, r17);
				t14.add(r18);
			}
			Automaton.Set r14 = new Automaton.Set(t14.toArray());
			boolean r19 = !r12.equals(r13); // x neq y
			if(r19) {
				Automaton.Set r20 = r14.appendFront(r2); // eq append cs
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
	// term $12<Mul($10<^[^real,^{|$3<^$20<AExpr>>...|}[$3<^$20<AExpr>>...]]>)>
	public final static int K_Mul = 26;
	public final static int Mul(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_Mul, r1));
	}
	public final static int Mul(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_Mul, r1));
	}

	// Mul([real n, {|$9<AExpr> rest...|}])
	private final static class Reduction_45 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_45(Pattern.Term pattern) { super(pattern); }

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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
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
					automaton.rewrite(r0, r13);
					return true;
				}
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Mul([real x, {|Num(real y), $9<AExpr> rest...|}])
	private final static class Reduction_46 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_46(Pattern.Term pattern) { super(pattern); }

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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
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
				automaton.rewrite(r0, r16);
				return true;
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 5; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Mul([real n1, {|Mul([real n2, {|$9<AExpr> xs...|}]), $9<AExpr> ys...|}])
	private final static class Reduction_47 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_47(Pattern.Term pattern) { super(pattern); }

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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
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
				automaton.rewrite(r0, r20);
				return true;
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 7; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Mul([real n1, {|Sum([real n2, {|$9<AExpr> xs...|}]), $9<AExpr> ys...|}])
	private final static class Reduction_48 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_48(Pattern.Term pattern) { super(pattern); }

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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
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
				automaton.rewrite(r0, r35);
				return true;
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 7; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// term $8<Div(^[$2<^$16<AExpr>>,$2])>
	public final static int K_Div = 27;
	public final static int Div(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_Div, r1));
	}
	public final static int Div(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_Div, r1));
	}

	// Div([Num(real x), Num(real y)])
	private final static class Reduction_49 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_49(Pattern.Term pattern) { super(pattern); }

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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
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
				automaton.rewrite(r0, r11);
				return true;
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 5; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Div([$9<AExpr> x, Div([$9<AExpr> y, $9<AExpr> z])])
	private final static class Reduction_50 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_50(Pattern.Term pattern) { super(pattern); }

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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
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
				automaton.rewrite(r0, r18);
				return true;
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 9; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Div([Div([$9<AExpr> x, $9<AExpr> y]), $9<AExpr> z])
	private final static class Reduction_51 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_51(Pattern.Term pattern) { super(pattern); }

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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
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
				automaton.rewrite(r0, r18);
				return true;
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 9; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Div([$9<AExpr> x, Num(real n)])
	private final static class Reduction_52 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_52(Pattern.Term pattern) { super(pattern); }

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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
			int r0 = state[0];
			int r2 = state[2]; // x
			int r4 = state[4]; // n
			Automaton.Real r5 = new Automaton.Real(1); // 1.0
			Automaton.Real r6 = (Automaton.Real) automaton.get(r4);
			boolean r7 = r6.equals(r5);    // n eq 1.0
			if(r7) {
				if(r0 != r2) {
					automaton.rewrite(r0, r2);
					return true;
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
					automaton.rewrite(r0, r28);
					return true;
				}
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Div([Mul([real n, {|$9<AExpr> x, $9<AExpr> xs...|}]), $9<AExpr> y])
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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
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
					automaton.rewrite(r0, r15);
					return true;
				}
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Div([Sum([real n, {|$9<AExpr> xs...|}]), $9<AExpr> y])
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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
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
				automaton.rewrite(r0, r27);
				return true;
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 7; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Div([Mul([real n, {|$9<AExpr> xs...|}]), $9<AExpr> y])
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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
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
				automaton.rewrite(r0, r21);
				return true;
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 7; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// term $12<Sum($10<^[^real,^{|$3<^$20<AExpr>>...|}[$3<^$20<AExpr>>...]]>)>
	public final static int K_Sum = 28;
	public final static int Sum(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_Sum, r1));
	}
	public final static int Sum(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_Sum, r1));
	}

	// Sum([real n, {||}])
	private final static class Reduction_56 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_56(Pattern.Term pattern) { super(pattern); }

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
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
			int r0 = state[0];
			int r2 = state[2]; // n
			Automaton.Term r4 = new Automaton.Term(K_Num, r2);
			int r5 = automaton.add(r4);
			if(r0 != r5) {
				automaton.rewrite(r0, r5);
				return true;
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 3; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Sum([real n, {|$9<AExpr> x, $9<AExpr> rest...|}])
	private final static class Reduction_57 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_57(Pattern.Term pattern) { super(pattern); }

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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
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
			boolean r8 = Runtime.accepts(type20, automaton, r4, SCHEMA); // x is ^$13<Sum($11<^[^real,^{|$4<^$21<AExpr>>...|}[$4<^$21<AExpr>>...]]>)>
			boolean r9 = Runtime.accepts(type21, automaton, r4, SCHEMA); // x is ^$13<Mul($11<^[^real,^{|$4<^$21<AExpr>>...|}[$4<^$21<AExpr>>...]]>)>
			boolean r10 = r8 || r9;        // x is ^$13<Sum($11<^[^real,^{|$4<^$21<AExpr>>...|}[$4<^$21<AExpr>>...]]>)> || x is ^$13<Mul($11<^[^real,^{|$4<^$21<AExpr>>...|}[$4<^$21<AExpr>>...]]>)>
			boolean r11 = r7 || r10;       // x is ^Num(^real) || x is ^$13<Sum($11<^[^real,^{|$4<^$21<AExpr>>...|}[$4<^$21<AExpr>>...]]>)> || x is ^$13<Mul($11<^[^real,^{|$4<^$21<AExpr>>...|}[$4<^$21<AExpr>>...]]>)>
			boolean r12 = !r11;            // !x is ^Num(^real) || x is ^$13<Sum($11<^[^real,^{|$4<^$21<AExpr>>...|}[$4<^$21<AExpr>>...]]>)> || x is ^$13<Mul($11<^[^real,^{|$4<^$21<AExpr>>...|}[$4<^$21<AExpr>>...]]>)>
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
					automaton.rewrite(r0, r26);
					return true;
				}
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Sum([real x, {|Num(real y), $9<AExpr> rest...|}])
	private final static class Reduction_58 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_58(Pattern.Term pattern) { super(pattern); }

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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
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
				automaton.rewrite(r0, r16);
				return true;
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 5; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Sum([real n, {|Mul([real x, {|$9<AExpr>...|} xs]), Mul([real y, {|$9<AExpr>...|} ys]), $9<AExpr> zs...|}])
	private final static class Reduction_59 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_59(Pattern.Term pattern) { super(pattern); }

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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
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
					automaton.rewrite(r0, r31);
					return true;
				}
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Sum([real x, {|Sum([real y, {|$9<AExpr> ys...|}]), $9<AExpr> xs...|}])
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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
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
				automaton.rewrite(r0, r20);
				return true;
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 7; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// term $10<Equation($8<^[^AType,$4<^$29<AExpr>>]>)>
	public final static int K_Equation = 29;
	public final static int Equation(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_Equation, r1));
	}
	public final static int Equation(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_Equation, r1));
	}

	// Equation([AType, Num(real v)])
	private final static class Reduction_61 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_61(Pattern.Term pattern) { super(pattern); }

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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
			int r0 = state[0];
			int r4 = state[4]; // v
			Automaton.Real r5 = new Automaton.Real(0); // 0.0
			Automaton.Real r6 = (Automaton.Real) automaton.get(r4);
			boolean r7 = !r6.equals(r5);   // v neq 0.0
			if(r7) {
				Automaton.Term r8 = False;
				int r9 = automaton.add(r8);
				if(r0 != r9) {
					automaton.rewrite(r0, r9);
					return true;
				}
			}
			Automaton.Term r10 = True;
			int r11 = automaton.add(r10);
			if(r0 != r11) {
				automaton.rewrite(r0, r11);
				return true;
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 4; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// And({Equation([AType t, Sum([real c, {|Mul([real vc, {|$9<AExpr> v|}]), $12<Mul($10<^[^real,^{|$3<^$20<AExpr>>...|}[$3<^$20<AExpr>>...]]>)> ms...|} xs])]) eq, $25<BExpr> bs...})
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
														} else { m9_1=false; break; }
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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
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
			Automaton.Real r20 = new Automaton.Real(1); // 1.0
			Automaton.Real r21 = r20.negate(); // -1.0
			int r22 = automaton.add(r21);
			int r23 = automaton.add(r17);
			Automaton.List r24 = new Automaton.List(r8, r23); // [cms]
			int r25 = automaton.add(r24);
			Automaton.Term r26 = new Automaton.Term(K_Sum, r25);
			int r27 = automaton.add(r26);
			Automaton.Bag r28 = new Automaton.Bag(r27); // {|Sum([cms])|}
			int r29 = automaton.add(r28);
			Automaton.List r30 = new Automaton.List(r22, r29); // [-1.0{|Sum([cms])|}]
			int r31 = automaton.add(r30);
			Automaton.Term r32 = new Automaton.Term(K_Mul, r31);
			int r33 = automaton.add(r32);
			Automaton.Term r34 = new Automaton.Term(K_Num, r13);
			int r35 = automaton.add(r34);
			Automaton.List r36 = new Automaton.List(r33, r35); // [Mul([-1.0{|Sum([cms])|}])Num(vc)]
			int r37 = automaton.add(r36);
			Automaton.Term r38 = new Automaton.Term(K_Div, r37);
			Automaton.List t39 = new Automaton.List();
			for(int i40=0;i40<r18.size();i40++) {
				int r40 = (int) r18.get(i40);
				int r41 = automaton.add(r19);
				int r42 = automaton.add(r38);
				int r43 = automaton.substitute(r40, r41, r42);
				t39.add(r43);
			}
			Automaton.Set r39 = new Automaton.Set(t39.toArray());
			Object r44 = (Object) automaton.get(r15);
			boolean r45 = r44.equals(r19); // v eq var
			if(r45) {
				Automaton.Set r46 = r39.appendFront(r2); // eq append cs
				int r47 = automaton.add(r46);
				Automaton.Term r48 = new Automaton.Term(K_And, r47);
				int r49 = automaton.add(r48);
				if(r0 != r49) {
					automaton.rewrite(r0, r49);
					return true;
				}
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Not(Equation([IntT t, $9<AExpr> e]))
	private final static class Reduction_62 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_62(Pattern.Term pattern) { super(pattern); }

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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
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
				automaton.rewrite(r0, r43);
				return true;
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 5; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Not(Equation([RealT t, $9<AExpr> e]))
	private final static class Reduction_63 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_63(Pattern.Term pattern) { super(pattern); }

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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
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
				automaton.rewrite(r0, r25);
				return true;
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 5; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Equals([AType t, {|$9<AExpr> e1, $9<AExpr> e2|}])
	private final static class Reduction_64 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_64(Pattern.Term pattern) { super(pattern); }

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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
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
				automaton.rewrite(r0, r28);
				return true;
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 7; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// term $10<Inequality($8<^[^AType,$4<^$29<AExpr>>]>)>
	public final static int K_Inequality = 30;
	public final static int Inequality(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_Inequality, r1));
	}
	public final static int Inequality(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_Inequality, r1));
	}

	// Inequality([AType t, Num(real v)])
	private final static class Reduction_65 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_65(Pattern.Term pattern) { super(pattern); }

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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
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
					automaton.rewrite(r0, r9);
					return true;
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
					automaton.rewrite(r0, r18);
					return true;
				}
			}
			Automaton.Term r19 = True;
			int r20 = automaton.add(r19);
			if(r0 != r20) {
				automaton.rewrite(r0, r20);
				return true;
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 4; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Not(Inequality([IntT t, $9<AExpr> e]))
	private final static class Reduction_66 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_66(Pattern.Term pattern) { super(pattern); }

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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
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
				automaton.rewrite(r0, r26);
				return true;
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 5; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// And({Inequality([AType t1, Sum([real x1, {|Mul([real x2, {|$9<AExpr> v1|}]), $12<Mul($10<^[^real,^{|$3<^$20<AExpr>>...|}[$3<^$20<AExpr>>...]]>)> xs...|}]) s1]) eq1, Inequality([AType t2, Sum([real y1, {|Mul([real y2, {|$9<AExpr> v2|}]), $12<Mul($10<^[^real,^{|$3<^$20<AExpr>>...|}[$3<^$20<AExpr>>...]]>)> ys...|}]) s2]) eq2, $25<BExpr> rest...})
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
														} else { m9_1=false; break; }
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
																							} else { m25_1=false; break; }
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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
			int r0 = state[0];
			int r2 = state[2]; // eq1
			int r3 = state[3];
			int r5 = state[5]; // t1
			int r6 = state[6]; // s1
			int r8 = state[8]; // x1
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
			int r35 = automaton.add(r17);
			Automaton.List r36 = new Automaton.List(r8, r35); // [x1xs]
			int r37 = automaton.add(r36);
			Automaton.Term r38 = new Automaton.Term(K_Sum, r37);
			int r39 = automaton.add(r38);
			Automaton.Bag r40 = new Automaton.Bag(r39); // {|Sum([x1xs])|}
			int r41 = automaton.add(r40);
			Automaton.List r42 = new Automaton.List(r29, r41); // [y2{|Sum([x1xs])|}]
			int r43 = automaton.add(r42);
			Automaton.Term r44 = new Automaton.Term(K_Mul, r43);
			Automaton.Real r45 = (Automaton.Real) automaton.get(r13);
			Automaton.Real r46 = r45.negate(); // -x2
			int r47 = automaton.add(r46);
			int r48 = automaton.add(r33);
			Automaton.List r49 = new Automaton.List(r24, r48); // [y1ys]
			int r50 = automaton.add(r49);
			Automaton.Term r51 = new Automaton.Term(K_Sum, r50);
			int r52 = automaton.add(r51);
			Automaton.Bag r53 = new Automaton.Bag(r52); // {|Sum([y1ys])|}
			int r54 = automaton.add(r53);
			Automaton.List r55 = new Automaton.List(r47, r54); // [-x2{|Sum([y1ys])|}]
			int r56 = automaton.add(r55);
			Automaton.Term r57 = new Automaton.Term(K_Mul, r56);
			Automaton.Real r58 = new Automaton.Real(0); // 0.0
			int r59 = automaton.add(r58);
			int r60 = automaton.add(r44);
			int r61 = automaton.add(r57);
			Automaton.Bag r62 = new Automaton.Bag(r60, r61); // {|s3s4|}
			int r63 = automaton.add(r62);
			Automaton.List r64 = new Automaton.List(r59, r63); // [0.0{|s3s4|}]
			int r65 = automaton.add(r64);
			Automaton.Term r66 = new Automaton.Term(K_Sum, r65);
			int r67 = automaton.add(r66);
			Automaton.List r68 = new Automaton.List(r5, r67); // [t1Sum([0.0{|s3s4|}])]
			int r69 = automaton.add(r68);
			Automaton.Term r70 = new Automaton.Term(K_Inequality, r69);
			boolean r71 = r15 == r31;      // v1 eq v2
			boolean r72 = false;           // v1 eq v2 && t1 eq t2 && x2 lt 0.0 && y2 gt 0.0
			if(r71) {
				boolean r73 = r5 == r21;       // t1 eq t2
				boolean r74 = false;           // t1 eq t2 && x2 lt 0.0 && y2 gt 0.0
				if(r73) {
					Automaton.Real r75 = new Automaton.Real(0); // 0.0
					Automaton.Real r76 = (Automaton.Real) automaton.get(r13);
					boolean r77 = r76.compareTo(r75)<0; // x2 lt 0.0
					boolean r78 = false;           // x2 lt 0.0 && y2 gt 0.0
					if(r77) {
						Automaton.Real r79 = new Automaton.Real(0); // 0.0
						Automaton.Real r80 = (Automaton.Real) automaton.get(r29);
						boolean r81 = r80.compareTo(r79)>0; // y2 gt 0.0
						r78 = r81;
					}
					r74 = r78;
				}
				r72 = r74;
			}
			if(r72) {
				int r82 = automaton.add(r70);
				Automaton.Set r83 = new Automaton.Set(r2, r18, r82); // {eq1eq2eq3}
				Automaton.Set r84 = r83.append(r34); // {eq1eq2eq3} append rest
				int r85 = automaton.add(r84);
				Automaton.Term r86 = new Automaton.Term(K_And, r85);
				int r87 = automaton.add(r86);
				if(r0 != r87) {
					automaton.rewrite(r0, r87);
					return true;
				}
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// term $7<Set(^{$2<^Expr>...})>
	public final static int K_Set = 31;
	public final static int Set(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.Set(r0));
		return automaton.add(new Automaton.Term(K_Set, r1));
	}
	public final static int Set(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.Set(r0));
		return automaton.add(new Automaton.Term(K_Set, r1));
	}

	// Equals([$11<Type> t, {|Set({$14<Expr> xs...}), Set({$14<Expr> ys...})|}])
	private final static class Reduction_67 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_67(Pattern.Term pattern) { super(pattern); }

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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
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
					automaton.rewrite(r0, r20);
					return true;
				}
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// And({Equals([$11<Type> t, {|$10<VExpr> x, $7<Set(^{$2<^Expr>...})> y|}]) eq, $25<BExpr> bs...})
	private final static class Reduction_68 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_68(Pattern.Term pattern) { super(pattern); }

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
										if(Runtime.accepts(type26,automaton,automaton.get(r9), SCHEMA)) {
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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
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
				automaton.rewrite(r0, r18);
				return true;
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 8; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// LengthOf(Set({$22<Value> xs...}))
	private final static class Reduction_69 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_69(Pattern.Term pattern) { super(pattern); }

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
						if(Runtime.accepts(type16,automaton,automaton.get(r3), SCHEMA)) {
							continue;
						} else { m2_0=false; break; }
					}
					if(m2_0) {
						int[] state = {r0, r1, r2, 0};
						activations.add(new Activation(this,null,state));
					}
				}
			}
		}

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
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
				automaton.rewrite(r0, r8);
				return true;
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 2; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Equals([IntT, {|LengthOf($6<SExpr> x), Num(real y)|}])
	private final static class Reduction_70 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_70(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Equals) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.List l1 = (Automaton.List) s1;
				int r2 = l1.get(0);
				if(Runtime.accepts(type24,automaton,automaton.get(r2), SCHEMA)) {
					int r3 = l1.get(1);
					Automaton.State s3 = automaton.get(r3);
					Automaton.Collection c3 = (Automaton.Collection) s3;
					for(int r5=0;r5!=c3.size();++r5) {
						int r4 = c3.get(r5);
						Automaton.State s4 = automaton.get(r4);
						if(s4.kind == K_LengthOf) {
							Automaton.Term t4 = (Automaton.Term) s4;
							int r6 = t4.contents;
							if(Runtime.accepts(type27,automaton,automaton.get(r6), SCHEMA)) {
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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
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
					automaton.rewrite(r0, r30);
					return true;
				}
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// term $10<SubsetEq(^[^$19<SetT(^[^bool,$13<^Type>])>,^$94<SExpr>,^$94])>
	public final static int K_SubsetEq = 32;
	public final static int SubsetEq(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_SubsetEq, r1));
	}
	public final static int SubsetEq(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_SubsetEq, r1));
	}

	// SubsetEq([$9<SetT(^[^bool,$3<^Type>])> t, Set({$14<Expr> xs...}) s1, Set({$14<Expr> ys...}) s2])
	private final static class Reduction_71 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_71(Pattern.Term pattern) { super(pattern); }

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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
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
					automaton.rewrite(r0, r13);
					return true;
				}
			}
			Automaton.Int r14 = r8.lengthOf(); // |ys|
			Automaton.Int r15 = new Automaton.Int(0); // 0
			boolean r16 = r14.equals(r15); // |ys| eq 0
			if(r16) {
				Automaton.Term r17 = False;
				int r18 = automaton.add(r17);
				if(r0 != r18) {
					automaton.rewrite(r0, r18);
					return true;
				}
			}
			Automaton.Int r19 = r5.lengthOf(); // |xs|
			Automaton.Int r20 = r8.lengthOf(); // |ys|
			boolean r21 = r19.compareTo(r20)<=0; // |xs| le |ys|
			boolean r22 = false;           // |xs| le |ys| && wyrl.core.Expr$Comprehension@4a1daaa
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
					automaton.rewrite(r0, r28);
					return true;
				}
			}
			boolean r29 = Runtime.accepts(type29, automaton, r3, SCHEMA); // s1 is ^$7<Set(^{$2<^Value>...})>
			boolean r30 = false;           // s1 is ^$7<Set(^{$2<^Value>...})> && s2 is ^$7<Set(^{$2<^Value>...})>
			if(r29) {
				boolean r31 = Runtime.accepts(type29, automaton, r6, SCHEMA); // s2 is ^$7<Set(^{$2<^Value>...})>
				r30 = r31;
			}
			if(r30) {
				Automaton.Term r32 = False;
				int r33 = automaton.add(r32);
				if(r0 != r33) {
					automaton.rewrite(r0, r33);
					return true;
				}
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// SubsetEq([$9<SetT(^[^bool,$3<^Type>])> t, $6<SExpr> x, $6<SExpr> y])
	private final static class Reduction_72 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_72(Pattern.Term pattern) { super(pattern); }

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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
			int r0 = state[0];
			int r2 = state[2]; // t
			int r3 = state[3]; // x
			int r4 = state[4]; // y
			boolean r5 = r3 == r4;         // x eq y
			if(r5) {
				Automaton.Term r6 = True;
				int r7 = automaton.add(r6);
				if(r0 != r7) {
					automaton.rewrite(r0, r7);
					return true;
				}
			}
			boolean r8 = Runtime.accepts(type30, automaton, r3, SCHEMA); // x is ^$8<Set(^{$3<^Expr>...})>
			boolean r9 = false;            // x is ^$8<Set(^{$3<^Expr>...})> && |*x| eq 0
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
					automaton.rewrite(r0, r17);
					return true;
				}
			}
			boolean r18 = Runtime.accepts(type30, automaton, r4, SCHEMA); // y is ^$8<Set(^{$3<^Expr>...})>
			boolean r19 = false;           // y is ^$8<Set(^{$3<^Expr>...})> && |*y| eq 0
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
					automaton.rewrite(r0, r31);
					return true;
				}
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// SubsetEq([SetT([bool b, $11<Type> e]) t, Set({$14<Expr> x, $14<Expr> xs...}) s1, Set({$14<Expr> ys...}) s2])
	private final static class Inference_4 extends AbstractRewriteRule implements InferenceRule {

		public Inference_4(Pattern.Term pattern) { super(pattern); }

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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
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
			Automaton.List t14 = new Automaton.List();
			for(int i15=0;i15<r13.size();i15++) {
				int r15 = (int) r13.get(i15);
				Automaton.Bag r16 = new Automaton.Bag(r8, r15); // {|xy|}
				int r17 = automaton.add(r16);
				Automaton.List r18 = new Automaton.List(r5, r17); // [e{|xy|}]
				int r19 = automaton.add(r18);
				Automaton.Term r20 = new Automaton.Term(K_Equals, r19);
				int r21 = automaton.add(r20);
				t14.add(r21);
			}
			Automaton.Set r14 = new Automaton.Set(t14.toArray());
			boolean r22 = Runtime.accepts(type15, automaton, r8, SCHEMA); // x is $1<^Value>
			boolean r23 = !r22;            // !x is $1<^Value>
			boolean r24 = false;           // !x is $1<^Value> && |ys| gt 0
			if(r23) {
				Automaton.Int r25 = r13.lengthOf(); // |ys|
				Automaton.Int r26 = new Automaton.Int(0); // 0
				boolean r27 = r25.compareTo(r26)>0; // |ys| gt 0
				r24 = r27;
			}
			if(r24) {
				int r28 = automaton.add(r14);
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
					automaton.rewrite(r0, r41);
					return true;
				}
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// And({SubsetEq([SetT([bool b1, $11<Type> e1]), Set({$14<Expr> xs...}), any x]), SubsetEq([SetT([bool b2, $11<Type> e2]), Set({$14<Expr> ys...}), $6<SExpr> y]), $25<BExpr> rest...})
	private final static class Reduction_73 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_73(Pattern.Term pattern) { super(pattern); }

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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
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
			Automaton.Set r25 = r11.append(r22); // xs append ys
			boolean r26 = r12 == r23;      // x eq y
			if(r26) {
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
				int r39 = automaton.add(r25);
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
					automaton.rewrite(r0, r49);
					return true;
				}
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// And({SubsetEq([SetT([bool b1, $11<Type> e1]), $6<SExpr> x, Set({$14<Expr> xs...})]), SubsetEq([SetT([bool b2, $11<Type> e2]), $6<SExpr> y, Set({$14<Expr> ys...})]), $25<BExpr> rest...})
	private final static class Reduction_74 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_74(Pattern.Term pattern) { super(pattern); }

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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
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
			Automaton.List t25 = new Automaton.List();
			for(int i26=0;i26<r12.size();i26++) {
				int r26 = (int) r12.get(i26);
				boolean r27 = true;            // true
				boolean r28 = false;           // true && z in ys
				if(r27) {
					boolean r29 = r23.contains(r26); // z in ys
					r28 = r29;
				}
				if(r28) {
					t25.add(r26);
				}
			}
			Automaton.Set r25 = new Automaton.Set(t25.toArray());
			boolean r30 = r9 == r20;       // x eq y
			if(r30) {
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
				int r43 = automaton.add(r25);
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
					automaton.rewrite(r0, r53);
					return true;
				}
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// And({SubsetEq([$9<SetT(^[^bool,$3<^Type>])> t1, $6<SExpr> x, $6<SExpr> y]) s1, SubsetEq([$9<SetT(^[^bool,$3<^Type>])> t2, $6<SExpr> u, $6<SExpr> v]) s2, $25<BExpr> rest...})
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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
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
					automaton.rewrite(r0, r24);
					return true;
				}
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// term $19<ForAll($17<^[^{^[^Var(^string),$4<^Type>]...},$13<^$122<BExpr>>]>)>
	public final static int K_ForAll = 33;
	public final static int ForAll(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_ForAll, r1));
	}
	public final static int ForAll(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_ForAll, r1));
	}

	// ForAll([{[Var(^string), $11<Type>] qs...}, $25<BExpr> be])
	private final static class Reduction_75 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_75(Pattern.Term pattern) { super(pattern); }

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
				boolean m2_0 = true;
				for(int i3=0;i3!=c2.size();++i3) {
					int r3 = c2.get(i3);
					Automaton.State s3 = automaton.get(r3);
					Automaton.List l3 = (Automaton.List) s3;
					int r4 = l3.get(0);
					int r5 = l3.get(1);
				}
				if(m2_0) {
					int r4 = l1.get(1);
					int[] state = {r0, r1, r2, 0, r4};
					activations.add(new Activation(this,null,state));
				}
			}
		}

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
			int r0 = state[0];
			Automaton.Collection s2 = (Automaton.Collection) automaton.get(state[2]);
			int[] s2children = new int[s2.size() - 0];
			for(int s2i=0, s2j=0; s2i != s2.size();++s2i) {
				s2children[s2j++] = s2.get(s2i);
			}
			Automaton.Set r3 = new Automaton.Set(s2children);
			int r4 = state[4]; // be
			boolean r5 = Runtime.accepts(type32, automaton, r4, SCHEMA); // be is ^Bool
			Automaton.Int r6 = r3.lengthOf(); // |qs|
			Automaton.Int r7 = new Automaton.Int(0); // 0
			boolean r8 = r6.equals(r7);    // |qs| eq 0
			boolean r9 = r5 || r8;         // be is ^Bool || |qs| eq 0
			if(r9) {
				if(r0 != r4) {
					automaton.rewrite(r0, r4);
					return true;
				}
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// ForAll([{[Var(^string), $11<Type>]...} xs, ForAll([{[Var(^string), $11<Type>]...} ys, $25<BExpr> e])])
	private final static class Reduction_76 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_76(Pattern.Term pattern) { super(pattern); }

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
				boolean m2_0 = true;
				for(int i3=0;i3!=c2.size();++i3) {
					int r3 = c2.get(i3);
					Automaton.State s3 = automaton.get(r3);
					Automaton.List l3 = (Automaton.List) s3;
					int r4 = l3.get(0);
					int r5 = l3.get(1);
				}
				if(m2_0) {
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
						boolean m6_0 = true;
						for(int i7=0;i7!=c6.size();++i7) {
							int r7 = c6.get(i7);
							Automaton.State s7 = automaton.get(r7);
							Automaton.List l7 = (Automaton.List) s7;
							int r8 = l7.get(0);
							int r9 = l7.get(1);
						}
						if(m6_0) {
							int r8 = l5.get(1);
							int[] state = {r0, r1, r2, 0, r4, r5, r6, 0, r8};
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
				automaton.rewrite(r0, r16);
				return true;
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 6; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Not(ForAll([{[Var(^string), $11<Type>]...} vars, $25<BExpr> be]))
	private final static class Reduction_77 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_77(Pattern.Term pattern) { super(pattern); }

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
					boolean m3_0 = true;
					for(int i4=0;i4!=c3.size();++i4) {
						int r4 = c3.get(i4);
						Automaton.State s4 = automaton.get(r4);
						Automaton.List l4 = (Automaton.List) s4;
						int r5 = l4.get(0);
						int r6 = l4.get(1);
					}
					if(m3_0) {
						int r5 = l2.get(1);
						int[] state = {r0, r1, r2, r3, 0, r5};
						activations.add(new Activation(this,null,state));
					}
				}
			}
		}

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
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
				automaton.rewrite(r0, r11);
				return true;
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 4; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// And({Not(SubsetEq([$9<SetT(^[^bool,$3<^Type>])> t1, Set({$14<Expr> w, $14<Expr>...}), $14<Expr> r1])) s, ForAll([{[Var(^string) v, $11<Type>], [Var(^string), $11<Type>]...} vars, Or({And({SubsetEq([$9<SetT(^[^bool,$3<^Type>])> t2, Set({Var(^string) u, $14<Expr>...}), $14<Expr> r2]), $25<BExpr>...}), $25<BExpr>...}) f]), $25<BExpr> rs...})
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
						Automaton.State s2 = automaton.get(r2);
						if(s2.kind == K_Not) {
							Automaton.Term t2 = (Automaton.Term) s2;
							int r4 = t2.contents;
							Automaton.State s4 = automaton.get(r4);
							if(s4.kind == K_SubsetEq) {
								Automaton.Term t4 = (Automaton.Term) s4;
								int r5 = t4.contents;
								Automaton.State s5 = automaton.get(r5);
								Automaton.List l5 = (Automaton.List) s5;
								int r6 = l5.get(0);
								int r7 = l5.get(1);
								Automaton.State s7 = automaton.get(r7);
								if(s7.kind == K_Set) {
									Automaton.Term t7 = (Automaton.Term) s7;
									int r8 = t7.contents;
									Automaton.State s8 = automaton.get(r8);
									Automaton.Collection c8 = (Automaton.Collection) s8;
									if(c8.size() >= 1) {
										for(int r10=0;r10!=c8.size();++r10) {
											int r9 = c8.get(r10);
											int r12 = l5.get(2);
											for(int r14=0;r14!=c1.size();++r14) {
												if(r14 == r3) { continue; }
												int r13 = c1.get(r14);
												Automaton.State s13 = automaton.get(r13);
												if(s13.kind == K_ForAll) {
													Automaton.Term t13 = (Automaton.Term) s13;
													int r15 = t13.contents;
													Automaton.State s15 = automaton.get(r15);
													Automaton.List l15 = (Automaton.List) s15;
													int r16 = l15.get(0);
													Automaton.State s16 = automaton.get(r16);
													Automaton.Collection c16 = (Automaton.Collection) s16;
													if(c16.size() >= 1) {
														for(int r18=0;r18!=c16.size();++r18) {
															int r17 = c16.get(r18);
															Automaton.State s17 = automaton.get(r17);
															Automaton.List l17 = (Automaton.List) s17;
															int r19 = l17.get(0);
															int r20 = l17.get(1);
															boolean m16_1 = true;
															for(int i21=0;i21!=c16.size();++i21) {
																if(i21 == r18) { continue; }
																int r21 = c16.get(i21);
																Automaton.State s21 = automaton.get(r21);
																Automaton.List l21 = (Automaton.List) s21;
																int r22 = l21.get(0);
																int r23 = l21.get(1);
															}
															if(m16_1) {
																int r22 = l15.get(1);
																Automaton.State s22 = automaton.get(r22);
																if(s22.kind == K_Or) {
																	Automaton.Term t22 = (Automaton.Term) s22;
																	int r23 = t22.contents;
																	Automaton.State s23 = automaton.get(r23);
																	Automaton.Collection c23 = (Automaton.Collection) s23;
																	if(c23.size() >= 1) {
																		for(int r25=0;r25!=c23.size();++r25) {
																			int r24 = c23.get(r25);
																			Automaton.State s24 = automaton.get(r24);
																			if(s24.kind == K_And) {
																				Automaton.Term t24 = (Automaton.Term) s24;
																				int r26 = t24.contents;
																				Automaton.State s26 = automaton.get(r26);
																				Automaton.Collection c26 = (Automaton.Collection) s26;
																				if(c26.size() >= 1) {
																					for(int r28=0;r28!=c26.size();++r28) {
																						int r27 = c26.get(r28);
																						Automaton.State s27 = automaton.get(r27);
																						if(s27.kind == K_SubsetEq) {
																							Automaton.Term t27 = (Automaton.Term) s27;
																							int r29 = t27.contents;
																							Automaton.State s29 = automaton.get(r29);
																							Automaton.List l29 = (Automaton.List) s29;
																							int r30 = l29.get(0);
																							int r31 = l29.get(1);
																							Automaton.State s31 = automaton.get(r31);
																							if(s31.kind == K_Set) {
																								Automaton.Term t31 = (Automaton.Term) s31;
																								int r32 = t31.contents;
																								Automaton.State s32 = automaton.get(r32);
																								Automaton.Collection c32 = (Automaton.Collection) s32;
																								if(c32.size() >= 1) {
																									for(int r34=0;r34!=c32.size();++r34) {
																										int r33 = c32.get(r34);
																										if(Runtime.accepts(type31,automaton,automaton.get(r33), SCHEMA)) {
																											int r36 = l29.get(2);
																											int[] state = {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, 0, r12, r13, r14, r15, r16, r17, r18, r19, r20, 0, r22, r23, r24, r25, r26, r27, r28, r29, r30, r31, r32, r33, r34, 0, r36, 0, 0, 0};
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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
			int r0 = state[0];
			int r2 = state[2]; // s
			int r3 = state[3];
			int r6 = state[6]; // t1
			int r9 = state[9]; // w
			int r10 = state[10];
			int r12 = state[12]; // r1
			int r14 = state[14];
			int r16 = state[16]; // vars
			int r18 = state[18];
			int r19 = state[19]; // v
			int r22 = state[22]; // f
			int r25 = state[25];
			int r28 = state[28];
			int r30 = state[30]; // t2
			int r33 = state[33]; // u
			int r34 = state[34];
			int r36 = state[36]; // r2
			Automaton.Collection s1 = (Automaton.Collection) automaton.get(state[1]);
			int[] s1children = new int[s1.size() - 2];
			for(int s1i=0, s1j=0; s1i != s1.size();++s1i) {
				if(s1i == r3 || s1i == r14) { continue; }
				s1children[s1j++] = s1.get(s1i);
			}
			Automaton.Set r39 = new Automaton.Set(s1children);
			boolean r40 = r33 == r19;      // u eq v
			boolean r41 = false;           // u eq v && r1 eq r2
			if(r40) {
				boolean r42 = r12 == r36;      // r1 eq r2
				r41 = r42;
			}
			if(r41) {
				Automaton.List r43 = new Automaton.List(r16, r22); // [varsf]
				int r44 = automaton.add(r43);
				Automaton.Term r45 = new Automaton.Term(K_ForAll, r44);
				int r46 = automaton.add(r45);
				int r47 = automaton.substitute(r22, r19, r9);
				Automaton.Set r48 = new Automaton.Set(r2, r46, r47); // {sForAll([varsf])f[v \ w]}
				Automaton.Set r49 = r48.append(r39); // {sForAll([varsf])f[v \ w]} append rs
				int r50 = automaton.add(r49);
				Automaton.Term r51 = new Automaton.Term(K_And, r50);
				int r52 = automaton.add(r51);
				if(r0 != r52) {
					automaton.rewrite(r0, r52);
					return true;
				}
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// And({Not(SubsetEq([$9<SetT(^[^bool,$3<^Type>])> t1, Set({$14<Expr> w, $14<Expr>...}), $14<Expr> r1])) s, ForAll([{[Var(^string) v, $11<Type>], [Var(^string), $11<Type>]...} vars, Or({SubsetEq([$9<SetT(^[^bool,$3<^Type>])> t2, Set({Var(^string) u, $14<Expr>...}), $14<Expr> r2]), $25<BExpr>...}) f]), $25<BExpr> rs...})
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
							Automaton.State s4 = automaton.get(r4);
							if(s4.kind == K_SubsetEq) {
								Automaton.Term t4 = (Automaton.Term) s4;
								int r5 = t4.contents;
								Automaton.State s5 = automaton.get(r5);
								Automaton.List l5 = (Automaton.List) s5;
								int r6 = l5.get(0);
								int r7 = l5.get(1);
								Automaton.State s7 = automaton.get(r7);
								if(s7.kind == K_Set) {
									Automaton.Term t7 = (Automaton.Term) s7;
									int r8 = t7.contents;
									Automaton.State s8 = automaton.get(r8);
									Automaton.Collection c8 = (Automaton.Collection) s8;
									if(c8.size() >= 1) {
										for(int r10=0;r10!=c8.size();++r10) {
											int r9 = c8.get(r10);
											int r12 = l5.get(2);
											for(int r14=0;r14!=c1.size();++r14) {
												if(r14 == r3) { continue; }
												int r13 = c1.get(r14);
												Automaton.State s13 = automaton.get(r13);
												if(s13.kind == K_ForAll) {
													Automaton.Term t13 = (Automaton.Term) s13;
													int r15 = t13.contents;
													Automaton.State s15 = automaton.get(r15);
													Automaton.List l15 = (Automaton.List) s15;
													int r16 = l15.get(0);
													Automaton.State s16 = automaton.get(r16);
													Automaton.Collection c16 = (Automaton.Collection) s16;
													if(c16.size() >= 1) {
														for(int r18=0;r18!=c16.size();++r18) {
															int r17 = c16.get(r18);
															Automaton.State s17 = automaton.get(r17);
															Automaton.List l17 = (Automaton.List) s17;
															int r19 = l17.get(0);
															int r20 = l17.get(1);
															boolean m16_1 = true;
															for(int i21=0;i21!=c16.size();++i21) {
																if(i21 == r18) { continue; }
																int r21 = c16.get(i21);
																Automaton.State s21 = automaton.get(r21);
																Automaton.List l21 = (Automaton.List) s21;
																int r22 = l21.get(0);
																int r23 = l21.get(1);
															}
															if(m16_1) {
																int r22 = l15.get(1);
																Automaton.State s22 = automaton.get(r22);
																if(s22.kind == K_Or) {
																	Automaton.Term t22 = (Automaton.Term) s22;
																	int r23 = t22.contents;
																	Automaton.State s23 = automaton.get(r23);
																	Automaton.Collection c23 = (Automaton.Collection) s23;
																	if(c23.size() >= 1) {
																		for(int r25=0;r25!=c23.size();++r25) {
																			int r24 = c23.get(r25);
																			Automaton.State s24 = automaton.get(r24);
																			if(s24.kind == K_SubsetEq) {
																				Automaton.Term t24 = (Automaton.Term) s24;
																				int r26 = t24.contents;
																				Automaton.State s26 = automaton.get(r26);
																				Automaton.List l26 = (Automaton.List) s26;
																				int r27 = l26.get(0);
																				int r28 = l26.get(1);
																				Automaton.State s28 = automaton.get(r28);
																				if(s28.kind == K_Set) {
																					Automaton.Term t28 = (Automaton.Term) s28;
																					int r29 = t28.contents;
																					Automaton.State s29 = automaton.get(r29);
																					Automaton.Collection c29 = (Automaton.Collection) s29;
																					if(c29.size() >= 1) {
																						for(int r31=0;r31!=c29.size();++r31) {
																							int r30 = c29.get(r31);
																							if(Runtime.accepts(type31,automaton,automaton.get(r30), SCHEMA)) {
																								int r33 = l26.get(2);
																								int[] state = {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, 0, r12, r13, r14, r15, r16, r17, r18, r19, r20, 0, r22, r23, r24, r25, r26, r27, r28, r29, r30, r31, 0, r33, 0, 0};
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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
			int r0 = state[0];
			int r2 = state[2]; // s
			int r3 = state[3];
			int r6 = state[6]; // t1
			int r9 = state[9]; // w
			int r10 = state[10];
			int r12 = state[12]; // r1
			int r14 = state[14];
			int r16 = state[16]; // vars
			int r18 = state[18];
			int r19 = state[19]; // v
			int r22 = state[22]; // f
			int r25 = state[25];
			int r27 = state[27]; // t2
			int r30 = state[30]; // u
			int r31 = state[31];
			int r33 = state[33]; // r2
			Automaton.Collection s1 = (Automaton.Collection) automaton.get(state[1]);
			int[] s1children = new int[s1.size() - 2];
			for(int s1i=0, s1j=0; s1i != s1.size();++s1i) {
				if(s1i == r3 || s1i == r14) { continue; }
				s1children[s1j++] = s1.get(s1i);
			}
			Automaton.Set r35 = new Automaton.Set(s1children);
			boolean r36 = r30 == r19;      // u eq v
			boolean r37 = false;           // u eq v && r1 eq r2
			if(r36) {
				boolean r38 = r12 == r33;      // r1 eq r2
				r37 = r38;
			}
			if(r37) {
				Automaton.List r39 = new Automaton.List(r16, r22); // [varsf]
				int r40 = automaton.add(r39);
				Automaton.Term r41 = new Automaton.Term(K_ForAll, r40);
				int r42 = automaton.add(r41);
				int r43 = automaton.substitute(r22, r19, r9);
				Automaton.Set r44 = new Automaton.Set(r2, r42, r43); // {sForAll([varsf])f[v \ w]}
				Automaton.Set r45 = r44.append(r35); // {sForAll([varsf])f[v \ w]} append rs
				int r46 = automaton.add(r45);
				Automaton.Term r47 = new Automaton.Term(K_And, r46);
				int r48 = automaton.add(r47);
				if(r0 != r48) {
					automaton.rewrite(r0, r48);
					return true;
				}
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// And({SubsetEq([$9<SetT(^[^bool,$3<^Type>])> t1, Set({$14<Expr> w, $14<Expr>...}), $14<Expr> r1]) s, ForAll([{[Var(^string) v, $11<Type>], [Var(^string), $11<Type>]...} vars, Or({And({Not(SubsetEq([$9<SetT(^[^bool,$3<^Type>])> t2, Set({Var(^string) u, $14<Expr>...}), $14<Expr> r2])), $25<BExpr>...}), $25<BExpr>...}) f]), $25<BExpr> rs...})
	private final static class Inference_8 extends AbstractRewriteRule implements InferenceRule {

		public Inference_8(Pattern.Term pattern) { super(pattern); }

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
							Automaton.State s6 = automaton.get(r6);
							if(s6.kind == K_Set) {
								Automaton.Term t6 = (Automaton.Term) s6;
								int r7 = t6.contents;
								Automaton.State s7 = automaton.get(r7);
								Automaton.Collection c7 = (Automaton.Collection) s7;
								if(c7.size() >= 1) {
									for(int r9=0;r9!=c7.size();++r9) {
										int r8 = c7.get(r9);
										int r11 = l4.get(2);
										for(int r13=0;r13!=c1.size();++r13) {
											if(r13 == r3) { continue; }
											int r12 = c1.get(r13);
											Automaton.State s12 = automaton.get(r12);
											if(s12.kind == K_ForAll) {
												Automaton.Term t12 = (Automaton.Term) s12;
												int r14 = t12.contents;
												Automaton.State s14 = automaton.get(r14);
												Automaton.List l14 = (Automaton.List) s14;
												int r15 = l14.get(0);
												Automaton.State s15 = automaton.get(r15);
												Automaton.Collection c15 = (Automaton.Collection) s15;
												if(c15.size() >= 1) {
													for(int r17=0;r17!=c15.size();++r17) {
														int r16 = c15.get(r17);
														Automaton.State s16 = automaton.get(r16);
														Automaton.List l16 = (Automaton.List) s16;
														int r18 = l16.get(0);
														int r19 = l16.get(1);
														boolean m15_1 = true;
														for(int i20=0;i20!=c15.size();++i20) {
															if(i20 == r17) { continue; }
															int r20 = c15.get(i20);
															Automaton.State s20 = automaton.get(r20);
															Automaton.List l20 = (Automaton.List) s20;
															int r21 = l20.get(0);
															int r22 = l20.get(1);
														}
														if(m15_1) {
															int r21 = l14.get(1);
															Automaton.State s21 = automaton.get(r21);
															if(s21.kind == K_Or) {
																Automaton.Term t21 = (Automaton.Term) s21;
																int r22 = t21.contents;
																Automaton.State s22 = automaton.get(r22);
																Automaton.Collection c22 = (Automaton.Collection) s22;
																if(c22.size() >= 1) {
																	for(int r24=0;r24!=c22.size();++r24) {
																		int r23 = c22.get(r24);
																		Automaton.State s23 = automaton.get(r23);
																		if(s23.kind == K_And) {
																			Automaton.Term t23 = (Automaton.Term) s23;
																			int r25 = t23.contents;
																			Automaton.State s25 = automaton.get(r25);
																			Automaton.Collection c25 = (Automaton.Collection) s25;
																			if(c25.size() >= 1) {
																				for(int r27=0;r27!=c25.size();++r27) {
																					int r26 = c25.get(r27);
																					Automaton.State s26 = automaton.get(r26);
																					if(s26.kind == K_Not) {
																						Automaton.Term t26 = (Automaton.Term) s26;
																						int r28 = t26.contents;
																						Automaton.State s28 = automaton.get(r28);
																						if(s28.kind == K_SubsetEq) {
																							Automaton.Term t28 = (Automaton.Term) s28;
																							int r29 = t28.contents;
																							Automaton.State s29 = automaton.get(r29);
																							Automaton.List l29 = (Automaton.List) s29;
																							int r30 = l29.get(0);
																							int r31 = l29.get(1);
																							Automaton.State s31 = automaton.get(r31);
																							if(s31.kind == K_Set) {
																								Automaton.Term t31 = (Automaton.Term) s31;
																								int r32 = t31.contents;
																								Automaton.State s32 = automaton.get(r32);
																								Automaton.Collection c32 = (Automaton.Collection) s32;
																								if(c32.size() >= 1) {
																									for(int r34=0;r34!=c32.size();++r34) {
																										int r33 = c32.get(r34);
																										if(Runtime.accepts(type31,automaton,automaton.get(r33), SCHEMA)) {
																											int r36 = l29.get(2);
																											int[] state = {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, 0, r11, r12, r13, r14, r15, r16, r17, r18, r19, 0, r21, r22, r23, r24, r25, r26, r27, r28, r29, r30, r31, r32, r33, r34, 0, r36, 0, 0, 0};
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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
			int r0 = state[0];
			int r2 = state[2]; // s
			int r3 = state[3];
			int r5 = state[5]; // t1
			int r8 = state[8]; // w
			int r9 = state[9];
			int r11 = state[11]; // r1
			int r13 = state[13];
			int r15 = state[15]; // vars
			int r17 = state[17];
			int r18 = state[18]; // v
			int r21 = state[21]; // f
			int r24 = state[24];
			int r27 = state[27];
			int r30 = state[30]; // t2
			int r33 = state[33]; // u
			int r34 = state[34];
			int r36 = state[36]; // r2
			Automaton.Collection s1 = (Automaton.Collection) automaton.get(state[1]);
			int[] s1children = new int[s1.size() - 2];
			for(int s1i=0, s1j=0; s1i != s1.size();++s1i) {
				if(s1i == r3 || s1i == r13) { continue; }
				s1children[s1j++] = s1.get(s1i);
			}
			Automaton.Set r39 = new Automaton.Set(s1children);
			boolean r40 = r33 == r18;      // u eq v
			boolean r41 = false;           // u eq v && r1 eq r2
			if(r40) {
				boolean r42 = r11 == r36;      // r1 eq r2
				r41 = r42;
			}
			if(r41) {
				Automaton.List r43 = new Automaton.List(r15, r21); // [varsf]
				int r44 = automaton.add(r43);
				Automaton.Term r45 = new Automaton.Term(K_ForAll, r44);
				int r46 = automaton.add(r45);
				int r47 = automaton.substitute(r21, r18, r8);
				Automaton.Set r48 = new Automaton.Set(r2, r46, r47); // {sForAll([varsf])f[v \ w]}
				Automaton.Set r49 = r48.append(r39); // {sForAll([varsf])f[v \ w]} append rs
				int r50 = automaton.add(r49);
				Automaton.Term r51 = new Automaton.Term(K_And, r50);
				int r52 = automaton.add(r51);
				if(r0 != r52) {
					automaton.rewrite(r0, r52);
					return true;
				}
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// And({SubsetEq([$9<SetT(^[^bool,$3<^Type>])> t1, Set({$14<Expr> w, $14<Expr>...}), $14<Expr> r1]) s, ForAll([{[Var(^string) v, $11<Type>], [Var(^string), $11<Type>]...} vars, Or({Not(SubsetEq([$9<SetT(^[^bool,$3<^Type>])> t2, Set({Var(^string) u, $14<Expr>...}), $14<Expr> r2])), $25<BExpr>...}) f]), $25<BExpr> rs...})
	private final static class Inference_9 extends AbstractRewriteRule implements InferenceRule {

		public Inference_9(Pattern.Term pattern) { super(pattern); }

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
							Automaton.State s6 = automaton.get(r6);
							if(s6.kind == K_Set) {
								Automaton.Term t6 = (Automaton.Term) s6;
								int r7 = t6.contents;
								Automaton.State s7 = automaton.get(r7);
								Automaton.Collection c7 = (Automaton.Collection) s7;
								if(c7.size() >= 1) {
									for(int r9=0;r9!=c7.size();++r9) {
										int r8 = c7.get(r9);
										int r11 = l4.get(2);
										for(int r13=0;r13!=c1.size();++r13) {
											if(r13 == r3) { continue; }
											int r12 = c1.get(r13);
											Automaton.State s12 = automaton.get(r12);
											if(s12.kind == K_ForAll) {
												Automaton.Term t12 = (Automaton.Term) s12;
												int r14 = t12.contents;
												Automaton.State s14 = automaton.get(r14);
												Automaton.List l14 = (Automaton.List) s14;
												int r15 = l14.get(0);
												Automaton.State s15 = automaton.get(r15);
												Automaton.Collection c15 = (Automaton.Collection) s15;
												if(c15.size() >= 1) {
													for(int r17=0;r17!=c15.size();++r17) {
														int r16 = c15.get(r17);
														Automaton.State s16 = automaton.get(r16);
														Automaton.List l16 = (Automaton.List) s16;
														int r18 = l16.get(0);
														int r19 = l16.get(1);
														boolean m15_1 = true;
														for(int i20=0;i20!=c15.size();++i20) {
															if(i20 == r17) { continue; }
															int r20 = c15.get(i20);
															Automaton.State s20 = automaton.get(r20);
															Automaton.List l20 = (Automaton.List) s20;
															int r21 = l20.get(0);
															int r22 = l20.get(1);
														}
														if(m15_1) {
															int r21 = l14.get(1);
															Automaton.State s21 = automaton.get(r21);
															if(s21.kind == K_Or) {
																Automaton.Term t21 = (Automaton.Term) s21;
																int r22 = t21.contents;
																Automaton.State s22 = automaton.get(r22);
																Automaton.Collection c22 = (Automaton.Collection) s22;
																if(c22.size() >= 1) {
																	for(int r24=0;r24!=c22.size();++r24) {
																		int r23 = c22.get(r24);
																		Automaton.State s23 = automaton.get(r23);
																		if(s23.kind == K_Not) {
																			Automaton.Term t23 = (Automaton.Term) s23;
																			int r25 = t23.contents;
																			Automaton.State s25 = automaton.get(r25);
																			if(s25.kind == K_SubsetEq) {
																				Automaton.Term t25 = (Automaton.Term) s25;
																				int r26 = t25.contents;
																				Automaton.State s26 = automaton.get(r26);
																				Automaton.List l26 = (Automaton.List) s26;
																				int r27 = l26.get(0);
																				int r28 = l26.get(1);
																				Automaton.State s28 = automaton.get(r28);
																				if(s28.kind == K_Set) {
																					Automaton.Term t28 = (Automaton.Term) s28;
																					int r29 = t28.contents;
																					Automaton.State s29 = automaton.get(r29);
																					Automaton.Collection c29 = (Automaton.Collection) s29;
																					if(c29.size() >= 1) {
																						for(int r31=0;r31!=c29.size();++r31) {
																							int r30 = c29.get(r31);
																							if(Runtime.accepts(type31,automaton,automaton.get(r30), SCHEMA)) {
																								int r33 = l26.get(2);
																								int[] state = {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, 0, r11, r12, r13, r14, r15, r16, r17, r18, r19, 0, r21, r22, r23, r24, r25, r26, r27, r28, r29, r30, r31, 0, r33, 0, 0};
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

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
			int r0 = state[0];
			int r2 = state[2]; // s
			int r3 = state[3];
			int r5 = state[5]; // t1
			int r8 = state[8]; // w
			int r9 = state[9];
			int r11 = state[11]; // r1
			int r13 = state[13];
			int r15 = state[15]; // vars
			int r17 = state[17];
			int r18 = state[18]; // v
			int r21 = state[21]; // f
			int r24 = state[24];
			int r27 = state[27]; // t2
			int r30 = state[30]; // u
			int r31 = state[31];
			int r33 = state[33]; // r2
			Automaton.Collection s1 = (Automaton.Collection) automaton.get(state[1]);
			int[] s1children = new int[s1.size() - 2];
			for(int s1i=0, s1j=0; s1i != s1.size();++s1i) {
				if(s1i == r3 || s1i == r13) { continue; }
				s1children[s1j++] = s1.get(s1i);
			}
			Automaton.Set r35 = new Automaton.Set(s1children);
			boolean r36 = r30 == r18;      // u eq v
			boolean r37 = false;           // u eq v && r1 eq r2
			if(r36) {
				boolean r38 = r11 == r33;      // r1 eq r2
				r37 = r38;
			}
			if(r37) {
				Automaton.List r39 = new Automaton.List(r15, r21); // [varsf]
				int r40 = automaton.add(r39);
				Automaton.Term r41 = new Automaton.Term(K_ForAll, r40);
				int r42 = automaton.add(r41);
				int r43 = automaton.substitute(r21, r18, r8);
				Automaton.Set r44 = new Automaton.Set(r2, r42, r43); // {sForAll([varsf])f[v \ w]}
				Automaton.Set r45 = r44.append(r35); // {sForAll([varsf])f[v \ w]} append rs
				int r46 = automaton.add(r45);
				Automaton.Term r47 = new Automaton.Term(K_And, r46);
				int r48 = automaton.add(r47);
				if(r0 != r48) {
					automaton.rewrite(r0, r48);
					return true;
				}
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// term $19<Exists($17<^[^{^[^Var(^string),$4<^Type>]...},$13<^$122<BExpr>>]>)>
	public final static int K_Exists = 34;
	public final static int Exists(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_Exists, r1));
	}
	public final static int Exists(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_Exists, r1));
	}

	// Exists([{[Var(^string), $11<Type>] qs...}, $25<BExpr> be])
	private final static class Reduction_78 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_78(Pattern.Term pattern) { super(pattern); }

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
				boolean m2_0 = true;
				for(int i3=0;i3!=c2.size();++i3) {
					int r3 = c2.get(i3);
					Automaton.State s3 = automaton.get(r3);
					Automaton.List l3 = (Automaton.List) s3;
					int r4 = l3.get(0);
					int r5 = l3.get(1);
				}
				if(m2_0) {
					int r4 = l1.get(1);
					int[] state = {r0, r1, r2, 0, r4};
					activations.add(new Activation(this,null,state));
				}
			}
		}

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
			int r0 = state[0];
			Automaton.Collection s2 = (Automaton.Collection) automaton.get(state[2]);
			int[] s2children = new int[s2.size() - 0];
			for(int s2i=0, s2j=0; s2i != s2.size();++s2i) {
				s2children[s2j++] = s2.get(s2i);
			}
			Automaton.Set r3 = new Automaton.Set(s2children);
			int r4 = state[4]; // be
			boolean r5 = Runtime.accepts(type32, automaton, r4, SCHEMA); // be is ^Bool
			Automaton.Int r6 = r3.lengthOf(); // |qs|
			Automaton.Int r7 = new Automaton.Int(0); // 0
			boolean r8 = r6.equals(r7);    // |qs| eq 0
			boolean r9 = r5 || r8;         // be is ^Bool || |qs| eq 0
			if(r9) {
				if(r0 != r4) {
					automaton.rewrite(r0, r4);
					return true;
				}
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Exists([{[Var(^string), $11<Type>]...} xs, Exists([{[Var(^string), $11<Type>]...} ys, $25<BExpr> e])])
	private final static class Reduction_79 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_79(Pattern.Term pattern) { super(pattern); }

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
				boolean m2_0 = true;
				for(int i3=0;i3!=c2.size();++i3) {
					int r3 = c2.get(i3);
					Automaton.State s3 = automaton.get(r3);
					Automaton.List l3 = (Automaton.List) s3;
					int r4 = l3.get(0);
					int r5 = l3.get(1);
				}
				if(m2_0) {
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
						boolean m6_0 = true;
						for(int i7=0;i7!=c6.size();++i7) {
							int r7 = c6.get(i7);
							Automaton.State s7 = automaton.get(r7);
							Automaton.List l7 = (Automaton.List) s7;
							int r8 = l7.get(0);
							int r9 = l7.get(1);
						}
						if(m6_0) {
							int r8 = l5.get(1);
							int[] state = {r0, r1, r2, 0, r4, r5, r6, 0, r8};
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
				automaton.rewrite(r0, r16);
				return true;
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 6; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Not(Exists([{[Var(^string), $11<Type>]...} vars, $25<BExpr> be]))
	private final static class Reduction_80 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_80(Pattern.Term pattern) { super(pattern); }

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
					boolean m3_0 = true;
					for(int i4=0;i4!=c3.size();++i4) {
						int r4 = c3.get(i4);
						Automaton.State s4 = automaton.get(r4);
						Automaton.List l4 = (Automaton.List) s4;
						int r5 = l4.get(0);
						int r6 = l4.get(1);
					}
					if(m3_0) {
						int r5 = l2.get(1);
						int[] state = {r0, r1, r2, r3, 0, r5};
						activations.add(new Activation(this,null,state));
					}
				}
			}
		}

		public final boolean apply(Automaton automaton, Object _state) {
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
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
				automaton.rewrite(r0, r11);
				return true;
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 4; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// And({Exists([{[Var(^string), $11<Type>]...} vs, $25<BExpr> e]), $25<BExpr> es...})
	private final static class Reduction_81 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_81(Pattern.Term pattern) { super(pattern); }

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
							boolean m5_0 = true;
							for(int i6=0;i6!=c5.size();++i6) {
								int r6 = c5.get(i6);
								Automaton.State s6 = automaton.get(r6);
								Automaton.List l6 = (Automaton.List) s6;
								int r7 = l6.get(0);
								int r8 = l6.get(1);
							}
							if(m5_0) {
								int r7 = l4.get(1);
								int[] state = {r0, r1, r2, r3, r4, r5, 0, r7, 0};
								activations.add(new Activation(this,null,state));
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
				automaton.rewrite(r0, r16);
				return true;
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 5; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// =========================================================================
	// Schema
	// =========================================================================

	public static final Schema SCHEMA = new Schema(new Schema.Term[]{
		// $4<NotT($2<^Type>)>
		Schema.Term("NotT",Schema.Or(Schema.Any, Schema.Or(Schema.Term("NotT",Schema.Or(Schema.Term("AnyT"), Schema.Term("VoidT"), Schema.Term("BoolT"), Schema.Term("IntT"), Schema.Term("RealT"), Schema.Term("StringT"), Schema.Term("TupleT",Schema.List(true)), Schema.Term("VarT",Schema.String))), Schema.Any), Schema.Term("OrT",Schema.Set(true)), Schema.Term("AndT",Schema.Any), Schema.Term("SetT",Schema.List(true,Schema.Bool,Schema.Any)), Schema.Term("TupleT",Schema.List(true)), Schema.Term("FunctionT",Schema.List(true,Schema.Any,Schema.Any)))),
		// $7<AndT($5<^{$2<^Type>...}>)>
		Schema.Term("AndT",Schema.Set(true)),
		// $7<OrT($5<^{$2<^Type>...}>)>
		Schema.Term("OrT",Schema.Set(true)),
		// $7<TupleT(^[$2<^Type>...])>
		Schema.Term("TupleT",Schema.List(true)),
		// $9<SetT(^[^bool,$3<^Type>])>
		Schema.Term("SetT",Schema.List(true,Schema.Bool,Schema.Or(Schema.Any, Schema.Or(Schema.Term("NotT",Schema.Or(Schema.Term("AnyT"), Schema.Term("VoidT"), Schema.Term("BoolT"), Schema.Term("IntT"), Schema.Term("RealT"), Schema.Term("StringT"), Schema.Term("TupleT",Schema.List(true)), Schema.Term("VarT",Schema.String))), Schema.Any), Schema.Term("NotT",Schema.Any), Schema.Term("OrT",Schema.Set(true)), Schema.Term("AndT",Schema.Any), Schema.Term("TupleT",Schema.List(true)), Schema.Term("FunctionT",Schema.List(true,Schema.Any,Schema.Any))))),
		// AnyT
		Schema.Term("AnyT"),
		// VoidT
		Schema.Term("VoidT"),
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
		// $8<FunctionT(^[$2<^Type>,$2,$2...])>
		Schema.Term("FunctionT",Schema.List(true,Schema.Or(Schema.Any, Schema.Or(Schema.Term("NotT",Schema.Or(Schema.Term("AnyT"), Schema.Term("VoidT"), Schema.Term("BoolT"), Schema.Term("IntT"), Schema.Term("RealT"), Schema.Term("StringT"), Schema.Term("TupleT",Schema.List(true)), Schema.Term("VarT",Schema.String))), Schema.Any), Schema.Term("NotT",Schema.Any), Schema.Term("OrT",Schema.Set(true)), Schema.Term("AndT",Schema.Any), Schema.Term("SetT",Schema.List(true,Schema.Bool,Schema.Any)), Schema.Term("TupleT",Schema.List(true))),Schema.Any)),
		// True
		Schema.Term("True"),
		// False
		Schema.Term("False"),
		// Num(^real)
		Schema.Term("Num",Schema.Real),
		// Var(^string)
		Schema.Term("Var",Schema.String),
		// $7<Tuple(^[$2<^Expr>...])>
		Schema.Term("Tuple",Schema.List(true)),
		// $9<Load(^[$2<^Expr>,^int])>
		Schema.Term("Load",Schema.List(true,Schema.Or(Schema.Or(Schema.Or(Schema.Or(Schema.Or(Schema.Term("Tuple",Schema.List(true)), Schema.Or(Schema.Term("True"), Schema.Term("False")), Schema.Term("Num",Schema.Real), Schema.Term("String",Schema.String)), Schema.Term("Set",Schema.Set(true))), Schema.Term("Tuple",Schema.List(true)), Schema.Term("Fn",Schema.List(true,Schema.Any)), Schema.Or(Schema.Or(Schema.Or(Schema.Or(Schema.Any, Schema.Or(Schema.Or(Schema.Any, Schema.Any, Schema.Term("Var",Schema.Any)), Schema.Term("LengthOf",Schema.Any)), Schema.Term("And",Schema.Set(true)), Schema.Term("Or",Schema.Any), Schema.Term("Not",Schema.Any), Schema.Term("Equals",Schema.List(true,Schema.Or(Schema.Or(Schema.Term("NotT",Schema.Or(Schema.Term("AnyT"), Schema.Term("VoidT"), Schema.Term("BoolT"), Schema.Term("IntT"), Schema.Term("RealT"), Schema.Term("StringT"), Schema.Term("TupleT",Schema.List(true)), Schema.Term("VarT",Schema.Any))), Schema.Any), Schema.Term("NotT",Schema.Any), Schema.Term("OrT",Schema.Set(true)), Schema.Term("AndT",Schema.Any), Schema.Term("SetT",Schema.List(true,Schema.Bool,Schema.Any)), Schema.Term("TupleT",Schema.List(true)), Schema.Term("FunctionT",Schema.List(true,Schema.Any,Schema.Any))),Schema.Bag(true,Schema.Any,Schema.Any)))), Schema.Or(Schema.Term("Inequality",Schema.List(true,Schema.Or(Schema.Any, Schema.Any),Schema.Or(Schema.Any, Schema.Any, Schema.Term("Sum",Schema.List(true,Schema.Any,Schema.Bag(true))), Schema.Term("Mul",Schema.Any), Schema.Term("Div",Schema.List(true,Schema.Any,Schema.Any))))), Schema.Term("Equation",Schema.Any))), Schema.Term("SubsetEq",Schema.List(true,Schema.Any,Schema.Or(Schema.Any, Schema.Term("Set",Schema.Set(true))),Schema.Any))), Schema.Or(Schema.Term("ForAll",Schema.List(true,Schema.Set(true),Schema.Any)), Schema.Term("Exists",Schema.Any)))), Schema.Any), Schema.Any),Schema.Int)),
		// $4<LengthOf($2<^Expr>)>
		Schema.Term("LengthOf",Schema.Or(Schema.Or(Schema.Or(Schema.Or(Schema.Or(Schema.Term("Tuple",Schema.List(true)), Schema.Or(Schema.Term("True"), Schema.Term("False")), Schema.Term("Num",Schema.Real), Schema.Term("String",Schema.String)), Schema.Term("Set",Schema.Set(true))), Schema.Term("Tuple",Schema.List(true)), Schema.Term("Fn",Schema.List(true,Schema.Any)), Schema.Or(Schema.Or(Schema.Or(Schema.Or(Schema.Any, Schema.Or(Schema.Any, Schema.Or(Schema.Any, Schema.Term("Var",Schema.Any), Schema.Term("Load",Schema.List(true,Schema.Any,Schema.Int)))), Schema.Term("And",Schema.Set(true)), Schema.Term("Or",Schema.Any), Schema.Term("Not",Schema.Any), Schema.Term("Equals",Schema.List(true,Schema.Or(Schema.Or(Schema.Term("NotT",Schema.Or(Schema.Term("AnyT"), Schema.Term("VoidT"), Schema.Term("BoolT"), Schema.Term("IntT"), Schema.Term("RealT"), Schema.Term("StringT"), Schema.Term("TupleT",Schema.List(true)), Schema.Term("VarT",Schema.Any))), Schema.Any), Schema.Term("NotT",Schema.Any), Schema.Term("OrT",Schema.Set(true)), Schema.Term("AndT",Schema.Any), Schema.Term("SetT",Schema.List(true,Schema.Bool,Schema.Any)), Schema.Term("TupleT",Schema.List(true)), Schema.Term("FunctionT",Schema.List(true,Schema.Any,Schema.Any))),Schema.Bag(true,Schema.Any,Schema.Any)))), Schema.Or(Schema.Term("Inequality",Schema.List(true,Schema.Or(Schema.Any, Schema.Any),Schema.Or(Schema.Any, Schema.Any, Schema.Term("Sum",Schema.List(true,Schema.Any,Schema.Bag(true))), Schema.Term("Mul",Schema.Any), Schema.Term("Div",Schema.List(true,Schema.Any,Schema.Any))))), Schema.Term("Equation",Schema.Any))), Schema.Term("SubsetEq",Schema.List(true,Schema.Any,Schema.Or(Schema.Any, Schema.Term("Set",Schema.Set(true))),Schema.Any))), Schema.Or(Schema.Term("ForAll",Schema.List(true,Schema.Set(true),Schema.Any)), Schema.Term("Exists",Schema.Any)))), Schema.Any), Schema.Any)),
		// $9<Fn(^[^string,$3<^Expr>...])>
		Schema.Term("Fn",Schema.List(true,Schema.String)),
		// String(^string)
		Schema.Term("String",Schema.String),
		// $4<Not($2<^$28<BExpr>>)>
		Schema.Term("Not",Schema.Or(Schema.Or(Schema.Or(Schema.Or(Schema.Any, Schema.Or(Schema.Or(Schema.Term("Var",Schema.String), Schema.Term("Fn",Schema.List(true,Schema.Any)), Schema.Term("Load",Schema.List(true,Schema.Or(Schema.Or(Schema.Or(Schema.Any, Schema.Any, Schema.Or(Schema.Or(Schema.Term("Tuple",Schema.List(true)), Schema.Or(Schema.Term("True"), Schema.Term("False")), Schema.Term("Num",Schema.Real), Schema.Term("String",Schema.Any)), Schema.Term("Set",Schema.Set(true))), Schema.Term("Tuple",Schema.List(true))), Schema.Or(Schema.Any, Schema.Any, Schema.Term("Sum",Schema.List(true,Schema.Any,Schema.Bag(true))), Schema.Term("Mul",Schema.Any), Schema.Term("Div",Schema.List(true,Schema.Any,Schema.Any)))), Schema.Or(Schema.Any, Schema.Term("Set",Schema.Set(true)))),Schema.Int))), Schema.Term("LengthOf",Schema.Any)), Schema.Any, Schema.Term("And",Schema.Set(true)), Schema.Term("Or",Schema.Any), Schema.Term("Equals",Schema.List(true,Schema.Or(Schema.Or(Schema.Term("NotT",Schema.Or(Schema.Term("AnyT"), Schema.Term("VoidT"), Schema.Term("BoolT"), Schema.Term("IntT"), Schema.Term("RealT"), Schema.Term("StringT"), Schema.Term("TupleT",Schema.List(true)), Schema.Term("VarT",Schema.Any))), Schema.Any), Schema.Term("NotT",Schema.Any), Schema.Term("OrT",Schema.Set(true)), Schema.Term("AndT",Schema.Any), Schema.Term("SetT",Schema.List(true,Schema.Bool,Schema.Any)), Schema.Term("TupleT",Schema.List(true)), Schema.Term("FunctionT",Schema.List(true,Schema.Any,Schema.Any))),Schema.Bag(true,Schema.Any,Schema.Any)))), Schema.Or(Schema.Term("Inequality",Schema.List(true,Schema.Or(Schema.Any, Schema.Any),Schema.Any)), Schema.Term("Equation",Schema.Any))), Schema.Term("SubsetEq",Schema.List(true,Schema.Any,Schema.Any,Schema.Any))), Schema.Or(Schema.Term("ForAll",Schema.List(true,Schema.Set(true),Schema.Any)), Schema.Term("Exists",Schema.Any)))),
		// $7<And($5<^{$2<^$31<BExpr>>...}>)>
		Schema.Term("And",Schema.Set(true)),
		// $7<Or($5<^{$2<^$31<BExpr>>...}>)>
		Schema.Term("Or",Schema.Set(true)),
		// $14<Equals(^[$2<^Type>,^{|$4<^Expr>,$4|}[$4<^Expr>,$4]])>
		Schema.Term("Equals",Schema.List(true,Schema.Or(Schema.Or(Schema.Term("NotT",Schema.Or(Schema.Term("AnyT"), Schema.Term("VoidT"), Schema.Term("BoolT"), Schema.Term("IntT"), Schema.Term("RealT"), Schema.Term("StringT"), Schema.Term("TupleT",Schema.List(true)), Schema.Term("VarT",Schema.String))), Schema.Any), Schema.Term("NotT",Schema.Any), Schema.Term("OrT",Schema.Set(true)), Schema.Term("AndT",Schema.Any), Schema.Term("SetT",Schema.List(true,Schema.Bool,Schema.Any)), Schema.Term("TupleT",Schema.List(true)), Schema.Term("FunctionT",Schema.List(true,Schema.Any,Schema.Any))),Schema.Bag(true,Schema.Or(Schema.Or(Schema.Or(Schema.Or(Schema.Or(Schema.Term("Tuple",Schema.List(true)), Schema.Or(Schema.Term("True"), Schema.Term("False")), Schema.Term("Num",Schema.Real), Schema.Term("String",Schema.Any)), Schema.Term("Set",Schema.Set(true))), Schema.Term("Tuple",Schema.List(true)), Schema.Term("Fn",Schema.List(true,Schema.Any)), Schema.Or(Schema.Or(Schema.Or(Schema.Or(Schema.Any, Schema.Any, Schema.Or(Schema.Or(Schema.Any, Schema.Term("Var",Schema.Any), Schema.Term("Load",Schema.List(true,Schema.Any,Schema.Int))), Schema.Term("LengthOf",Schema.Any)), Schema.Term("And",Schema.Set(true)), Schema.Term("Or",Schema.Any), Schema.Term("Not",Schema.Any)), Schema.Or(Schema.Term("Inequality",Schema.List(true,Schema.Or(Schema.Any, Schema.Any),Schema.Or(Schema.Any, Schema.Any, Schema.Term("Sum",Schema.List(true,Schema.Any,Schema.Bag(true))), Schema.Term("Mul",Schema.Any), Schema.Term("Div",Schema.List(true,Schema.Any,Schema.Any))))), Schema.Term("Equation",Schema.Any))), Schema.Term("SubsetEq",Schema.List(true,Schema.Any,Schema.Or(Schema.Any, Schema.Term("Set",Schema.Set(true))),Schema.Any))), Schema.Or(Schema.Term("ForAll",Schema.List(true,Schema.Set(true),Schema.Any)), Schema.Term("Exists",Schema.Any)))), Schema.Any), Schema.Any),Schema.Any))),
		// $12<Mul($10<^[^real,^{|$3<^$20<AExpr>>...|}[$3<^$20<AExpr>>...]]>)>
		Schema.Term("Mul",Schema.List(true,Schema.Real,Schema.Bag(true))),
		// $8<Div(^[$2<^$16<AExpr>>,$2])>
		Schema.Term("Div",Schema.List(true,Schema.Or(Schema.Any, Schema.Term("Num",Schema.Real), Schema.Term("Sum",Schema.List(true,Schema.Any,Schema.Bag(true))), Schema.Term("Mul",Schema.Any), Schema.Or(Schema.Or(Schema.Term("Var",Schema.String), Schema.Term("Fn",Schema.List(true,Schema.Any)), Schema.Term("Load",Schema.List(true,Schema.Or(Schema.Or(Schema.Any, Schema.Or(Schema.Any, Schema.Or(Schema.Or(Schema.Any, Schema.Term("Tuple",Schema.List(true)), Schema.Or(Schema.Term("True"), Schema.Term("False")), Schema.Term("String",Schema.Any)), Schema.Term("Set",Schema.Set(true))), Schema.Term("Tuple",Schema.List(true)), Schema.Or(Schema.Or(Schema.Or(Schema.Or(Schema.Any, Schema.Any, Schema.Term("And",Schema.Set(true)), Schema.Term("Or",Schema.Any), Schema.Term("Not",Schema.Any), Schema.Term("Equals",Schema.List(true,Schema.Or(Schema.Or(Schema.Term("NotT",Schema.Or(Schema.Term("AnyT"), Schema.Term("VoidT"), Schema.Term("BoolT"), Schema.Term("IntT"), Schema.Term("RealT"), Schema.Term("StringT"), Schema.Term("TupleT",Schema.List(true)), Schema.Term("VarT",Schema.Any))), Schema.Any), Schema.Term("NotT",Schema.Any), Schema.Term("OrT",Schema.Set(true)), Schema.Term("AndT",Schema.Any), Schema.Term("SetT",Schema.List(true,Schema.Bool,Schema.Any)), Schema.Term("TupleT",Schema.List(true)), Schema.Term("FunctionT",Schema.List(true,Schema.Any,Schema.Any))),Schema.Bag(true,Schema.Any,Schema.Any)))), Schema.Or(Schema.Term("Inequality",Schema.List(true,Schema.Or(Schema.Any, Schema.Any),Schema.Any)), Schema.Term("Equation",Schema.Any))), Schema.Term("SubsetEq",Schema.List(true,Schema.Any,Schema.Or(Schema.Any, Schema.Term("Set",Schema.Set(true))),Schema.Any))), Schema.Or(Schema.Term("ForAll",Schema.List(true,Schema.Set(true),Schema.Any)), Schema.Term("Exists",Schema.Any))))), Schema.Any),Schema.Int))), Schema.Term("LengthOf",Schema.Any))),Schema.Any)),
		// $12<Sum($10<^[^real,^{|$3<^$20<AExpr>>...|}[$3<^$20<AExpr>>...]]>)>
		Schema.Term("Sum",Schema.List(true,Schema.Real,Schema.Bag(true))),
		// $10<Equation($8<^[^AType,$4<^$29<AExpr>>]>)>
		Schema.Term("Equation",Schema.List(true,Schema.Or(Schema.Term("IntT"), Schema.Term("RealT")),Schema.Or(Schema.Term("Num",Schema.Real), Schema.Term("Sum",Schema.List(true,Schema.Any,Schema.Bag(true))), Schema.Term("Mul",Schema.Any), Schema.Term("Div",Schema.List(true,Schema.Any,Schema.Any)), Schema.Or(Schema.Or(Schema.Term("Var",Schema.String), Schema.Term("Fn",Schema.List(true,Schema.Any)), Schema.Term("Load",Schema.List(true,Schema.Or(Schema.Or(Schema.Any, Schema.Or(Schema.Any, Schema.Or(Schema.Or(Schema.Any, Schema.Term("Tuple",Schema.List(true)), Schema.Or(Schema.Term("True"), Schema.Term("False")), Schema.Term("String",Schema.Any)), Schema.Term("Set",Schema.Set(true))), Schema.Term("Tuple",Schema.List(true)), Schema.Or(Schema.Or(Schema.Or(Schema.Or(Schema.Any, Schema.Any, Schema.Term("And",Schema.Set(true)), Schema.Term("Or",Schema.Any), Schema.Term("Not",Schema.Any), Schema.Term("Equals",Schema.List(true,Schema.Or(Schema.Or(Schema.Term("NotT",Schema.Or(Schema.Any, Schema.Any, Schema.Term("AnyT"), Schema.Term("VoidT"), Schema.Term("BoolT"), Schema.Term("StringT"), Schema.Term("TupleT",Schema.List(true)), Schema.Term("VarT",Schema.Any))), Schema.Any), Schema.Term("NotT",Schema.Any), Schema.Term("OrT",Schema.Set(true)), Schema.Term("AndT",Schema.Any), Schema.Term("SetT",Schema.List(true,Schema.Bool,Schema.Any)), Schema.Term("TupleT",Schema.List(true)), Schema.Term("FunctionT",Schema.List(true,Schema.Any,Schema.Any))),Schema.Bag(true,Schema.Any,Schema.Any)))), Schema.Or(Schema.Any, Schema.Term("Inequality",Schema.Any))), Schema.Term("SubsetEq",Schema.List(true,Schema.Any,Schema.Or(Schema.Any, Schema.Term("Set",Schema.Set(true))),Schema.Any))), Schema.Or(Schema.Term("ForAll",Schema.List(true,Schema.Set(true),Schema.Any)), Schema.Term("Exists",Schema.Any))))), Schema.Any),Schema.Int))), Schema.Term("LengthOf",Schema.Any))))),
		// $10<Inequality($8<^[^AType,$4<^$29<AExpr>>]>)>
		Schema.Term("Inequality",Schema.List(true,Schema.Or(Schema.Term("IntT"), Schema.Term("RealT")),Schema.Or(Schema.Term("Num",Schema.Real), Schema.Term("Sum",Schema.List(true,Schema.Any,Schema.Bag(true))), Schema.Term("Mul",Schema.Any), Schema.Term("Div",Schema.List(true,Schema.Any,Schema.Any)), Schema.Or(Schema.Or(Schema.Term("Var",Schema.String), Schema.Term("Fn",Schema.List(true,Schema.Any)), Schema.Term("Load",Schema.List(true,Schema.Or(Schema.Or(Schema.Any, Schema.Or(Schema.Any, Schema.Or(Schema.Or(Schema.Any, Schema.Term("Tuple",Schema.List(true)), Schema.Or(Schema.Term("True"), Schema.Term("False")), Schema.Term("String",Schema.Any)), Schema.Term("Set",Schema.Set(true))), Schema.Term("Tuple",Schema.List(true)), Schema.Or(Schema.Or(Schema.Or(Schema.Or(Schema.Any, Schema.Any, Schema.Term("And",Schema.Set(true)), Schema.Term("Or",Schema.Any), Schema.Term("Not",Schema.Any), Schema.Term("Equals",Schema.List(true,Schema.Or(Schema.Or(Schema.Term("NotT",Schema.Or(Schema.Any, Schema.Any, Schema.Term("AnyT"), Schema.Term("VoidT"), Schema.Term("BoolT"), Schema.Term("StringT"), Schema.Term("TupleT",Schema.List(true)), Schema.Term("VarT",Schema.Any))), Schema.Any), Schema.Term("NotT",Schema.Any), Schema.Term("OrT",Schema.Set(true)), Schema.Term("AndT",Schema.Any), Schema.Term("SetT",Schema.List(true,Schema.Bool,Schema.Any)), Schema.Term("TupleT",Schema.List(true)), Schema.Term("FunctionT",Schema.List(true,Schema.Any,Schema.Any))),Schema.Bag(true,Schema.Any,Schema.Any)))), Schema.Or(Schema.Any, Schema.Term("Equation",Schema.Any))), Schema.Term("SubsetEq",Schema.List(true,Schema.Any,Schema.Or(Schema.Any, Schema.Term("Set",Schema.Set(true))),Schema.Any))), Schema.Or(Schema.Term("ForAll",Schema.List(true,Schema.Set(true),Schema.Any)), Schema.Term("Exists",Schema.Any))))), Schema.Any),Schema.Int))), Schema.Term("LengthOf",Schema.Any))))),
		// $7<Set(^{$2<^Expr>...})>
		Schema.Term("Set",Schema.Set(true)),
		// $10<SubsetEq(^[^$19<SetT(^[^bool,$13<^Type>])>,^$94<SExpr>,^$94])>
		Schema.Term("SubsetEq",Schema.List(true,Schema.Term("SetT",Schema.List(true,Schema.Bool,Schema.Or(Schema.Any, Schema.Or(Schema.Term("NotT",Schema.Or(Schema.Term("AnyT"), Schema.Term("VoidT"), Schema.Term("BoolT"), Schema.Term("IntT"), Schema.Term("RealT"), Schema.Term("StringT"), Schema.Term("TupleT",Schema.List(true)), Schema.Term("VarT",Schema.String))), Schema.Any), Schema.Term("NotT",Schema.Any), Schema.Term("OrT",Schema.Set(true)), Schema.Term("AndT",Schema.Any), Schema.Term("TupleT",Schema.List(true)), Schema.Term("FunctionT",Schema.List(true,Schema.Any,Schema.Any))))),Schema.Or(Schema.Or(Schema.Or(Schema.Term("Var",Schema.Any), Schema.Term("Fn",Schema.List(true,Schema.Any)), Schema.Term("Load",Schema.List(true,Schema.Or(Schema.Any, Schema.Or(Schema.Or(Schema.Any, Schema.Or(Schema.Or(Schema.Term("Tuple",Schema.List(true)), Schema.Or(Schema.Term("True"), Schema.Term("False")), Schema.Term("Num",Schema.Real), Schema.Term("String",Schema.Any)), Schema.Term("Set",Schema.Set(true))), Schema.Term("Tuple",Schema.List(true)), Schema.Or(Schema.Or(Schema.Any, Schema.Or(Schema.Or(Schema.Any, Schema.Any, Schema.Term("And",Schema.Set(true)), Schema.Term("Or",Schema.Any), Schema.Term("Not",Schema.Any), Schema.Term("Equals",Schema.List(true,Schema.Any,Schema.Bag(true,Schema.Any,Schema.Any)))), Schema.Or(Schema.Term("Inequality",Schema.List(true,Schema.Or(Schema.Any, Schema.Any),Schema.Or(Schema.Any, Schema.Any, Schema.Term("Sum",Schema.List(true,Schema.Any,Schema.Bag(true))), Schema.Term("Mul",Schema.Any), Schema.Term("Div",Schema.List(true,Schema.Any,Schema.Any))))), Schema.Term("Equation",Schema.Any)))), Schema.Or(Schema.Term("ForAll",Schema.List(true,Schema.Set(true),Schema.Any)), Schema.Term("Exists",Schema.Any)))), Schema.Any)),Schema.Int))), Schema.Term("LengthOf",Schema.Any)), Schema.Term("Set",Schema.Set(true))),Schema.Any)),
		// $19<ForAll($17<^[^{^[^Var(^string),$4<^Type>]...},$13<^$122<BExpr>>]>)>
		Schema.Term("ForAll",Schema.List(true,Schema.Set(true),Schema.Or(Schema.Or(Schema.Or(Schema.Or(Schema.Or(Schema.Or(Schema.Term("Var",Schema.String), Schema.Term("Fn",Schema.List(true,Schema.Any)), Schema.Term("Load",Schema.List(true,Schema.Or(Schema.Or(Schema.Or(Schema.Any, Schema.Any, Schema.Or(Schema.Or(Schema.Term("Tuple",Schema.List(true)), Schema.Or(Schema.Term("True"), Schema.Term("False")), Schema.Term("Num",Schema.Real), Schema.Term("String",Schema.Any)), Schema.Term("Set",Schema.Set(true))), Schema.Term("Tuple",Schema.List(true))), Schema.Or(Schema.Any, Schema.Any, Schema.Term("Sum",Schema.List(true,Schema.Any,Schema.Bag(true))), Schema.Term("Mul",Schema.Any), Schema.Term("Div",Schema.List(true,Schema.Any,Schema.Any)))), Schema.Or(Schema.Any, Schema.Term("Set",Schema.Set(true)))),Schema.Int))), Schema.Term("LengthOf",Schema.Any)), Schema.Any, Schema.Term("And",Schema.Set(true)), Schema.Term("Or",Schema.Any), Schema.Term("Not",Schema.Any), Schema.Term("Equals",Schema.List(true,Schema.Or(Schema.Or(Schema.Term("NotT",Schema.Or(Schema.Term("AnyT"), Schema.Term("VoidT"), Schema.Term("BoolT"), Schema.Term("IntT"), Schema.Term("RealT"), Schema.Term("StringT"), Schema.Term("TupleT",Schema.List(true)), Schema.Term("VarT",Schema.Any))), Schema.Any), Schema.Term("NotT",Schema.Any), Schema.Term("OrT",Schema.Set(true)), Schema.Term("AndT",Schema.Any), Schema.Term("SetT",Schema.List(true,Schema.Bool,Schema.Any)), Schema.Term("TupleT",Schema.List(true)), Schema.Term("FunctionT",Schema.List(true,Schema.Any,Schema.Any))),Schema.Bag(true,Schema.Any,Schema.Any)))), Schema.Or(Schema.Term("Inequality",Schema.List(true,Schema.Or(Schema.Any, Schema.Any),Schema.Any)), Schema.Term("Equation",Schema.Any))), Schema.Term("SubsetEq",Schema.List(true,Schema.Any,Schema.Any,Schema.Any))), Schema.Or(Schema.Any, Schema.Term("Exists",Schema.Any))))),
		// $19<Exists($17<^[^{^[^Var(^string),$4<^Type>]...},$13<^$122<BExpr>>]>)>
		Schema.Term("Exists",Schema.List(true,Schema.Set(true),Schema.Or(Schema.Or(Schema.Or(Schema.Or(Schema.Or(Schema.Or(Schema.Term("Var",Schema.String), Schema.Term("Fn",Schema.List(true,Schema.Any)), Schema.Term("Load",Schema.List(true,Schema.Or(Schema.Or(Schema.Or(Schema.Any, Schema.Any, Schema.Or(Schema.Or(Schema.Term("Tuple",Schema.List(true)), Schema.Or(Schema.Term("True"), Schema.Term("False")), Schema.Term("Num",Schema.Real), Schema.Term("String",Schema.Any)), Schema.Term("Set",Schema.Set(true))), Schema.Term("Tuple",Schema.List(true))), Schema.Or(Schema.Any, Schema.Any, Schema.Term("Sum",Schema.List(true,Schema.Any,Schema.Bag(true))), Schema.Term("Mul",Schema.Any), Schema.Term("Div",Schema.List(true,Schema.Any,Schema.Any)))), Schema.Or(Schema.Any, Schema.Term("Set",Schema.Set(true)))),Schema.Int))), Schema.Term("LengthOf",Schema.Any)), Schema.Any, Schema.Term("And",Schema.Set(true)), Schema.Term("Or",Schema.Any), Schema.Term("Not",Schema.Any), Schema.Term("Equals",Schema.List(true,Schema.Or(Schema.Or(Schema.Term("NotT",Schema.Or(Schema.Term("AnyT"), Schema.Term("VoidT"), Schema.Term("BoolT"), Schema.Term("IntT"), Schema.Term("RealT"), Schema.Term("StringT"), Schema.Term("TupleT",Schema.List(true)), Schema.Term("VarT",Schema.Any))), Schema.Any), Schema.Term("NotT",Schema.Any), Schema.Term("OrT",Schema.Set(true)), Schema.Term("AndT",Schema.Any), Schema.Term("SetT",Schema.List(true,Schema.Bool,Schema.Any)), Schema.Term("TupleT",Schema.List(true)), Schema.Term("FunctionT",Schema.List(true,Schema.Any,Schema.Any))),Schema.Bag(true,Schema.Any,Schema.Any)))), Schema.Or(Schema.Term("Inequality",Schema.List(true,Schema.Or(Schema.Any, Schema.Any),Schema.Any)), Schema.Term("Equation",Schema.Any))), Schema.Term("SubsetEq",Schema.List(true,Schema.Any,Schema.Any,Schema.Any))), Schema.Or(Schema.Any, Schema.Term("ForAll",Schema.Any)))))
	});

	// =========================================================================
	// Types
	// =========================================================================

	// AnyT
	private static Type type0 = Runtime.Type("2G0tLTJCWDggIk2");
	// VoidT
	private static Type type1 = Runtime.Type("2KLxLPZGp3ukmD0E");
	// $11<Type>
	private static Type type2 = Runtime.Type("U53GKTkK5G0GrQhGZIjG6KowZRJGJFiG5K3CKOoG4OJK6RgK5KJ55KbQYGMPjt5Klppb0fWfGjWm0ql59CXDAp1IZ0_RjGrQid1bl7ww3AN4HLR5Qcp7vgKARGJFi_6KIs4AUG_Kj_5OJCGPgc5K1xqQgGp3glHQ3_ZQoGp3jl1TJ8KOWl5KIc6AvGrJo8MPiS5KIo6AyCmIgZ2XW985YVZX0AA53OKNmG_9OBHYWY0AE505chaQtlrUB5N5QZOBXIP5hgOcHIYkIb0AT5YoOgmAc5eZPBHEe5ggPBXEe5goPc16YwPoOBH6s5tZQcXil7zgQk1jl7S5gZYjW9z5YV3m0A86YoOoOBHblmGDB6eoRBHHD6gwR3Cx");
	// bool
	private static Type type3 = Runtime.Type("Fk0");
	// $33<Proton>
	private static Type type4 = Runtime.Type("9G5Jmx5Sjt5G0tLTJClDgk2KLxLPZGp3ykmEJ8oQjl5KIZ3A9GJHiG6KIk3ACG_J_45QJClIgV4SIGbRdtqOJCWLgg4OJK6RgK5Kegr7TlHDUd1PYoKPgc5GL4aRJdH5YkLQgsLVGE7hZIOlpPjh0TYcIThcMg6");
	// ^AnyT
	private static Type type5 = Runtime.Type("3G0tLTJCWDggY9w3x$");
	// $14<Expr>
	private static Type type6 = Runtime.Type("iH3K3Tk86KL45QpK5KJK6RgK585t5K1K3Tk8MFxhPZQZTglEJ4JGs0bRWVoyn59GpJ4W6Rm4mHuHQoo7usJAEGZFjx5QosJShGqJo8MPiSa9xC1MgZIMesp7ww4Ac4JPE5P5S5Qc5CIK5SYkp9joa9iC1Qjl1TWgLTQcr7vgMAwG3KmKMOIs6AzG_GWlqR_CGX0A95WVNgNg0Yl7OpNoXYW9PBXLN5gZOcH5Ygpa0AR5eVp7T5gZnbW9c5YkIe0Ae5IgOBXb0fGDh5esPBHEj5gVQF_K4W6RmGIFiG58E86CDx5SZKJRp45Qn4qYWylaHbmbmim5z5Z58tLOlKMNg_5StGNJJRp45SdxaQWVys8hlmG776B6QoRFNBKSXCMOoKJRWsRs9h0q0O5xaR0l5QZK3TdC6Sn4Hroro5R6WZSoSgWrl7ywSo1u0CL4aR3loQWGLBt5w6A9QkTFNkJOiS5ScxZOWoTocglvl7u5s6hZUBXula0Av6egl7T5x6YoWzGDz6eVcBmuGX1A99YsTsOk1YX9d6YscgmAE9eVdBmiGa1AP9YkQZdk1bm7x5D9gsdF3Kt0MOesg7XbWbl7SceVneX9g9YZeoeBH6i9twec1im7y5t9gcfFJFoxLQ3toQoG4CE86K34ZQZG4GIK5SJG5Kp06Q_G4_WGptqNo_qQiGKRTATDfDhDwD8EEEQggB1e1nHACAZ0_RjGrQid1bn7x9NAgZh3Xq1bn5QAYkfkhoHr1G0tLTJClr1AcAJOpQdG5KIcikmu1K1xqQgGp3hAgsiFJHiG6KIVjkHy1KHKLNgGp3vAgkjFrJo8MPiS5KIsjkmzm7NAgZIXY99DYZggsk1Y2GL4aRJCXYna0AED05dAgAjAuAxA7DCDNDQZtBmnXaIAQDYofZekHbn7d9fwmbY9cDYsfZukXen7z9dDgkuc16YsuZeBH6jDtVvcHin77AuDggvBHe1AtovcXjn78AzDgVwBHeHem7d99Etgwc1nn79ACEgswFKFJ_6R_d1vY9vEYZxcxBH6QEtkxcHrn786TEgwx3XyHzm5dEYVxcyomu2CIKMQooJSgG2GdOMJP5u6BHDHRHQVzBHHtEhczBXqn9skzcHzn7N5yEYolzID7HeZ7CHvYX3AAHYsyc7lHYo7PEPEYolYJDNHeZ8CmvYa3AQHYcRsxkHbZ9wDecACnb3e3eo7SZ9_YeZ9fHYwRk9lHfJ7u6zHQw9C1IsHhZACXbl9jgAd1jo7gpAlXjZ9w6YVB_eBH68ItcBdmmo7BIfwHnZ9DIYwBtcBH6NItZCdXqo7P6QIgkCCmqlq3ATI0LE");
	// int
	private static Type type7 = Runtime.Type("Fg0");
	// $10<VExpr>
	private static Type type8 = Runtime.Type("iHJOKGs0bRoNKNmGXGiG3Ij45OlwoMSIQs2W0I_tqOoWqIa4mEUIQZo7ucJAAdH5YgIIgs3G4W6Rmd1UIoo7OdKDQd1MYkIMgs4KL45QpK5KJK6RgK5K1K3Tk8MFU_PoRkUglPJ4JGs0bRWkaun5iGpJ4W6Rm4mQdHQZr7NdMAvGZFjx5QosJShGqJo8MPiSa9d5YVNkHD85ecNBHPA5gkN3JYliWj0ml5D5oBKOoC1Xl9jZOcXal7N5Q5gkO3mYGbl5T5YVqbGAc53G_RpKq3e5ggPF_GWlqR_CGf0Ai5WkPwPg0il7x_QoXiW9PBXUw5goQBmUClmjl7OlHD86ecRBHPA6gkRFIFiG58E86CDx5SZKJRp45Qn45Iv599B9D9e9QcSFPZZQ_4MSWlLPo_6WGGlKMNo_qQi4mnIYo5T6WgSwSg0u0WlJp8qR_GMGl4HuGbo5f6ZOoQm43QgGLGs_qRoCM7BIDIQwT31v0yl5t6YcayGAv6ekUBHzl9jsUcmzl7D679gZcBmn0X1AA9YVSoUkHY1GJ_6R_dHjX7O_p7SZdVYaX9Q9YVdkdBH6S9tsdcmbm7O6c9gZeFJFoxLQ3toQoG4CE86K34ZQZG4GIK5SJG5Kp06Q_G4_WGptqNo_qQiGKRCACDPDRDfDsDyDQcfBmYmiHAw9Z0_RjGrQidmXn7g9z9gVg3HmmXn59AYgeggo1n1G0tLTJCWn1AEAJOpQdG5KIZhkXq1K1xqQgGp3RAgohFJHiG6KIwhk1u1KHKLNgGp3eAggiFrJo8MPiS5KIoikXvm7z9gZ2yX9tAYVfcjkmy1GL4aRJCHzHIgsj3NVhghshZikiwikjwjg0Xn7y98DhcsB1f1a1ABDYVdgmADDewsBHf1a2AODYseVtkmaY9RBHb2am7SstZnbY9cDYweZukXen7N9gZ2fY9hDYVfsukmfn7N9N9YVdZvZYiY9vDYZfkvkHj2K0GKTkKa9QEecyB1mImn7ScwZnmY9BEYkSowkXnI7dAgAQVxBmjIqIAPEoBKShGIIpl5C3_aSGlZjlyIznXo5UEYo5uIAdEYZwg1DfEekyB1jGvn7SsyZnvY9sEYkxZzkXyn7SEtEgkzBHmImn7SszZnzY97HYsxZ7lXXo7S6CEgk7dmeY9dHns7x7x7CH6NHtZ8dXao7e6QHgk841IiHQs8C1TUHhV9CHLfwXeZ9fHYVOk9lHfZ9ECmf3am7SVA_IiZ9uHYgAhmAwHeoACXjJzl7SwA_2mZ98IYoTcBlmmo7i69IgoBdm5YZpno7SVC_IqZ9PIYonq3ARIYVJLgsC4Bx");
	// $7<Tuple(^[$2<^Expr>...])>
	private static Type type9 = Runtime.Type("iHJGKSklLO3K3Tk8b9TC1EgZIEesn7uw2A7G_KWlLS_GXGiG_F4W6Rm4JHA5t5d6Qo3K0K3Tk8M7Dhzg0LJCKGs0bRWZ_io5QCmDRpHM38oQjl5CDKMQZC4Sm_aQbdmXl7elHDfd1QYcIQgsLFjpOVPgPg0ToBKOoCXPfwmTekr7up6Ay4HTzh0Xl79_NoXX0GJ8MS_C0Y0AC5JOJNgCMOIwNk1aG7D5O5QcOBmMQ5hkOcX5YVab0AU5eZl7d_PkXel3d5Yk2fGDh5esPBmHj5gVQF_K4W6RmGIFiG58E86CDx5SZKJRp45Qn4LbWylaHbmbmim5z5Z58tLOlKMNg_5StGNJJRp45SdxaQWVys8hlmG776B6QoRFNBKSXCMOoKJRWsRs9h0q0O5xaR0l5QZK3TdC6Sn4Hroro5R6WZSoSgWrl7BxSo1u0CL4aR3loQWGLBt5w6A9QkTFNkJOiS5ScxZOWoTocglvl7u5s6hZUBXuGe0Av6egl7woUBH6y6twUc1Xm7f689gccBXv0EgkccHul7D9fwmYX9N9YgQZdkXam7w5O9gkdBHjWY1AT93GKTkKa9DAXk2EYoWe1Df9ekeBHeHfm7SseZnfX9s9YsQZfkXi1G0GrQhGZIjG6KowZRJGJFiG5K3CKOoG4OJK6RgK5KJ55KbQYGMPjt5KlthstguoukvZwwwglmm7c9BAhogF5Jmx5Sjta9RDYofVhkHqH7PARDQghB1j1rHASA34ZQtGp3UAgViF_Kj_5OJCWu1AfAJ8oQjl5KIoikXv1G8t5SJC0y1AtAJ8KOWl5KIgjk1z1SIGbRdtqOJCWz1AzAYVhkHD8DecsBHmmX2ABD3OKNmGp7DDd5gws3NZikiwicjojVsosVtgGan7EAPDhgtBHjHe1ASDYZegmAUDeVuBXjHe2AeDYwfZuk1fY9RBXfIem7SwuZ2iY9tDYVgcvkmin7d9gZIjY9yDYZgwvk1mn7d9d9YZecwZnmY9BEYcgowkXn2K0GKTkKa9gEegzBHqYqn7SgxZ2rY9SEYZRsxkmrI7uAxAQZyB1qYuIAfEoBKShGIIpl5C3_aSGWPcUk7t7l8h0yn7E_zoXyn7PEfV2zY9xEYsOszBH6zEtV7dHXo7hE9Hgg7CXvYX3ACHYcxcxBH6EHtV8dHao7jEPHgg8CXmWr2ASHekvcXioBUHcHcHYoGeJDeHeg9Cmn0f3AhHWcUwAhlfo7PWApHio7wgmAvHekACXTxHgsAd1zl77Id9YoGmJD9IegBC1no9joBdXno7EID9Yo0qJDOIecCCXqlq3ARIYgSgClXrJZ3");
	// $25<BExpr>
	private static Type type10 = Runtime.Type("iHJ8JGs0bRJOKGs0bR38oQjl5C0t5OZwZRosoQoGLGlKMNgCMNxdTohwhZiojgGHZ58tLOlKMNg_5StGNJJRp45SdxaQWZ9x9hGIWcZIQw3WlJp8qR_GMGl41LzHQc4O5xaR0l5QZK3TdC6Sn4Hroro5T4mLUh0PYcIPhc5CL4aRZNZQ3loQWGLB75N5CAQw5W0I_tqOoWqIa41TEAQcr7vgMAwdH5YkaUgw6G4W6Rmd1fl3yCXXlXGDB5eoNBHQD5gwNF_KWlLS_G4Kp06Q_4oPN5N6w6QgOFKF4W6Rm41blXm5T5JCKGs0bRWwOZfgGel785e5hgPFYIpp5OIGbRdtqOeVSBmf0AtVQcHil7P5u5ggQ33jWuGvlvl5x5oBKOoCmfl9jVRcHml7z596ggR3Xj0nl5C6YZOsRomn0GJ8MS_CGq0AP6JOJNgCMOIkSkHrG7Q6T6QwSB1Ec6hZTcX5YoPgTk1vl7i5ylXvl795gZ2yW9t6YcOcUkmy0CIKMQooJSgG2GdOMJxpTodwdoeg0Xm7S589hcccmXm7B9fVIYX9D9YgTwcBH6N9tZdcXam7x6Q9gkdBXzla1AT9YkckcBH6c9tZecXem7z6f9gke3HUy9QseB1elfHAs9YcNgmAu9egfBmj0j1Ax9egl795z9Yo0mHD8AecgBXQAAgkgBHT95gsgcmPYVhgmAOAechBHEQAgkhBXEQAgshBmENAgViF3Kt0MOeVt7XXWXl7SkiVIvX9iAYgiwiBH6sAtZjcXym77hjk1z1G0GrQhGZIjG6KowZRJGJFiG5K3CKOoG4OJK6RgK5KJ55KbQYGMPjt5KlWuVyoywyszg7_8hGYn7eADDhwsF5Jmx5Sjta9TEYwjctkmaI7RDTEQotBXzXbIAUD34ZQtGp3dDgcuF_Kj_5OJC0f2AhDJ8oQjl5KIwuk1i2G8t5SJCWi2AvDJ8KOWl5KIovkXj2SIGbRdtqOJC0m2A8EYctkHDAEekwBmXIn2ADE3OKNmGp7NEylHqIVleYfIi2jnjYmnnYqn5QEYZtkxoHrn7zAfAgwxBmum9jZycXun77DfEgkyBHXnu2AiEekl7sEfAYoGyIDuEegzBXX2z2AxEYgikHDzEeV7CmXIX3A9HYgigiBmu1YJDCHes7C1YnY3ANHJ43Kt0MOeo9Cma3Ym7Sk8_IbZ9THYgob3AcHWkvwvgWeo7PHfHhk9C1IUHgs9dXzY9t9nVA_A_ACH6uHtgAd1jo7OpAlXjZ975YVBhiBH68ItcBdmmo7BIfwHnZ9DIYwBWhBH6NItZCdXqo7RhCl1ro7ShClXrJgq2");
	// Bool
	private static Type type11 = Runtime.Type("QFZFjx5Q3G_RpKq3vk1EJOJNgCMOIs2Az3HE7hGHYcYHhgJko2");
	// any
	private static Type type12 = Runtime.Type("Fs0");
	// False
	private static Type type13 = Runtime.Type("2K545QnKq3ukmD0E");
	// True
	private static Type type14 = Runtime.Type("2GJ8MS_CWDggIk2");
	// $1<^Value>
	private static Type type15 = Runtime.Type("EG_KWlLS_d1P38oQjl5CDKMQZC4Sm_aQbG4Kp06Q_CmDgZ2HeZo7zc3AA43Iup6Xl5CGnJ_Gr7vgmANdHLYwZLggK7Dlp5SCXDTpmM3G_RpKq3dlXPJOJNgCMOIk5Ah4mPihlQYk2ThZb9PBHEvl1UeZl7ys6Az4v$");
	// $22<Value>
	private static Type type16 = Runtime.Type("EG_KWlLS_GZFjx5QosJShGqJo8MPiS5KJK6RgKa9cCmEgZ2HeZo7yc3AA43Iup6Xl5CGnJ_Gr7zgmANdHLYwZLggK7Dlp5SCXDTpmM3G_RpKq3dlXPJOJNgCMOIk5Ah4mPihlQYg2ThZb9PB1Evl1UeZl7xs6Az4c0");
	// real
	private static Type type17 = Runtime.Type("Fc0");
	// $9<AExpr>
	private static Type type18 = Runtime.Type("iHJ4JGs0bRosJShGnJpp5CCK6QoFJPqG_K4W6Rm4_Icd5T95QVo7uZJA9dX5Yg2IgoZ9ACmIfV2LeZp7Bdp7SgKDRdHMYkYMgwp7xs4AdCmIECH6f_2Qeoq7ys5AjGYKW8685t5GBxLNZ4IYGbGro5wGNkJOiS5ScxZOWorro5zCmE75hZNcH5YZrX0AB53K3Tk8b9t5IgNBmY0aGDO5ecOBXTQ5gkOF_KWlLS_G4Kp06Q_G_F4W6Rm4JbGrWzGfm5d5WgZel5f5JCKGs0bRWkPZ9hWfl7D5j5hVQFZFjx5QZC4Sm_aQbdHrl7w5gZIjW9y5YwOwQk1mGFD_RwTZUgWm0CIK5SYkQgmAC6esRB1nln0AN6WgRZSgWql7T5Q6hkSF3KmKMOIsSkmr0K545QnKq3d6gcT31ulul5g6YcQoToXvl7v5A5gVUBmY0AtcUcmyl7U5w6goUFIFiG58E86CDx5SZKJRp45Qn4aXlvliHjmjmqm5A9Z58tLOlKMNg_5StGNJJRp45SdxaQWwzo7hlYH7B9N9QZdFNBKSXCMOoKJRWcdo8h0b1O5xaR0l5QZK3TdC6Sn41nZno5c9WodZegWem7c5f9hkecHfm7i9fwmfX9s9YwUZfkXim779t9gkfBHXXf1Ay93GKTkKa9iAXwNwNBH69Asggc1nm78ACAYoWnHDEAeVhBXXHq1APA343Sjp5GDx5SJGnImG4G0t5OJGoJ_G6KZGKSklLOJGONJSiC5SdxaQJ4bzXjnmIn2rIunvn5fAYVgkioHv1OF8rQoxaQekvBHr1y1AtAWcjkvglym7RAwAhojFJFi_6KIwjk1X2KLxLPZGp39DggsF_Fjx5QJCGY2ADD3_ZQoGp3NDgZtF_J_45QJCla2ARDoC4Sm_aQbGp3TDgwtB1y1AtZucXen7dAfDgkuFZKW86KYsugNkmfIVGX2YnYYaIb2eIf2in5tDYwicvomin7SA8AgovBHmm9jwvc1mn7TA8EgcwBmrHm2ABEekl7DE8AYolnIDNEeZxB1uXq2AQEYZgkHDSEesxBHumr2AcEYZgZgBHmXuIDfEekyBXuHv2AiEJ43Kt0MOeg7CHynIYoWyIDvEekzBHYHz2AyEWctotg0Xo7sE8Hhc7CXYHz2ABHekxcHeoBDHEHEHYo0aJDOHec8Cmama3ARHWcNs9hWbo7h5UHhV9CmYl9jc9dmeo7B6gHgo9dHYl7jH8AYo0iJDtHecACmio9jkAdHjo7yHi9YoljJD7IeZBCXbXm3AAIYwdcBlHnZ9QBmYlno7SVC_IqZ9PIYgrq3ARIYsrY0ATIlH");
	// ^Num(^real)
	private static Type type19 = Runtime.Type("4CDKMQesY9PBXDwkHElD");
	// ^$13<Sum($11<^[^real,^{|$4<^$21<AExpr>>...|}[$4<^$21<AExpr>>...]]>)>
	private static Type type20 = Runtime.Type("jHoBKShdmIec0K0K3Tk8b9UCXEfVnEeVo7wZo7ScJDAd1IYcIIgs3CDKMQooJSgG2GdO6KLK3Tk8MJE_qPthNg0MYoIMhsp7Nl2AcCHLClXPYsYEYo0Qtoa9iCXLjl1ToNKNmGXGiG3Ij45OlsNsOsChGU35BKaQbG6PEOL7yWDh0Xl7Q_NoXXW9OBXTB5goNFJGs0bRecQB0Yl7N5O5tcOcmal7vlOkHb0KL45QpK5KJK6RgK5K1K3Tk8MFT5T6z6i9QcP3mMf5QkPFpJ4W6Rm4HfWeo5j5YwNVQoHi0G1xqQgGqJo8MPiSa9T6YoQkHDy5ewQB1e0m0A860_am0yWyl5A6oBKOoCHjl9jsRcmnl7C6N6gZS31nWql5Q6YwOkSoHr0GJ8MS_Clr0Ac6JOJNgCMOIcTkmuG7d6g6QoTBmiWvGAj6YkQkNkHyl7N5gZnyW9w6YVPoUkXz0C0t5OZwZRosoQoGLGlKMNgCMNA5s6w9y97ARAQkcFPZZQ_4MSWlLPo_6WGGlKMNo_qQi41XZYo5N9WocZdgWa1WlJp8qR_GMGl4maXbo5S9ZOoQm43QgGLGs_qRoCM7CIEIQZe3XbXem5f9YZPkeoHfX9i9YwegmAs9eZfB1XXi1Av9YZccfkHjm799j9gwfF3Kt0MOewi71a0al7SggV2nX9CAYcgsgBH6EAtVhcHqm7A9PAgghFJFoxLQ3toQoG4CE86K34ZQZG4GIK5SJG5Kp06Q_G4_WGptqNo_qQiGKRzAzDBEDESEeEsEQkiBHmHvHAiAZ0_RjGrQidHjn7TAtAgcj3myHjn5wAYohojoXz1G0tLTJC0X2A8DJOpQdG5KIgsk1Y2K1xqQgGp3DDgwsFJHiG6KIZtkXa2KHKLNgGp3RDgotFrJo8MPiS5KIwtk1en7tAgZYeY9fDYcikukHf2GL4aRJCmf2Y0AsD059DCDNDQDTDdDiDtDQcvB1ymiIAwDYshcgkXjn79Afw1mY98EYwhcwkmmn7cA9Egowc16YwwcgBH6NEtZxcXqn7dAQEgkxBXm1Atsxcmrn7eAcEgZyBXmXmm79AfEtkycHvn7fAiEgwyFKFJ_6R_d1Yo7uEyBH6vEtkzcHzn7D9yEgwz3maYbn58HYZzc7pmXo7E9yEgo7dHrY9eHnw7W8W8CH6OHtc8dmao7R9RHgo84mXlfo5UHYsPV9pHeo7N5fwmeZ9gHYoRo9lXfZ9D5YVAdgBH6tHtcAdmio7wHfwHjZ9yHYwAxeBH67ItZBdXmo7U9AIgkBC1emm3ADIegl7N5NIYoGqJDPIegCC1URIgoCCmUN5gwC4vw");
	// ^$13<Mul($11<^[^real,^{|$4<^$21<AExpr>>...|}[$4<^$21<AExpr>>...]]>)>
	private static Type type21 = Runtime.Type("jHooJSgdmIec0K0K3Tk8b9UCXEfVnEeVo7wZo7ScJDAd1IYcIIgs3CDKMQoBKShG2GdO6KLK3Tk8MJE_qPthNg0MYoIMhsp7Nl2AcCHLClXPYsYEYo0Qtoa9iCXLjl1ToNKNmGXGiG3Ij45OlsNsOsChGU35BKaQbG6PEOL7yWDh0Xl7Q_NoXXW9OBXTB5goNFJGs0bRecQB0Yl7N5O5tcOcmal7vlOkHb0KL45QpK5KJK6RgK5K1K3Tk8MFT5T6z6i9QcP3mMf5QkPFpJ4W6Rm4HfWeo5j5YwNVQoHi0G1xqQgGqJo8MPiSa9T6YoQkHDy5ewQB1e0m0A860_am0yWyl5A6oBKOoCHjl9jsRcmnl7C6N6gZS31nWql5Q6YwOkSoHr0GJ8MS_Clr0Ac6JOJNgCMOIcTkmuG7d6g6QoTBmiWvGAj6YkQkNkHyl7N5gZnyW9w6YVPoUkXz0C0t5OZwZRosoQoGLGlKMNgCMNA5s6w9y97ARAQkcFPZZQ_4MSWlLPo_6WGGlKMNo_qQi41XZYo5N9WocZdgWa1WlJp8qR_GMGl4maXbo5S9ZOoQm43QgGLGs_qRoCM7CIEIQZe3XbXem5f9YZPkeoHfX9i9YwegmAs9eZfB1XXi1Av9YZccfkHjm799j9gwfF3Kt0MOewi71a0al7SggV2nX9CAYcgsgBH6EAtVhcHqm7A9PAgghFJFoxLQ3toQoG4CE86K34ZQZG4GIK5SJG5Kp06Q_G4_WGptqNo_qQiGKRzAzDBEDESEeEsEQkiBHmHvHAiAZ0_RjGrQidHjn7TAtAgcj3myHjn5wAYohojoXz1G0tLTJC0X2A8DJOpQdG5KIgsk1Y2K1xqQgGp3DDgwsFJHiG6KIZtkXa2KHKLNgGp3RDgotFrJo8MPiS5KIwtk1en7tAgZYeY9fDYcikukHf2GL4aRJCmf2Y0AsD059DCDNDQDTDdDiDtDQcvB1ymiIAwDYshcgkXjn79Afw1mY98EYwhcwkmmn7cA9Egowc16YwwcgBH6NEtZxcXqn7dAQEgkxBXm1Atsxcmrn7eAcEgZyBXmXmm79AfEtkycHvn7fAiEgwyFKFJ_6R_d1Yo7uEyBH6vEtkzcHzn7D9yEgwz3maYbn58HYZzc7pmXo7E9yEgo7dHrY9eHnw7W8W8CH6OHtc8dmao7R9RHgo84mXlfo5UHYsPV9pHeo7N5fwmeZ9gHYoRo9lXfZ9D5YVAdgBH6tHtcAdmio7wHfwHjZ9yHYwAxeBH67ItZBdXmo7U9AIgkBC1emm3ADIegl7N5NIYoGqJDPIegCC1URIgoCCmUN5gwC4vw");
	// AType
	private static Type type22 = Runtime.Type("QFKFJ_6R_GJHiG6KIg2AwF_J_45QJCWEgwI7xVo58CXD9pmH0IE");
	// $12<Mul($10<^[^real,^{|$3<^$20<AExpr>>...|}[$3<^$20<AExpr>>...]]>)>
	private static Type type23 = Runtime.Type("iHooJSgdX5J4JGs0bResp7xg1DycmEYg2HYoGHtcZ9ACXDBlHIosJShGnJpp5C3_aSJOKGs0bRGt3PeWbXl5QC1ERpHMYwoDgwp7Nl3AdCHExBH6f_2Qeoq7Ot5AjGYKW8685t5GBxLNZ4IYGbGro5wGNkJOiS5ScxZOWorro5zCXL75hZNcH5YZrX0AB53K3Tk8b9t5IgNBmY0aGDO5ecOBXTQ5gkOF_KWlLS_G4Kp06Q_G_F4W6Rm4JbGrWzGfm5d5Ws_el5f5JCKGs0bRWkPZ9hWfl7D5j5hVQFZFjx5QZC4Sm_aQbdHrl7w5gZIjW9y5YwOwQk1mGFc_RwTZUgWm0CIK5SYkQgmAC6esRB1nln0AN6WgRZSgWql7T5Q6hkSF3KmKMOIsSkmr0K545QnKq3d6gcT31ulul5g6YcQoToXvl7v5A5gVUBmY0AtcUcmyl7U5w6goUFIFiG58E86CDx5SZKJRp45Qn4aXlvliHjmjmqm5A9Z58tLOlKMNg_5StGNJJRp45SdxaQWwzo7hlYH7B9N9QZdFNBKSXCMOoKJRWcdo8h0b1O5xaR0l5QZK3TdC6Sn41nZno5c9WodZegWem7c5f9hkecHfm7i9fwmfX9s9YwUZfkXim779t9gkfBHXXf1Ay93GKTkKa9iAXwNwNBH69Asggc1nm78ACAYoWnHDEAeVhBXXHq1APA343Sjp5GDx5SJGnImG4G0t5OJGoJ_G6KZGKSklLOJGONJSiC5SdxaQJ4bzXjnmIn2rIunvn5fAYVgkioHv1OF8rQoxaQekvBHr1y1AtAWcjkvglym7RAwAhojFJFi_6KIwjk1X2KLxLPZGp39DggsF_Fjx5QJCGY2ADD3_ZQoGp3NDgZtF_J_45QJCla2ARDoC4Sm_aQbGp3TDgwtB1y1AtZucXen7dAfDgkuFZKW86KYsugNkmfIVGX2YnYYaIb2eIf2in5tDYwicvomin7SA8AgovBHmm9jwvc1mn7TA8EgcwBmrHm2ABEekl7DE8AYolnIDNEeZxB1uXq2AQEYZgkHDSEesxBHumr2AcEYZgZgBHmXuIDfEekyBXuHv2AiEJ43Kt0MOeg7CHyIEYoWyIDvEekzBHYHz2AyEWctotg0Xo7sE8Hhc7CXYHz2ABHekxcHeoBDHEHEHYo0aJDOHec8Cmama3ARHWcNs9hWbo7h5UHhV9CmYl9jc9dmeo7B6gHgo9dHYl7jH8AYo0iJDtHecACmio9jkAdHjo7yHi9YoljJD7IeZBCXbXm3AAIYwdcBlHnZ9QBmYlno7SVC_IqZ9PIYgrq3ARIYsrY0ATIWI");
	// IntT
	private static Type type24 = Runtime.Type("2G8t5SJCWDggIk2");
	// RealT
	private static Type type25 = Runtime.Type("2KHKLNgGp3ukmD0E");
	// $7<Set(^{$2<^Expr>...})>
	private static Type type26 = Runtime.Type("iHoBKOoGJGs0bRewp7wgmAxcXEYcnEgV3KL45QpK5KJK6RgK585t5K1K3Tk8MFA5s5y5i6Qs3K0K3Tk8M7EW7hGLJCKGs0bRWcpjo5RCmDSpXM38oQjl5CDKMQZC4Sm_aQbdmXl7flHDgdHQYgZQgwLFspOVPgPgGTYgq9jgb9wCXDxlXUWcrUQVNBXH85hcNF3KmKMOIkNkHY0K545QnKq3E5gVO3XYGal5P5YVqaGAR5ecl7dtOkmbW9OBXPd5gcPB1EgZ2fW9h5YgZf0Aj5IZPB1Et5tcQcmil7BlQkHj0KLK3Tk86C0t5OZwZRosoQoGLGlKMNgCMNS5z6c9e9g97AQkRFPZZQ_4MSWlLPo_6WGGlKMNo_qQi4Hvneo5N6WoRZSgWq0WlJp8qR_GMGl4mqlio5S6ZOoQm43QgGLGs_qRoCM7SIUIQZT3XrWul5f6Yo3vGAh6oNKNmG3Ij45OlsQZcVdgGy0W0I_tqOoWqIa4XyWam5w6YwQoUoXzl7j6d5gVccm5YkYXm7SgcZ2YX9C9YVUsckmYm7v6wkHaX9i6YgdgmAR9eodB1mWb1AU9YZRsdkHem796Q9ggeF3Kt0MOegh71EwBH6j9sVfcHim7i9u9YoliHDw9eofBmmWj1Az9343Sjp5GDx5SJGnImG4G0t5OJGoJ_G6KZGKSklLOJGONJSiC5SdxaQJ4rume2iYiImYn2rn5NAYoeZhoXq1OF8rQoxaQeZuBXmHr1ATAWwhZug0um78AdAhciFJFi_6KIkikHv1KLxLPZGp3jAgVjF_Fjx5QJCWy1AvA3_ZQoGp3xAgsjF_J_45QJC0X2A8DoC4Sm_aQbGp3ADgksBHr1AtsscmYn7DANDgZtFZKW86KYgtZPk1bIVWvHy1zmzXXIYYaIbn5TDYkhwto1en79Ai9gcuBXfm9jkucHfn7AAiDgwuB1nXf2AtDekl7vDi9Yo0jIDxDesvBHnmj2A7EYsekHD9EegwBXn1n2ACEYseseBXfmnIDNEeZxBmnXq2AQEJ43Kt0MOeZzc1Xo7TEUEYo0uIDdEecyBXnlu2AgEWwjcsgWvn7SEjEhVzFnJpp5CCK6QoFJPq44elzGaoaJeo5xEYV_zIAzEYwxg1D8Hec7CXblXo7Sk7_IYZ9DHYczw7l1ao7vEEHgc8Cmrnrn7Sk8_IbZ9THYkzw8l1eo7E6fEgc9dHmY9zHnk9p9p9CH6iHtw9d1io7R6tHgcA4HHz6QkACmLxHhsAdHXm77Ii9YoGmJD9IegBC1no9joBdXno7EIQ9Yo0qJDOIecCCmrlq3ARIYVTgClXrJZ3");
	// $6<SExpr>
	private static Type type27 = Runtime.Type("iHJCKGs0bRJOKGs0bRoBKOo4XLUIQon7usIAzFYKW8685t5GBxLNZ4IMhWCh0I35BKaQbG6PEOL7CdChlIYg2LhZ_9OBHHQl1M3K3Tk8b985Igp7UWLDddXPYcoPgk5KL45QpK5KJK6RgK5K1K3Tk8MFhpPZSVcgGTJ4JGs0bRWcbvn5w41HxhWUYspUhVNFZFjx5QosJShGqJo8MPiSa9h5YoNkHDD5ewNBmQN5gZO3ZaljWm0nl5Q5YoNgmAS5esOB1EU5gVP31bGel5e5YsqeGAg53G_RpKq3i5gwPF_GWlqR_CGi0Au5WVQgQg0jl795x5hsQcX5YgNVRkHml7B5Qlmml7UlHDC6esRBmQE6gVSFIFiG58E86CDx5SZKJRp45Qn4aLz5D9N9P9i9QsSFPZZQ_4MSWlLPo_6WGGlKMNo_qQi4mqIao5e6WwSgTg0v0WlJp8qR_GMGl4HvGeo5j6ZOoQm43QgGLGs_qRoCM7zH8IQgU31y0zl5x6YVbzGAz6eVcBHXm9jcccmXm7P6B9gocBmq0Y1AE9YkSZckHa1GJ_6R_dHmX7Uxp7SodVYbX9U9YkdVeBH6d9tcecmem7S6g9goeFJFoxLQ3toQoG4CE86K34ZQZG4GIK5SJG5Kp06Q_G4_WGptqNo_qQiGKROAODTDcDjDwD9EQsfBmamjHA7AZ0_RjGrQidmYn7s9AAgkg3HnmYn5DAYwewgo1q1G0tLTJCWq1AQAJOpQdG5KIohkXr1K1xqQgGp3cAgZiFJHiG6KIgik1v1KHKLNgGp3iAgwiFrJo8MPiS5KIZjkXym7AAgZ2zX9xAYkfsjkmz1GL4aRJCHXnLgcs3NkhwhcioiVjgjVsgsg0Yn79ACDhssB1i1b1ANDYkdgmAPDegtBHi1b2ASDYcfktkmbY9RBHe2bm7ScuZneY9gDYgfoukXfn7R9gZ2iY9tDYkfcvkmin7R9R9YkdovZYjY9zDYofVwkHm2K0GKTkKa9UEesyB1nInn7SswZnnY9NEYVTZxkXqI7hAsAQkxBmmIrIATEoBKShGIIpl5C3_aSGd_mlzIXoYo5fEYg6vIAhEYowg1DjEeVzB1mGyn7SczZnyY9wEYVyozkXzn7dExEgV7CHnInn7Sc7_nXZ9BHYcyo7lXYo7d6OEgV8dmfY97CYaoaoao7Sk8_IbZ9THYsTw8l1eZ9SCXe3bm7Sg9_2fZ9hHYs9hmAjHeVACHiJXm7ScA_niZ9wHYZUoAlXjo7u6xHgVBdm5Yw_mo7SgB_2nZ9CIYgZn3AEIYsoMgZCCmMfwmqZ9RIYkIr3ATI0HE");
	// $9<SetT(^[^bool,$3<^Type>])>
	private static Type type28 = Runtime.Type("U53CKOoG_9RF3Kt0MOeop7von7SsIDzc1HYcIHgc3G0GrQhGZIjG6KowZRJGJFiG5KZGKSklLOJGONJSiC5SdxaQJ4rHhtPgQoQcRVSgWLYknLhk4OF8rQoxaQekPBHIUl1PWZ5fl5eC1Ifp1Q34ZQtGp3ilmQJOpQdG5KIZ6AuG_Fjx5QJC0Ugo6G8t5SJClUgVNF_J_45QJCWX0AA5oC4Sm_aQbGp3C5gsNBmMgZ2aW9O5YV_a0AQ53OKNmG_9OBHbWb0AU505shbU85B5E5R5c5QZPBXMe5hgPBHIxkHfl7xgmAj5eVQBXIt5gcQBmIt5gkQBHEgZYjW9z5YV4m0A86YoIEYonmGDB6eoRBHLD6gwR3Ax");
	// ^$7<Set(^{$2<^Value>...})>
	private static Type type29 = Runtime.Type("NGnJ_G6KL45QpKa9dC1EfwHEesn7uw2A7dHH38oQjl5CDKMQZC4Sm_aQbG4Kp06Q_C1EgZnIeVp7D_4AP4oLvtMXl5R4HHShWMYgnMhV5GJ8MS_CWPgg5K545QnKq3hlXQWkqQQVr7A_MAudX5Yk3Ugob9OBHIzl1XGco2");
	// ^$8<Set(^{$3<^Expr>...})>
	private static Type type30 = Runtime.Type("jHoBKOodXH3K3Tk8b9cCHEfwXEewn7uV3A8G_KWlLS_G4Kp06Q_GXGiG_F4W6Rm43YGiljlvl5EGKF4W6Rm41L8HQc4KIK3Tk8M7QWBhGMYkYMhw4G1xqQgGYIpp5OIGbRdtqOekNB1QgZIQesq7Bx5As4JTT5d5g5Qcr7ghmAwdHUYcYUgwM7vWNgGXl7AdNomX0GJ8MS_CGY0AD5JOJNgCMOIVOkHaG7E5P5QgOBHPR5hoOcX5Ycqb0Ac5eZl7fdPkmel7xkHDh5esPB1Ij5gVQBWel7xcQZniW9w5YoJj0Ay5JOKGs0bRo3ZQZGmImGYIjG6O44MSWlqRWtOVcZegeoeZggGn0dGHiKLRp45QdGMT3544MSWGMPjtL7iEgHQZS3XnWql5Q635IKbNnK5S44M7R6wHQsSFaGj8MFgl5O4WMPnGrRWsCWDhWuG7U6f6QkTBXIh6hsTFYKW86GBxLNZ4njWXHam5u635BKaQbG6PEOL7v6Q9QoUB1mWzGAz6YVUcPkHXX9QBHEA9Yo0YHDC9escBHylY1AN9YkUo2AP9ewTB1bm9jodcXbm786U9gVeBXmlb1Ae9YgRkdk1f1GJ_6R_d1rX7xon7SVfVIiX9u9YwegfBH6w9tofcXjm7B6z9gVgFJFoxLQ3toQoG4CE86K34ZQZG4GIK5SJG5Kp06Q_G4_WGptqNo_qQiGKRgAgDtDvD9EEESEQZhBXfXqHAQAZ0_RjGrQidXen7AATAgwh31uXen5dAYcgciomu1G0tLTJCGv1AiAJOpQdG5KIVjkHy1K1xqQgGp3vAgkjFJHiG6KIsjkmz1KHKLNgGp38DgcsFrJo8MPiS5KIkskHYn7TAgZnYY9NDYwgZtkXa2GL4aRJC1bYe0ASD05jAuAxA7DADDDQDTDQwtBHr1eIAdDYggwekmen7j9fwHfY9iDYkgwuk1in7CAjDgcvc16YkvweBH6xDtsvcmjn7DA7EgZwBmf1Atgwc1nn7EACEgswBmfmfm7j9NEtZxcXqn7NAQEgkxFKFJ_6R_dXyY98HYwxVyBH6dEtcycmun7E6gEgoy31XnXn5jEYsxVzoHy2CIKMQooJSgG2GdOMJd579PHRHeHQszBHLzEhV7C1un9sc7dmXo7U5BHYoGYJDDHew7Cmy2a3AOHYkzV8lmao7cEcEYoGbJDTHew8CHz2e3AdHYVSkykmeZ99EeVBCIfZfZfo7Sw9_2iZ9tHYoScAlmiJ79WcgGjo7RtApmjZ999YZBxeBH69ItgBd1no7CIfwXnZ9EIYVCldBH6OItcCdmqo7c6RIgoCCHu0r3AUIlDE");
	// Var(^string)
	private static Type type31 = Runtime.Type("3CL4aReZl7ug2Aw3x$");
	// ^Bool
	private static Type type32 = Runtime.Type("RFZFjx5Qeo3GJ8MS_C0Ego2K545QnKq3zk1HWsIHQco7ugJAB4vw");

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
		new Pattern.Term("OrT",
			new Pattern.Set(true, new Pair[]{
				new Pair(new Pattern.Leaf(type2), "es")}),
			null),
		null);
	private final static Pattern.Term pattern3 = new Pattern.Term("NotT",
		new Pattern.Term("AndT",
			new Pattern.Set(true, new Pair[]{
				new Pair(new Pattern.Leaf(type2), "es")}),
			null),
		null);
	private final static Pattern.Term pattern4 = new Pattern.Term("AndT",
		new Pattern.Set(false, new Pair[]{}),
		null);
	private final static Pattern.Term pattern5 = new Pattern.Term("AndT",
		new Pattern.Set(false, new Pair[]{
			new Pair(new Pattern.Leaf(type2), "t")}),
		null);
	private final static Pattern.Term pattern6 = new Pattern.Term("AndT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("AndT",
				new Pattern.Set(true, new Pair[]{
					new Pair(new Pattern.Leaf(type2), "xs")}),
				null),null), 
			new Pair(new Pattern.Leaf(type2), "ys")}),
		null);
	private final static Pattern.Term pattern7 = new Pattern.Term("AndT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("OrT",
				new Pattern.Set(true, new Pair[]{
					new Pair(new Pattern.Leaf(type2), "xs")}),
				null),null), 
			new Pair(new Pattern.Leaf(type2), "ys")}),
		null);
	private final static Pattern.Term pattern8 = new Pattern.Term("OrT",
		new Pattern.Set(false, new Pair[]{}),
		null);
	private final static Pattern.Term pattern9 = new Pattern.Term("OrT",
		new Pattern.Set(false, new Pair[]{
			new Pair(new Pattern.Leaf(type2), "t")}),
		null);
	private final static Pattern.Term pattern10 = new Pattern.Term("OrT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("OrT",
				new Pattern.Set(true, new Pair[]{
					new Pair(new Pattern.Leaf(type2), "xs")}),
				null),null), 
			new Pair(new Pattern.Leaf(type2), "ys")}),
		null);
	private final static Pattern.Term pattern11 = new Pattern.Term("TupleT",
		new Pattern.List(true, new Pair[]{
			new Pair(new Pattern.Leaf(type2), "ts")}),
		null);
	private final static Pattern.Term pattern12 = new Pattern.Term("AndT",
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
	private final static Pattern.Term pattern13 = new Pattern.Term("AndT",
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
	private final static Pattern.Term pattern14 = new Pattern.Term("SetT",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type3), "b"), 
			new Pair(new Pattern.Leaf(type1),null)}),
		null);
	private final static Pattern.Term pattern15 = new Pattern.Term("AndT",
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
	private final static Pattern.Term pattern16 = new Pattern.Term("AndT",
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
	private final static Pattern.Term pattern17 = new Pattern.Term("AndT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("SetT",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type3),null), 
					new Pair(new Pattern.Leaf(type2),null)}),
				null), "s"), 
			new Pair(new Pattern.Leaf(type4), "p"), 
			new Pair(new Pattern.Leaf(type2), "ts")}),
		null);
	private final static Pattern.Term pattern18 = new Pattern.Term("OrT",
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
	private final static Pattern.Term pattern19 = new Pattern.Term("AndT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Leaf(type1),null), 
			new Pair(new Pattern.Leaf(type2), "xs")}),
		null);
	private final static Pattern.Term pattern20 = new Pattern.Term("AndT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Leaf(type0),null), 
			new Pair(new Pattern.Leaf(type2), "xs")}),
		null);
	private final static Pattern.Term pattern21 = new Pattern.Term("AndT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Leaf(type4), "a1"), 
			new Pair(new Pattern.Leaf(type4), "a2"), 
			new Pair(new Pattern.Leaf(type2), "ts")}),
		null);
	private final static Pattern.Term pattern22 = new Pattern.Term("AndT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Leaf(type4), "a1"), 
			new Pair(new Pattern.Term("NotT",
				new Pattern.Leaf(type4),
				"a2"),null), 
			new Pair(new Pattern.Leaf(type2), "ts")}),
		null);
	private final static Pattern.Term pattern23 = new Pattern.Term("OrT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Leaf(type0),null), 
			new Pair(new Pattern.Leaf(type2), "xs")}),
		null);
	private final static Pattern.Term pattern24 = new Pattern.Term("OrT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Leaf(type1),null), 
			new Pair(new Pattern.Leaf(type2), "xs")}),
		null);
	private final static Pattern.Term pattern25 = new Pattern.Term("Load",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Term("Tuple",
				new Pattern.List(true, new Pair[]{
					new Pair(new Pattern.Leaf(type6), "ls")}),
				null),null), 
			new Pair(new Pattern.Leaf(type7), "idx")}),
		null);
	private final static Pattern.Term pattern26 = new Pattern.Term("LengthOf",
		new Pattern.Term("Tuple",
			new Pattern.List(true, new Pair[]{
				new Pair(new Pattern.Leaf(type6), "xs")}),
			null),
		null);
	private final static Pattern.Term pattern27 = new Pattern.Term("Equals",
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
	private final static Pattern.Term pattern28 = new Pattern.Term("And",
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
	private final static Pattern.Term pattern29 = new Pattern.Term("Not",
		new Pattern.Leaf(type11),
		"b");
	private final static Pattern.Term pattern30 = new Pattern.Term("Not",
		new Pattern.Term("Not",
			new Pattern.Leaf(type12),
			"x"),
		null);
	private final static Pattern.Term pattern31 = new Pattern.Term("Not",
		new Pattern.Term("And",
			new Pattern.Set(true, new Pair[]{
				new Pair(new Pattern.Leaf(type10), "xs")}),
			null),
		null);
	private final static Pattern.Term pattern32 = new Pattern.Term("Not",
		new Pattern.Term("Or",
			new Pattern.Set(true, new Pair[]{
				new Pair(new Pattern.Leaf(type10), "xs")}),
			null),
		null);
	private final static Pattern.Term pattern33 = new Pattern.Term("And",
		new Pattern.Set(false, new Pair[]{
			new Pair(new Pattern.Leaf(type10), "x")}),
		null);
	private final static Pattern.Term pattern34 = new Pattern.Term("And",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Leaf(type13),null), 
			new Pair(new Pattern.Leaf(type10), "xs")}),
		null);
	private final static Pattern.Term pattern35 = new Pattern.Term("And",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Leaf(type14),null), 
			new Pair(new Pattern.Leaf(type10), "xs")}),
		null);
	private final static Pattern.Term pattern36 = new Pattern.Term("And",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("And",
				new Pattern.Set(true, new Pair[]{
					new Pair(new Pattern.Leaf(type10), "xs")}),
				null),null), 
			new Pair(new Pattern.Leaf(type10), "ys")}),
		null);
	private final static Pattern.Term pattern37 = new Pattern.Term("And",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("Not",
				new Pattern.Leaf(type10),
				"x"),null), 
			new Pair(new Pattern.Leaf(type10), "y"), 
			new Pair(new Pattern.Leaf(type10), "ys")}),
		null);
	private final static Pattern.Term pattern38 = new Pattern.Term("And",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("Or",
				new Pattern.Set(true, new Pair[]{
					new Pair(new Pattern.Leaf(type10), "xs")}),
				null),null), 
			new Pair(new Pattern.Leaf(type10), "ys")}),
		null);
	private final static Pattern.Term pattern39 = new Pattern.Term("Or",
		new Pattern.Set(false, new Pair[]{
			new Pair(new Pattern.Leaf(type10), "x")}),
		null);
	private final static Pattern.Term pattern40 = new Pattern.Term("Or",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Leaf(type14),null), 
			new Pair(new Pattern.Leaf(type10), "xs")}),
		null);
	private final static Pattern.Term pattern41 = new Pattern.Term("Or",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Leaf(type13),null), 
			new Pair(new Pattern.Leaf(type10), "xs")}),
		null);
	private final static Pattern.Term pattern42 = new Pattern.Term("Or",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("Not",
				new Pattern.Leaf(type10),
				"x"),null), 
			new Pair(new Pattern.Leaf(type10), "y"), 
			new Pair(new Pattern.Leaf(type10), "ys")}),
		null);
	private final static Pattern.Term pattern43 = new Pattern.Term("Or",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("Or",
				new Pattern.Set(true, new Pair[]{
					new Pair(new Pattern.Leaf(type10), "xs")}),
				null),null), 
			new Pair(new Pattern.Leaf(type10), "ys")}),
		null);
	private final static Pattern.Term pattern44 = new Pattern.Term("Equals",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type2), "t"), 
			new Pair(new Pattern.Bag(false, new Pair[]{
				new Pair(new Pattern.Leaf(type6), "x"), 
				new Pair(new Pattern.Leaf(type6), "y")}),null)}),
		null);
	private final static Pattern.Term pattern45 = new Pattern.Term("And",
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
	private final static Pattern.Term pattern46 = new Pattern.Term("And",
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
	private final static Pattern.Term pattern47 = new Pattern.Term("Mul",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type17), "n"), 
			new Pair(new Pattern.Bag(true, new Pair[]{
				new Pair(new Pattern.Leaf(type18), "rest")}),null)}),
		null);
	private final static Pattern.Term pattern48 = new Pattern.Term("Mul",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type17), "x"), 
			new Pair(new Pattern.Bag(true, new Pair[]{
				new Pair(new Pattern.Term("Num",
					new Pattern.Leaf(type17),
					"y"),null), 
				new Pair(new Pattern.Leaf(type18), "rest")}),null)}),
		null);
	private final static Pattern.Term pattern49 = new Pattern.Term("Mul",
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
	private final static Pattern.Term pattern50 = new Pattern.Term("Mul",
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
	private final static Pattern.Term pattern51 = new Pattern.Term("Div",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Term("Num",
				new Pattern.Leaf(type17),
				"x"),null), 
			new Pair(new Pattern.Term("Num",
				new Pattern.Leaf(type17),
				"y"),null)}),
		null);
	private final static Pattern.Term pattern52 = new Pattern.Term("Div",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type18), "x"), 
			new Pair(new Pattern.Term("Div",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type18), "y"), 
					new Pair(new Pattern.Leaf(type18), "z")}),
				null),null)}),
		null);
	private final static Pattern.Term pattern53 = new Pattern.Term("Div",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Term("Div",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type18), "x"), 
					new Pair(new Pattern.Leaf(type18), "y")}),
				null),null), 
			new Pair(new Pattern.Leaf(type18), "z")}),
		null);
	private final static Pattern.Term pattern54 = new Pattern.Term("Div",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type18), "x"), 
			new Pair(new Pattern.Term("Num",
				new Pattern.Leaf(type17),
				"n"),null)}),
		null);
	private final static Pattern.Term pattern55 = new Pattern.Term("Div",
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
	private final static Pattern.Term pattern56 = new Pattern.Term("Div",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Term("Sum",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type17), "n"), 
					new Pair(new Pattern.Bag(true, new Pair[]{
						new Pair(new Pattern.Leaf(type18), "xs")}),null)}),
				null),null), 
			new Pair(new Pattern.Leaf(type18), "y")}),
		null);
	private final static Pattern.Term pattern57 = new Pattern.Term("Div",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Term("Mul",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type17), "n"), 
					new Pair(new Pattern.Bag(true, new Pair[]{
						new Pair(new Pattern.Leaf(type18), "xs")}),null)}),
				null),null), 
			new Pair(new Pattern.Leaf(type18), "y")}),
		null);
	private final static Pattern.Term pattern58 = new Pattern.Term("Sum",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type17), "n"), 
			new Pair(new Pattern.Bag(false, new Pair[]{}),null)}),
		null);
	private final static Pattern.Term pattern59 = new Pattern.Term("Sum",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type17), "n"), 
			new Pair(new Pattern.Bag(true, new Pair[]{
				new Pair(new Pattern.Leaf(type18), "x"), 
				new Pair(new Pattern.Leaf(type18), "rest")}),null)}),
		null);
	private final static Pattern.Term pattern60 = new Pattern.Term("Sum",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type17), "x"), 
			new Pair(new Pattern.Bag(true, new Pair[]{
				new Pair(new Pattern.Term("Num",
					new Pattern.Leaf(type17),
					"y"),null), 
				new Pair(new Pattern.Leaf(type18), "rest")}),null)}),
		null);
	private final static Pattern.Term pattern61 = new Pattern.Term("Sum",
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
	private final static Pattern.Term pattern62 = new Pattern.Term("Sum",
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
	private final static Pattern.Term pattern63 = new Pattern.Term("Equation",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type22),null), 
			new Pair(new Pattern.Term("Num",
				new Pattern.Leaf(type17),
				"v"),null)}),
		null);
	private final static Pattern.Term pattern64 = new Pattern.Term("And",
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
	private final static Pattern.Term pattern65 = new Pattern.Term("Not",
		new Pattern.Term("Equation",
			new Pattern.List(false, new Pair[]{
				new Pair(new Pattern.Leaf(type24), "t"), 
				new Pair(new Pattern.Leaf(type18), "e")}),
			null),
		null);
	private final static Pattern.Term pattern66 = new Pattern.Term("Not",
		new Pattern.Term("Equation",
			new Pattern.List(false, new Pair[]{
				new Pair(new Pattern.Leaf(type25), "t"), 
				new Pair(new Pattern.Leaf(type18), "e")}),
			null),
		null);
	private final static Pattern.Term pattern67 = new Pattern.Term("Equals",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type22), "t"), 
			new Pair(new Pattern.Bag(false, new Pair[]{
				new Pair(new Pattern.Leaf(type18), "e1"), 
				new Pair(new Pattern.Leaf(type18), "e2")}),null)}),
		null);
	private final static Pattern.Term pattern68 = new Pattern.Term("Inequality",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type22), "t"), 
			new Pair(new Pattern.Term("Num",
				new Pattern.Leaf(type17),
				"v"),null)}),
		null);
	private final static Pattern.Term pattern69 = new Pattern.Term("Not",
		new Pattern.Term("Inequality",
			new Pattern.List(false, new Pair[]{
				new Pair(new Pattern.Leaf(type24), "t"), 
				new Pair(new Pattern.Leaf(type18), "e")}),
			null),
		null);
	private final static Pattern.Term pattern70 = new Pattern.Term("And",
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
								new Pair(new Pattern.Leaf(type23), "xs")}),null)}),
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
								new Pair(new Pattern.Leaf(type23), "ys")}),null)}),
						null), "s2")}),
				null), "eq2"), 
			new Pair(new Pattern.Leaf(type10), "rest")}),
		null);
	private final static Pattern.Term pattern71 = new Pattern.Term("Equals",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type2), "t"), 
			new Pair(new Pattern.Bag(false, new Pair[]{
				new Pair(new Pattern.Term("Set",
					new Pattern.Set(true, new Pair[]{
						new Pair(new Pattern.Leaf(type6), "xs")}),
					null),null), 
				new Pair(new Pattern.Term("Set",
					new Pattern.Set(true, new Pair[]{
						new Pair(new Pattern.Leaf(type6), "ys")}),
					null),null)}),null)}),
		null);
	private final static Pattern.Term pattern72 = new Pattern.Term("And",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("Equals",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type2), "t"), 
					new Pair(new Pattern.Bag(false, new Pair[]{
						new Pair(new Pattern.Leaf(type8), "x"), 
						new Pair(new Pattern.Leaf(type26), "y")}),null)}),
				null), "eq"), 
			new Pair(new Pattern.Leaf(type10), "bs")}),
		null);
	private final static Pattern.Term pattern73 = new Pattern.Term("LengthOf",
		new Pattern.Term("Set",
			new Pattern.Set(true, new Pair[]{
				new Pair(new Pattern.Leaf(type16), "xs")}),
			null),
		null);
	private final static Pattern.Term pattern74 = new Pattern.Term("Equals",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type24),null), 
			new Pair(new Pattern.Bag(false, new Pair[]{
				new Pair(new Pattern.Term("LengthOf",
					new Pattern.Leaf(type27),
					"x"),null), 
				new Pair(new Pattern.Term("Num",
					new Pattern.Leaf(type17),
					"y"),null)}),null)}),
		null);
	private final static Pattern.Term pattern75 = new Pattern.Term("SubsetEq",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type28), "t"), 
			new Pair(new Pattern.Term("Set",
				new Pattern.Set(true, new Pair[]{
					new Pair(new Pattern.Leaf(type6), "xs")}),
				null), "s1"), 
			new Pair(new Pattern.Term("Set",
				new Pattern.Set(true, new Pair[]{
					new Pair(new Pattern.Leaf(type6), "ys")}),
				null), "s2")}),
		null);
	private final static Pattern.Term pattern76 = new Pattern.Term("SubsetEq",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type28), "t"), 
			new Pair(new Pattern.Leaf(type27), "x"), 
			new Pair(new Pattern.Leaf(type27), "y")}),
		null);
	private final static Pattern.Term pattern77 = new Pattern.Term("SubsetEq",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Term("SetT",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type3), "b"), 
					new Pair(new Pattern.Leaf(type2), "e")}),
				null), "t"), 
			new Pair(new Pattern.Term("Set",
				new Pattern.Set(true, new Pair[]{
					new Pair(new Pattern.Leaf(type6), "x"), 
					new Pair(new Pattern.Leaf(type6), "xs")}),
				null), "s1"), 
			new Pair(new Pattern.Term("Set",
				new Pattern.Set(true, new Pair[]{
					new Pair(new Pattern.Leaf(type6), "ys")}),
				null), "s2")}),
		null);
	private final static Pattern.Term pattern78 = new Pattern.Term("And",
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
							new Pair(new Pattern.Leaf(type6), "xs")}),
						null),null), 
					new Pair(new Pattern.Leaf(type12), "x")}),
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
							new Pair(new Pattern.Leaf(type6), "ys")}),
						null),null), 
					new Pair(new Pattern.Leaf(type27), "y")}),
				null),null), 
			new Pair(new Pattern.Leaf(type10), "rest")}),
		null);
	private final static Pattern.Term pattern79 = new Pattern.Term("And",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("SubsetEq",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Term("SetT",
						new Pattern.List(false, new Pair[]{
							new Pair(new Pattern.Leaf(type3), "b1"), 
							new Pair(new Pattern.Leaf(type2), "e1")}),
						null),null), 
					new Pair(new Pattern.Leaf(type27), "x"), 
					new Pair(new Pattern.Term("Set",
						new Pattern.Set(true, new Pair[]{
							new Pair(new Pattern.Leaf(type6), "xs")}),
						null),null)}),
				null),null), 
			new Pair(new Pattern.Term("SubsetEq",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Term("SetT",
						new Pattern.List(false, new Pair[]{
							new Pair(new Pattern.Leaf(type3), "b2"), 
							new Pair(new Pattern.Leaf(type2), "e2")}),
						null),null), 
					new Pair(new Pattern.Leaf(type27), "y"), 
					new Pair(new Pattern.Term("Set",
						new Pattern.Set(true, new Pair[]{
							new Pair(new Pattern.Leaf(type6), "ys")}),
						null),null)}),
				null),null), 
			new Pair(new Pattern.Leaf(type10), "rest")}),
		null);
	private final static Pattern.Term pattern80 = new Pattern.Term("And",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("SubsetEq",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type28), "t1"), 
					new Pair(new Pattern.Leaf(type27), "x"), 
					new Pair(new Pattern.Leaf(type27), "y")}),
				null), "s1"), 
			new Pair(new Pattern.Term("SubsetEq",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type28), "t2"), 
					new Pair(new Pattern.Leaf(type27), "u"), 
					new Pair(new Pattern.Leaf(type27), "v")}),
				null), "s2"), 
			new Pair(new Pattern.Leaf(type10), "rest")}),
		null);
	private final static Pattern.Term pattern81 = new Pattern.Term("ForAll",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Set(true, new Pair[]{
				new Pair(new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type31),null), 
					new Pair(new Pattern.Leaf(type2),null)}), "qs")}),null), 
			new Pair(new Pattern.Leaf(type10), "be")}),
		null);
	private final static Pattern.Term pattern82 = new Pattern.Term("ForAll",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Set(true, new Pair[]{
				new Pair(new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type31),null), 
					new Pair(new Pattern.Leaf(type2),null)}),null)}), "xs"), 
			new Pair(new Pattern.Term("ForAll",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Set(true, new Pair[]{
						new Pair(new Pattern.List(false, new Pair[]{
							new Pair(new Pattern.Leaf(type31),null), 
							new Pair(new Pattern.Leaf(type2),null)}),null)}), "ys"), 
					new Pair(new Pattern.Leaf(type10), "e")}),
				null),null)}),
		null);
	private final static Pattern.Term pattern83 = new Pattern.Term("Not",
		new Pattern.Term("ForAll",
			new Pattern.List(false, new Pair[]{
				new Pair(new Pattern.Set(true, new Pair[]{
					new Pair(new Pattern.List(false, new Pair[]{
						new Pair(new Pattern.Leaf(type31),null), 
						new Pair(new Pattern.Leaf(type2),null)}),null)}), "vars"), 
				new Pair(new Pattern.Leaf(type10), "be")}),
			null),
		null);
	private final static Pattern.Term pattern84 = new Pattern.Term("And",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("Not",
				new Pattern.Term("SubsetEq",
					new Pattern.List(false, new Pair[]{
						new Pair(new Pattern.Leaf(type28), "t1"), 
						new Pair(new Pattern.Term("Set",
							new Pattern.Set(true, new Pair[]{
								new Pair(new Pattern.Leaf(type6), "w"), 
								new Pair(new Pattern.Leaf(type6),null)}),
							null),null), 
						new Pair(new Pattern.Leaf(type6), "r1")}),
					null),
				null), "s"), 
			new Pair(new Pattern.Term("ForAll",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Set(true, new Pair[]{
						new Pair(new Pattern.List(false, new Pair[]{
							new Pair(new Pattern.Leaf(type31), "v"), 
							new Pair(new Pattern.Leaf(type2),null)}),null), 
						new Pair(new Pattern.List(false, new Pair[]{
							new Pair(new Pattern.Leaf(type31),null), 
							new Pair(new Pattern.Leaf(type2),null)}),null)}), "vars"), 
					new Pair(new Pattern.Term("Or",
						new Pattern.Set(true, new Pair[]{
							new Pair(new Pattern.Term("And",
								new Pattern.Set(true, new Pair[]{
									new Pair(new Pattern.Term("SubsetEq",
										new Pattern.List(false, new Pair[]{
											new Pair(new Pattern.Leaf(type28), "t2"), 
											new Pair(new Pattern.Term("Set",
												new Pattern.Set(true, new Pair[]{
													new Pair(new Pattern.Leaf(type31), "u"), 
													new Pair(new Pattern.Leaf(type6),null)}),
												null),null), 
											new Pair(new Pattern.Leaf(type6), "r2")}),
										null),null), 
									new Pair(new Pattern.Leaf(type10),null)}),
								null),null), 
							new Pair(new Pattern.Leaf(type10),null)}),
						null), "f")}),
				null),null), 
			new Pair(new Pattern.Leaf(type10), "rs")}),
		null);
	private final static Pattern.Term pattern85 = new Pattern.Term("And",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("Not",
				new Pattern.Term("SubsetEq",
					new Pattern.List(false, new Pair[]{
						new Pair(new Pattern.Leaf(type28), "t1"), 
						new Pair(new Pattern.Term("Set",
							new Pattern.Set(true, new Pair[]{
								new Pair(new Pattern.Leaf(type6), "w"), 
								new Pair(new Pattern.Leaf(type6),null)}),
							null),null), 
						new Pair(new Pattern.Leaf(type6), "r1")}),
					null),
				null), "s"), 
			new Pair(new Pattern.Term("ForAll",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Set(true, new Pair[]{
						new Pair(new Pattern.List(false, new Pair[]{
							new Pair(new Pattern.Leaf(type31), "v"), 
							new Pair(new Pattern.Leaf(type2),null)}),null), 
						new Pair(new Pattern.List(false, new Pair[]{
							new Pair(new Pattern.Leaf(type31),null), 
							new Pair(new Pattern.Leaf(type2),null)}),null)}), "vars"), 
					new Pair(new Pattern.Term("Or",
						new Pattern.Set(true, new Pair[]{
							new Pair(new Pattern.Term("SubsetEq",
								new Pattern.List(false, new Pair[]{
									new Pair(new Pattern.Leaf(type28), "t2"), 
									new Pair(new Pattern.Term("Set",
										new Pattern.Set(true, new Pair[]{
											new Pair(new Pattern.Leaf(type31), "u"), 
											new Pair(new Pattern.Leaf(type6),null)}),
										null),null), 
									new Pair(new Pattern.Leaf(type6), "r2")}),
								null),null), 
							new Pair(new Pattern.Leaf(type10),null)}),
						null), "f")}),
				null),null), 
			new Pair(new Pattern.Leaf(type10), "rs")}),
		null);
	private final static Pattern.Term pattern86 = new Pattern.Term("And",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("SubsetEq",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type28), "t1"), 
					new Pair(new Pattern.Term("Set",
						new Pattern.Set(true, new Pair[]{
							new Pair(new Pattern.Leaf(type6), "w"), 
							new Pair(new Pattern.Leaf(type6),null)}),
						null),null), 
					new Pair(new Pattern.Leaf(type6), "r1")}),
				null), "s"), 
			new Pair(new Pattern.Term("ForAll",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Set(true, new Pair[]{
						new Pair(new Pattern.List(false, new Pair[]{
							new Pair(new Pattern.Leaf(type31), "v"), 
							new Pair(new Pattern.Leaf(type2),null)}),null), 
						new Pair(new Pattern.List(false, new Pair[]{
							new Pair(new Pattern.Leaf(type31),null), 
							new Pair(new Pattern.Leaf(type2),null)}),null)}), "vars"), 
					new Pair(new Pattern.Term("Or",
						new Pattern.Set(true, new Pair[]{
							new Pair(new Pattern.Term("And",
								new Pattern.Set(true, new Pair[]{
									new Pair(new Pattern.Term("Not",
										new Pattern.Term("SubsetEq",
											new Pattern.List(false, new Pair[]{
												new Pair(new Pattern.Leaf(type28), "t2"), 
												new Pair(new Pattern.Term("Set",
													new Pattern.Set(true, new Pair[]{
														new Pair(new Pattern.Leaf(type31), "u"), 
														new Pair(new Pattern.Leaf(type6),null)}),
													null),null), 
												new Pair(new Pattern.Leaf(type6), "r2")}),
											null),
										null),null), 
									new Pair(new Pattern.Leaf(type10),null)}),
								null),null), 
							new Pair(new Pattern.Leaf(type10),null)}),
						null), "f")}),
				null),null), 
			new Pair(new Pattern.Leaf(type10), "rs")}),
		null);
	private final static Pattern.Term pattern87 = new Pattern.Term("And",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("SubsetEq",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type28), "t1"), 
					new Pair(new Pattern.Term("Set",
						new Pattern.Set(true, new Pair[]{
							new Pair(new Pattern.Leaf(type6), "w"), 
							new Pair(new Pattern.Leaf(type6),null)}),
						null),null), 
					new Pair(new Pattern.Leaf(type6), "r1")}),
				null), "s"), 
			new Pair(new Pattern.Term("ForAll",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Set(true, new Pair[]{
						new Pair(new Pattern.List(false, new Pair[]{
							new Pair(new Pattern.Leaf(type31), "v"), 
							new Pair(new Pattern.Leaf(type2),null)}),null), 
						new Pair(new Pattern.List(false, new Pair[]{
							new Pair(new Pattern.Leaf(type31),null), 
							new Pair(new Pattern.Leaf(type2),null)}),null)}), "vars"), 
					new Pair(new Pattern.Term("Or",
						new Pattern.Set(true, new Pair[]{
							new Pair(new Pattern.Term("Not",
								new Pattern.Term("SubsetEq",
									new Pattern.List(false, new Pair[]{
										new Pair(new Pattern.Leaf(type28), "t2"), 
										new Pair(new Pattern.Term("Set",
											new Pattern.Set(true, new Pair[]{
												new Pair(new Pattern.Leaf(type31), "u"), 
												new Pair(new Pattern.Leaf(type6),null)}),
											null),null), 
										new Pair(new Pattern.Leaf(type6), "r2")}),
									null),
								null),null), 
							new Pair(new Pattern.Leaf(type10),null)}),
						null), "f")}),
				null),null), 
			new Pair(new Pattern.Leaf(type10), "rs")}),
		null);
	private final static Pattern.Term pattern88 = new Pattern.Term("Exists",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Set(true, new Pair[]{
				new Pair(new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type31),null), 
					new Pair(new Pattern.Leaf(type2),null)}), "qs")}),null), 
			new Pair(new Pattern.Leaf(type10), "be")}),
		null);
	private final static Pattern.Term pattern89 = new Pattern.Term("Exists",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Set(true, new Pair[]{
				new Pair(new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type31),null), 
					new Pair(new Pattern.Leaf(type2),null)}),null)}), "xs"), 
			new Pair(new Pattern.Term("Exists",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Set(true, new Pair[]{
						new Pair(new Pattern.List(false, new Pair[]{
							new Pair(new Pattern.Leaf(type31),null), 
							new Pair(new Pattern.Leaf(type2),null)}),null)}), "ys"), 
					new Pair(new Pattern.Leaf(type10), "e")}),
				null),null)}),
		null);
	private final static Pattern.Term pattern90 = new Pattern.Term("Not",
		new Pattern.Term("Exists",
			new Pattern.List(false, new Pair[]{
				new Pair(new Pattern.Set(true, new Pair[]{
					new Pair(new Pattern.List(false, new Pair[]{
						new Pair(new Pattern.Leaf(type31),null), 
						new Pair(new Pattern.Leaf(type2),null)}),null)}), "vars"), 
				new Pair(new Pattern.Leaf(type10), "be")}),
			null),
		null);
	private final static Pattern.Term pattern91 = new Pattern.Term("And",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("Exists",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Set(true, new Pair[]{
						new Pair(new Pattern.List(false, new Pair[]{
							new Pair(new Pattern.Leaf(type31),null), 
							new Pair(new Pattern.Leaf(type2),null)}),null)}), "vs"), 
					new Pair(new Pattern.Leaf(type10), "e")}),
				null),null), 
			new Pair(new Pattern.Leaf(type10), "es")}),
		null);
	// =========================================================================
	// rules
	// =========================================================================

	public static final InferenceRule[] inferences = new InferenceRule[]{
		new Inference_0(pattern38),
		new Inference_1(pattern46),
		new Inference_2(pattern64),
		new Inference_3(pattern70),
		new Inference_4(pattern77),
		new Inference_5(pattern80),
		new Inference_6(pattern84),
		new Inference_7(pattern85),
		new Inference_8(pattern86),
		new Inference_9(pattern87)
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
		new Reduction_38(pattern39),
		new Reduction_39(pattern40),
		new Reduction_40(pattern41),
		new Reduction_41(pattern42),
		new Reduction_42(pattern43),
		new Reduction_43(pattern44),
		new Reduction_44(pattern45),
		new Reduction_45(pattern47),
		new Reduction_46(pattern48),
		new Reduction_47(pattern49),
		new Reduction_48(pattern50),
		new Reduction_49(pattern51),
		new Reduction_50(pattern52),
		new Reduction_51(pattern53),
		new Reduction_52(pattern54),
		new Reduction_53(pattern55),
		new Reduction_54(pattern56),
		new Reduction_55(pattern57),
		new Reduction_56(pattern58),
		new Reduction_57(pattern59),
		new Reduction_58(pattern60),
		new Reduction_59(pattern61),
		new Reduction_60(pattern62),
		new Reduction_61(pattern63),
		new Reduction_62(pattern65),
		new Reduction_63(pattern66),
		new Reduction_64(pattern67),
		new Reduction_65(pattern68),
		new Reduction_66(pattern69),
		new Reduction_67(pattern71),
		new Reduction_68(pattern72),
		new Reduction_69(pattern73),
		new Reduction_70(pattern74),
		new Reduction_71(pattern75),
		new Reduction_72(pattern76),
		new Reduction_73(pattern78),
		new Reduction_74(pattern79),
		new Reduction_75(pattern81),
		new Reduction_76(pattern82),
		new Reduction_77(pattern83),
		new Reduction_78(pattern88),
		new Reduction_79(pattern89),
		new Reduction_80(pattern90),
		new Reduction_81(pattern91)
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
			Rewriter rw = new SimpleRewriter(inferences,reductions,SCHEMA);
			rw.apply(automaton);
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
