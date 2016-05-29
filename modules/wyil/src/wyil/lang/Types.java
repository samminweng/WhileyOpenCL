package wyil.lang;

import java.io.*;
import java.util.*;
import java.math.BigInteger;
import wyautl.util.BigRational;
import wyautl.io.*;
import wyautl.core.*;
import wyrw.core.*;
import wyrw.util.AbstractRewriteRule;
import wyrl.core.*;
import wyrl.core.Type;
import wyrl.util.Runtime;
import wyrl.util.Pair;

public final class Types {
	// term $4<NotT($2<^Type<$4|Atom<NotT($17<^Proton<RecordT(^{^[^string,$17]...})|ArrayT($17)|ReferenceT($17)|FunctionT(^[^bool,^[$17...],^[$17...]])|Quark<AnyT|NullT|VoidT|BoolT|ByteT|IntT|NominalT(^string)>>>)|Proton<RecordT(^{^[^string,$17]...})|ArrayT($17)|ReferenceT($17)|FunctionT(^[^bool,^[$17...],^[$17...]])|Quark<AnyT|NullT|VoidT|BoolT|ByteT|IntT|NominalT(^string)>>>|OrT(^{$2...})|AndT(^{$2...})|ArrayT($2)|ReferenceT($2)|RecordT(^{^[^string,$2]...})|FunctionT(^[^bool,^[$2...],^[$2...]])>>)>
	public final static int K_NotT = 0;
	public final static int NotT(Automaton automaton, int r0) {
		return automaton.add(new Automaton.Term(K_NotT, r0));
	}

	private final static class Reduction_0 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_0(Pattern.Term pattern) {
			super(pattern);
			put("rank",0);
		}

		public final void probe(Automaton automaton, int target, List<Reduction.Activation> activations) {
			int r0 = target;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_NotT) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				if(Runtime.accepts(type0,automaton,automaton.get(r1), SCHEMA)) {
					int[] state = {r0, r1};
					activations.add(new Reduction.Activation(this,null,state));
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

	}
	private final static class Reduction_1 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_1(Pattern.Term pattern) {
			super(pattern);
			put("rank",0);
		}

		public final void probe(Automaton automaton, int target, List<Reduction.Activation> activations) {
			int r0 = target;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_NotT) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				if(Runtime.accepts(type1,automaton,automaton.get(r1), SCHEMA)) {
					int[] state = {r0, r1};
					activations.add(new Reduction.Activation(this,null,state));
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

	}
	private final static class Reduction_2 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_2(Pattern.Term pattern) {
			super(pattern);
			put("rank",0);
		}

		public final void probe(Automaton automaton, int target, List<Reduction.Activation> activations) {
			int r0 = target;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_NotT) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				if(s1.kind == K_NotT) {
					Automaton.Term t1 = (Automaton.Term) s1;
					int r2 = t1.contents;
					int[] state = {r0, r1, r2};
					activations.add(new Reduction.Activation(this,null,state));
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

	}
	private final static class Reduction_3 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_3(Pattern.Term pattern) {
			super(pattern);
			put("rank",1);
		}

		public final void probe(Automaton automaton, int target, List<Reduction.Activation> activations) {
			int r0 = target;
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
					activations.add(new Reduction.Activation(this,null,state));
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			Automaton.Collection c2 = (Automaton.Collection) automaton.get(state[2]);
			int[] c2children = new int[c2.size() - 0];
			for(int s2i=0, s2j=0; s2i != c2.size();++s2i) {
				c2children[s2j++] = c2.get(s2i);
			}
			Automaton.Set r3 = new Automaton.Set(c2children);
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

	}
	private final static class Reduction_4 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_4(Pattern.Term pattern) {
			super(pattern);
			put("rank",1);
		}

