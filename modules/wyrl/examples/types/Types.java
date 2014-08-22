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

public final class Types {
	// term $4<Not($2<^Type<$4|Any|Int|Intersect(^{$2...})|Tuple(^[$2...])|Union(^{$2...})>>)>
	public final static int K_Not = 0;
	public final static int Not(Automaton automaton, int r0) {
		return automaton.add(new Automaton.Term(K_Not, r0));
	}

	// 
	private final static class Reduction_0 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_0(Pattern.Term pattern) { super(pattern); }

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
		public final String name() { return ""; }
		public final int rank() { return 0; }

		public final int minimum() { return 1; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// 
	private final static class Reduction_1 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_1(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Not) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				if(s1.kind == K_Intersect) {
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
			Automaton.Term r9 = new Automaton.Term(K_Union, r8);
			int r10 = automaton.add(r9);
			if(r0 != r10) {
				return automaton.rewrite(r0, r10);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return ""; }
		public final int rank() { return 0; }

		public final int minimum() { return 2; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// 
	private final static class Reduction_2 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_2(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Not) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				if(s1.kind == K_Union) {
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
			Automaton.Term r9 = new Automaton.Term(K_Intersect, r8);
			int r10 = automaton.add(r9);
			if(r0 != r10) {
				return automaton.rewrite(r0, r10);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return ""; }
		public final int rank() { return 0; }

		public final int minimum() { return 2; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// term $7<Intersect($5<^{$2<^Type<$7|Any|Int|Not($2)|Tuple(^[$2...])|Union($5)>>...}>)>
	public final static int K_Intersect = 1;
	public final static int Intersect(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.Set(r0));
		return automaton.add(new Automaton.Term(K_Intersect, r1));
	}
	public final static int Intersect(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.Set(r0));
		return automaton.add(new Automaton.Term(K_Intersect, r1));
	}

	// 
	private final static class Reduction_3 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_3(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Intersect) {
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
		public final String name() { return ""; }
		public final int rank() { return 0; }

		public final int minimum() { return 2; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// 
	private final static class Reduction_4 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_4(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Intersect) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.Collection c1 = (Automaton.Collection) s1;
				if(c1.size() >= 1) {
					for(int r3=0;r3!=c1.size();++r3) {
						int r2 = c1.get(r3);
						Automaton.State s2 = automaton.get(r2);
						if(s2.kind == K_Not) {
							Automaton.Term t2 = (Automaton.Term) s2;
							int r4 = t2.contents;
							if(Runtime.accepts(type2,automaton,automaton.get(r4), SCHEMA)) {
								int[] state = {r0, r1, r2, r3, r4, 0};
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
			Automaton.Collection s1 = (Automaton.Collection) automaton.get(state[1]);
			int[] s1children = new int[s1.size() - 1];
			for(int s1i=0, s1j=0; s1i != s1.size();++s1i) {
				if(s1i == r3) { continue; }
				s1children[s1j++] = s1.get(s1i);
			}
			Automaton.Set r5 = new Automaton.Set(s1children);
			Automaton.Term r6 = Any;
			int r7 = automaton.add(r6);
			Automaton.Term r8 = new Automaton.Term(K_Not, r7);
			int r9 = automaton.add(r8);
			if(r0 != r9) {
				return automaton.rewrite(r0, r9);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return ""; }
		public final int rank() { return 0; }

		public final int minimum() { return 3; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// 
	private final static class Reduction_5 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_5(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Intersect) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.Collection c1 = (Automaton.Collection) s1;
				if(c1.size() >= 1) {
					for(int r3=0;r3!=c1.size();++r3) {
						int r2 = c1.get(r3);
						if(Runtime.accepts(type2,automaton,automaton.get(r2), SCHEMA)) {
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
				Automaton.Term r9 = new Automaton.Term(K_Intersect, r8);
				int r10 = automaton.add(r9);
				if(r0 != r10) {
					return automaton.rewrite(r0, r10);
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
	private final static class Reduction_6 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_6(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Intersect) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.Collection c1 = (Automaton.Collection) s1;
				if(c1.size() >= 2) {
					for(int r3=0;r3!=c1.size();++r3) {
						int r2 = c1.get(r3);
						if(Runtime.accepts(type3,automaton,automaton.get(r2), SCHEMA)) {
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
			int r3 = state[3];
			int r4 = state[4]; // y
			int r5 = state[5];
			Automaton.Collection s1 = (Automaton.Collection) automaton.get(state[1]);
			int[] s1children = new int[s1.size() - 2];
			for(int s1i=0, s1j=0; s1i != s1.size();++s1i) {
				if(s1i == r3 || s1i == r5) { continue; }
				s1children[s1j++] = s1.get(s1i);
			}
			Automaton.Set r6 = new Automaton.Set(s1children);
			Automaton.Term r7 = Any;
			int r8 = automaton.add(r7);
			Automaton.Term r9 = new Automaton.Term(K_Not, r8);
			int r10 = automaton.add(r9);
			if(r0 != r10) {
				return automaton.rewrite(r0, r10);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return ""; }
		public final int rank() { return 0; }

		public final int minimum() { return 3; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// 
	private final static class Reduction_7 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_7(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Intersect) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.Collection c1 = (Automaton.Collection) s1;
				if(c1.size() >= 2) {
					for(int r3=0;r3!=c1.size();++r3) {
						int r2 = c1.get(r3);
						Automaton.State s2 = automaton.get(r2);
						if(s2.kind == K_Tuple) {
							Automaton.Term t2 = (Automaton.Term) s2;
							int r4 = t2.contents;
							Automaton.State s4 = automaton.get(r4);
							Automaton.List l4 = (Automaton.List) s4;
							for(int r7=0;r7!=c1.size();++r7) {
								if(r7 == r3) { continue; }
								int r6 = c1.get(r7);
								Automaton.State s6 = automaton.get(r6);
								if(s6.kind == K_Tuple) {
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
			Automaton.Int r11 = r5.lengthOf(); // |xs|
			Automaton.Int r12 = r9.lengthOf(); // |ys|
			boolean r13 = !r11.equals(r12); // |xs| neq |ys|
			if(r13) {
				Automaton.Term r14 = Any;
				int r15 = automaton.add(r14);
				Automaton.Term r16 = new Automaton.Term(K_Not, r15);
				int r17 = automaton.add(r16);
				if(r0 != r17) {
					return automaton.rewrite(r0, r17);
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
	private final static class Reduction_8 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_8(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Intersect) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.Collection c1 = (Automaton.Collection) s1;
				if(c1.size() >= 1) {
					for(int r3=0;r3!=c1.size();++r3) {
						int r2 = c1.get(r3);
						Automaton.State s2 = automaton.get(r2);
						if(s2.kind == K_Intersect) {
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
			Automaton.Term r9 = new Automaton.Term(K_Intersect, r8);
			int r10 = automaton.add(r9);
			if(r0 != r10) {
				return automaton.rewrite(r0, r10);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return ""; }
		public final int rank() { return 0; }

		public final int minimum() { return 3; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// 
	private final static class Reduction_9 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_9(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Intersect) {
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
				Automaton.Term r9 = Any;
				int r10 = automaton.add(r9);
				Automaton.Term r11 = new Automaton.Term(K_Not, r10);
				int r12 = automaton.add(r11);
				if(r0 != r12) {
					return automaton.rewrite(r0, r12);
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
	private final static class Reduction_10 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_10(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Intersect) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.Collection c1 = (Automaton.Collection) s1;
				if(c1.size() >= 1) {
					for(int r3=0;r3!=c1.size();++r3) {
						int r2 = c1.get(r3);
						Automaton.State s2 = automaton.get(r2);
						if(s2.kind == K_Union) {
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
				Automaton.Term r11 = new Automaton.Term(K_Intersect, r10);
				int r12 = automaton.add(r11);
				t7.add(r12);
			}
			Automaton.Set r7 = new Automaton.Set(t7.toArray());
			int r13 = automaton.add(r7);
			Automaton.Term r14 = new Automaton.Term(K_Union, r13);
			int r15 = automaton.add(r14);
			if(r0 != r15) {
				return automaton.rewrite(r0, r15);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return ""; }
		public final int rank() { return 0; }

		public final int minimum() { return 3; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// 
	private final static class Reduction_11 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_11(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Intersect) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.Collection c1 = (Automaton.Collection) s1;
				if(c1.size() >= 2) {
					for(int r3=0;r3!=c1.size();++r3) {
						int r2 = c1.get(r3);
						if(Runtime.accepts(type3,automaton,automaton.get(r2), SCHEMA)) {
							for(int r5=0;r5!=c1.size();++r5) {
								if(r5 == r3) { continue; }
								int r4 = c1.get(r5);
								Automaton.State s4 = automaton.get(r4);
								if(s4.kind == K_Not) {
									Automaton.Term t4 = (Automaton.Term) s4;
									int r6 = t4.contents;
									Automaton.State s6 = automaton.get(r6);
									if(s6.kind == K_Tuple) {
										Automaton.Term t6 = (Automaton.Term) s6;
										int r7 = t6.contents;
										Automaton.State s7 = automaton.get(r7);
										Automaton.List l7 = (Automaton.List) s7;
										int[] state = {r0, r1, r2, r3, r4, r5, r6, r7, 0, 0};
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
			int r2 = state[2]; // x
			int r3 = state[3];
			int r5 = state[5];
			Automaton.Collection s1 = (Automaton.Collection) automaton.get(state[1]);
			int[] s1children = new int[s1.size() - 2];
			for(int s1i=0, s1j=0; s1i != s1.size();++s1i) {
				if(s1i == r3 || s1i == r5) { continue; }
				s1children[s1j++] = s1.get(s1i);
			}
			Automaton.Set r9 = new Automaton.Set(s1children);
			Automaton.Set r10 = r9.appendFront(r2); // x append rest
			int r11 = automaton.add(r10);
			Automaton.Term r12 = new Automaton.Term(K_Intersect, r11);
			int r13 = automaton.add(r12);
			if(r0 != r13) {
				return automaton.rewrite(r0, r13);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return ""; }
		public final int rank() { return 0; }

		public final int minimum() { return 5; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// 
	private final static class Reduction_12 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_12(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Intersect) {
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
								if(s4.kind == K_Not) {
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
			int r2 = state[2]; // x
			int r3 = state[3];
			int r5 = state[5];
			Automaton.Collection s1 = (Automaton.Collection) automaton.get(state[1]);
			int[] s1children = new int[s1.size() - 2];
			for(int s1i=0, s1j=0; s1i != s1.size();++s1i) {
				if(s1i == r3 || s1i == r5) { continue; }
				s1children[s1j++] = s1.get(s1i);
			}
			Automaton.Set r7 = new Automaton.Set(s1children);
			Automaton.Set r8 = r7.appendFront(r2); // x append rest
			int r9 = automaton.add(r8);
			Automaton.Term r10 = new Automaton.Term(K_Intersect, r9);
			int r11 = automaton.add(r10);
			if(r0 != r11) {
				return automaton.rewrite(r0, r11);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return ""; }
		public final int rank() { return 0; }

		public final int minimum() { return 4; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// 
	private final static class Reduction_13 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_13(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Intersect) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.Collection c1 = (Automaton.Collection) s1;
				if(c1.size() >= 2) {
					for(int r3=0;r3!=c1.size();++r3) {
						int r2 = c1.get(r3);
						Automaton.State s2 = automaton.get(r2);
						if(s2.kind == K_Tuple) {
							Automaton.Term t2 = (Automaton.Term) s2;
							int r4 = t2.contents;
							Automaton.State s4 = automaton.get(r4);
							Automaton.List l4 = (Automaton.List) s4;
							for(int r7=0;r7!=c1.size();++r7) {
								if(r7 == r3) { continue; }
								int r6 = c1.get(r7);
								Automaton.State s6 = automaton.get(r6);
								if(s6.kind == K_Not) {
									Automaton.Term t6 = (Automaton.Term) s6;
									int r8 = t6.contents;
									Automaton.State s8 = automaton.get(r8);
									if(s8.kind == K_Tuple) {
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
			int r2 = state[2]; // t
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
			Automaton.Int r12 = r5.lengthOf(); // |xs|
			Automaton.Int r13 = r10.lengthOf(); // |ys|
			boolean r14 = !r12.equals(r13); // |xs| neq |ys|
			if(r14) {
				Automaton.Set r15 = r11.appendFront(r2); // t append rest
				int r16 = automaton.add(r15);
				Automaton.Term r17 = new Automaton.Term(K_Intersect, r16);
				int r18 = automaton.add(r17);
				if(r0 != r18) {
					return automaton.rewrite(r0, r18);
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
	// term $7<Union($5<^{$2<^Type<$7|Any|Int|Not($2)|Intersect($5)|Tuple(^[$2...])>>...}>)>
	public final static int K_Union = 2;
	public final static int Union(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.Set(r0));
		return automaton.add(new Automaton.Term(K_Union, r1));
	}
	public final static int Union(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.Set(r0));
		return automaton.add(new Automaton.Term(K_Union, r1));
	}

	// 
	private final static class Reduction_14 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_14(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Union) {
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
		public final String name() { return ""; }
		public final int rank() { return 0; }

		public final int minimum() { return 2; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// 
	private final static class Reduction_15 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_15(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Union) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.Collection c1 = (Automaton.Collection) s1;
				if(c1.size() >= 1) {
					for(int r3=0;r3!=c1.size();++r3) {
						int r2 = c1.get(r3);
						if(Runtime.accepts(type2,automaton,automaton.get(r2), SCHEMA)) {
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
			Automaton.Term r5 = Any;
			int r6 = automaton.add(r5);
			if(r0 != r6) {
				return automaton.rewrite(r0, r6);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return ""; }
		public final int rank() { return 0; }

		public final int minimum() { return 2; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// 
	private final static class Reduction_16 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_16(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Union) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.Collection c1 = (Automaton.Collection) s1;
				if(c1.size() >= 1) {
					for(int r3=0;r3!=c1.size();++r3) {
						int r2 = c1.get(r3);
						Automaton.State s2 = automaton.get(r2);
						if(s2.kind == K_Not) {
							Automaton.Term t2 = (Automaton.Term) s2;
							int r4 = t2.contents;
							if(Runtime.accepts(type2,automaton,automaton.get(r4), SCHEMA)) {
								int[] state = {r0, r1, r2, r3, r4, 0};
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
			Automaton.Collection s1 = (Automaton.Collection) automaton.get(state[1]);
			int[] s1children = new int[s1.size() - 1];
			for(int s1i=0, s1j=0; s1i != s1.size();++s1i) {
				if(s1i == r3) { continue; }
				s1children[s1j++] = s1.get(s1i);
			}
			Automaton.Set r5 = new Automaton.Set(s1children);
			Automaton.Int r6 = r5.lengthOf(); // |xs|
			Automaton.Int r7 = new Automaton.Int(0); // 0
			boolean r8 = r6.compareTo(r7)>0; // |xs| gt 0
			if(r8) {
				int r9 = automaton.add(r5);
				Automaton.Term r10 = new Automaton.Term(K_Union, r9);
				int r11 = automaton.add(r10);
				if(r0 != r11) {
					return automaton.rewrite(r0, r11);
				}
			}
			Automaton.Term r12 = Any;
			int r13 = automaton.add(r12);
			Automaton.Term r14 = new Automaton.Term(K_Not, r13);
			int r15 = automaton.add(r14);
			if(r0 != r15) {
				return automaton.rewrite(r0, r15);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return ""; }
		public final int rank() { return 0; }

		public final int minimum() { return 3; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// 
	private final static class Reduction_17 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_17(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Union) {
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
				Automaton.Term r9 = Any;
				int r10 = automaton.add(r9);
				if(r0 != r10) {
					return automaton.rewrite(r0, r10);
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
	private final static class Reduction_18 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_18(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Union) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.Collection c1 = (Automaton.Collection) s1;
				if(c1.size() >= 1) {
					for(int r3=0;r3!=c1.size();++r3) {
						int r2 = c1.get(r3);
						Automaton.State s2 = automaton.get(r2);
						if(s2.kind == K_Union) {
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
			Automaton.Term r9 = new Automaton.Term(K_Union, r8);
			int r10 = automaton.add(r9);
			if(r0 != r10) {
				return automaton.rewrite(r0, r10);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return ""; }
		public final int rank() { return 0; }

		public final int minimum() { return 3; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// term $7<Tuple(^[$2<^Type<$7|Any|Int|Not($2)|Intersect(^{$2...})|Union(^{$2...})>>...])>
	public final static int K_Tuple = 3;
	public final static int Tuple(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_Tuple, r1));
	}
	public final static int Tuple(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_Tuple, r1));
	}

	// 
	private final static class Reduction_19 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_19(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Tuple) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.Collection c1 = (Automaton.Collection) s1;
				if(c1.size() >= 1) {
					for(int r3=0;r3!=c1.size();++r3) {
						int r2 = c1.get(r3);
						Automaton.State s2 = automaton.get(r2);
						if(s2.kind == K_Intersect) {
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
				Automaton.Set r9 = r6.appendFront(r8); // x append rest
				int r10 = automaton.add(r9);
				Automaton.Term r11 = new Automaton.Term(K_Tuple, r10);
				int r12 = automaton.add(r11);
				t7.add(r12);
			}
			Automaton.Set r7 = new Automaton.Set(t7.toArray());
			int r13 = automaton.add(r7);
			Automaton.Term r14 = new Automaton.Term(K_Intersect, r13);
			int r15 = automaton.add(r14);
			if(r0 != r15) {
				return automaton.rewrite(r0, r15);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return ""; }
		public final int rank() { return 0; }

		public final int minimum() { return 3; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// 
	private final static class Reduction_20 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_20(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Tuple) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.Collection c1 = (Automaton.Collection) s1;
				if(c1.size() >= 1) {
					for(int r3=0;r3!=c1.size();++r3) {
						int r2 = c1.get(r3);
						Automaton.State s2 = automaton.get(r2);
						if(s2.kind == K_Union) {
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
				Automaton.Set r9 = r6.appendFront(r8); // x append rest
				int r10 = automaton.add(r9);
				Automaton.Term r11 = new Automaton.Term(K_Tuple, r10);
				int r12 = automaton.add(r11);
				t7.add(r12);
			}
			Automaton.Set r7 = new Automaton.Set(t7.toArray());
			int r13 = automaton.add(r7);
			Automaton.Term r14 = new Automaton.Term(K_Union, r13);
			int r15 = automaton.add(r14);
			if(r0 != r15) {
				return automaton.rewrite(r0, r15);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return ""; }
		public final int rank() { return 0; }

		public final int minimum() { return 3; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// 
	private final static class Reduction_21 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_21(Pattern.Term pattern) { super(pattern); }

		public final void probe(Automaton automaton, int root, List<Activation> activations) {
			int r0 = root;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_Tuple) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.Collection c1 = (Automaton.Collection) s1;
				if(c1.size() >= 1) {
					for(int r3=0;r3!=c1.size();++r3) {
						int r2 = c1.get(r3);
						Automaton.State s2 = automaton.get(r2);
						if(s2.kind == K_Not) {
							Automaton.Term t2 = (Automaton.Term) s2;
							int r4 = t2.contents;
							int[] state = {r0, r1, r2, r3, r4, 0};
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
			int r4 = state[4]; // t
			Automaton.Collection s1 = (Automaton.Collection) automaton.get(state[1]);
			int[] s1children = new int[s1.size() - 1];
			for(int s1i=0, s1j=0; s1i != s1.size();++s1i) {
				if(s1i == r3) { continue; }
				s1children[s1j++] = s1.get(s1i);
			}
			Automaton.Set r5 = new Automaton.Set(s1children);
			Automaton.Term r6 = Any;
			int r7 = automaton.add(r6);
			Automaton.Set r8 = r5.appendFront(r7); // Any append rest
			int r9 = automaton.add(r8);
			Automaton.Term r10 = new Automaton.Term(K_Tuple, r9);
			Automaton.Set r11 = r5.appendFront(r4); // t append rest
			int r12 = automaton.add(r11);
			Automaton.Term r13 = new Automaton.Term(K_Tuple, r12);
			int r14 = automaton.add(r13);
			Automaton.Term r15 = new Automaton.Term(K_Not, r14);
			int r16 = automaton.add(r10);
			int r17 = automaton.add(r15);
			Automaton.Set r18 = new Automaton.Set(r16, r17); // {posneg}
			int r19 = automaton.add(r18);
			Automaton.Term r20 = new Automaton.Term(K_Intersect, r19);
			int r21 = automaton.add(r20);
			if(r0 != r21) {
				return automaton.rewrite(r0, r21);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}
		public final String name() { return ""; }
		public final int rank() { return 0; }

		public final int minimum() { return 3; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// term Any
	public final static int K_Any = 4;
	public final static Automaton.Term Any = new Automaton.Term(K_Any);

	// term Int
	public final static int K_Int = 5;
	public final static Automaton.Term Int = new Automaton.Term(K_Int);

	// =========================================================================
	// Schema
	// =========================================================================

	public static final Schema SCHEMA = new Schema(new Schema.Term[]{
		// $4<Not($2<^Type<$4|Any|Int|Intersect(^{$2...})|Tuple(^[$2...])|Union(^{$2...})>>)>
		Schema.Term("Not",Schema.Or(Schema.Any, Schema.Term("Any"), Schema.Term("Int"), Schema.Term("Intersect",Schema.Set(true)), Schema.Term("Tuple",Schema.List(true)), Schema.Term("Union",Schema.Any))),
		// $7<Intersect($5<^{$2<^Type<$7|Any|Int|Not($2)|Tuple(^[$2...])|Union($5)>>...}>)>
		Schema.Term("Intersect",Schema.Set(true)),
		// $7<Union($5<^{$2<^Type<$7|Any|Int|Not($2)|Intersect($5)|Tuple(^[$2...])>>...}>)>
		Schema.Term("Union",Schema.Set(true)),
		// $7<Tuple(^[$2<^Type<$7|Any|Int|Not($2)|Intersect(^{$2...})|Union(^{$2...})>>...])>
		Schema.Term("Tuple",Schema.List(true)),
		// Any
		Schema.Term("Any"),
		// Int
		Schema.Term("Int")
	});

	// =========================================================================
	// Types
	// =========================================================================

	// any
	private static Type type0 = Runtime.Type("Fs0");
	// $14<Type<Any|Int|Not(^$14)|Intersect(^{^$14...})|Tuple(^[^$14...])|Union(^{^$14...})>>
	private static Type type1 = Runtime.Type("yF3Kt0MOo3ZQtClDgk2C8t5SIs2AzFYIjG6_GHiGMOmCMOYG6KJK6RgK5KKtLPjtLNxVoLcpqQQoo7usJAEd1LYZJLgcp7OhmARdHMYcZMgwp7OlHDddXPYgoPgkq7Bt4Ai4N0");
	// Any
	private static Type type2 = Runtime.Type("2C0tLTIc2Av3w$");
	// Int
	private static Type type3 = Runtime.Type("2C8t5SIc2Av3w$");
	// $7<Tuple(^[$2<^Type<$7|Any|Int|Not($2)|Intersect(^{$2...})|Union(^{$2...})>>...])>
	private static Type type4 = Runtime.Type("yF4Kp06Q_G3Kt0MOesp7wkHDxcXEYcnEgV3C0tLTIc3AAGIHiGr3ClXIosoQoGOZZQoKaRnKqNoGKKi_qQi4LHBx3Phxq5QCmDRpHMYV4Egwp7wgmAddXPYZpPgkq7Ph5Ai480");

	// =========================================================================
	// Patterns
	// =========================================================================

	private final static Pattern.Term pattern0 = new Pattern.Term("Not",
		new Pattern.Term("Not",
			new Pattern.Leaf(type0),
			"x"),
		null);
	private final static Pattern.Term pattern1 = new Pattern.Term("Not",
		new Pattern.Term("Intersect",
			new Pattern.Set(true, new Pair[]{
				new Pair(new Pattern.Leaf(type1), "xs")}),
			null),
		null);
	private final static Pattern.Term pattern2 = new Pattern.Term("Not",
		new Pattern.Term("Union",
			new Pattern.Set(true, new Pair[]{
				new Pair(new Pattern.Leaf(type1), "xs")}),
			null),
		null);
	private final static Pattern.Term pattern3 = new Pattern.Term("Intersect",
		new Pattern.Set(false, new Pair[]{
			new Pair(new Pattern.Leaf(type1), "x")}),
		null);
	private final static Pattern.Term pattern4 = new Pattern.Term("Intersect",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("Not",
				new Pattern.Leaf(type2),
				null),null), 
			new Pair(new Pattern.Leaf(type1), "xs")}),
		null);
	private final static Pattern.Term pattern5 = new Pattern.Term("Intersect",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Leaf(type2),null), 
			new Pair(new Pattern.Leaf(type1), "xs")}),
		null);
	private final static Pattern.Term pattern6 = new Pattern.Term("Intersect",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Leaf(type3),null), 
			new Pair(new Pattern.Leaf(type4), "y"), 
			new Pair(new Pattern.Leaf(type1), "ys")}),
		null);
	private final static Pattern.Term pattern7 = new Pattern.Term("Intersect",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("Tuple",
				new Pattern.List(true, new Pair[]{
					new Pair(new Pattern.Leaf(type1), "xs")}),
				null),null), 
			new Pair(new Pattern.Term("Tuple",
				new Pattern.List(true, new Pair[]{
					new Pair(new Pattern.Leaf(type1), "ys")}),
				null),null), 
			new Pair(new Pattern.Leaf(type1), "zs")}),
		null);
	private final static Pattern.Term pattern8 = new Pattern.Term("Intersect",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("Intersect",
				new Pattern.Set(true, new Pair[]{
					new Pair(new Pattern.Leaf(type1), "xs")}),
				null),null), 
			new Pair(new Pattern.Leaf(type1), "ys")}),
		null);
	private final static Pattern.Term pattern9 = new Pattern.Term("Intersect",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("Not",
				new Pattern.Leaf(type1),
				"x"),null), 
			new Pair(new Pattern.Leaf(type1), "y"), 
			new Pair(new Pattern.Leaf(type1), "ys")}),
		null);
	private final static Pattern.Term pattern10 = new Pattern.Term("Intersect",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("Union",
				new Pattern.Set(true, new Pair[]{
					new Pair(new Pattern.Leaf(type1), "xs")}),
				null),null), 
			new Pair(new Pattern.Leaf(type1), "ys")}),
		null);
	private final static Pattern.Term pattern11 = new Pattern.Term("Intersect",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Leaf(type3), "x"), 
			new Pair(new Pattern.Term("Not",
				new Pattern.Term("Tuple",
					new Pattern.List(true, new Pair[]{
						new Pair(new Pattern.Leaf(type1),null)}),
					null),
				null),null), 
			new Pair(new Pattern.Leaf(type1), "rest")}),
		null);
	private final static Pattern.Term pattern12 = new Pattern.Term("Intersect",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Leaf(type4), "x"), 
			new Pair(new Pattern.Term("Not",
				new Pattern.Leaf(type3),
				null),null), 
			new Pair(new Pattern.Leaf(type1), "rest")}),
		null);
	private final static Pattern.Term pattern13 = new Pattern.Term("Intersect",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("Tuple",
				new Pattern.List(true, new Pair[]{
					new Pair(new Pattern.Leaf(type1), "xs")}),
				null), "t"), 
			new Pair(new Pattern.Term("Not",
				new Pattern.Term("Tuple",
					new Pattern.List(true, new Pair[]{
						new Pair(new Pattern.Leaf(type1), "ys")}),
					null),
				null),null), 
			new Pair(new Pattern.Leaf(type1), "rest")}),
		null);
	private final static Pattern.Term pattern14 = new Pattern.Term("Union",
		new Pattern.Set(false, new Pair[]{
			new Pair(new Pattern.Leaf(type1), "x")}),
		null);
	private final static Pattern.Term pattern15 = new Pattern.Term("Union",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Leaf(type2),null), 
			new Pair(new Pattern.Leaf(type1), "xs")}),
		null);
	private final static Pattern.Term pattern16 = new Pattern.Term("Union",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("Not",
				new Pattern.Leaf(type2),
				null),null), 
			new Pair(new Pattern.Leaf(type1), "xs")}),
		null);
	private final static Pattern.Term pattern17 = new Pattern.Term("Union",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("Not",
				new Pattern.Leaf(type1),
				"x"),null), 
			new Pair(new Pattern.Leaf(type1), "y"), 
			new Pair(new Pattern.Leaf(type1), "ys")}),
		null);
	private final static Pattern.Term pattern18 = new Pattern.Term("Union",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("Union",
				new Pattern.Set(true, new Pair[]{
					new Pair(new Pattern.Leaf(type1), "xs")}),
				null),null), 
			new Pair(new Pattern.Leaf(type1), "ys")}),
		null);
	private final static Pattern.Term pattern19 = new Pattern.Term("Tuple",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("Intersect",
				new Pattern.Set(true, new Pair[]{
					new Pair(new Pattern.Leaf(type1), "xs")}),
				null),null), 
			new Pair(new Pattern.Leaf(type1), "rest")}),
		null);
	private final static Pattern.Term pattern20 = new Pattern.Term("Tuple",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("Union",
				new Pattern.Set(true, new Pair[]{
					new Pair(new Pattern.Leaf(type1), "xs")}),
				null),null), 
			new Pair(new Pattern.Leaf(type1), "rest")}),
		null);
	private final static Pattern.Term pattern21 = new Pattern.Term("Tuple",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("Not",
				new Pattern.Leaf(type1),
				"t"),null), 
			new Pair(new Pattern.Leaf(type1), "rest")}),
		null);
	// =========================================================================
	// rules
	// =========================================================================

	public static final InferenceRule[] inferences = new InferenceRule[]{

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
		new Reduction_21(pattern21)
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