		public final void probe(Automaton automaton, int target, List<Reduction.Activation> activations) {
			int r0 = target;
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
					activations.add(new Reduction.Activation(this,null,state));
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			Automaton.Collection c2 = (Automaton.Collection) automaton.get(state[2]);
			int[] c2children = new int[c2.size() - 0];
			for(int s2i=0, s2j=0; s2i != c2.size();++s2i) {
				c2children[s2j++] = c2.get(s2i);
			}
			Automaton.Set r3 = new Automaton.Set(c2children);
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

	}
	// term $7<AndT($5<^{$2<^Type<$7|Atom<NotT($20<^Proton<RecordT(^{^[^string,$20]...})|ArrayT($20)|ReferenceT($20)|FunctionT(^[^bool,^[$20...],^[$20...]])|Quark<AnyT|NullT|VoidT|BoolT|ByteT|IntT|NominalT(^string)>>>)|Proton<RecordT(^{^[^string,$20]...})|ArrayT($20)|ReferenceT($20)|FunctionT(^[^bool,^[$20...],^[$20...]])|Quark<AnyT|NullT|VoidT|BoolT|ByteT|IntT|NominalT(^string)>>>|NotT($2)|OrT($5)|ArrayT($2)|ReferenceT($2)|RecordT(^{^[^string,$2]...})|FunctionT(^[^bool,^[$2...],^[$2...]])>>...}>)>
	public final static int K_AndT = 1;
	public final static int AndT(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.Set(r0));
		return automaton.add(new Automaton.Term(K_AndT, r1));
	}
	public final static int AndT(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.Set(r0));
		return automaton.add(new Automaton.Term(K_AndT, r1));
	}

	private final static class Reduction_5 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_5(Pattern.Term pattern) {
			super(pattern);
			put("rank",0);
		}

		public final void probe(Automaton automaton, int target, List<Reduction.Activation> activations) {
			int r0 = target;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_AndT) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.Collection c1 = (Automaton.Collection) s1;
				if(c1.size() == 0) {
					int[] state = {r0, r1};
					activations.add(new Reduction.Activation(this,null,state));
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

	}
	private final static class Reduction_6 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_6(Pattern.Term pattern) {
			super(pattern);
			put("rank",0);
		}

		public final void probe(Automaton automaton, int target, List<Reduction.Activation> activations) {
			int r0 = target;
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
						activations.add(new Reduction.Activation(this,null,state));
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

	}
	private final static class Reduction_7 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_7(Pattern.Term pattern) {
			super(pattern);
			put("rank",0);
		}

		public final void probe(Automaton automaton, int target, List<Reduction.Activation> activations) {
			int r0 = target;
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
						if(s2.kind == K_NotT) {
							Automaton.Term t2 = (Automaton.Term) s2;
							int r4 = t2.contents;
							for(int r6=0;r6!=c1.size();++r6) {
								if(r6 == r3) { continue; }
								int r5 = c1.get(r6);
								int[] c1children = new int[c1.size() - 2];
								for(int s1i=0, s1j=0; s1i != c1.size();++s1i) {
									if(s1i == r3 || s1i == r6) { continue; }
									c1children[s1j++] = c1.get(s1i);
								}
								Automaton.Set r7 = new Automaton.Set(c1children);
								boolean r8 = r4 == r5;         // t1 eq t2
								if(r8) { // REQUIRES
									int[] state = {r0, r1, r2, r3, r4, r5, r6, 0};
									activations.add(new Reduction.Activation(this,null,state));
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
			int r5 = state[5]; // t2
			int r6 = state[6];
			Automaton.Collection c1 = (Automaton.Collection) automaton.get(state[1]);
			int[] c1children = new int[c1.size() - 2];
			for(int s1i=0, s1j=0; s1i != c1.size();++s1i) {
				if(s1i == r3 || s1i == r6) { continue; }
				c1children[s1j++] = c1.get(s1i);
			}
			Automaton.Set r7 = new Automaton.Set(c1children);
			Automaton.Term r8 = VoidT;
			int r9 = automaton.add(r8);
			if(r0 != r9) {
				return automaton.rewrite(r0, r9);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}

	}
	private final static class Reduction_8 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_8(Pattern.Term pattern) {
			super(pattern);
			put("rank",0);
		}

		public final void probe(Automaton automaton, int target, List<Reduction.Activation> activations) {
			int r0 = target;
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
							activations.add(new Reduction.Activation(this,null,state));
						}
					}
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r3 = state[3];
			Automaton.Collection c4 = (Automaton.Collection) automaton.get(state[4]);
			int[] c4children = new int[c4.size() - 0];
			for(int s4i=0, s4j=0; s4i != c4.size();++s4i) {
				c4children[s4j++] = c4.get(s4i);
			}
			Automaton.Set r5 = new Automaton.Set(c4children);
			Automaton.Collection c1 = (Automaton.Collection) automaton.get(state[1]);
			int[] c1children = new int[c1.size() - 1];
			for(int s1i=0, s1j=0; s1i != c1.size();++s1i) {
				if(s1i == r3) { continue; }
				c1children[s1j++] = c1.get(s1i);
			}
			Automaton.Set r6 = new Automaton.Set(c1children);
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

	}
	private final static class Reduction_9 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_9(Pattern.Term pattern) {
			super(pattern);
			put("rank",1);
		}

		public final void probe(Automaton automaton, int target, List<Reduction.Activation> activations) {
			int r0 = target;
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
							activations.add(new Reduction.Activation(this,null,state));
						}
					}
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r3 = state[3];
			Automaton.Collection c4 = (Automaton.Collection) automaton.get(state[4]);
			int[] c4children = new int[c4.size() - 0];
			for(int s4i=0, s4j=0; s4i != c4.size();++s4i) {
				c4children[s4j++] = c4.get(s4i);
			}
			Automaton.Set r5 = new Automaton.Set(c4children);
			Automaton.Collection c1 = (Automaton.Collection) automaton.get(state[1]);
			int[] c1children = new int[c1.size() - 1];
			for(int s1i=0, s1j=0; s1i != c1.size();++s1i) {
				if(s1i == r3) { continue; }
				c1children[s1j++] = c1.get(s1i);
			}
			Automaton.Set r6 = new Automaton.Set(c1children);
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

	}
	// term $7<OrT($5<^{$2<^Type<$7|Atom<NotT($20<^Proton<RecordT(^{^[^string,$20]...})|ArrayT($20)|ReferenceT($20)|FunctionT(^[^bool,^[$20...],^[$20...]])|Quark<AnyT|NullT|VoidT|BoolT|ByteT|IntT|NominalT(^string)>>>)|Proton<RecordT(^{^[^string,$20]...})|ArrayT($20)|ReferenceT($20)|FunctionT(^[^bool,^[$20...],^[$20...]])|Quark<AnyT|NullT|VoidT|BoolT|ByteT|IntT|NominalT(^string)>>>|NotT($2)|AndT($5)|ArrayT($2)|ReferenceT($2)|RecordT(^{^[^string,$2]...})|FunctionT(^[^bool,^[$2...],^[$2...]])>>...}>)>
	public final static int K_OrT = 2;
	public final static int OrT(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.Set(r0));
		return automaton.add(new Automaton.Term(K_OrT, r1));
	}
	public final static int OrT(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.Set(r0));
		return automaton.add(new Automaton.Term(K_OrT, r1));
	}

	private final static class Reduction_10 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_10(Pattern.Term pattern) {
			super(pattern);
			put("rank",0);
		}

		public final void probe(Automaton automaton, int target, List<Reduction.Activation> activations) {
			int r0 = target;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_OrT) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.Collection c1 = (Automaton.Collection) s1;
				if(c1.size() == 0) {
					int[] state = {r0, r1};
					activations.add(new Reduction.Activation(this,null,state));
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

	}
	private final static class Reduction_11 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_11(Pattern.Term pattern) {
			super(pattern);
			put("rank",0);
		}

		public final void probe(Automaton automaton, int target, List<Reduction.Activation> activations) {
			int r0 = target;
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
						activations.add(new Reduction.Activation(this,null,state));
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

	}
	private final static class Reduction_12 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_12(Pattern.Term pattern) {
			super(pattern);
			put("rank",0);
		}

		public final void probe(Automaton automaton, int target, List<Reduction.Activation> activations) {
			int r0 = target;
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
							activations.add(new Reduction.Activation(this,null,state));
						}
					}
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r3 = state[3];
			Automaton.Collection c4 = (Automaton.Collection) automaton.get(state[4]);
			int[] c4children = new int[c4.size() - 0];
			for(int s4i=0, s4j=0; s4i != c4.size();++s4i) {
				c4children[s4j++] = c4.get(s4i);
			}
			Automaton.Set r5 = new Automaton.Set(c4children);
			Automaton.Collection c1 = (Automaton.Collection) automaton.get(state[1]);
			int[] c1children = new int[c1.size() - 1];
			for(int s1i=0, s1j=0; s1i != c1.size();++s1i) {
				if(s1i == r3) { continue; }
				c1children[s1j++] = c1.get(s1i);
			}
			Automaton.Set r6 = new Automaton.Set(c1children);
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

	}
	// term $12<RecordT(^{^[^string,$3<^Type<$12|Atom<NotT($25<^Proton<RecordT(^{^[^string,$25]...})|ArrayT($25)|ReferenceT($25)|FunctionT(^[^bool,^[$25...],^[$25...]])|Quark<AnyT|NullT|VoidT|BoolT|ByteT|IntT|NominalT(^string)>>>)|Proton<RecordT(^{^[^string,$25]...})|ArrayT($25)|ReferenceT($25)|FunctionT(^[^bool,^[$25...],^[$25...]])|Quark<AnyT|NullT|VoidT|BoolT|ByteT|IntT|NominalT(^string)>>>|NotT($3)|OrT(^{$3...})|AndT(^{$3...})|ArrayT($3)|ReferenceT($3)|FunctionT(^[^bool,^[$3...],^[$3...]])>>]...})>
	public final static int K_RecordT = 3;
	public final static int RecordT(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.Set(r0));
		return automaton.add(new Automaton.Term(K_RecordT, r1));
	}
	public final static int RecordT(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.Set(r0));
		return automaton.add(new Automaton.Term(K_RecordT, r1));
	}

	private final static class Reduction_13 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_13(Pattern.Term pattern) {
			super(pattern);
			put("rank",0);
		}

		public final void probe(Automaton automaton, int target, List<Reduction.Activation> activations) {
			int r0 = target;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_RecordT) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.Collection c1 = (Automaton.Collection) s1;
				if(c1.size() >= 1) {
					for(int r3=0;r3!=c1.size();++r3) {
						int r2 = c1.get(r3);
						Automaton.State s2 = automaton.get(r2);
						Automaton.List l2 = (Automaton.List) s2;
						int r4 = l2.get(0);
						int r5 = l2.get(1);
						if(Runtime.accepts(type1,automaton,automaton.get(r5), SCHEMA)) {
							int[] state = {r0, r1, r2, r3, r4, r5, 0};
							activations.add(new Reduction.Activation(this,null,state));
						}
					}
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r3 = state[3];
			Automaton.Collection c1 = (Automaton.Collection) automaton.get(state[1]);
			int[] c1children = new int[c1.size() - 1];
			for(int s1i=0, s1j=0; s1i != c1.size();++s1i) {
				if(s1i == r3) { continue; }
				c1children[s1j++] = c1.get(s1i);
			}
			Automaton.Set r6 = new Automaton.Set(c1children);
			Automaton.Term r7 = VoidT;
			int r8 = automaton.add(r7);
			if(r0 != r8) {
				return automaton.rewrite(r0, r8);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}

	}
	private final static class Reduction_14 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_14(Pattern.Term pattern) {
			super(pattern);
			put("rank",0);
		}

		public final void probe(Automaton automaton, int target, List<Reduction.Activation> activations) {
			int r0 = target;
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
						if(s2.kind == K_RecordT) {
							Automaton.Term t2 = (Automaton.Term) s2;
							int r4 = t2.contents;
							Automaton.State s4 = automaton.get(r4);
							Automaton.Collection c4 = (Automaton.Collection) s4;
							for(int r7=0;r7!=c1.size();++r7) {
								if(r7 == r3) { continue; }
								int r6 = c1.get(r7);
								Automaton.State s6 = automaton.get(r6);
								if(s6.kind == K_RecordT) {
									Automaton.Term t6 = (Automaton.Term) s6;
									int r8 = t6.contents;
									Automaton.State s8 = automaton.get(r8);
									Automaton.Collection c8 = (Automaton.Collection) s8;
									int[] c4children = new int[c4.size() - 0];
									for(int s4i=0, s4j=0; s4i != c4.size();++s4i) {
										c4children[s4j++] = c4.get(s4i);
									}
									Automaton.Set r5 = new Automaton.Set(c4children);
									int[] c8children = new int[c8.size() - 0];
									for(int s8i=0, s8j=0; s8i != c8.size();++s8i) {
										c8children[s8j++] = c8.get(s8i);
									}
									Automaton.Set r9 = new Automaton.Set(c8children);
									int[] c1children = new int[c1.size() - 2];
									for(int s1i=0, s1j=0; s1i != c1.size();++s1i) {
										if(s1i == r3 || s1i == r7) { continue; }
										c1children[s1j++] = c1.get(s1i);
									}
									Automaton.Set r10 = new Automaton.Set(c1children);
									Automaton.Int r11 = r5.lengthOf(); // |t1s|
									Automaton.Int r12 = r9.lengthOf(); // |t2s|
									boolean r13 = !r11.equals(r12); // |t1s| neq |t2s|
									if(r13) { // REQUIRES
										int[] state = {r0, r1, r2, r3, r4, 0, r6, r7, r8, 0, 0};
										activations.add(new Reduction.Activation(this,null,state));
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
			Automaton.Collection c4 = (Automaton.Collection) automaton.get(state[4]);
			int[] c4children = new int[c4.size() - 0];
			for(int s4i=0, s4j=0; s4i != c4.size();++s4i) {
				c4children[s4j++] = c4.get(s4i);
			}
			Automaton.Set r5 = new Automaton.Set(c4children);
			int r7 = state[7];
			Automaton.Collection c8 = (Automaton.Collection) automaton.get(state[8]);
			int[] c8children = new int[c8.size() - 0];
			for(int s8i=0, s8j=0; s8i != c8.size();++s8i) {
				c8children[s8j++] = c8.get(s8i);
			}
			Automaton.Set r9 = new Automaton.Set(c8children);
			Automaton.Collection c1 = (Automaton.Collection) automaton.get(state[1]);
			int[] c1children = new int[c1.size() - 2];
			for(int s1i=0, s1j=0; s1i != c1.size();++s1i) {
				if(s1i == r3 || s1i == r7) { continue; }
				c1children[s1j++] = c1.get(s1i);
			}
			Automaton.Set r10 = new Automaton.Set(c1children);
			Automaton.Term r11 = VoidT;
			int r12 = automaton.add(r11);
			if(r0 != r12) {
				return automaton.rewrite(r0, r12);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}

	}
	private final static class Reduction_15 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_15(Pattern.Term pattern) {
			super(pattern);
		}

		public final void probe(Automaton automaton, int target, List<Reduction.Activation> activations) {
			int r0 = target;
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
						if(s2.kind == K_RecordT) {
							Automaton.Term t2 = (Automaton.Term) s2;
							int r4 = t2.contents;
							Automaton.State s4 = automaton.get(r4);
							Automaton.Collection c4 = (Automaton.Collection) s4;
							for(int r7=0;r7!=c1.size();++r7) {
								if(r7 == r3) { continue; }
								int r6 = c1.get(r7);
								Automaton.State s6 = automaton.get(r6);
								if(s6.kind == K_RecordT) {
									Automaton.Term t6 = (Automaton.Term) s6;
									int r8 = t6.contents;
									Automaton.State s8 = automaton.get(r8);
									Automaton.Collection c8 = (Automaton.Collection) s8;
									int[] c4children = new int[c4.size() - 0];
									for(int s4i=0, s4j=0; s4i != c4.size();++s4i) {
										c4children[s4j++] = c4.get(s4i);
									}
									Automaton.Set r5 = new Automaton.Set(c4children);
									int[] c8children = new int[c8.size() - 0];
									for(int s8i=0, s8j=0; s8i != c8.size();++s8i) {
										c8children[s8j++] = c8.get(s8i);
									}
									Automaton.Set r9 = new Automaton.Set(c8children);
									int[] c1children = new int[c1.size() - 2];
									for(int s1i=0, s1j=0; s1i != c1.size();++s1i) {
										if(s1i == r3 || s1i == r7) { continue; }
										c1children[s1j++] = c1.get(s1i);
									}
									Automaton.Set r10 = new Automaton.Set(c1children);
									Automaton.Int r11 = r5.lengthOf(); // |t1s|
									Automaton.Int r12 = r9.lengthOf(); // |t2s|
									boolean r13 = r11.equals(r12); // |t1s| eq |t2s|
									boolean r14 = false;           // |t1s| eq |t2s| && wyrl.core.Expr$Comprehension@7a8406c2 neq wyrl.core.Expr$Comprehension@17690e14
									if(r13) {
										Automaton.List t15 = new Automaton.List();
										for(int i16=0;i16<r5.size();i16++) {
											int r16 = (int) r5.get(i16);
											Automaton.Int r17 = new Automaton.Int(0); // 0
											Automaton.List r18 = (Automaton.List) automaton.get(r16);
											int r19 = r18.indexOf(r17);    // p[0]
											t15.add(r19);
										}
										Automaton.Set r15 = new Automaton.Set(t15.toArray());
										Automaton.List t20 = new Automaton.List();
										for(int i21=0;i21<r9.size();i21++) {
											int r21 = (int) r9.get(i21);
											Automaton.Int r22 = new Automaton.Int(0); // 0
											Automaton.List r23 = (Automaton.List) automaton.get(r21);
											int r24 = r23.indexOf(r22);    // p[0]
											t20.add(r24);
										}
										Automaton.Set r20 = new Automaton.Set(t20.toArray());
										boolean r25 = !r15.equals(r20); // wyrl.core.Expr$Comprehension@7a8406c2 neq wyrl.core.Expr$Comprehension@17690e14
										r14 = r25;
									}
									if(r14) { // REQUIRES
										int[] state = {r0, r1, r2, r3, r4, 0, r6, r7, r8, 0, 0};
										activations.add(new Reduction.Activation(this,null,state));
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
			Automaton.Collection c4 = (Automaton.Collection) automaton.get(state[4]);
			int[] c4children = new int[c4.size() - 0];
			for(int s4i=0, s4j=0; s4i != c4.size();++s4i) {
				c4children[s4j++] = c4.get(s4i);
			}
			Automaton.Set r5 = new Automaton.Set(c4children);
			int r7 = state[7];
			Automaton.Collection c8 = (Automaton.Collection) automaton.get(state[8]);
			int[] c8children = new int[c8.size() - 0];
			for(int s8i=0, s8j=0; s8i != c8.size();++s8i) {
				c8children[s8j++] = c8.get(s8i);
			}
			Automaton.Set r9 = new Automaton.Set(c8children);
			Automaton.Collection c1 = (Automaton.Collection) automaton.get(state[1]);
			int[] c1children = new int[c1.size() - 2];
			for(int s1i=0, s1j=0; s1i != c1.size();++s1i) {
				if(s1i == r3 || s1i == r7) { continue; }
				c1children[s1j++] = c1.get(s1i);
			}
			Automaton.Set r10 = new Automaton.Set(c1children);
			Automaton.Term r11 = VoidT;
			int r12 = automaton.add(r11);
			if(r0 != r12) {
				return automaton.rewrite(r0, r12);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}

	}
	private final static class Reduction_16 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_16(Pattern.Term pattern) {
			super(pattern);
			put("rank",2);
		}

		public final void probe(Automaton automaton, int target, List<Reduction.Activation> activations) {
			int r0 = target;
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
						if(s2.kind == K_RecordT) {
							Automaton.Term t2 = (Automaton.Term) s2;
							int r4 = t2.contents;
							Automaton.State s4 = automaton.get(r4);
							Automaton.Collection c4 = (Automaton.Collection) s4;
							for(int r7=0;r7!=c1.size();++r7) {
								if(r7 == r3) { continue; }
								int r6 = c1.get(r7);
								Automaton.State s6 = automaton.get(r6);
								if(s6.kind == K_RecordT) {
									Automaton.Term t6 = (Automaton.Term) s6;
									int r8 = t6.contents;
									Automaton.State s8 = automaton.get(r8);
									Automaton.Collection c8 = (Automaton.Collection) s8;
									int[] c4children = new int[c4.size() - 0];
									for(int s4i=0, s4j=0; s4i != c4.size();++s4i) {
										c4children[s4j++] = c4.get(s4i);
									}
									Automaton.Set r5 = new Automaton.Set(c4children);
									int[] c8children = new int[c8.size() - 0];
									for(int s8i=0, s8j=0; s8i != c8.size();++s8i) {
										c8children[s8j++] = c8.get(s8i);
									}
									Automaton.Set r9 = new Automaton.Set(c8children);
									int[] c1children = new int[c1.size() - 2];
									for(int s1i=0, s1j=0; s1i != c1.size();++s1i) {
										if(s1i == r3 || s1i == r7) { continue; }
										c1children[s1j++] = c1.get(s1i);
									}
									Automaton.Set r10 = new Automaton.Set(c1children);
									Automaton.Int r11 = r5.lengthOf(); // |t1s|
									Automaton.Int r12 = r9.lengthOf(); // |t2s|
									boolean r13 = r11.equals(r12); // |t1s| eq |t2s|
									boolean r14 = false;           // |t1s| eq |t2s| && wyrl.core.Expr$Comprehension@2f00f851 eq wyrl.core.Expr$Comprehension@4207609e
									if(r13) {
										Automaton.List t15 = new Automaton.List();
										for(int i16=0;i16<r5.size();i16++) {
											int r16 = (int) r5.get(i16);
											Automaton.Int r17 = new Automaton.Int(0); // 0
											Automaton.List r18 = (Automaton.List) automaton.get(r16);
											int r19 = r18.indexOf(r17);    // p[0]
											t15.add(r19);
										}
										Automaton.Set r15 = new Automaton.Set(t15.toArray());
										Automaton.List t20 = new Automaton.List();
										for(int i21=0;i21<r9.size();i21++) {
											int r21 = (int) r9.get(i21);
											Automaton.Int r22 = new Automaton.Int(0); // 0
											Automaton.List r23 = (Automaton.List) automaton.get(r21);
											int r24 = r23.indexOf(r22);    // p[0]
											t20.add(r24);
										}
										Automaton.Set r20 = new Automaton.Set(t20.toArray());
										boolean r25 = r15.equals(r20); // wyrl.core.Expr$Comprehension@2f00f851 eq wyrl.core.Expr$Comprehension@4207609e
										r14 = r25;
									}
									if(r14) { // REQUIRES
										int[] state = {r0, r1, r2, r3, r4, 0, r6, r7, r8, 0, 0};
										activations.add(new Reduction.Activation(this,null,state));
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
			Automaton.Collection c4 = (Automaton.Collection) automaton.get(state[4]);
			int[] c4children = new int[c4.size() - 0];
			for(int s4i=0, s4j=0; s4i != c4.size();++s4i) {
				c4children[s4j++] = c4.get(s4i);
			}
			Automaton.Set r5 = new Automaton.Set(c4children);
			int r7 = state[7];
			Automaton.Collection c8 = (Automaton.Collection) automaton.get(state[8]);
			int[] c8children = new int[c8.size() - 0];
			for(int s8i=0, s8j=0; s8i != c8.size();++s8i) {
				c8children[s8j++] = c8.get(s8i);
			}
			Automaton.Set r9 = new Automaton.Set(c8children);
			Automaton.Collection c1 = (Automaton.Collection) automaton.get(state[1]);
			int[] c1children = new int[c1.size() - 2];
			for(int s1i=0, s1j=0; s1i != c1.size();++s1i) {
				if(s1i == r3 || s1i == r7) { continue; }
				c1children[s1j++] = c1.get(s1i);
			}
			Automaton.Set r10 = new Automaton.Set(c1children);
			Automaton.List t11 = new Automaton.List();
			for(int i12=0;i12<r5.size();i12++) {
				int r12 = (int) r5.get(i12);
				for(int i13=0;i13<r9.size();i13++) {
					int r13 = (int) r9.get(i13);
					Automaton.Int r14 = new Automaton.Int(0); // 0
					Automaton.List r15 = (Automaton.List) automaton.get(r12);
					int r16 = r15.indexOf(r14);    // p1[0]
					Automaton.Int r17 = new Automaton.Int(0); // 0
					Automaton.List r18 = (Automaton.List) automaton.get(r13);
					int r19 = r18.indexOf(r17);    // p2[0]
					boolean r20 = r16 == r19;      // p1[0] eq p2[0]
					if(r20) {
						Automaton.Int r21 = new Automaton.Int(0); // 0
						Automaton.List r22 = (Automaton.List) automaton.get(r12);
						int r23 = r22.indexOf(r21);    // p1[0]
						Automaton.Int r24 = new Automaton.Int(1); // 1
						Automaton.List r25 = (Automaton.List) automaton.get(r12);
						int r26 = r25.indexOf(r24);    // p1[1]
						Automaton.Int r27 = new Automaton.Int(1); // 1
						Automaton.List r28 = (Automaton.List) automaton.get(r13);
						int r29 = r28.indexOf(r27);    // p2[1]
						Automaton.Set r30 = new Automaton.Set(r26, r29); // {p1[1]p2[1]}
						int r31 = automaton.add(r30);
						Automaton.Term r32 = new Automaton.Term(K_AndT, r31);
						int r33 = automaton.add(r32);
						Automaton.List r34 = new Automaton.List(r23, r33); // [p1[0]AndT({p1[1]p2[1]})]
						int r35 = automaton.add(r34);
						t11.add(r35);
					}
				}
			}
			Automaton.Set r11 = new Automaton.Set(t11.toArray());
			int r36 = automaton.add(r11);
			Automaton.Term r37 = new Automaton.Term(K_RecordT, r36);
			int r38 = automaton.add(r37);
			Automaton.Set r39 = r10.appendFront(r38); // RecordT(f1s) append ts
			int r40 = automaton.add(r39);
			Automaton.Term r41 = new Automaton.Term(K_AndT, r40);
			int r42 = automaton.add(r41);
			if(r0 != r42) {
				return automaton.rewrite(r0, r42);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}

	}
	private final static class Reduction_17 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_17(Pattern.Term pattern) {
			super(pattern);
			put("rank",1);
		}

		public final void probe(Automaton automaton, int target, List<Reduction.Activation> activations) {
			int r0 = target;
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
						if(s2.kind == K_RecordT) {
							Automaton.Term t2 = (Automaton.Term) s2;
							int r4 = t2.contents;
							Automaton.State s4 = automaton.get(r4);
							Automaton.Collection c4 = (Automaton.Collection) s4;
							for(int r7=0;r7!=c1.size();++r7) {
								if(r7 == r3) { continue; }
								int r6 = c1.get(r7);
								Automaton.State s6 = automaton.get(r6);
								if(s6.kind == K_NotT) {
									Automaton.Term t6 = (Automaton.Term) s6;
									int r8 = t6.contents;
									Automaton.State s8 = automaton.get(r8);
									if(s8.kind == K_RecordT) {
										Automaton.Term t8 = (Automaton.Term) s8;
										int r9 = t8.contents;
										Automaton.State s9 = automaton.get(r9);
										Automaton.Collection c9 = (Automaton.Collection) s9;
										int[] c4children = new int[c4.size() - 0];
										for(int s4i=0, s4j=0; s4i != c4.size();++s4i) {
											c4children[s4j++] = c4.get(s4i);
										}
										Automaton.Set r5 = new Automaton.Set(c4children);
										int[] c9children = new int[c9.size() - 0];
										for(int s9i=0, s9j=0; s9i != c9.size();++s9i) {
											c9children[s9j++] = c9.get(s9i);
										}
										Automaton.Set r10 = new Automaton.Set(c9children);
										int[] c1children = new int[c1.size() - 2];
										for(int s1i=0, s1j=0; s1i != c1.size();++s1i) {
											if(s1i == r3 || s1i == r7) { continue; }
											c1children[s1j++] = c1.get(s1i);
										}
										Automaton.Set r11 = new Automaton.Set(c1children);
										Automaton.Int r12 = r5.lengthOf(); // |t1s|
										Automaton.Int r13 = r10.lengthOf(); // |t2s|
										boolean r14 = !r12.equals(r13); // |t1s| neq |t2s|
										if(r14) { // REQUIRES
											int[] state = {r0, r1, r2, r3, r4, 0, r6, r7, r8, r9, 0, 0};
											activations.add(new Reduction.Activation(this,null,state));
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
			int r2 = state[2]; // r
			int r3 = state[3];
			Automaton.Collection c4 = (Automaton.Collection) automaton.get(state[4]);
			int[] c4children = new int[c4.size() - 0];
			for(int s4i=0, s4j=0; s4i != c4.size();++s4i) {
				c4children[s4j++] = c4.get(s4i);
			}
			Automaton.Set r5 = new Automaton.Set(c4children);
			int r7 = state[7];
			Automaton.Collection c9 = (Automaton.Collection) automaton.get(state[9]);
			int[] c9children = new int[c9.size() - 0];
			for(int s9i=0, s9j=0; s9i != c9.size();++s9i) {
				c9children[s9j++] = c9.get(s9i);
			}
			Automaton.Set r10 = new Automaton.Set(c9children);
			Automaton.Collection c1 = (Automaton.Collection) automaton.get(state[1]);
			int[] c1children = new int[c1.size() - 2];
			for(int s1i=0, s1j=0; s1i != c1.size();++s1i) {
				if(s1i == r3 || s1i == r7) { continue; }
				c1children[s1j++] = c1.get(s1i);
			}
			Automaton.Set r11 = new Automaton.Set(c1children);
			Automaton.Set r12 = r11.appendFront(r2); // r append ts
			int r13 = automaton.add(r12);
			Automaton.Term r14 = new Automaton.Term(K_AndT, r13);
			int r15 = automaton.add(r14);
			if(r0 != r15) {
				return automaton.rewrite(r0, r15);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}

	}
	private final static class Reduction_18 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_18(Pattern.Term pattern) {
			super(pattern);
			put("rank",2);
		}

		public final void probe(Automaton automaton, int target, List<Reduction.Activation> activations) {
			int r0 = target;
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
						if(s2.kind == K_RecordT) {
							Automaton.Term t2 = (Automaton.Term) s2;
							int r4 = t2.contents;
							Automaton.State s4 = automaton.get(r4);
							Automaton.Collection c4 = (Automaton.Collection) s4;
							for(int r7=0;r7!=c1.size();++r7) {
								if(r7 == r3) { continue; }
								int r6 = c1.get(r7);
								Automaton.State s6 = automaton.get(r6);
								if(s6.kind == K_NotT) {
									Automaton.Term t6 = (Automaton.Term) s6;
									int r8 = t6.contents;
									Automaton.State s8 = automaton.get(r8);
									if(s8.kind == K_RecordT) {
										Automaton.Term t8 = (Automaton.Term) s8;
										int r9 = t8.contents;
										Automaton.State s9 = automaton.get(r9);
										Automaton.Collection c9 = (Automaton.Collection) s9;
										int[] c4children = new int[c4.size() - 0];
										for(int s4i=0, s4j=0; s4i != c4.size();++s4i) {
											c4children[s4j++] = c4.get(s4i);
										}
										Automaton.Set r5 = new Automaton.Set(c4children);
										int[] c9children = new int[c9.size() - 0];
										for(int s9i=0, s9j=0; s9i != c9.size();++s9i) {
											c9children[s9j++] = c9.get(s9i);
										}
										Automaton.Set r10 = new Automaton.Set(c9children);
										int[] c1children = new int[c1.size() - 2];
										for(int s1i=0, s1j=0; s1i != c1.size();++s1i) {
											if(s1i == r3 || s1i == r7) { continue; }
											c1children[s1j++] = c1.get(s1i);
										}
										Automaton.Set r11 = new Automaton.Set(c1children);
										Automaton.Int r12 = r5.lengthOf(); // |t1s|
										Automaton.Int r13 = r10.lengthOf(); // |t2s|
										boolean r14 = r12.equals(r13); // |t1s| eq |t2s|
										boolean r15 = false;           // |t1s| eq |t2s| && wyrl.core.Expr$Comprehension@c6c82aa neq wyrl.core.Expr$Comprehension@2e179f3e
										if(r14) {
											Automaton.List t16 = new Automaton.List();
											for(int i17=0;i17<r5.size();i17++) {
												int r17 = (int) r5.get(i17);
												Automaton.Int r18 = new Automaton.Int(0); // 0
												Automaton.List r19 = (Automaton.List) automaton.get(r17);
												int r20 = r19.indexOf(r18);    // p[0]
												t16.add(r20);
											}
											Automaton.Set r16 = new Automaton.Set(t16.toArray());
											Automaton.List t21 = new Automaton.List();
											for(int i22=0;i22<r10.size();i22++) {
												int r22 = (int) r10.get(i22);
												Automaton.Int r23 = new Automaton.Int(0); // 0
												Automaton.List r24 = (Automaton.List) automaton.get(r22);
												int r25 = r24.indexOf(r23);    // p[0]
												t21.add(r25);
											}
											Automaton.Set r21 = new Automaton.Set(t21.toArray());
											boolean r26 = !r16.equals(r21); // wyrl.core.Expr$Comprehension@c6c82aa neq wyrl.core.Expr$Comprehension@2e179f3e
											r15 = r26;
										}
										if(r15) { // REQUIRES
											int[] state = {r0, r1, r2, r3, r4, 0, r6, r7, r8, r9, 0, 0};
											activations.add(new Reduction.Activation(this,null,state));
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
			int r2 = state[2]; // r
			int r3 = state[3];
			Automaton.Collection c4 = (Automaton.Collection) automaton.get(state[4]);
			int[] c4children = new int[c4.size() - 0];
			for(int s4i=0, s4j=0; s4i != c4.size();++s4i) {
				c4children[s4j++] = c4.get(s4i);
			}
			Automaton.Set r5 = new Automaton.Set(c4children);
			int r7 = state[7];
			Automaton.Collection c9 = (Automaton.Collection) automaton.get(state[9]);
			int[] c9children = new int[c9.size() - 0];
			for(int s9i=0, s9j=0; s9i != c9.size();++s9i) {
				c9children[s9j++] = c9.get(s9i);
			}
			Automaton.Set r10 = new Automaton.Set(c9children);
			Automaton.Collection c1 = (Automaton.Collection) automaton.get(state[1]);
			int[] c1children = new int[c1.size() - 2];
			for(int s1i=0, s1j=0; s1i != c1.size();++s1i) {
				if(s1i == r3 || s1i == r7) { continue; }
				c1children[s1j++] = c1.get(s1i);
			}
			Automaton.Set r11 = new Automaton.Set(c1children);
			Automaton.Set r12 = r11.appendFront(r2); // r append ts
			int r13 = automaton.add(r12);
			Automaton.Term r14 = new Automaton.Term(K_AndT, r13);
			int r15 = automaton.add(r14);
			if(r0 != r15) {
				return automaton.rewrite(r0, r15);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}

	}
	private final static class Reduction_19 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_19(Pattern.Term pattern) {
			super(pattern);
			put("rank",2);
		}

		public final void probe(Automaton automaton, int target, List<Reduction.Activation> activations) {
			int r0 = target;
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
						if(s2.kind == K_RecordT) {
							Automaton.Term t2 = (Automaton.Term) s2;
							int r4 = t2.contents;
							Automaton.State s4 = automaton.get(r4);
							Automaton.Collection c4 = (Automaton.Collection) s4;
							for(int r7=0;r7!=c1.size();++r7) {
								if(r7 == r3) { continue; }
								int r6 = c1.get(r7);
								Automaton.State s6 = automaton.get(r6);
								if(s6.kind == K_NotT) {
									Automaton.Term t6 = (Automaton.Term) s6;
									int r8 = t6.contents;
									Automaton.State s8 = automaton.get(r8);
									if(s8.kind == K_RecordT) {
										Automaton.Term t8 = (Automaton.Term) s8;
										int r9 = t8.contents;
										Automaton.State s9 = automaton.get(r9);
										Automaton.Collection c9 = (Automaton.Collection) s9;
										int[] c4children = new int[c4.size() - 0];
										for(int s4i=0, s4j=0; s4i != c4.size();++s4i) {
											c4children[s4j++] = c4.get(s4i);
										}
										Automaton.Set r5 = new Automaton.Set(c4children);
										int[] c9children = new int[c9.size() - 0];
										for(int s9i=0, s9j=0; s9i != c9.size();++s9i) {
											c9children[s9j++] = c9.get(s9i);
										}
										Automaton.Set r10 = new Automaton.Set(c9children);
										int[] c1children = new int[c1.size() - 2];
										for(int s1i=0, s1j=0; s1i != c1.size();++s1i) {
											if(s1i == r3 || s1i == r7) { continue; }
											c1children[s1j++] = c1.get(s1i);
										}
										Automaton.Set r11 = new Automaton.Set(c1children);
										Automaton.Int r12 = r5.lengthOf(); // |t1s|
										Automaton.Int r13 = r10.lengthOf(); // |t2s|
										boolean r14 = r12.equals(r13); // |t1s| eq |t2s|
										boolean r15 = false;           // |t1s| eq |t2s| && wyrl.core.Expr$Comprehension@16e7b402 eq wyrl.core.Expr$Comprehension@534c6767
										if(r14) {
											Automaton.List t16 = new Automaton.List();
											for(int i17=0;i17<r5.size();i17++) {
												int r17 = (int) r5.get(i17);
												Automaton.Int r18 = new Automaton.Int(0); // 0
												Automaton.List r19 = (Automaton.List) automaton.get(r17);
												int r20 = r19.indexOf(r18);    // p[0]
												t16.add(r20);
											}
											Automaton.Set r16 = new Automaton.Set(t16.toArray());
											Automaton.List t21 = new Automaton.List();
											for(int i22=0;i22<r10.size();i22++) {
												int r22 = (int) r10.get(i22);
												Automaton.Int r23 = new Automaton.Int(0); // 0
												Automaton.List r24 = (Automaton.List) automaton.get(r22);
												int r25 = r24.indexOf(r23);    // p[0]
												t21.add(r25);
											}
											Automaton.Set r21 = new Automaton.Set(t21.toArray());
											boolean r26 = r16.equals(r21); // wyrl.core.Expr$Comprehension@16e7b402 eq wyrl.core.Expr$Comprehension@534c6767
											r15 = r26;
										}
										if(r15) { // REQUIRES
											int[] state = {r0, r1, r2, r3, r4, 0, r6, r7, r8, r9, 0, 0};
											activations.add(new Reduction.Activation(this,null,state));
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
			Automaton.Collection c4 = (Automaton.Collection) automaton.get(state[4]);
			int[] c4children = new int[c4.size() - 0];
			for(int s4i=0, s4j=0; s4i != c4.size();++s4i) {
				c4children[s4j++] = c4.get(s4i);
			}
			Automaton.Set r5 = new Automaton.Set(c4children);
			int r7 = state[7];
			Automaton.Collection c9 = (Automaton.Collection) automaton.get(state[9]);
			int[] c9children = new int[c9.size() - 0];
			for(int s9i=0, s9j=0; s9i != c9.size();++s9i) {
				c9children[s9j++] = c9.get(s9i);
			}
			Automaton.Set r10 = new Automaton.Set(c9children);
			Automaton.Collection c1 = (Automaton.Collection) automaton.get(state[1]);
			int[] c1children = new int[c1.size() - 2];
			for(int s1i=0, s1j=0; s1i != c1.size();++s1i) {
				if(s1i == r3 || s1i == r7) { continue; }
				c1children[s1j++] = c1.get(s1i);
			}
			Automaton.Set r11 = new Automaton.Set(c1children);
			Automaton.List t12 = new Automaton.List();
			for(int i13=0;i13<r5.size();i13++) {
				int r13 = (int) r5.get(i13);
				for(int i14=0;i14<r10.size();i14++) {
					int r14 = (int) r10.get(i14);
					Automaton.Int r15 = new Automaton.Int(0); // 0
					Automaton.List r16 = (Automaton.List) automaton.get(r13);
					int r17 = r16.indexOf(r15);    // p1[0]
					Automaton.Int r18 = new Automaton.Int(0); // 0
					Automaton.List r19 = (Automaton.List) automaton.get(r14);
					int r20 = r19.indexOf(r18);    // p2[0]
					boolean r21 = r17 == r20;      // p1[0] eq p2[0]
					if(r21) {
						Automaton.Int r22 = new Automaton.Int(0); // 0
						Automaton.List r23 = (Automaton.List) automaton.get(r13);
						int r24 = r23.indexOf(r22);    // p1[0]
						Automaton.Int r25 = new Automaton.Int(1); // 1
						Automaton.List r26 = (Automaton.List) automaton.get(r13);
						int r27 = r26.indexOf(r25);    // p1[1]
						Automaton.Int r28 = new Automaton.Int(1); // 1
						Automaton.List r29 = (Automaton.List) automaton.get(r14);
						int r30 = r29.indexOf(r28);    // p2[1]
						Automaton.Term r31 = new Automaton.Term(K_NotT, r30);
						int r32 = automaton.add(r31);
						Automaton.Set r33 = new Automaton.Set(r27, r32); // {p1[1]NotT(p2[1])}
						int r34 = automaton.add(r33);
						Automaton.Term r35 = new Automaton.Term(K_AndT, r34);
						int r36 = automaton.add(r35);
						Automaton.List r37 = new Automaton.List(r24, r36); // [p1[0]AndT({p1[1]NotT(p2[1])})]
						int r38 = automaton.add(r37);
						t12.add(r38);
					}
				}
			}
			Automaton.Set r12 = new Automaton.Set(t12.toArray());
			int r39 = automaton.add(r12);
			Automaton.Term r40 = new Automaton.Term(K_RecordT, r39);
			int r41 = automaton.add(r40);
			Automaton.Set r42 = r11.appendFront(r41); // RecordT(f1s) append ts
			int r43 = automaton.add(r42);
			Automaton.Term r44 = new Automaton.Term(K_AndT, r43);
			int r45 = automaton.add(r44);
			if(r0 != r45) {
				return automaton.rewrite(r0, r45);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}

	}
	// term $4<ArrayT($2<^Type<$4|Atom<NotT($17<^Proton<RecordT(^{^[^string,$17]...})|ArrayT($17)|ReferenceT($17)|FunctionT(^[^bool,^[$17...],^[$17...]])|Quark<AnyT|NullT|VoidT|BoolT|ByteT|IntT|NominalT(^string)>>>)|Proton<RecordT(^{^[^string,$17]...})|ArrayT($17)|ReferenceT($17)|FunctionT(^[^bool,^[$17...],^[$17...]])|Quark<AnyT|NullT|VoidT|BoolT|ByteT|IntT|NominalT(^string)>>>|NotT($2)|OrT(^{$2...})|AndT(^{$2...})|ReferenceT($2)|RecordT(^{^[^string,$2]...})|FunctionT(^[^bool,^[$2...],^[$2...]])>>)>
	public final static int K_ArrayT = 4;
	public final static int ArrayT(Automaton automaton, int r0) {
		return automaton.add(new Automaton.Term(K_ArrayT, r0));
	}

	private final static class Reduction_20 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_20(Pattern.Term pattern) {
			super(pattern);
			put("rank",0);
		}

		public final void probe(Automaton automaton, int target, List<Reduction.Activation> activations) {
			int r0 = target;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_ArrayT) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				if(Runtime.accepts(type1,automaton,automaton.get(r1), SCHEMA)) {
					int[] state = {r0, r1};
					activations.add(new Reduction.Activation(this,null,state));
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

	}
	private final static class Reduction_21 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_21(Pattern.Term pattern) {
			super(pattern);
			put("rank",0);
		}

		public final void probe(Automaton automaton, int target, List<Reduction.Activation> activations) {
			int r0 = target;
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
									activations.add(new Reduction.Activation(this,null,state));
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
			Automaton.Collection c1 = (Automaton.Collection) automaton.get(state[1]);
			int[] c1children = new int[c1.size() - 2];
			for(int s1i=0, s1j=0; s1i != c1.size();++s1i) {
				if(s1i == r3 || s1i == r6) { continue; }
				c1children[s1j++] = c1.get(s1i);
			}
			Automaton.Set r8 = new Automaton.Set(c1children);
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

	}
	private final static class Reduction_22 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_22(Pattern.Term pattern) {
			super(pattern);
			put("rank",0);
		}

		public final void probe(Automaton automaton, int target, List<Reduction.Activation> activations) {
			int r0 = target;
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
										activations.add(new Reduction.Activation(this,null,state));
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
			Automaton.Collection c1 = (Automaton.Collection) automaton.get(state[1]);
			int[] c1children = new int[c1.size() - 2];
			for(int s1i=0, s1j=0; s1i != c1.size();++s1i) {
				if(s1i == r3 || s1i == r6) { continue; }
				c1children[s1j++] = c1.get(s1i);
			}
			Automaton.Set r9 = new Automaton.Set(c1children);
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

	}
	private final static class Reduction_23 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_23(Pattern.Term pattern) {
			super(pattern);
			put("rank",0);
		}

		public final void probe(Automaton automaton, int target, List<Reduction.Activation> activations) {
			int r0 = target;
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
									if(Runtime.accepts(type4,automaton,automaton.get(r7), SCHEMA)) {
										int[] state = {r0, r1, r2, r3, r4, r5, r6, r7, 0};
										activations.add(new Reduction.Activation(this,null,state));
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
			Automaton.Collection c1 = (Automaton.Collection) automaton.get(state[1]);
			int[] c1children = new int[c1.size() - 2];
			for(int s1i=0, s1j=0; s1i != c1.size();++s1i) {
				if(s1i == r3 || s1i == r6) { continue; }
				c1children[s1j++] = c1.get(s1i);
			}
			Automaton.Set r8 = new Automaton.Set(c1children);
			Automaton.Set r9 = r8.appendFront(r2); // t1 append ts
			int r10 = automaton.add(r9);
			Automaton.Term r11 = new Automaton.Term(K_AndT, r10);
			int r12 = automaton.add(r11);
			if(r0 != r12) {
				return automaton.rewrite(r0, r12);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}

	}
	private final static class Reduction_24 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_24(Pattern.Term pattern) {
			super(pattern);
			put("rank",0);
		}

		public final void probe(Automaton automaton, int target, List<Reduction.Activation> activations) {
			int r0 = target;
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
								if(Runtime.accepts(type5,automaton,automaton.get(r5), SCHEMA)) {
									int[] c1children = new int[c1.size() - 2];
									for(int s1i=0, s1j=0; s1i != c1.size();++s1i) {
										if(s1i == r3 || s1i == r6) { continue; }
										c1children[s1j++] = c1.get(s1i);
									}
									Automaton.Set r7 = new Automaton.Set(c1children);
									boolean r8 = Runtime.accepts(type6, automaton, r5, SCHEMA); // p is ^AnyT
									boolean r9 = !r8;              // !p is ^AnyT
									if(r9) { // REQUIRES
										int[] state = {r0, r1, r2, r3, r4, r5, r6, 0};
										activations.add(new Reduction.Activation(this,null,state));
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
			int r2 = state[2]; // s
			int r3 = state[3];
			int r5 = state[5]; // p
			int r6 = state[6];
			Automaton.Collection c1 = (Automaton.Collection) automaton.get(state[1]);
			int[] c1children = new int[c1.size() - 2];
			for(int s1i=0, s1j=0; s1i != c1.size();++s1i) {
				if(s1i == r3 || s1i == r6) { continue; }
				c1children[s1j++] = c1.get(s1i);
			}
			Automaton.Set r7 = new Automaton.Set(c1children);
			Automaton.Term r8 = VoidT;
			int r9 = automaton.add(r8);
			if(r0 != r9) {
				return automaton.rewrite(r0, r9);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}

	}
	private final static class Reduction_25 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_25(Pattern.Term pattern) {
			super(pattern);
			put("rank",0);
		}

		public final void probe(Automaton automaton, int target, List<Reduction.Activation> activations) {
			int r0 = target;
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
									int[] c1children = new int[c1.size() - 2];
									for(int s1i=0, s1j=0; s1i != c1.size();++s1i) {
										if(s1i == r3 || s1i == r6) { continue; }
										c1children[s1j++] = c1.get(s1i);
									}
									Automaton.Set r8 = new Automaton.Set(c1children);
									boolean r9 = r4 == r7;         // t1 eq t2
									if(r9) { // REQUIRES
										int[] state = {r0, r1, r2, r3, r4, r5, r6, r7, 0};
										activations.add(new Reduction.Activation(this,null,state));
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
			int r2 = state[2]; // s1
			int r3 = state[3];
			int r4 = state[4]; // t1
			int r5 = state[5]; // s2
			int r6 = state[6];
			int r7 = state[7]; // t2
			Automaton.Collection c1 = (Automaton.Collection) automaton.get(state[1]);
			int[] c1children = new int[c1.size() - 2];
			for(int s1i=0, s1j=0; s1i != c1.size();++s1i) {
				if(s1i == r3 || s1i == r6) { continue; }
				c1children[s1j++] = c1.get(s1i);
			}
			Automaton.Set r8 = new Automaton.Set(c1children);
			Automaton.Set r9 = r8.appendFront(r2); // s1 append ts
			int r10 = automaton.add(r9);
			Automaton.Term r11 = new Automaton.Term(K_OrT, r10);
			int r12 = automaton.add(r11);
			if(r0 != r12) {
				return automaton.rewrite(r0, r12);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}

	}
	// term $4<ReferenceT($2<^Type<$4|Atom<NotT($17<^Proton<RecordT(^{^[^string,$17]...})|ArrayT($17)|ReferenceT($17)|FunctionT(^[^bool,^[$17...],^[$17...]])|Quark<AnyT|NullT|VoidT|BoolT|ByteT|IntT|NominalT(^string)>>>)|Proton<RecordT(^{^[^string,$17]...})|ArrayT($17)|ReferenceT($17)|FunctionT(^[^bool,^[$17...],^[$17...]])|Quark<AnyT|NullT|VoidT|BoolT|ByteT|IntT|NominalT(^string)>>>|NotT($2)|OrT(^{$2...})|AndT(^{$2...})|ArrayT($2)|RecordT(^{^[^string,$2]...})|FunctionT(^[^bool,^[$2...],^[$2...]])>>)>
	public final static int K_ReferenceT = 5;
	public final static int ReferenceT(Automaton automaton, int r0) {
		return automaton.add(new Automaton.Term(K_ReferenceT, r0));
	}

	private final static class Reduction_26 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_26(Pattern.Term pattern) {
			super(pattern);
			put("rank",0);
		}

		public final void probe(Automaton automaton, int target, List<Reduction.Activation> activations) {
			int r0 = target;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_ReferenceT) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				if(Runtime.accepts(type1,automaton,automaton.get(r1), SCHEMA)) {
					int[] state = {r0, r1};
					activations.add(new Reduction.Activation(this,null,state));
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

	}
	private final static class Reduction_27 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_27(Pattern.Term pattern) {
			super(pattern);
			put("rank",0);
		}

		public final void probe(Automaton automaton, int target, List<Reduction.Activation> activations) {
			int r0 = target;
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
						if(s2.kind == K_ReferenceT) {
							Automaton.Term t2 = (Automaton.Term) s2;
							int r4 = t2.contents;
							for(int r6=0;r6!=c1.size();++r6) {
								if(r6 == r3) { continue; }
								int r5 = c1.get(r6);
								Automaton.State s5 = automaton.get(r5);
								if(s5.kind == K_ReferenceT) {
									Automaton.Term t5 = (Automaton.Term) s5;
									int r7 = t5.contents;
									int[] c1children = new int[c1.size() - 2];
									for(int s1i=0, s1j=0; s1i != c1.size();++s1i) {
										if(s1i == r3 || s1i == r6) { continue; }
										c1children[s1j++] = c1.get(s1i);
									}
									Automaton.Set r8 = new Automaton.Set(c1children);
									boolean r9 = r4 == r7;         // t1 eq t2
									if(r9) { // REQUIRES
										int[] state = {r0, r1, r2, r3, r4, r5, r6, r7, 0};
										activations.add(new Reduction.Activation(this,null,state));
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
			int r7 = state[7]; // t2
			Automaton.Collection c1 = (Automaton.Collection) automaton.get(state[1]);
			int[] c1children = new int[c1.size() - 2];
			for(int s1i=0, s1j=0; s1i != c1.size();++s1i) {
				if(s1i == r3 || s1i == r6) { continue; }
				c1children[s1j++] = c1.get(s1i);
			}
			Automaton.Set r8 = new Automaton.Set(c1children);
			Automaton.Term r9 = new Automaton.Term(K_ReferenceT, r4);
			int r10 = automaton.add(r9);
			Automaton.Set r11 = r8.appendFront(r10); // ReferenceT(t1) append ts
			int r12 = automaton.add(r11);
			Automaton.Term r13 = new Automaton.Term(K_AndT, r12);
			int r14 = automaton.add(r13);
			if(r0 != r14) {
				return automaton.rewrite(r0, r14);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}

	}
	private final static class Reduction_28 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_28(Pattern.Term pattern) {
			super(pattern);
			put("rank",0);
		}

		public final void probe(Automaton automaton, int target, List<Reduction.Activation> activations) {
			int r0 = target;
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
						if(s2.kind == K_ReferenceT) {
							Automaton.Term t2 = (Automaton.Term) s2;
							int r4 = t2.contents;
							for(int r6=0;r6!=c1.size();++r6) {
								if(r6 == r3) { continue; }
								int r5 = c1.get(r6);
								Automaton.State s5 = automaton.get(r5);
								if(s5.kind == K_ReferenceT) {
									Automaton.Term t5 = (Automaton.Term) s5;
									int r7 = t5.contents;
									int[] c1children = new int[c1.size() - 2];
									for(int s1i=0, s1j=0; s1i != c1.size();++s1i) {
										if(s1i == r3 || s1i == r6) { continue; }
										c1children[s1j++] = c1.get(s1i);
									}
									Automaton.Set r8 = new Automaton.Set(c1children);
									boolean r9 = r4 != r7;         // t1 neq t2
									if(r9) { // REQUIRES
										int[] state = {r0, r1, r2, r3, r4, r5, r6, r7, 0};
										activations.add(new Reduction.Activation(this,null,state));
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
			int r7 = state[7]; // t2
			Automaton.Collection c1 = (Automaton.Collection) automaton.get(state[1]);
			int[] c1children = new int[c1.size() - 2];
			for(int s1i=0, s1j=0; s1i != c1.size();++s1i) {
				if(s1i == r3 || s1i == r6) { continue; }
				c1children[s1j++] = c1.get(s1i);
			}
			Automaton.Set r8 = new Automaton.Set(c1children);
			Automaton.Term r9 = VoidT;
			int r10 = automaton.add(r9);
			if(r0 != r10) {
				return automaton.rewrite(r0, r10);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}

	}
	private final static class Reduction_29 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_29(Pattern.Term pattern) {
			super(pattern);
			put("rank",1);
		}

		public final void probe(Automaton automaton, int target, List<Reduction.Activation> activations) {
			int r0 = target;
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
						if(s2.kind == K_ReferenceT) {
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
									if(s7.kind == K_ReferenceT) {
										Automaton.Term t7 = (Automaton.Term) s7;
										int r8 = t7.contents;
										int[] c1children = new int[c1.size() - 2];
										for(int s1i=0, s1j=0; s1i != c1.size();++s1i) {
											if(s1i == r3 || s1i == r6) { continue; }
											c1children[s1j++] = c1.get(s1i);
										}
										Automaton.Set r9 = new Automaton.Set(c1children);
										boolean r10 = r4 != r8;        // t1 neq t2
										if(r10) { // REQUIRES
											int[] state = {r0, r1, r2, r3, r4, r5, r6, r7, r8, 0};
											activations.add(new Reduction.Activation(this,null,state));
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
			int r2 = state[2]; // r
			int r3 = state[3];
			int r4 = state[4]; // t1
			int r6 = state[6];
			int r8 = state[8]; // t2
			Automaton.Collection c1 = (Automaton.Collection) automaton.get(state[1]);
			int[] c1children = new int[c1.size() - 2];
			for(int s1i=0, s1j=0; s1i != c1.size();++s1i) {
				if(s1i == r3 || s1i == r6) { continue; }
				c1children[s1j++] = c1.get(s1i);
			}
			Automaton.Set r9 = new Automaton.Set(c1children);
			Automaton.Set r10 = r9.appendFront(r2); // r append ts
			int r11 = automaton.add(r10);
			Automaton.Term r12 = new Automaton.Term(K_AndT, r11);
			int r13 = automaton.add(r12);
			if(r0 != r13) {
				return automaton.rewrite(r0, r13);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}

	}
	// term $12<FunctionT(^[^bool,^[$3<^Type<$12|Atom<NotT($25<^Proton<RecordT(^{^[^string,$25]...})|ArrayT($25)|ReferenceT($25)|FunctionT(^[^bool,^[$25...],^[$25...]])|Quark<AnyT|NullT|VoidT|BoolT|ByteT|IntT|NominalT(^string)>>>)|Proton<RecordT(^{^[^string,$25]...})|ArrayT($25)|ReferenceT($25)|FunctionT(^[^bool,^[$25...],^[$25...]])|Quark<AnyT|NullT|VoidT|BoolT|ByteT|IntT|NominalT(^string)>>>|NotT($3)|OrT(^{$3...})|AndT(^{$3...})|ArrayT($3)|ReferenceT($3)|RecordT(^{^[^string,$3]...})>>...],^[$3...]])>
	public final static int K_FunctionT = 6;
	public final static int FunctionT(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_FunctionT, r1));
	}
	public final static int FunctionT(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_FunctionT, r1));
	}

	private final static class Reduction_30 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_30(Pattern.Term pattern) {
			super(pattern);
			put("rank",0);
		}

		public final void probe(Automaton automaton, int target, List<Reduction.Activation> activations) {
			int r0 = target;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_FunctionT) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.List l1 = (Automaton.List) s1;
				int r2 = l1.get(0);
				int r3 = l1.get(1);
				Automaton.State s3 = automaton.get(r3);
				Automaton.List l3 = (Automaton.List) s3;
				int r5 = l1.get(2);
				Automaton.State s5 = automaton.get(r5);
				Automaton.List l5 = (Automaton.List) s5;
				Automaton.List r4 = l3;
				Automaton.List r6 = l5;
				Automaton.Term r7 = VoidT;
				int r8 = automaton.add(r7);
				boolean r9 = r4.contains(r8);  // VoidT in from
				Automaton.Term r10 = VoidT;
				int r11 = automaton.add(r10);
				boolean r12 = r6.contains(r11); // VoidT in to
				boolean r13 = r9 || r12;       // VoidT in from || VoidT in to
				if(r13) { // REQUIRES
					int[] state = {r0, r1, r2, r3, 0, r5, 0};
					activations.add(new Reduction.Activation(this,null,state));
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			Automaton.List r4 = ((Automaton.List) automaton.get(state[3])).sublist(0);
			Automaton.List r6 = ((Automaton.List) automaton.get(state[5])).sublist(0);
			Automaton.Term r7 = VoidT;
			int r8 = automaton.add(r7);
			if(r0 != r8) {
				return automaton.rewrite(r0, r8);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}

	}
	private final static class Reduction_31 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_31(Pattern.Term pattern) {
			super(pattern);
			put("rank",0);
		}

		public final void probe(Automaton automaton, int target, List<Reduction.Activation> activations) {
			int r0 = target;
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
						if(s2.kind == K_FunctionT) {
							Automaton.Term t2 = (Automaton.Term) s2;
							int r4 = t2.contents;
							Automaton.State s4 = automaton.get(r4);
							Automaton.List l4 = (Automaton.List) s4;
							int r5 = l4.get(0);
							int r6 = l4.get(1);
							Automaton.State s6 = automaton.get(r6);
							Automaton.List l6 = (Automaton.List) s6;
							int r8 = l4.get(2);
							Automaton.State s8 = automaton.get(r8);
							Automaton.List l8 = (Automaton.List) s8;
							for(int r11=0;r11!=c1.size();++r11) {
								if(r11 == r3) { continue; }
								int r10 = c1.get(r11);
								Automaton.State s10 = automaton.get(r10);
								if(s10.kind == K_FunctionT) {
									Automaton.Term t10 = (Automaton.Term) s10;
									int r12 = t10.contents;
									Automaton.State s12 = automaton.get(r12);
									Automaton.List l12 = (Automaton.List) s12;
									int r13 = l12.get(0);
									int r14 = l12.get(1);
									Automaton.State s14 = automaton.get(r14);
									Automaton.List l14 = (Automaton.List) s14;
									int r16 = l12.get(2);
									Automaton.State s16 = automaton.get(r16);
									Automaton.List l16 = (Automaton.List) s16;
									Automaton.List r7 = l6;
									Automaton.List r9 = l8;
									Automaton.List r15 = l14;
									Automaton.List r17 = l16;
									int[] c1children = new int[c1.size() - 2];
									for(int s1i=0, s1j=0; s1i != c1.size();++s1i) {
										if(s1i == r3 || s1i == r11) { continue; }
										c1children[s1j++] = c1.get(s1i);
									}
									Automaton.Set r18 = new Automaton.Set(c1children);
									boolean r19 = r5 != r13;       // p1 neq p2
									if(r19) { // REQUIRES
										int[] state = {r0, r1, r2, r3, r4, r5, r6, 0, r8, 0, r10, r11, r12, r13, r14, 0, r16, 0, 0};
										activations.add(new Reduction.Activation(this,null,state));
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
			int r5 = state[5]; // p1
			Automaton.List r7 = ((Automaton.List) automaton.get(state[6])).sublist(0);
			Automaton.List r9 = ((Automaton.List) automaton.get(state[8])).sublist(0);
			int r11 = state[11];
			int r13 = state[13]; // p2
			Automaton.List r15 = ((Automaton.List) automaton.get(state[14])).sublist(0);
			Automaton.List r17 = ((Automaton.List) automaton.get(state[16])).sublist(0);
			Automaton.Collection c1 = (Automaton.Collection) automaton.get(state[1]);
			int[] c1children = new int[c1.size() - 2];
			for(int s1i=0, s1j=0; s1i != c1.size();++s1i) {
				if(s1i == r3 || s1i == r11) { continue; }
				c1children[s1j++] = c1.get(s1i);
			}
			Automaton.Set r18 = new Automaton.Set(c1children);
			Automaton.Term r19 = VoidT;
			int r20 = automaton.add(r19);
			if(r0 != r20) {
				return automaton.rewrite(r0, r20);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}

	}
	private final static class Reduction_32 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_32(Pattern.Term pattern) {
			super(pattern);
			put("rank",2);
		}

		public final void probe(Automaton automaton, int target, List<Reduction.Activation> activations) {
			int r0 = target;
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
						if(s2.kind == K_FunctionT) {
							Automaton.Term t2 = (Automaton.Term) s2;
							int r4 = t2.contents;
							Automaton.State s4 = automaton.get(r4);
							Automaton.List l4 = (Automaton.List) s4;
							int r5 = l4.get(0);
							int r6 = l4.get(1);
							Automaton.State s6 = automaton.get(r6);
							Automaton.List l6 = (Automaton.List) s6;
							int r8 = l4.get(2);
							Automaton.State s8 = automaton.get(r8);
							Automaton.List l8 = (Automaton.List) s8;
							for(int r11=0;r11!=c1.size();++r11) {
								if(r11 == r3) { continue; }
								int r10 = c1.get(r11);
								Automaton.State s10 = automaton.get(r10);
								if(s10.kind == K_FunctionT) {
									Automaton.Term t10 = (Automaton.Term) s10;
									int r12 = t10.contents;
									Automaton.State s12 = automaton.get(r12);
									Automaton.List l12 = (Automaton.List) s12;
									int r13 = l12.get(0);
									int r14 = l12.get(1);
									Automaton.State s14 = automaton.get(r14);
									Automaton.List l14 = (Automaton.List) s14;
									int r16 = l12.get(2);
									Automaton.State s16 = automaton.get(r16);
									Automaton.List l16 = (Automaton.List) s16;
									Automaton.List r7 = l6;
									Automaton.List r9 = l8;
									Automaton.List r15 = l14;
									Automaton.List r17 = l16;
									int[] c1children = new int[c1.size() - 2];
									for(int s1i=0, s1j=0; s1i != c1.size();++s1i) {
										if(s1i == r3 || s1i == r11) { continue; }
										c1children[s1j++] = c1.get(s1i);
									}
									Automaton.Set r18 = new Automaton.Set(c1children);
									boolean r19 = r5 == r13;       // p1 eq p2
									if(r19) { // REQUIRES
										int[] state = {r0, r1, r2, r3, r4, r5, r6, 0, r8, 0, r10, r11, r12, r13, r14, 0, r16, 0, 0};
										activations.add(new Reduction.Activation(this,null,state));
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
			int r5 = state[5]; // p1
			Automaton.List r7 = ((Automaton.List) automaton.get(state[6])).sublist(0);
			Automaton.List r9 = ((Automaton.List) automaton.get(state[8])).sublist(0);
			int r11 = state[11];
			int r13 = state[13]; // p2
			Automaton.List r15 = ((Automaton.List) automaton.get(state[14])).sublist(0);
			Automaton.List r17 = ((Automaton.List) automaton.get(state[16])).sublist(0);
			Automaton.Collection c1 = (Automaton.Collection) automaton.get(state[1]);
			int[] c1children = new int[c1.size() - 2];
			for(int s1i=0, s1j=0; s1i != c1.size();++s1i) {
				if(s1i == r3 || s1i == r11) { continue; }
				c1children[s1j++] = c1.get(s1i);
			}
			Automaton.Set r18 = new Automaton.Set(c1children);
			Automaton.Int r19 = r7.lengthOf(); // |f1s|
			Automaton.Int r20 = r15.lengthOf(); // |f2s|
			boolean r21 = !r19.equals(r20); // |f1s| neq |f2s|
			Automaton.Int r22 = r9.lengthOf(); // |t1s|
			Automaton.Int r23 = r17.lengthOf(); // |t2s|
			boolean r24 = !r22.equals(r23); // |t1s| neq |t2s|
			boolean r25 = r21 || r24;      // |f1s| neq |f2s| || |t1s| neq |t2s|
			if(r25) {
				Automaton.Term r26 = VoidT;
				int r27 = automaton.add(r26);
				if(r0 != r27) {
					return automaton.rewrite(r0, r27);
				}
			}
			Automaton.Int r29 = new Automaton.Int(0); // 0
			Automaton.Int r30 = r7.lengthOf(); // |f1s|
			Automaton.List r31 = Runtime.rangeOf(automaton,r29,r30); // 0 range |f1s|
			Automaton.List t28 = new Automaton.List();
			for(int i32=0;i32<r31.size();i32++) {
				Automaton.Int r32 = (Automaton.Int) automaton.get(r31.get(i32));;
				int r33 = r7.indexOf(r32);     // f1s[i]
				int r34 = r15.indexOf(r32);    // f2s[i]
				Automaton.Set r35 = new Automaton.Set(r33, r34); // {f1s[i]f2s[i]}
				int r36 = automaton.add(r35);
				Automaton.Term r37 = new Automaton.Term(K_AndT, r36);
				int r38 = automaton.add(r37);
				t28.add(r38);
			}
			Automaton.List r28 = t28;
			Automaton.Int r40 = new Automaton.Int(0); // 0
			Automaton.Int r41 = r9.lengthOf(); // |t1s|
			Automaton.List r42 = Runtime.rangeOf(automaton,r40,r41); // 0 range |t1s|
			Automaton.List t39 = new Automaton.List();
			for(int i43=0;i43<r42.size();i43++) {
				Automaton.Int r43 = (Automaton.Int) automaton.get(r42.get(i43));;
				int r44 = r9.indexOf(r43);     // t1s[i]
				int r45 = r17.indexOf(r43);    // t2s[i]
				Automaton.Set r46 = new Automaton.Set(r44, r45); // {t1s[i]t2s[i]}
				int r47 = automaton.add(r46);
				Automaton.Term r48 = new Automaton.Term(K_OrT, r47);
				int r49 = automaton.add(r48);
				t39.add(r49);
			}
			Automaton.List r39 = t39;
			int r50 = automaton.add(r28);
			int r51 = automaton.add(r39);
			Automaton.List r52 = new Automaton.List(r5, r50, r51); // [p1fromto]
			int r53 = automaton.add(r52);
			Automaton.Term r54 = new Automaton.Term(K_FunctionT, r53);
			int r55 = automaton.add(r54);
			Automaton.Set r56 = r18.appendFront(r55); // FunctionT([p1fromto]) append ts
			int r57 = automaton.add(r56);
			Automaton.Term r58 = new Automaton.Term(K_AndT, r57);
			int r59 = automaton.add(r58);
			if(r0 != r59) {
				return automaton.rewrite(r0, r59);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}

	}
	private final static class Reduction_33 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_33(Pattern.Term pattern) {
			super(pattern);
			put("rank",1);
		}

		public final void probe(Automaton automaton, int target, List<Reduction.Activation> activations) {
			int r0 = target;
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
						if(s2.kind == K_FunctionT) {
							Automaton.Term t2 = (Automaton.Term) s2;
							int r4 = t2.contents;
							Automaton.State s4 = automaton.get(r4);
							Automaton.List l4 = (Automaton.List) s4;
							int r5 = l4.get(0);
							int r6 = l4.get(1);
							Automaton.State s6 = automaton.get(r6);
							Automaton.List l6 = (Automaton.List) s6;
							int r8 = l4.get(2);
							Automaton.State s8 = automaton.get(r8);
							Automaton.List l8 = (Automaton.List) s8;
							for(int r11=0;r11!=c1.size();++r11) {
								if(r11 == r3) { continue; }
								int r10 = c1.get(r11);
								Automaton.State s10 = automaton.get(r10);
								if(s10.kind == K_NotT) {
									Automaton.Term t10 = (Automaton.Term) s10;
									int r12 = t10.contents;
									Automaton.State s12 = automaton.get(r12);
									if(s12.kind == K_FunctionT) {
										Automaton.Term t12 = (Automaton.Term) s12;
										int r13 = t12.contents;
										Automaton.State s13 = automaton.get(r13);
										Automaton.List l13 = (Automaton.List) s13;
										int r14 = l13.get(0);
										int r15 = l13.get(1);
										Automaton.State s15 = automaton.get(r15);
										Automaton.List l15 = (Automaton.List) s15;
										int r17 = l13.get(2);
										Automaton.State s17 = automaton.get(r17);
										Automaton.List l17 = (Automaton.List) s17;
										Automaton.List r7 = l6;
										Automaton.List r9 = l8;
										Automaton.List r16 = l15;
										Automaton.List r18 = l17;
										int[] c1children = new int[c1.size() - 2];
										for(int s1i=0, s1j=0; s1i != c1.size();++s1i) {
											if(s1i == r3 || s1i == r11) { continue; }
											c1children[s1j++] = c1.get(s1i);
										}
										Automaton.Set r19 = new Automaton.Set(c1children);
										boolean r20 = r5 != r14;       // p1 neq p2
										if(r20) { // REQUIRES
											int[] state = {r0, r1, r2, r3, r4, r5, r6, 0, r8, 0, r10, r11, r12, r13, r14, r15, 0, r17, 0, 0};
											activations.add(new Reduction.Activation(this,null,state));
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
			int r2 = state[2]; // f
			int r3 = state[3];
			int r5 = state[5]; // p1
			Automaton.List r7 = ((Automaton.List) automaton.get(state[6])).sublist(0);
			Automaton.List r9 = ((Automaton.List) automaton.get(state[8])).sublist(0);
			int r11 = state[11];
			int r14 = state[14]; // p2
			Automaton.List r16 = ((Automaton.List) automaton.get(state[15])).sublist(0);
			Automaton.List r18 = ((Automaton.List) automaton.get(state[17])).sublist(0);
			Automaton.Collection c1 = (Automaton.Collection) automaton.get(state[1]);
			int[] c1children = new int[c1.size() - 2];
			for(int s1i=0, s1j=0; s1i != c1.size();++s1i) {
				if(s1i == r3 || s1i == r11) { continue; }
				c1children[s1j++] = c1.get(s1i);
			}
			Automaton.Set r19 = new Automaton.Set(c1children);
			Automaton.Set r20 = r19.appendFront(r2); // f append ts
			int r21 = automaton.add(r20);
			Automaton.Term r22 = new Automaton.Term(K_AndT, r21);
			int r23 = automaton.add(r22);
			if(r0 != r23) {
				return automaton.rewrite(r0, r23);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}

	}
	private final static class Reduction_34 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_34(Pattern.Term pattern) {
			super(pattern);
			put("rank",1);
		}

		public final void probe(Automaton automaton, int target, List<Reduction.Activation> activations) {
			int r0 = target;
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
						if(s2.kind == K_FunctionT) {
							Automaton.Term t2 = (Automaton.Term) s2;
							int r4 = t2.contents;
							Automaton.State s4 = automaton.get(r4);
							Automaton.List l4 = (Automaton.List) s4;
							int r5 = l4.get(0);
							int r6 = l4.get(1);
							Automaton.State s6 = automaton.get(r6);
							Automaton.List l6 = (Automaton.List) s6;
							int r8 = l4.get(2);
							Automaton.State s8 = automaton.get(r8);
							Automaton.List l8 = (Automaton.List) s8;
							for(int r11=0;r11!=c1.size();++r11) {
								if(r11 == r3) { continue; }
								int r10 = c1.get(r11);
								Automaton.State s10 = automaton.get(r10);
								if(s10.kind == K_FunctionT) {
									Automaton.Term t10 = (Automaton.Term) s10;
									int r12 = t10.contents;
									Automaton.State s12 = automaton.get(r12);
									Automaton.List l12 = (Automaton.List) s12;
									int r13 = l12.get(0);
									int r14 = l12.get(1);
									Automaton.State s14 = automaton.get(r14);
									Automaton.List l14 = (Automaton.List) s14;
									int r16 = l12.get(2);
									Automaton.State s16 = automaton.get(r16);
									Automaton.List l16 = (Automaton.List) s16;
									Automaton.List r7 = l6;
									Automaton.List r9 = l8;
									Automaton.List r15 = l14;
									Automaton.List r17 = l16;
									int[] c1children = new int[c1.size() - 2];
									for(int s1i=0, s1j=0; s1i != c1.size();++s1i) {
										if(s1i == r3 || s1i == r11) { continue; }
										c1children[s1j++] = c1.get(s1i);
									}
									Automaton.Set r18 = new Automaton.Set(c1children);
									boolean r19 = r5 == r13;       // p1 eq p2
									if(r19) { // REQUIRES
										int[] state = {r0, r1, r2, r3, r4, r5, r6, 0, r8, 0, r10, r11, r12, r13, r14, 0, r16, 0, 0};
										activations.add(new Reduction.Activation(this,null,state));
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
			int r2 = state[2]; // f
			int r3 = state[3];
			int r5 = state[5]; // p1
			Automaton.List r7 = ((Automaton.List) automaton.get(state[6])).sublist(0);
			Automaton.List r9 = ((Automaton.List) automaton.get(state[8])).sublist(0);
			int r11 = state[11];
			int r13 = state[13]; // p2
			Automaton.List r15 = ((Automaton.List) automaton.get(state[14])).sublist(0);
			Automaton.List r17 = ((Automaton.List) automaton.get(state[16])).sublist(0);
			Automaton.Collection c1 = (Automaton.Collection) automaton.get(state[1]);
			int[] c1children = new int[c1.size() - 2];
			for(int s1i=0, s1j=0; s1i != c1.size();++s1i) {
				if(s1i == r3 || s1i == r11) { continue; }
				c1children[s1j++] = c1.get(s1i);
			}
			Automaton.Set r18 = new Automaton.Set(c1children);
			Automaton.Int r19 = r7.lengthOf(); // |f1s|
			Automaton.Int r20 = r15.lengthOf(); // |f2s|
			boolean r21 = !r19.equals(r20); // |f1s| neq |f2s|
			Automaton.Int r22 = r9.lengthOf(); // |t1s|
			Automaton.Int r23 = r17.lengthOf(); // |t2s|
			boolean r24 = !r22.equals(r23); // |t1s| neq |t2s|
			boolean r25 = r21 || r24;      // |f1s| neq |f2s| || |t1s| neq |t2s|
			if(r25) {
				Automaton.Set r26 = r18.appendFront(r2); // f append ts
				int r27 = automaton.add(r26);
				Automaton.Term r28 = new Automaton.Term(K_AndT, r27);
				int r29 = automaton.add(r28);
				if(r0 != r29) {
					return automaton.rewrite(r0, r29);
				}
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}

	}
	// term AnyT
	public final static int K_AnyT = 7;
	public final static Automaton.Term AnyT = new Automaton.Term(K_AnyT);

	// term VoidT
	public final static int K_VoidT = 8;
	public final static Automaton.Term VoidT = new Automaton.Term(K_VoidT);

	// term NullT
	public final static int K_NullT = 9;
	public final static Automaton.Term NullT = new Automaton.Term(K_NullT);

	// term BoolT
	public final static int K_BoolT = 10;
	public final static Automaton.Term BoolT = new Automaton.Term(K_BoolT);

	// term ByteT
	public final static int K_ByteT = 11;
	public final static Automaton.Term ByteT = new Automaton.Term(K_ByteT);

	// term IntT
	public final static int K_IntT = 12;
	public final static Automaton.Term IntT = new Automaton.Term(K_IntT);

	// term NominalT(^string)
	public final static int K_NominalT = 13;
	public final static int NominalT(Automaton automaton, String r0) {
		int r1 = automaton.add(new Automaton.Strung(r0));
		return automaton.add(new Automaton.Term(K_NominalT, r1));
	}

	private final static class Reduction_35 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_35(Pattern.Term pattern) {
			super(pattern);
			put("rank",0);
		}

		public final void probe(Automaton automaton, int target, List<Reduction.Activation> activations) {
			int r0 = target;
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
							activations.add(new Reduction.Activation(this,null,state));
						}
					}
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r3 = state[3];
			Automaton.Collection c1 = (Automaton.Collection) automaton.get(state[1]);
			int[] c1children = new int[c1.size() - 1];
			for(int s1i=0, s1j=0; s1i != c1.size();++s1i) {
				if(s1i == r3) { continue; }
				c1children[s1j++] = c1.get(s1i);
			}
			Automaton.Set r4 = new Automaton.Set(c1children);
			Automaton.Term r5 = VoidT;
			int r6 = automaton.add(r5);
			if(r0 != r6) {
				return automaton.rewrite(r0, r6);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}

	}
	private final static class Reduction_36 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_36(Pattern.Term pattern) {
			super(pattern);
			put("rank",0);
		}

		public final void probe(Automaton automaton, int target, List<Reduction.Activation> activations) {
			int r0 = target;
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
							activations.add(new Reduction.Activation(this,null,state));
						}
					}
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r3 = state[3];
			Automaton.Collection c1 = (Automaton.Collection) automaton.get(state[1]);
			int[] c1children = new int[c1.size() - 1];
			for(int s1i=0, s1j=0; s1i != c1.size();++s1i) {
				if(s1i == r3) { continue; }
				c1children[s1j++] = c1.get(s1i);
			}
			Automaton.Set r4 = new Automaton.Set(c1children);
			int r5 = automaton.add(r4);
			Automaton.Term r6 = new Automaton.Term(K_AndT, r5);
			int r7 = automaton.add(r6);
			if(r0 != r7) {
				return automaton.rewrite(r0, r7);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}

	}
	private final static class Reduction_37 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_37(Pattern.Term pattern) {
			super(pattern);
		}

		public final void probe(Automaton automaton, int target, List<Reduction.Activation> activations) {
			int r0 = target;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_AndT) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.Collection c1 = (Automaton.Collection) s1;
				if(c1.size() >= 2) {
					for(int r3=0;r3!=c1.size();++r3) {
						int r2 = c1.get(r3);
						if(Runtime.accepts(type8,automaton,automaton.get(r2), SCHEMA)) {
							for(int r5=0;r5!=c1.size();++r5) {
								if(r5 == r3) { continue; }
								int r4 = c1.get(r5);
								if(Runtime.accepts(type5,automaton,automaton.get(r4), SCHEMA)) {
									int[] c1children = new int[c1.size() - 2];
									for(int s1i=0, s1j=0; s1i != c1.size();++s1i) {
										if(s1i == r3 || s1i == r5) { continue; }
										c1children[s1j++] = c1.get(s1i);
									}
									Automaton.Set r6 = new Automaton.Set(c1children);
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
									if(r8) { // REQUIRES
										int[] state = {r0, r1, r2, r3, r4, r5, 0};
										activations.add(new Reduction.Activation(this,null,state));
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
			int r4 = state[4]; // a2
			int r5 = state[5];
			Automaton.Collection c1 = (Automaton.Collection) automaton.get(state[1]);
			int[] c1children = new int[c1.size() - 2];
			for(int s1i=0, s1j=0; s1i != c1.size();++s1i) {
				if(s1i == r3 || s1i == r5) { continue; }
				c1children[s1j++] = c1.get(s1i);
			}
			Automaton.Set r6 = new Automaton.Set(c1children);
			Automaton.Term r7 = VoidT;
			int r8 = automaton.add(r7);
			if(r0 != r8) {
				return automaton.rewrite(r0, r8);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}

	}
	private final static class Reduction_38 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_38(Pattern.Term pattern) {
			super(pattern);
			put("rank",0);
		}

		public final void probe(Automaton automaton, int target, List<Reduction.Activation> activations) {
			int r0 = target;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_AndT) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.Collection c1 = (Automaton.Collection) s1;
				if(c1.size() >= 2) {
					for(int r3=0;r3!=c1.size();++r3) {
						int r2 = c1.get(r3);
						if(Runtime.accepts(type8,automaton,automaton.get(r2), SCHEMA)) {
							for(int r5=0;r5!=c1.size();++r5) {
								if(r5 == r3) { continue; }
								int r4 = c1.get(r5);
								Automaton.State s4 = automaton.get(r4);
								if(s4.kind == K_NotT) {
									Automaton.Term t4 = (Automaton.Term) s4;
									int r6 = t4.contents;
									if(Runtime.accepts(type5,automaton,automaton.get(r6), SCHEMA)) {
										int[] c1children = new int[c1.size() - 2];
										for(int s1i=0, s1j=0; s1i != c1.size();++s1i) {
											if(s1i == r3 || s1i == r5) { continue; }
											c1children[s1j++] = c1.get(s1i);
										}
										Automaton.Set r7 = new Automaton.Set(c1children);
										boolean r8 = r2 == r6;         // a1 eq a2
										if(r8) { // REQUIRES
											int[] state = {r0, r1, r2, r3, r4, r5, r6, 0};
											activations.add(new Reduction.Activation(this,null,state));
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
			int r2 = state[2]; // a1
			int r3 = state[3];
			int r5 = state[5];
			int r6 = state[6]; // a2
			Automaton.Collection c1 = (Automaton.Collection) automaton.get(state[1]);
			int[] c1children = new int[c1.size() - 2];
			for(int s1i=0, s1j=0; s1i != c1.size();++s1i) {
				if(s1i == r3 || s1i == r5) { continue; }
				c1children[s1j++] = c1.get(s1i);
			}
			Automaton.Set r7 = new Automaton.Set(c1children);
			Automaton.Term r8 = VoidT;
			int r9 = automaton.add(r8);
			if(r0 != r9) {
				return automaton.rewrite(r0, r9);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}

	}
	private final static class Reduction_39 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_39(Pattern.Term pattern) {
			super(pattern);
			put("rank",0);
		}

		public final void probe(Automaton automaton, int target, List<Reduction.Activation> activations) {
			int r0 = target;
			Automaton.State s0 = automaton.get(r0);
			if(s0.kind == K_AndT) {
				Automaton.Term t0 = (Automaton.Term) s0;
				int r1 = t0.contents;
				Automaton.State s1 = automaton.get(r1);
				Automaton.Collection c1 = (Automaton.Collection) s1;
				if(c1.size() >= 2) {
					for(int r3=0;r3!=c1.size();++r3) {
						int r2 = c1.get(r3);
						if(Runtime.accepts(type8,automaton,automaton.get(r2), SCHEMA)) {
							for(int r5=0;r5!=c1.size();++r5) {
								if(r5 == r3) { continue; }
								int r4 = c1.get(r5);
								Automaton.State s4 = automaton.get(r4);
								if(s4.kind == K_NotT) {
									Automaton.Term t4 = (Automaton.Term) s4;
									int r6 = t4.contents;
									if(Runtime.accepts(type5,automaton,automaton.get(r6), SCHEMA)) {
										int[] c1children = new int[c1.size() - 2];
										for(int s1i=0, s1j=0; s1i != c1.size();++s1i) {
											if(s1i == r3 || s1i == r5) { continue; }
											c1children[s1j++] = c1.get(s1i);
										}
										Automaton.Set r7 = new Automaton.Set(c1children);
										boolean r8 = r2 != r6;         // a1 neq a2
										boolean r9 = false;            // a1 neq a2 && a2 neq AnyT
										if(r8) {
											Automaton.Term r10 = AnyT;
											Object r11 = (Object) automaton.get(r6);
											boolean r12 = !r11.equals(r10); // a2 neq AnyT
											r9 = r12;
										}
										if(r9) { // REQUIRES
											int[] state = {r0, r1, r2, r3, r4, r5, r6, 0};
											activations.add(new Reduction.Activation(this,null,state));
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
			int r2 = state[2]; // a1
			int r3 = state[3];
			int r5 = state[5];
			int r6 = state[6]; // a2
			Automaton.Collection c1 = (Automaton.Collection) automaton.get(state[1]);
			int[] c1children = new int[c1.size() - 2];
			for(int s1i=0, s1j=0; s1i != c1.size();++s1i) {
				if(s1i == r3 || s1i == r5) { continue; }
				c1children[s1j++] = c1.get(s1i);
			}
			Automaton.Set r7 = new Automaton.Set(c1children);
			Automaton.Set r8 = r7.appendFront(r2); // a1 append ts
			int r9 = automaton.add(r8);
			Automaton.Term r10 = new Automaton.Term(K_AndT, r9);
			int r11 = automaton.add(r10);
			if(r0 != r11) {
				return automaton.rewrite(r0, r11);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}

	}
	private final static class Reduction_40 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_40(Pattern.Term pattern) {
			super(pattern);
			put("rank",0);
		}

		public final void probe(Automaton automaton, int target, List<Reduction.Activation> activations) {
			int r0 = target;
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
							activations.add(new Reduction.Activation(this,null,state));
						}
					}
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r3 = state[3];
			Automaton.Collection c1 = (Automaton.Collection) automaton.get(state[1]);
			int[] c1children = new int[c1.size() - 1];
			for(int s1i=0, s1j=0; s1i != c1.size();++s1i) {
				if(s1i == r3) { continue; }
				c1children[s1j++] = c1.get(s1i);
			}
			Automaton.Set r4 = new Automaton.Set(c1children);
			Automaton.Term r5 = AnyT;
			int r6 = automaton.add(r5);
			if(r0 != r6) {
				return automaton.rewrite(r0, r6);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}

	}
	private final static class Reduction_41 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_41(Pattern.Term pattern) {
			super(pattern);
			put("rank",0);
		}

		public final void probe(Automaton automaton, int target, List<Reduction.Activation> activations) {
			int r0 = target;
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
							activations.add(new Reduction.Activation(this,null,state));
						}
					}
				}
			}
		}

		public final int apply(Automaton automaton, int[] state) {
			int nStates = automaton.nStates();
			int r0 = state[0];
			int r3 = state[3];
			Automaton.Collection c1 = (Automaton.Collection) automaton.get(state[1]);
			int[] c1children = new int[c1.size() - 1];
			for(int s1i=0, s1j=0; s1i != c1.size();++s1i) {
				if(s1i == r3) { continue; }
				c1children[s1j++] = c1.get(s1i);
			}
			Automaton.Set r4 = new Automaton.Set(c1children);
			int r5 = automaton.add(r4);
			Automaton.Term r6 = new Automaton.Term(K_OrT, r5);
			int r7 = automaton.add(r6);
			if(r0 != r7) {
				return automaton.rewrite(r0, r7);
			}
			automaton.resize(nStates);
			return Automaton.K_VOID;
		}

	}
	// =========================================================================
	// Schema
	// =========================================================================

	public static final Schema SCHEMA = new Schema(new Schema.Term[]{
		// $4<NotT($2<^Type<$4|Atom<NotT($17<^Proton<RecordT(^{^[^string,$17]...})|ArrayT($17)|ReferenceT($17)|FunctionT(^[^bool,^[$17...],^[$17...]])|Quark<AnyT|NullT|VoidT|BoolT|ByteT|IntT|NominalT(^string)>>>)|Proton<RecordT(^{^[^string,$17]...})|ArrayT($17)|ReferenceT($17)|FunctionT(^[^bool,^[$17...],^[$17...]])|Quark<AnyT|NullT|VoidT|BoolT|ByteT|IntT|NominalT(^string)>>>|OrT(^{$2...})|AndT(^{$2...})|ArrayT($2)|ReferenceT($2)|RecordT(^{^[^string,$2]...})|FunctionT(^[^bool,^[$2...],^[$2...]])>>)>
		Schema.Term("NotT",Schema.Or(Schema.Any, Schema.Or(Schema.Term("NotT",Schema.Or(Schema.Term("RecordT",Schema.Set(true)), Schema.Term("ArrayT",Schema.Any), Schema.Term("ReferenceT",Schema.Any), Schema.Term("FunctionT",Schema.List(true,Schema.Bool,Schema.List(true),Schema.Any)), Schema.Or(Schema.Term("AnyT"), Schema.Term("NullT"), Schema.Term("VoidT"), Schema.Term("BoolT"), Schema.Term("ByteT"), Schema.Term("IntT"), Schema.Term("NominalT",Schema.String)))), Schema.Any), Schema.Term("OrT",Schema.Set(true)), Schema.Term("AndT",Schema.Any), Schema.Term("ArrayT",Schema.Any), Schema.Term("ReferenceT",Schema.Any), Schema.Term("RecordT",Schema.Set(true)), Schema.Term("FunctionT",Schema.List(true,Schema.Any,Schema.List(true),Schema.Any)))),
		// $7<AndT($5<^{$2<^Type<$7|Atom<NotT($20<^Proton<RecordT(^{^[^string,$20]...})|ArrayT($20)|ReferenceT($20)|FunctionT(^[^bool,^[$20...],^[$20...]])|Quark<AnyT|NullT|VoidT|BoolT|ByteT|IntT|NominalT(^string)>>>)|Proton<RecordT(^{^[^string,$20]...})|ArrayT($20)|ReferenceT($20)|FunctionT(^[^bool,^[$20...],^[$20...]])|Quark<AnyT|NullT|VoidT|BoolT|ByteT|IntT|NominalT(^string)>>>|NotT($2)|OrT($5)|ArrayT($2)|ReferenceT($2)|RecordT(^{^[^string,$2]...})|FunctionT(^[^bool,^[$2...],^[$2...]])>>...}>)>
		Schema.Term("AndT",Schema.Set(true)),
		// $7<OrT($5<^{$2<^Type<$7|Atom<NotT($20<^Proton<RecordT(^{^[^string,$20]...})|ArrayT($20)|ReferenceT($20)|FunctionT(^[^bool,^[$20...],^[$20...]])|Quark<AnyT|NullT|VoidT|BoolT|ByteT|IntT|NominalT(^string)>>>)|Proton<RecordT(^{^[^string,$20]...})|ArrayT($20)|ReferenceT($20)|FunctionT(^[^bool,^[$20...],^[$20...]])|Quark<AnyT|NullT|VoidT|BoolT|ByteT|IntT|NominalT(^string)>>>|NotT($2)|AndT($5)|ArrayT($2)|ReferenceT($2)|RecordT(^{^[^string,$2]...})|FunctionT(^[^bool,^[$2...],^[$2...]])>>...}>)>
		Schema.Term("OrT",Schema.Set(true)),
		// $12<RecordT(^{^[^string,$3<^Type<$12|Atom<NotT($25<^Proton<RecordT(^{^[^string,$25]...})|ArrayT($25)|ReferenceT($25)|FunctionT(^[^bool,^[$25...],^[$25...]])|Quark<AnyT|NullT|VoidT|BoolT|ByteT|IntT|NominalT(^string)>>>)|Proton<RecordT(^{^[^string,$25]...})|ArrayT($25)|ReferenceT($25)|FunctionT(^[^bool,^[$25...],^[$25...]])|Quark<AnyT|NullT|VoidT|BoolT|ByteT|IntT|NominalT(^string)>>>|NotT($3)|OrT(^{$3...})|AndT(^{$3...})|ArrayT($3)|ReferenceT($3)|FunctionT(^[^bool,^[$3...],^[$3...]])>>]...})>
		Schema.Term("RecordT",Schema.Set(true)),
		// $4<ArrayT($2<^Type<$4|Atom<NotT($17<^Proton<RecordT(^{^[^string,$17]...})|ArrayT($17)|ReferenceT($17)|FunctionT(^[^bool,^[$17...],^[$17...]])|Quark<AnyT|NullT|VoidT|BoolT|ByteT|IntT|NominalT(^string)>>>)|Proton<RecordT(^{^[^string,$17]...})|ArrayT($17)|ReferenceT($17)|FunctionT(^[^bool,^[$17...],^[$17...]])|Quark<AnyT|NullT|VoidT|BoolT|ByteT|IntT|NominalT(^string)>>>|NotT($2)|OrT(^{$2...})|AndT(^{$2...})|ReferenceT($2)|RecordT(^{^[^string,$2]...})|FunctionT(^[^bool,^[$2...],^[$2...]])>>)>
		Schema.Term("ArrayT",Schema.Or(Schema.Any, Schema.Or(Schema.Term("NotT",Schema.Or(Schema.Term("RecordT",Schema.Set(true)), Schema.Term("ArrayT",Schema.Any), Schema.Term("ReferenceT",Schema.Any), Schema.Term("FunctionT",Schema.List(true,Schema.Bool,Schema.List(true),Schema.Any)), Schema.Or(Schema.Term("AnyT"), Schema.Term("NullT"), Schema.Term("VoidT"), Schema.Term("BoolT"), Schema.Term("ByteT"), Schema.Term("IntT"), Schema.Term("NominalT",Schema.String)))), Schema.Any), Schema.Term("NotT",Schema.Any), Schema.Term("OrT",Schema.Set(true)), Schema.Term("AndT",Schema.Any), Schema.Term("ReferenceT",Schema.Any), Schema.Term("RecordT",Schema.Set(true)), Schema.Term("FunctionT",Schema.List(true,Schema.Any,Schema.List(true),Schema.Any)))),
		// $4<ReferenceT($2<^Type<$4|Atom<NotT($17<^Proton<RecordT(^{^[^string,$17]...})|ArrayT($17)|ReferenceT($17)|FunctionT(^[^bool,^[$17...],^[$17...]])|Quark<AnyT|NullT|VoidT|BoolT|ByteT|IntT|NominalT(^string)>>>)|Proton<RecordT(^{^[^string,$17]...})|ArrayT($17)|ReferenceT($17)|FunctionT(^[^bool,^[$17...],^[$17...]])|Quark<AnyT|NullT|VoidT|BoolT|ByteT|IntT|NominalT(^string)>>>|NotT($2)|OrT(^{$2...})|AndT(^{$2...})|ArrayT($2)|RecordT(^{^[^string,$2]...})|FunctionT(^[^bool,^[$2...],^[$2...]])>>)>
		Schema.Term("ReferenceT",Schema.Or(Schema.Any, Schema.Or(Schema.Term("NotT",Schema.Or(Schema.Term("RecordT",Schema.Set(true)), Schema.Term("ArrayT",Schema.Any), Schema.Term("ReferenceT",Schema.Any), Schema.Term("FunctionT",Schema.List(true,Schema.Bool,Schema.List(true),Schema.Any)), Schema.Or(Schema.Term("AnyT"), Schema.Term("NullT"), Schema.Term("VoidT"), Schema.Term("BoolT"), Schema.Term("ByteT"), Schema.Term("IntT"), Schema.Term("NominalT",Schema.String)))), Schema.Any), Schema.Term("NotT",Schema.Any), Schema.Term("OrT",Schema.Set(true)), Schema.Term("AndT",Schema.Any), Schema.Term("ArrayT",Schema.Any), Schema.Term("RecordT",Schema.Set(true)), Schema.Term("FunctionT",Schema.List(true,Schema.Any,Schema.List(true),Schema.Any)))),
		// $12<FunctionT(^[^bool,^[$3<^Type<$12|Atom<NotT($25<^Proton<RecordT(^{^[^string,$25]...})|ArrayT($25)|ReferenceT($25)|FunctionT(^[^bool,^[$25...],^[$25...]])|Quark<AnyT|NullT|VoidT|BoolT|ByteT|IntT|NominalT(^string)>>>)|Proton<RecordT(^{^[^string,$25]...})|ArrayT($25)|ReferenceT($25)|FunctionT(^[^bool,^[$25...],^[$25...]])|Quark<AnyT|NullT|VoidT|BoolT|ByteT|IntT|NominalT(^string)>>>|NotT($3)|OrT(^{$3...})|AndT(^{$3...})|ArrayT($3)|ReferenceT($3)|RecordT(^{^[^string,$3]...})>>...],^[$3...]])>
		Schema.Term("FunctionT",Schema.List(true,Schema.Bool,Schema.List(true),Schema.Any)),
		// AnyT
		Schema.Term("AnyT"),
		// VoidT
		Schema.Term("VoidT"),
		// NullT
		Schema.Term("NullT"),
		// BoolT
		Schema.Term("BoolT"),
		// ByteT
		Schema.Term("ByteT"),
		// IntT
		Schema.Term("IntT"),
		// NominalT(^string)
		Schema.Term("NominalT",Schema.String)
	});

	// =========================================================================
	// Types
	// =========================================================================

	// AnyT
	private static Type type0 = Runtime.Type("2G0tLTJCWDggIk2");
	// VoidT
	private static Type type1 = Runtime.Type("2KLxLPZGp3ukmD0E");
	// $12<Type<Atom<NotT($14<^Proton<RecordT(^{^[^string,$14]...})|ArrayT($14)|ReferenceT($14)|FunctionT(^[^bool,^[$14...],^[$14...]])|Quark<AnyT|NullT|VoidT|BoolT|ByteT|IntT|NominalT(^string)>>>)|Proton<RecordT(^{^[^string,$14]...})|ArrayT($14)|ReferenceT($14)|FunctionT(^[^bool,^[$14...],^[$14...]])|Quark<AnyT|NullT|VoidT|BoolT|ByteT|IntT|NominalT(^string)>>>|NotT(^$12)|OrT(^{^$12...})|AndT(^{^$12...})|ArrayT(^$12)|ReferenceT(^$12)|RecordT(^{^[^string,^$12]...})|FunctionT(^[^bool,^[^$12...],^[^$12...]])>>
	private static Type type2 = Runtime.Type("Q63GKTkK5G0GrQhGZIjG6KowZRJGJFiG5KZ4ZRm4LTJGP7KOaKaR_tqN_G4SHKqNj86OJGONJSiC5SdxaQJ4Nspn0rWr0uWuly0Ym5ACXDBpHIZ0_RjGrQidmal7wV4AO4XLQ5Qgp7vkKASGKJp4aRfdH5YV5LYoGPtca9fC1QfwHQesq78x5AsCmENlXTYV3Lgkb9RB1LgZnUeVNBYU8585YoWXGDA5ekNBXHC5gsN3KTvprY0nl5N5YwJaGAP534ZQtGp3R5goOF_Ipl5QJClb0Ac5JOpQdG5KIcPkme0K1xqQgGp3h5gsPF_FtGMOJC0i0At53_ZQoGp3v5gkQFNsoQh_aQWl5KYsQV5Az5ltOZPkPwPcQoQVRgGml7UdRommW9DC1EC6gsRBHnl9jVScHql7xcSkmql7ycSkHrl7zoRkmrl77pRkHul7cpRBH6f6tkTcHvl7i6fwmvW9s6YZJy0Au6YoRkHDw6eoUBYUy6y6YolzGD79eZcBXH99ggc3D0");
	// string
	private static Type type3 = Runtime.Type("FZ0");
	// $12<RecordT(^{^[^string,$3<^Type<$12|Atom<NotT($25<^Proton<RecordT(^{^[^string,$25]...})|ArrayT($25)|ReferenceT($25)|FunctionT(^[^bool,^[$25...],^[$25...]])|Quark<AnyT|NullT|VoidT|BoolT|ByteT|IntT|NominalT(^string)>>>)|Proton<RecordT(^{^[^string,$25]...})|ArrayT($25)|ReferenceT($25)|FunctionT(^[^bool,^[$25...],^[$25...]])|Quark<AnyT|NullT|VoidT|BoolT|ByteT|IntT|NominalT(^string)>>>|NotT($3)|OrT(^{$3...})|AndT(^{$3...})|ArrayT($3)|ReferenceT($3)|FunctionT(^[^bool,^[$3...],^[$3...]])>>]...})>
	private static Type type4 = Runtime.Type("Q6o8KOYxaRZG_9OF3Kt0MOeZq7von7SsIDzc1HYZo9jcZ9ACXDBlHI343Sjp5GDx5SJGnImG4G0t5OJGLFm8MNtG4dWJ_OLOmKaQYK5KJ55KbQYGMPjt5K05D_6uGvlvGyly0Ym5TC1EUp1PZ0_RjGrQidHfl7Nh5Ag4HQh5Qsq7ExLAsGKJp4aRfCmDfCH6v_2Ueor7yhmAzd1Xl7uZNkXXl7Qh5AB5YkpPgsNc16Yg5AtZOcXalBN5Q5Q5Yo0bGDS5esOBHMU5gVP3pXGYlYGeWrl5e5YcqeGAg534ZQtGp3i5gwPF_Ipl5QJCGi0Au5JOpQdG5KIkQkHj0K1xqQgGp3z5gVRF_FtGMOJCWm0AA63_ZQoGp3C6gsRFNsoQh_aQWl5KYVSg2AO6lWQgQsQZRkRwRcSglql7ulSoHrl7Np2AU6Yon9jZTcXul7OhTk1vl7PhTkXvl7Qp2As6YkKEgcUBHEgZ2zW9x6nVOsUsUBH6z6tVccHXm7SdckmXHs3");
	// $34<Proton<RecordT(^{^[^string,^$34]...})|ArrayT(^$34)|ReferenceT(^$34)|FunctionT(^[^bool,^[^$34...],^[^$34...]])|Quark<AnyT|NullT|VoidT|BoolT|ByteT|IntT|NominalT(^string)>>>
	private static Type type5 = Runtime.Type("wG5Jmx5Sjt5KGKMNmh5SHKqNj86OJdH5ekr7xsn7SwID7dHHYco9jgZ9BC1EClXIZ4ZRm4LTJC1LykHLZ5HKaO_8MOiCLOJCmLyk1MJ55KbQYGMPjt5Kekl7ykHDcdHPnw_PeCH6f_2Qeoq7Tt5Aj4pIPp4Th5QZr7ucMAvGJFi_6KIo6AyG_Ipl5QJC0X0A85JOpQdG5KIgNk1Y0K1xqQgGp3D5gwNF_FtGMOJCGa0AP53_ZQoGp3R5goOFNsoQh_aQWl5KYwOo2Ac5lxbXGY0alaWbGel5e5YgneGAg50U");
	// ^AnyT
	private static Type type6 = Runtime.Type("3G0tLTJCWDggY9w3x$");
	// bool
	private static Type type7 = Runtime.Type("Fk0");
	// Quark<AnyT|NullT|VoidT|BoolT|ByteT|IntT|NominalT(^string)>
	private static Type type8 = Runtime.Type("vFKJp4aRfGJFi_6KIg2AwF_Ipl5QJCWEgw2KLxLPZGp38lXHJ8oQjl5KIk3ACG_FtGMOJClIgV4G8t5SJCWLgg4WWIjpLPi45QJdH5Yo_MgwKRxVoHD_4MchGPYcYPhgLk5");

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
			new Pair(new Pattern.Term("NotT",
				new Pattern.Leaf(type2),
				"t1"),null), 
			new Pair(new Pattern.Leaf(type2), "t2"), 
			new Pair(new Pattern.Leaf(type2), "ys")}),
		null);
	private final static Pattern.Term pattern8 = new Pattern.Term("AndT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("AndT",
				new Pattern.Set(true, new Pair[]{
					new Pair(new Pattern.Leaf(type2), "xs")}),
				null),null), 
			new Pair(new Pattern.Leaf(type2), "ys")}),
		null);
	private final static Pattern.Term pattern9 = new Pattern.Term("AndT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("OrT",
				new Pattern.Set(true, new Pair[]{
					new Pair(new Pattern.Leaf(type2), "xs")}),
				null),null), 
			new Pair(new Pattern.Leaf(type2), "ys")}),
		null);
	private final static Pattern.Term pattern10 = new Pattern.Term("OrT",
		new Pattern.Set(false, new Pair[]{}),
		null);
	private final static Pattern.Term pattern11 = new Pattern.Term("OrT",
		new Pattern.Set(false, new Pair[]{
			new Pair(new Pattern.Leaf(type2), "t")}),
		null);
	private final static Pattern.Term pattern12 = new Pattern.Term("OrT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("OrT",
				new Pattern.Set(true, new Pair[]{
					new Pair(new Pattern.Leaf(type2), "xs")}),
				null),null), 
			new Pair(new Pattern.Leaf(type2), "ys")}),
		null);
	private final static Pattern.Term pattern13 = new Pattern.Term("RecordT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.List(false, new Pair[]{
				new Pair(new Pattern.Leaf(type3),null), 
				new Pair(new Pattern.Leaf(type1),null)}),null), 
			new Pair(new Pattern.List(false, new Pair[]{
				new Pair(new Pattern.Leaf(type3),null), 
				new Pair(new Pattern.Leaf(type2),null)}), "ts")}),
		null);
	private final static Pattern.Term pattern14 = new Pattern.Term("AndT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("RecordT",
				new Pattern.Set(true, new Pair[]{
					new Pair(new Pattern.List(false, new Pair[]{
						new Pair(new Pattern.Leaf(type3),null), 
						new Pair(new Pattern.Leaf(type2),null)}), "t1s")}),
				null),null), 
			new Pair(new Pattern.Term("RecordT",
				new Pattern.Set(true, new Pair[]{
					new Pair(new Pattern.List(false, new Pair[]{
						new Pair(new Pattern.Leaf(type3),null), 
						new Pair(new Pattern.Leaf(type2),null)}), "t2s")}),
				null),null), 
			new Pair(new Pattern.Leaf(type2), "ts")}),
		null);
	private final static Pattern.Term pattern15 = new Pattern.Term("AndT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("RecordT",
				new Pattern.Set(true, new Pair[]{
					new Pair(new Pattern.List(false, new Pair[]{
						new Pair(new Pattern.Leaf(type3),null), 
						new Pair(new Pattern.Leaf(type2),null)}), "t1s")}),
				null),null), 
			new Pair(new Pattern.Term("RecordT",
				new Pattern.Set(true, new Pair[]{
					new Pair(new Pattern.List(false, new Pair[]{
						new Pair(new Pattern.Leaf(type3),null), 
						new Pair(new Pattern.Leaf(type2),null)}), "t2s")}),
				null),null), 
			new Pair(new Pattern.Leaf(type2), "ts")}),
		null);
	private final static Pattern.Term pattern16 = new Pattern.Term("AndT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("RecordT",
				new Pattern.Set(true, new Pair[]{
					new Pair(new Pattern.List(false, new Pair[]{
						new Pair(new Pattern.Leaf(type3),null), 
						new Pair(new Pattern.Leaf(type2),null)}), "t1s")}),
				null),null), 
			new Pair(new Pattern.Term("RecordT",
				new Pattern.Set(true, new Pair[]{
					new Pair(new Pattern.List(false, new Pair[]{
						new Pair(new Pattern.Leaf(type3),null), 
						new Pair(new Pattern.Leaf(type2),null)}), "t2s")}),
				null),null), 
			new Pair(new Pattern.Leaf(type2), "ts")}),
		null);
	private final static Pattern.Term pattern17 = new Pattern.Term("AndT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("RecordT",
				new Pattern.Set(true, new Pair[]{
					new Pair(new Pattern.List(false, new Pair[]{
						new Pair(new Pattern.Leaf(type3),null), 
						new Pair(new Pattern.Leaf(type2),null)}), "t1s")}),
				null), "r"), 
			new Pair(new Pattern.Term("NotT",
				new Pattern.Term("RecordT",
					new Pattern.Set(true, new Pair[]{
						new Pair(new Pattern.List(false, new Pair[]{
							new Pair(new Pattern.Leaf(type3),null), 
							new Pair(new Pattern.Leaf(type2),null)}), "t2s")}),
					null),
				null),null), 
			new Pair(new Pattern.Leaf(type2), "ts")}),
		null);
	private final static Pattern.Term pattern18 = new Pattern.Term("AndT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("RecordT",
				new Pattern.Set(true, new Pair[]{
					new Pair(new Pattern.List(false, new Pair[]{
						new Pair(new Pattern.Leaf(type3),null), 
						new Pair(new Pattern.Leaf(type2),null)}), "t1s")}),
				null), "r"), 
			new Pair(new Pattern.Term("NotT",
				new Pattern.Term("RecordT",
					new Pattern.Set(true, new Pair[]{
						new Pair(new Pattern.List(false, new Pair[]{
							new Pair(new Pattern.Leaf(type3),null), 
							new Pair(new Pattern.Leaf(type2),null)}), "t2s")}),
					null),
				null),null), 
			new Pair(new Pattern.Leaf(type2), "ts")}),
		null);
	private final static Pattern.Term pattern19 = new Pattern.Term("AndT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("RecordT",
				new Pattern.Set(true, new Pair[]{
					new Pair(new Pattern.List(false, new Pair[]{
						new Pair(new Pattern.Leaf(type3),null), 
						new Pair(new Pattern.Leaf(type2),null)}), "t1s")}),
				null),null), 
			new Pair(new Pattern.Term("NotT",
				new Pattern.Term("RecordT",
					new Pattern.Set(true, new Pair[]{
						new Pair(new Pattern.List(false, new Pair[]{
							new Pair(new Pattern.Leaf(type3),null), 
							new Pair(new Pattern.Leaf(type2),null)}), "t2s")}),
					null),
				null),null), 
			new Pair(new Pattern.Leaf(type2), "ts")}),
		null);
	private final static Pattern.Term pattern20 = new Pattern.Term("ArrayT",
		new Pattern.Leaf(type1),
		null);
	private final static Pattern.Term pattern21 = new Pattern.Term("AndT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("ArrayT",
				new Pattern.Leaf(type2),
				"t1"),null), 
			new Pair(new Pattern.Term("ArrayT",
				new Pattern.Leaf(type2),
				"t2"),null), 
			new Pair(new Pattern.Leaf(type2), "ts")}),
		null);
	private final static Pattern.Term pattern22 = new Pattern.Term("AndT",
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
	private final static Pattern.Term pattern23 = new Pattern.Term("AndT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("ArrayT",
				new Pattern.Leaf(type2),
				null), "t1"), 
			new Pair(new Pattern.Term("NotT",
				new Pattern.Leaf(type4),
				null),null), 
			new Pair(new Pattern.Leaf(type2), "ts")}),
		null);
	private final static Pattern.Term pattern24 = new Pattern.Term("AndT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("ArrayT",
				new Pattern.Leaf(type2),
				null), "s"), 
			new Pair(new Pattern.Leaf(type5), "p"), 
			new Pair(new Pattern.Leaf(type2), "ts")}),
		null);
	private final static Pattern.Term pattern25 = new Pattern.Term("OrT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("ArrayT",
				new Pattern.Leaf(type2),
				"t1"), "s1"), 
			new Pair(new Pattern.Term("ArrayT",
				new Pattern.Leaf(type2),
				"t2"), "s2"), 
			new Pair(new Pattern.Leaf(type2), "ts")}),
		null);
	private final static Pattern.Term pattern26 = new Pattern.Term("ReferenceT",
		new Pattern.Leaf(type1),
		null);
	private final static Pattern.Term pattern27 = new Pattern.Term("AndT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("ReferenceT",
				new Pattern.Leaf(type2),
				"t1"),null), 
			new Pair(new Pattern.Term("ReferenceT",
				new Pattern.Leaf(type2),
				"t2"),null), 
			new Pair(new Pattern.Leaf(type2), "ts")}),
		null);
	private final static Pattern.Term pattern28 = new Pattern.Term("AndT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("ReferenceT",
				new Pattern.Leaf(type2),
				"t1"),null), 
			new Pair(new Pattern.Term("ReferenceT",
				new Pattern.Leaf(type2),
				"t2"),null), 
			new Pair(new Pattern.Leaf(type2), "ts")}),
		null);
	private final static Pattern.Term pattern29 = new Pattern.Term("AndT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("ReferenceT",
				new Pattern.Leaf(type2),
				"t1"), "r"), 
			new Pair(new Pattern.Term("NotT",
				new Pattern.Term("ReferenceT",
					new Pattern.Leaf(type2),
					"t2"),
				null),null), 
			new Pair(new Pattern.Leaf(type2), "ts")}),
		null);
	private final static Pattern.Term pattern30 = new Pattern.Term("FunctionT",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type7),null), 
			new Pair(new Pattern.List(true, new Pair[]{
				new Pair(new Pattern.Leaf(type2), "from")}),null), 
			new Pair(new Pattern.List(true, new Pair[]{
				new Pair(new Pattern.Leaf(type2), "to")}),null)}),
		null);
	private final static Pattern.Term pattern31 = new Pattern.Term("AndT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("FunctionT",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type7), "p1"), 
					new Pair(new Pattern.List(true, new Pair[]{
						new Pair(new Pattern.Leaf(type2), "f1s")}),null), 
					new Pair(new Pattern.List(true, new Pair[]{
						new Pair(new Pattern.Leaf(type2), "t1s")}),null)}),
				null),null), 
			new Pair(new Pattern.Term("FunctionT",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type7), "p2"), 
					new Pair(new Pattern.List(true, new Pair[]{
						new Pair(new Pattern.Leaf(type2), "f2s")}),null), 
					new Pair(new Pattern.List(true, new Pair[]{
						new Pair(new Pattern.Leaf(type2), "t2s")}),null)}),
				null),null), 
			new Pair(new Pattern.Leaf(type2), "ts")}),
		null);
	private final static Pattern.Term pattern32 = new Pattern.Term("AndT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("FunctionT",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type7), "p1"), 
					new Pair(new Pattern.List(true, new Pair[]{
						new Pair(new Pattern.Leaf(type2), "f1s")}),null), 
					new Pair(new Pattern.List(true, new Pair[]{
						new Pair(new Pattern.Leaf(type2), "t1s")}),null)}),
				null),null), 
			new Pair(new Pattern.Term("FunctionT",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type7), "p2"), 
					new Pair(new Pattern.List(true, new Pair[]{
						new Pair(new Pattern.Leaf(type2), "f2s")}),null), 
					new Pair(new Pattern.List(true, new Pair[]{
						new Pair(new Pattern.Leaf(type2), "t2s")}),null)}),
				null),null), 
			new Pair(new Pattern.Leaf(type2), "ts")}),
		null);
	private final static Pattern.Term pattern33 = new Pattern.Term("AndT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("FunctionT",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type7), "p1"), 
					new Pair(new Pattern.List(true, new Pair[]{
						new Pair(new Pattern.Leaf(type2), "f1s")}),null), 
					new Pair(new Pattern.List(true, new Pair[]{
						new Pair(new Pattern.Leaf(type2), "t1s")}),null)}),
				null), "f"), 
			new Pair(new Pattern.Term("NotT",
				new Pattern.Term("FunctionT",
					new Pattern.List(false, new Pair[]{
						new Pair(new Pattern.Leaf(type7), "p2"), 
						new Pair(new Pattern.List(true, new Pair[]{
							new Pair(new Pattern.Leaf(type2), "f2s")}),null), 
						new Pair(new Pattern.List(true, new Pair[]{
							new Pair(new Pattern.Leaf(type2), "t2s")}),null)}),
					null),
				null),null), 
			new Pair(new Pattern.Leaf(type2), "ts")}),
		null);
	private final static Pattern.Term pattern34 = new Pattern.Term("AndT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("FunctionT",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type7), "p1"), 
					new Pair(new Pattern.List(true, new Pair[]{
						new Pair(new Pattern.Leaf(type2), "f1s")}),null), 
					new Pair(new Pattern.List(true, new Pair[]{
						new Pair(new Pattern.Leaf(type2), "t1s")}),null)}),
				null), "f"), 
			new Pair(new Pattern.Term("FunctionT",
				new Pattern.List(false, new Pair[]{
					new Pair(new Pattern.Leaf(type7), "p2"), 
					new Pair(new Pattern.List(true, new Pair[]{
						new Pair(new Pattern.Leaf(type2), "f2s")}),null), 
					new Pair(new Pattern.List(true, new Pair[]{
						new Pair(new Pattern.Leaf(type2), "t2s")}),null)}),
				null),null), 
			new Pair(new Pattern.Leaf(type2), "ts")}),
		null);
	private final static Pattern.Term pattern35 = new Pattern.Term("AndT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Leaf(type1),null), 
			new Pair(new Pattern.Leaf(type2), "xs")}),
		null);
	private final static Pattern.Term pattern36 = new Pattern.Term("AndT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Leaf(type0),null), 
			new Pair(new Pattern.Leaf(type2), "xs")}),
		null);
	private final static Pattern.Term pattern37 = new Pattern.Term("AndT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Leaf(type8), "a1"), 
			new Pair(new Pattern.Leaf(type5), "a2"), 
			new Pair(new Pattern.Leaf(type2), "ts")}),
		null);
	private final static Pattern.Term pattern38 = new Pattern.Term("AndT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Leaf(type8), "a1"), 
			new Pair(new Pattern.Term("NotT",
				new Pattern.Leaf(type5),
				"a2"),null), 
			new Pair(new Pattern.Leaf(type2), "ts")}),
		null);
	private final static Pattern.Term pattern39 = new Pattern.Term("AndT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Leaf(type8), "a1"), 
			new Pair(new Pattern.Term("NotT",
				new Pattern.Leaf(type5),
				"a2"),null), 
			new Pair(new Pattern.Leaf(type2), "ts")}),
		null);
	private final static Pattern.Term pattern40 = new Pattern.Term("OrT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Leaf(type0),null), 
			new Pair(new Pattern.Leaf(type2), "xs")}),
		null);
	private final static Pattern.Term pattern41 = new Pattern.Term("OrT",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Leaf(type1),null), 
			new Pair(new Pattern.Leaf(type2), "xs")}),
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
		new Reduction_41(pattern41)
	};


	// =========================================================================
	// Main Method
	// =========================================================================

	public static void main(String[] args) throws IOException {
		new wyrl.ConsoleRewriter(SCHEMA,inferences,reductions).readEvaluatePrintLoop();
	}
}
