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

public final class Arithmetic {
	// term Var(^string)
	public final static int K_Var = 0;
	public final static int Var(Automaton automaton, String r0) {
		int r1 = automaton.add(new Automaton.Strung(r0));
		return automaton.add(new Automaton.Term(K_Var, r1));
	}

	// term $12<Mul($10<^[^real,^{|$3<^AExpr<$12|Num(^real)|Sum($10)|Div(^[$3,$3])|Var(^string)>>...|}[$3<^AExpr<$12|Num(^real)|Sum($10)|Div(^[$3,$3])|Var(^string)>>...]]>)>
	public final static int K_Mul = 1;
	public final static int Mul(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_Mul, r1));
	}
	public final static int Mul(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_Mul, r1));
	}

	// Mul([real n, {|$9<AExpr<Num(^real)|Sum(^[^real,^{|^$9...|}[^$9...]])|Mul(^[^real,^{|^$9...|}[^$9...]])|Div(^[^$9,^$9])|Var(^string)>> rest...|}])
	private final static class Reduction_0 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_0(Pattern.Term pattern) { super(pattern); }

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
	// Mul([real x, {|Num(real y), $9<AExpr<Num(^real)|Sum(^[^real,^{|^$9...|}[^$9...]])|Mul(^[^real,^{|^$9...|}[^$9...]])|Div(^[^$9,^$9])|Var(^string)>> rest...|}])
	private final static class Reduction_1 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_1(Pattern.Term pattern) { super(pattern); }

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
	// Mul([real n1, {|Mul([real n2, {|$9<AExpr<Num(^real)|Sum(^[^real,^{|^$9...|}[^$9...]])|Mul(^[^real,^{|^$9...|}[^$9...]])|Div(^[^$9,^$9])|Var(^string)>> xs...|}]), $9<AExpr<Num(^real)|Sum(^[^real,^{|^$9...|}[^$9...]])|Mul(^[^real,^{|^$9...|}[^$9...]])|Div(^[^$9,^$9])|Var(^string)>> ys...|}])
	private final static class Reduction_2 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_2(Pattern.Term pattern) { super(pattern); }

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
	// Mul([real n1, {|Sum([real n2, {|$9<AExpr<Num(^real)|Sum(^[^real,^{|^$9...|}[^$9...]])|Mul(^[^real,^{|^$9...|}[^$9...]])|Div(^[^$9,^$9])|Var(^string)>> xs...|}]), $9<AExpr<Num(^real)|Sum(^[^real,^{|^$9...|}[^$9...]])|Mul(^[^real,^{|^$9...|}[^$9...]])|Div(^[^$9,^$9])|Var(^string)>> ys...|}])
	private final static class Reduction_3 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_3(Pattern.Term pattern) { super(pattern); }

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
			int r23 = automaton.add(r11);
			Automaton.List r24 = new Automaton.List(r22, r23); // [n1 mul n2ys]
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
	// term $8<Div(^[$2<^AExpr<$8|Num(^real)|Sum(^[^real,^{|$2...|}[$2...]])|Mul(^[^real,^{|$2...|}[$2...]])|Var(^string)>>,$2])>
	public final static int K_Div = 2;
	public final static int Div(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_Div, r1));
	}
	public final static int Div(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.List(r0));
		return automaton.add(new Automaton.Term(K_Div, r1));
	}

	// term $12<Sum($10<^[^real,^{|$3<^AExpr<$12|Num(^real)|Mul($10)|Div(^[$3,$3])|Var(^string)>>...|}[$3<^AExpr<$12|Num(^real)|Mul($10)|Div(^[$3,$3])|Var(^string)>>...]]>)>
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
	private final static class Reduction_4 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_4(Pattern.Term pattern) { super(pattern); }

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
	// Sum([real n, {|$9<AExpr<Num(^real)|Sum(^[^real,^{|^$9...|}[^$9...]])|Mul(^[^real,^{|^$9...|}[^$9...]])|Div(^[^$9,^$9])|Var(^string)>> x, $9<AExpr<Num(^real)|Sum(^[^real,^{|^$9...|}[^$9...]])|Mul(^[^real,^{|^$9...|}[^$9...]])|Div(^[^$9,^$9])|Var(^string)>> rest...|}])
	private final static class Reduction_5 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_5(Pattern.Term pattern) { super(pattern); }

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
			boolean r7 = Runtime.accepts(type2, automaton, r4, SCHEMA); // x is ^NumSumMul<Num(^real)|$22<Sum($20<^[^real,^{|$13<^AExpr<Num(^real)|$22|Mul($20)|Div(^[$13,$13])|Var(^string)>>...|}[$13<^AExpr<Num(^real)|$22|Mul($20)|Div(^[$13,$13])|Var(^string)>>...]]>)>|Mul($20)>
			boolean r8 = !r7;              // !x is ^NumSumMul<Num(^real)|$22<Sum($20<^[^real,^{|$13<^AExpr<Num(^real)|$22|Mul($20)|Div(^[$13,$13])|Var(^string)>>...|}[$13<^AExpr<Num(^real)|$22|Mul($20)|Div(^[$13,$13])|Var(^string)>>...]]>)>|Mul($20)>
			if(r8) {
				Automaton.Real r9 = new Automaton.Real(1); // 1.0
				int r10 = automaton.add(r9);
				Automaton.Bag r11 = new Automaton.Bag(r4); // {|x|}
				int r12 = automaton.add(r11);
				Automaton.List r13 = new Automaton.List(r10, r12); // [1.0{|x|}]
				int r14 = automaton.add(r13);
				Automaton.Term r15 = new Automaton.Term(K_Mul, r14);
				int r16 = automaton.add(r15);
				Automaton.Bag r17 = r6.appendFront(r16); // Mul([1.0{|x|}]) append rest
				int r18 = automaton.add(r17);
				Automaton.List r19 = new Automaton.List(r2, r18); // [nMul([1.0{|x|}]) append rest]
				int r20 = automaton.add(r19);
				Automaton.Term r21 = new Automaton.Term(K_Sum, r20);
				int r22 = automaton.add(r21);
				if(r0 != r22) {
					automaton.rewrite(r0, r22);
					return true;
				}
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// Sum([real x, {|Num(real y), $9<AExpr<Num(^real)|Sum(^[^real,^{|^$9...|}[^$9...]])|Mul(^[^real,^{|^$9...|}[^$9...]])|Div(^[^$9,^$9])|Var(^string)>> rest...|}])
	private final static class Reduction_6 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_6(Pattern.Term pattern) { super(pattern); }

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
	// Sum([real n, {|Mul([real x, {|$9<AExpr<Num(^real)|Sum(^[^real,^{|^$9...|}[^$9...]])|Mul(^[^real,^{|^$9...|}[^$9...]])|Div(^[^$9,^$9])|Var(^string)>>...|} xs]), Mul([real y, {|$9<AExpr<Num(^real)|Sum(^[^real,^{|^$9...|}[^$9...]])|Mul(^[^real,^{|^$9...|}[^$9...]])|Div(^[^$9,^$9])|Var(^string)>>...|} ys]), $9<AExpr<Num(^real)|Sum(^[^real,^{|^$9...|}[^$9...]])|Mul(^[^real,^{|^$9...|}[^$9...]])|Div(^[^$9,^$9])|Var(^string)>> zs...|}])
	private final static class Reduction_7 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_7(Pattern.Term pattern) { super(pattern); }

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
	// Sum([real x, {|Sum([real y, {|$9<AExpr<Num(^real)|Sum(^[^real,^{|^$9...|}[^$9...]])|Mul(^[^real,^{|^$9...|}[^$9...]])|Div(^[^$9,^$9])|Var(^string)>> ys...|}]), $9<AExpr<Num(^real)|Sum(^[^real,^{|^$9...|}[^$9...]])|Mul(^[^real,^{|^$9...|}[^$9...]])|Div(^[^$9,^$9])|Var(^string)>> xs...|}])
	private final static class Reduction_8 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_8(Pattern.Term pattern) { super(pattern); }

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
	// term True
	public final static int K_True = 4;
	public final static Automaton.Term True = new Automaton.Term(K_True);

	// term False
	public final static int K_False = 5;
	public final static Automaton.Term False = new Automaton.Term(K_False);

	// term $7<And($5<^{^BExpr<$7|Bool<True|False>|Var(^string)|Or($5)|Inequality($32<^AExpr<Var(^string)|Num(^real)|Sum(^[^real,^{|$32...|}[$32...]])|Mul(^[^real,^{|$32...|}[$32...]])|Div(^[$32,$32])>>)>...}>)>
	public final static int K_And = 6;
	public final static int And(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.Set(r0));
		return automaton.add(new Automaton.Term(K_And, r1));
	}
	public final static int And(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.Set(r0));
		return automaton.add(new Automaton.Term(K_And, r1));
	}

	// And({$9<BExpr<Bool<True|False>|Var(^string)|And(^{^$9...})|Or(^{^$9...})|Inequality($32<^AExpr<Var(^string)|Num(^real)|Sum(^[^real,^{|$32...|}[$32...]])|Mul(^[^real,^{|$32...|}[$32...]])|Div(^[$32,$32])>>)>> x})
	private final static class Reduction_9 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_9(Pattern.Term pattern) { super(pattern); }

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
	// And({Bool<True|False> b, $9<BExpr<Bool<True|False>|Var(^string)|And(^{^$9...})|Or(^{^$9...})|Inequality($32<^AExpr<Var(^string)|Num(^real)|Sum(^[^real,^{|$32...|}[$32...]])|Mul(^[^real,^{|$32...|}[$32...]])|Div(^[$32,$32])>>)>> xs...})
	private final static class Reduction_10 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_10(Pattern.Term pattern) { super(pattern); }

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
						if(Runtime.accepts(type4,automaton,automaton.get(r2), SCHEMA)) {
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
	// And({And({$9<BExpr<Bool<True|False>|Var(^string)|And(^{^$9...})|Or(^{^$9...})|Inequality($32<^AExpr<Var(^string)|Num(^real)|Sum(^[^real,^{|$32...|}[$32...]])|Mul(^[^real,^{|$32...|}[$32...]])|Div(^[$32,$32])>>)>> xs...}), $9<BExpr<Bool<True|False>|Var(^string)|And(^{^$9...})|Or(^{^$9...})|Inequality($32<^AExpr<Var(^string)|Num(^real)|Sum(^[^real,^{|$32...|}[$32...]])|Mul(^[^real,^{|$32...|}[$32...]])|Div(^[$32,$32])>>)>> ys...})
	private final static class Reduction_11 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_11(Pattern.Term pattern) { super(pattern); }

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
	// And({Or({$9<BExpr<Bool<True|False>|Var(^string)|And(^{^$9...})|Or(^{^$9...})|Inequality($32<^AExpr<Var(^string)|Num(^real)|Sum(^[^real,^{|$32...|}[$32...]])|Mul(^[^real,^{|$32...|}[$32...]])|Div(^[$32,$32])>>)>> xs...}), $9<BExpr<Bool<True|False>|Var(^string)|And(^{^$9...})|Or(^{^$9...})|Inequality($32<^AExpr<Var(^string)|Num(^real)|Sum(^[^real,^{|$32...|}[$32...]])|Mul(^[^real,^{|$32...|}[$32...]])|Div(^[$32,$32])>>)>> ys...})
	private final static class Reduction_12 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_12(Pattern.Term pattern) { super(pattern); }

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
	// term $7<Or($5<^{^BExpr<$7|Bool<True|False>|Var(^string)|And($5)|Inequality($32<^AExpr<Var(^string)|Num(^real)|Sum(^[^real,^{|$32...|}[$32...]])|Mul(^[^real,^{|$32...|}[$32...]])|Div(^[$32,$32])>>)>...}>)>
	public final static int K_Or = 7;
	public final static int Or(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.Set(r0));
		return automaton.add(new Automaton.Term(K_Or, r1));
	}
	public final static int Or(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.Set(r0));
		return automaton.add(new Automaton.Term(K_Or, r1));
	}

	// Or({$9<BExpr<Bool<True|False>|Var(^string)|And(^{^$9...})|Or(^{^$9...})|Inequality($32<^AExpr<Var(^string)|Num(^real)|Sum(^[^real,^{|$32...|}[$32...]])|Mul(^[^real,^{|$32...|}[$32...]])|Div(^[$32,$32])>>)>> x})
	private final static class Reduction_13 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_13(Pattern.Term pattern) { super(pattern); }

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
	// Or({Bool<True|False> b, $9<BExpr<Bool<True|False>|Var(^string)|And(^{^$9...})|Or(^{^$9...})|Inequality($32<^AExpr<Var(^string)|Num(^real)|Sum(^[^real,^{|$32...|}[$32...]])|Mul(^[^real,^{|$32...|}[$32...]])|Div(^[$32,$32])>>)>> xs...})
	private final static class Reduction_14 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_14(Pattern.Term pattern) { super(pattern); }

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
						if(Runtime.accepts(type4,automaton,automaton.get(r2), SCHEMA)) {
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
			Automaton.Term r5 = True;
			Object r6 = (Object) automaton.get(r2);
			boolean r7 = r6.equals(r5);    // b eq True
			if(r7) {
				Automaton.Term r8 = True;
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
				Automaton.Term r13 = False;
				int r14 = automaton.add(r13);
				if(r0 != r14) {
					automaton.rewrite(r0, r14);
					return true;
				}
			}
			int r15 = automaton.add(r4);
			Automaton.Term r16 = new Automaton.Term(K_Or, r15);
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
	// Or({Or({$9<BExpr<Bool<True|False>|Var(^string)|And(^{^$9...})|Or(^{^$9...})|Inequality($32<^AExpr<Var(^string)|Num(^real)|Sum(^[^real,^{|$32...|}[$32...]])|Mul(^[^real,^{|$32...|}[$32...]])|Div(^[$32,$32])>>)>> xs...}), $9<BExpr<Bool<True|False>|Var(^string)|And(^{^$9...})|Or(^{^$9...})|Inequality($32<^AExpr<Var(^string)|Num(^real)|Sum(^[^real,^{|$32...|}[$32...]])|Mul(^[^real,^{|$32...|}[$32...]])|Div(^[$32,$32])>>)>> ys...})
	private final static class Reduction_15 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_15(Pattern.Term pattern) { super(pattern); }

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
	// term Inequality($2<^AExpr<Num(^real)|Sum(^[^real,^{|$2...|}[$2...]])|Mul(^[^real,^{|$2...|}[$2...]])|Div(^[$2,$2])|Var(^string)>>)
	public final static int K_Inequality = 8;
	public final static int Inequality(Automaton automaton, int r0) {
		return automaton.add(new Automaton.Term(K_Inequality, r0));
	}

	// Inequality(Num(real v))
	private final static class Reduction_16 extends AbstractRewriteRule implements ReductionRule {

		public Reduction_16(Pattern.Term pattern) { super(pattern); }

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
			int nStates = automaton.nStates();
			int[] state = (int[]) _state;
			int r0 = state[0];
			int r2 = state[2]; // v
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
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 2; }
		public final int maximum() { return Integer.MAX_VALUE; }
	}
	// And({Inequality(Sum([real x1, {|Mul([real x2, {|$9<AExpr<Num(^real)|Sum(^[^real,^{|^$9...|}[^$9...]])|Mul(^[^real,^{|^$9...|}[^$9...]])|Div(^[^$9,^$9])|Var(^string)>> v1|}]), $12<Mul($10<^[^real,^{|$3<^AExpr<$12|Num(^real)|Sum($10)|Div(^[$3,$3])|Var(^string)>>...|}[$3<^AExpr<$12|Num(^real)|Sum($10)|Div(^[$3,$3])|Var(^string)>>...]]>)> xs...|}]) s1) eq1, Inequality(Sum([real y1, {|Mul([real y2, {|$9<AExpr<Num(^real)|Sum(^[^real,^{|^$9...|}[^$9...]])|Mul(^[^real,^{|^$9...|}[^$9...]])|Div(^[^$9,^$9])|Var(^string)>> v2|}]), $12<Mul($10<^[^real,^{|$3<^AExpr<$12|Num(^real)|Sum($10)|Div(^[$3,$3])|Var(^string)>>...|}[$3<^AExpr<$12|Num(^real)|Sum($10)|Div(^[$3,$3])|Var(^string)>>...]]>)> ys...|}]) s2) eq2, $9<BExpr<Bool<True|False>|Var(^string)|And(^{^$9...})|Or(^{^$9...})|Inequality($32<^AExpr<Var(^string)|Num(^real)|Sum(^[^real,^{|$32...|}[$32...]])|Mul(^[^real,^{|$32...|}[$32...]])|Div(^[$32,$32])>>)>> rest...})
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
						if(s2.kind == K_Inequality) {
							Automaton.Term t2 = (Automaton.Term) s2;
							int r4 = t2.contents;
							Automaton.State s4 = automaton.get(r4);
							if(s4.kind == K_Sum) {
								Automaton.Term t4 = (Automaton.Term) s4;
								int r5 = t4.contents;
								Automaton.State s5 = automaton.get(r5);
								Automaton.List l5 = (Automaton.List) s5;
								int r6 = l5.get(0);
								int r7 = l5.get(1);
								Automaton.State s7 = automaton.get(r7);
								Automaton.Collection c7 = (Automaton.Collection) s7;
								if(c7.size() >= 1) {
									for(int r9=0;r9!=c7.size();++r9) {
										int r8 = c7.get(r9);
										Automaton.State s8 = automaton.get(r8);
										if(s8.kind == K_Mul) {
											Automaton.Term t8 = (Automaton.Term) s8;
											int r10 = t8.contents;
											Automaton.State s10 = automaton.get(r10);
											Automaton.List l10 = (Automaton.List) s10;
											int r11 = l10.get(0);
											int r12 = l10.get(1);
											Automaton.State s12 = automaton.get(r12);
											Automaton.Collection c12 = (Automaton.Collection) s12;
											if(c12.size() == 1) {
												for(int r14=0;r14!=c12.size();++r14) {
													int r13 = c12.get(r14);
													boolean m7_1 = true;
													for(int i15=0;i15!=c7.size();++i15) {
														if(i15 == r9) { continue; }
														int r15 = c7.get(i15);
														if(Runtime.accepts(type5,automaton,automaton.get(r15), SCHEMA)) {
															continue;
														} else { m7_1=false; break; }
													}
													if(m7_1) {
														for(int r17=0;r17!=c1.size();++r17) {
															if(r17 == r3) { continue; }
															int r16 = c1.get(r17);
															Automaton.State s16 = automaton.get(r16);
															if(s16.kind == K_Inequality) {
																Automaton.Term t16 = (Automaton.Term) s16;
																int r18 = t16.contents;
																Automaton.State s18 = automaton.get(r18);
																if(s18.kind == K_Sum) {
																	Automaton.Term t18 = (Automaton.Term) s18;
																	int r19 = t18.contents;
																	Automaton.State s19 = automaton.get(r19);
																	Automaton.List l19 = (Automaton.List) s19;
																	int r20 = l19.get(0);
																	int r21 = l19.get(1);
																	Automaton.State s21 = automaton.get(r21);
																	Automaton.Collection c21 = (Automaton.Collection) s21;
																	if(c21.size() >= 1) {
																		for(int r23=0;r23!=c21.size();++r23) {
																			int r22 = c21.get(r23);
																			Automaton.State s22 = automaton.get(r22);
																			if(s22.kind == K_Mul) {
																				Automaton.Term t22 = (Automaton.Term) s22;
																				int r24 = t22.contents;
																				Automaton.State s24 = automaton.get(r24);
																				Automaton.List l24 = (Automaton.List) s24;
																				int r25 = l24.get(0);
																				int r26 = l24.get(1);
																				Automaton.State s26 = automaton.get(r26);
																				Automaton.Collection c26 = (Automaton.Collection) s26;
																				if(c26.size() == 1) {
																					for(int r28=0;r28!=c26.size();++r28) {
																						int r27 = c26.get(r28);
																						boolean m21_1 = true;
																						for(int i29=0;i29!=c21.size();++i29) {
																							if(i29 == r23) { continue; }
																							int r29 = c21.get(i29);
																							if(Runtime.accepts(type5,automaton,automaton.get(r29), SCHEMA)) {
																								continue;
																							} else { m21_1=false; break; }
																						}
																						if(m21_1) {
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
			int r4 = state[4]; // s1
			int r6 = state[6]; // x1
			int r9 = state[9];
			int r11 = state[11]; // x2
			int r13 = state[13]; // v1
			int r14 = state[14];
			Automaton.Collection s7 = (Automaton.Collection) automaton.get(state[7]);
			int[] s7children = new int[s7.size() - 1];
			for(int s7i=0, s7j=0; s7i != s7.size();++s7i) {
				if(s7i == r9) { continue; }
				s7children[s7j++] = s7.get(s7i);
			}
			Automaton.Bag r15 = new Automaton.Bag(s7children);
			int r16 = state[16]; // eq2
			int r17 = state[17];
			int r18 = state[18]; // s2
			int r20 = state[20]; // y1
			int r23 = state[23];
			int r25 = state[25]; // y2
			int r27 = state[27]; // v2
			int r28 = state[28];
			Automaton.Collection s21 = (Automaton.Collection) automaton.get(state[21]);
			int[] s21children = new int[s21.size() - 1];
			for(int s21i=0, s21j=0; s21i != s21.size();++s21i) {
				if(s21i == r23) { continue; }
				s21children[s21j++] = s21.get(s21i);
			}
			Automaton.Bag r29 = new Automaton.Bag(s21children);
			Automaton.Collection s1 = (Automaton.Collection) automaton.get(state[1]);
			int[] s1children = new int[s1.size() - 2];
			for(int s1i=0, s1j=0; s1i != s1.size();++s1i) {
				if(s1i == r3 || s1i == r17) { continue; }
				s1children[s1j++] = s1.get(s1i);
			}
			Automaton.Set r30 = new Automaton.Set(s1children);
			int r31 = automaton.add(r15);
			Automaton.List r32 = new Automaton.List(r6, r31); // [x1xs]
			int r33 = automaton.add(r32);
			Automaton.Term r34 = new Automaton.Term(K_Sum, r33);
			int r35 = automaton.add(r34);
			Automaton.Bag r36 = new Automaton.Bag(r35); // {|Sum([x1xs])|}
			int r37 = automaton.add(r36);
			Automaton.List r38 = new Automaton.List(r25, r37); // [y2{|Sum([x1xs])|}]
			int r39 = automaton.add(r38);
			Automaton.Term r40 = new Automaton.Term(K_Mul, r39);
			Automaton.Real r41 = (Automaton.Real) automaton.get(r11);
			Automaton.Real r42 = r41.negate(); // -x2
			int r43 = automaton.add(r42);
			int r44 = automaton.add(r29);
			Automaton.List r45 = new Automaton.List(r20, r44); // [y1ys]
			int r46 = automaton.add(r45);
			Automaton.Term r47 = new Automaton.Term(K_Sum, r46);
			int r48 = automaton.add(r47);
			Automaton.Bag r49 = new Automaton.Bag(r48); // {|Sum([y1ys])|}
			int r50 = automaton.add(r49);
			Automaton.List r51 = new Automaton.List(r43, r50); // [-x2{|Sum([y1ys])|}]
			int r52 = automaton.add(r51);
			Automaton.Term r53 = new Automaton.Term(K_Mul, r52);
			Automaton.Real r54 = new Automaton.Real(0); // 0.0
			int r55 = automaton.add(r54);
			int r56 = automaton.add(r40);
			int r57 = automaton.add(r53);
			Automaton.Bag r58 = new Automaton.Bag(r56, r57); // {|s3s4|}
			int r59 = automaton.add(r58);
			Automaton.List r60 = new Automaton.List(r55, r59); // [0.0{|s3s4|}]
			int r61 = automaton.add(r60);
			Automaton.Term r62 = new Automaton.Term(K_Sum, r61);
			int r63 = automaton.add(r62);
			Automaton.Term r64 = new Automaton.Term(K_Inequality, r63);
			boolean r65 = r13 == r27;      // v1 eq v2
			boolean r66 = false;           // v1 eq v2 && x2 lt 0.0 && y2 gt 0.0
			if(r65) {
				Automaton.Real r67 = new Automaton.Real(0); // 0.0
				Automaton.Real r68 = (Automaton.Real) automaton.get(r11);
				boolean r69 = r68.compareTo(r67)<0; // x2 lt 0.0
				boolean r70 = false;           // x2 lt 0.0 && y2 gt 0.0
				if(r69) {
					Automaton.Real r71 = new Automaton.Real(0); // 0.0
					Automaton.Real r72 = (Automaton.Real) automaton.get(r25);
					boolean r73 = r72.compareTo(r71)>0; // y2 gt 0.0
					r70 = r73;
				}
				r66 = r70;
			}
			if(r66) {
				int r74 = automaton.add(r64);
				Automaton.Set r75 = new Automaton.Set(r2, r16, r74); // {eq1eq2eq3}
				Automaton.Set r76 = r75.append(r30); // {eq1eq2eq3} append rest
				int r77 = automaton.add(r76);
				Automaton.Term r78 = new Automaton.Term(K_And, r77);
				int r79 = automaton.add(r78);
				if(r0 != r79) {
					automaton.rewrite(r0, r79);
					return true;
				}
			}
			automaton.resize(nStates);
			return false;
		}

		public final int minimum() { return 0; }
		public final int maximum() { return Integer.MAX_VALUE; }
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
		// $12<Mul($10<^[^real,^{|$3<^AExpr<$12|Num(^real)|Sum($10)|Div(^[$3,$3])|Var(^string)>>...|}[$3<^AExpr<$12|Num(^real)|Sum($10)|Div(^[$3,$3])|Var(^string)>>...]]>)>
		Schema.Term("Mul",Schema.List(true,Schema.Real,Schema.Bag(true))),
		// $8<Div(^[$2<^AExpr<$8|Num(^real)|Sum(^[^real,^{|$2...|}[$2...]])|Mul(^[^real,^{|$2...|}[$2...]])|Var(^string)>>,$2])>
		Schema.Term("Div",Schema.List(true,Schema.Or(Schema.Any, Schema.Term("Num",Schema.Real), Schema.Term("Sum",Schema.List(true,Schema.Any,Schema.Bag(true))), Schema.Term("Mul",Schema.Any), Schema.Term("Var",Schema.String)),Schema.Any)),
		// $12<Sum($10<^[^real,^{|$3<^AExpr<$12|Num(^real)|Mul($10)|Div(^[$3,$3])|Var(^string)>>...|}[$3<^AExpr<$12|Num(^real)|Mul($10)|Div(^[$3,$3])|Var(^string)>>...]]>)>
		Schema.Term("Sum",Schema.List(true,Schema.Real,Schema.Bag(true))),
		// True
		Schema.Term("True"),
		// False
		Schema.Term("False"),
		// $7<And($5<^{^BExpr<$7|Bool<True|False>|Var(^string)|Or($5)|Inequality($32<^AExpr<Var(^string)|Num(^real)|Sum(^[^real,^{|$32...|}[$32...]])|Mul(^[^real,^{|$32...|}[$32...]])|Div(^[$32,$32])>>)>...}>)>
		Schema.Term("And",Schema.Set(true)),
		// $7<Or($5<^{^BExpr<$7|Bool<True|False>|Var(^string)|And($5)|Inequality($32<^AExpr<Var(^string)|Num(^real)|Sum(^[^real,^{|$32...|}[$32...]])|Mul(^[^real,^{|$32...|}[$32...]])|Div(^[$32,$32])>>)>...}>)>
		Schema.Term("Or",Schema.Set(true)),
		// Inequality($2<^AExpr<Num(^real)|Sum(^[^real,^{|$2...|}[$2...]])|Mul(^[^real,^{|$2...|}[$2...]])|Div(^[$2,$2])|Var(^string)>>)
		Schema.Term("Inequality",Schema.Or(Schema.Term("Num",Schema.Real), Schema.Term("Sum",Schema.List(true,Schema.Any,Schema.Bag(true))), Schema.Term("Mul",Schema.Any), Schema.Term("Div",Schema.List(true,Schema.Any,Schema.Any)), Schema.Term("Var",Schema.String))),
		// Num(^real)
		Schema.Term("Num",Schema.Real)
	});

	// =========================================================================
	// Types
	// =========================================================================

	// real
	private static Type type0 = Runtime.Type("Fc0");
	// $9<AExpr<Num(^real)|Sum(^[^real,^{|^$9...|}[^$9...]])|Mul(^[^real,^{|^$9...|}[^$9...]])|Div(^[^$9,^$9])|Var(^string)>>
	private static Type type1 = Runtime.Type("9GKF4W6RmGYIpp5CIKMQooJSgG2GdO6CL4aRGt3PeWrTQVo7uZJA9dX5Yg2IgoZ9ACmIfV2LeZp7Bdp7SgKDRdHMYkYMgwp7xs4AdCmIECH6f_2Qeoq7ys5AjdH5YwITgcMgo2");
	// ^NumSumMul<Num(^real)|$22<Sum($20<^[^real,^{|$13<^AExpr<Num(^real)|$22|Mul($20)|Div(^[$13,$13])|Var(^string)>>...|}[$13<^AExpr<Num(^real)|$22|Mul($20)|Div(^[$13,$13])|Var(^string)>>...]]>)>|Mul($20)>
	private static Type type2 = Runtime.Type("NGOsJShCKShpJSgdXHosJShGnJpp5CCK6Qlo3PshlEYc2HhZZ9PB1EAl1IJ4JGs0bResq7Eh1DNdHLYgZLYolLtk_9SCHETlmMoFJPqGYKW8MJCW5Ty_NglPYs3Qhoq7ys4AjCmIECH6t_YTegr7dl6AxdH5YcqUgVN3v$");
	// $9<BExpr<Bool<True|False>|Var(^string)|And(^{^$9...})|Or(^{^$9...})|Inequality($32<^AExpr<Var(^string)|Num(^real)|Sum(^[^real,^{|$32...|}[$32...]])|Mul(^[^real,^{|$32...|}[$32...]])|Div(^[$32,$32])>>)>>
	private static Type type3 = Runtime.Type("zG_F4W6RmGZFjx5QoNKNmGIFiG58E86dGHiKLRp45QdGMTGp4PiW6UQVo7uZJA9G3KmKMOIk3ACG_GWlqR_ClIgVK7D_p5PCmDQp1MeZl7ws4AUdmHYZq9jca9fCHEglHQYs2Qgw5K0K3Tk8b9B5YwYTgg6CDKMQoBKShGIIpl5C3_aSGWqY0eWe0il585YZbXGAA5ecl7xpNkXYl7uh1DN5eZOBHYWal7SgOZ2bW9S5Ysbb0AU5Ywbb0Ad5YcbTYoleGDg5eoPB1XWf0Aj5lHE");
	// Bool<True|False>
	private static Type type4 = Runtime.Type("QFZFjx5Q3G_RpKq3vk1EJOJNgCMOIs2Az3HE7hGHYcYHhgJko2");
	// $12<Mul($10<^[^real,^{|$3<^AExpr<$12|Num(^real)|Sum($10)|Div(^[$3,$3])|Var(^string)>>...|}[$3<^AExpr<$12|Num(^real)|Sum($10)|Div(^[$3,$3])|Var(^string)>>...]]>)>
	private static Type type5 = Runtime.Type("9GIIpla9PFKF4W6RmdXMYon9ssY9zBmD7CH68_YHego7uk3ACGYIpp5CIKMQoFJPqGYKW8MJDWaPshr5QC1ERpHMYwoDgwp7Nl3AdCHExBH6f_2Qeoq7Ot5AjdH5YcKTgcMso2");

	// =========================================================================
	// Patterns
	// =========================================================================

	private final static Pattern.Term pattern0 = new Pattern.Term("Mul",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type0), "n"), 
			new Pair(new Pattern.Bag(true, new Pair[]{
				new Pair(new Pattern.Leaf(type1), "rest")}),null)}),
		null);
	private final static Pattern.Term pattern1 = new Pattern.Term("Mul",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type0), "x"), 
			new Pair(new Pattern.Bag(true, new Pair[]{
				new Pair(new Pattern.Term("Num",
					new Pattern.Leaf(type0),
					"y"),null), 
				new Pair(new Pattern.Leaf(type1), "rest")}),null)}),
		null);
	private final static Pattern.Term pattern2 = new Pattern.Term("Mul",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type0), "n1"), 
			new Pair(new Pattern.Bag(true, new Pair[]{
				new Pair(new Pattern.Term("Mul",
					new Pattern.List(false, new Pair[]{
						new Pair(new Pattern.Leaf(type0), "n2"), 
						new Pair(new Pattern.Bag(true, new Pair[]{
							new Pair(new Pattern.Leaf(type1), "xs")}),null)}),
					null),null), 
				new Pair(new Pattern.Leaf(type1), "ys")}),null)}),
		null);
	private final static Pattern.Term pattern3 = new Pattern.Term("Mul",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type0), "n1"), 
			new Pair(new Pattern.Bag(true, new Pair[]{
				new Pair(new Pattern.Term("Sum",
					new Pattern.List(false, new Pair[]{
						new Pair(new Pattern.Leaf(type0), "n2"), 
						new Pair(new Pattern.Bag(true, new Pair[]{
							new Pair(new Pattern.Leaf(type1), "xs")}),null)}),
					null),null), 
				new Pair(new Pattern.Leaf(type1), "ys")}),null)}),
		null);
	private final static Pattern.Term pattern4 = new Pattern.Term("Sum",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type0), "n"), 
			new Pair(new Pattern.Bag(false, new Pair[]{}),null)}),
		null);
	private final static Pattern.Term pattern5 = new Pattern.Term("Sum",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type0), "n"), 
			new Pair(new Pattern.Bag(true, new Pair[]{
				new Pair(new Pattern.Leaf(type1), "x"), 
				new Pair(new Pattern.Leaf(type1), "rest")}),null)}),
		null);
	private final static Pattern.Term pattern6 = new Pattern.Term("Sum",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type0), "x"), 
			new Pair(new Pattern.Bag(true, new Pair[]{
				new Pair(new Pattern.Term("Num",
					new Pattern.Leaf(type0),
					"y"),null), 
				new Pair(new Pattern.Leaf(type1), "rest")}),null)}),
		null);
	private final static Pattern.Term pattern7 = new Pattern.Term("Sum",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type0), "n"), 
			new Pair(new Pattern.Bag(true, new Pair[]{
				new Pair(new Pattern.Term("Mul",
					new Pattern.List(false, new Pair[]{
						new Pair(new Pattern.Leaf(type0), "x"), 
						new Pair(new Pattern.Bag(true, new Pair[]{
							new Pair(new Pattern.Leaf(type1),null)}), "xs")}),
					null),null), 
				new Pair(new Pattern.Term("Mul",
					new Pattern.List(false, new Pair[]{
						new Pair(new Pattern.Leaf(type0), "y"), 
						new Pair(new Pattern.Bag(true, new Pair[]{
							new Pair(new Pattern.Leaf(type1),null)}), "ys")}),
					null),null), 
				new Pair(new Pattern.Leaf(type1), "zs")}),null)}),
		null);
	private final static Pattern.Term pattern8 = new Pattern.Term("Sum",
		new Pattern.List(false, new Pair[]{
			new Pair(new Pattern.Leaf(type0), "x"), 
			new Pair(new Pattern.Bag(true, new Pair[]{
				new Pair(new Pattern.Term("Sum",
					new Pattern.List(false, new Pair[]{
						new Pair(new Pattern.Leaf(type0), "y"), 
						new Pair(new Pattern.Bag(true, new Pair[]{
							new Pair(new Pattern.Leaf(type1), "ys")}),null)}),
					null),null), 
				new Pair(new Pattern.Leaf(type1), "xs")}),null)}),
		null);
	private final static Pattern.Term pattern9 = new Pattern.Term("And",
		new Pattern.Set(false, new Pair[]{
			new Pair(new Pattern.Leaf(type3), "x")}),
		null);
	private final static Pattern.Term pattern10 = new Pattern.Term("And",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Leaf(type4), "b"), 
			new Pair(new Pattern.Leaf(type3), "xs")}),
		null);
	private final static Pattern.Term pattern11 = new Pattern.Term("And",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("And",
				new Pattern.Set(true, new Pair[]{
					new Pair(new Pattern.Leaf(type3), "xs")}),
				null),null), 
			new Pair(new Pattern.Leaf(type3), "ys")}),
		null);
	private final static Pattern.Term pattern12 = new Pattern.Term("And",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("Or",
				new Pattern.Set(true, new Pair[]{
					new Pair(new Pattern.Leaf(type3), "xs")}),
				null),null), 
			new Pair(new Pattern.Leaf(type3), "ys")}),
		null);
	private final static Pattern.Term pattern13 = new Pattern.Term("Or",
		new Pattern.Set(false, new Pair[]{
			new Pair(new Pattern.Leaf(type3), "x")}),
		null);
	private final static Pattern.Term pattern14 = new Pattern.Term("Or",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Leaf(type4), "b"), 
			new Pair(new Pattern.Leaf(type3), "xs")}),
		null);
	private final static Pattern.Term pattern15 = new Pattern.Term("Or",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("Or",
				new Pattern.Set(true, new Pair[]{
					new Pair(new Pattern.Leaf(type3), "xs")}),
				null),null), 
			new Pair(new Pattern.Leaf(type3), "ys")}),
		null);
	private final static Pattern.Term pattern16 = new Pattern.Term("Inequality",
		new Pattern.Term("Num",
			new Pattern.Leaf(type0),
			"v"),
		null);
	private final static Pattern.Term pattern17 = new Pattern.Term("And",
		new Pattern.Set(true, new Pair[]{
			new Pair(new Pattern.Term("Inequality",
				new Pattern.Term("Sum",
					new Pattern.List(false, new Pair[]{
						new Pair(new Pattern.Leaf(type0), "x1"), 
						new Pair(new Pattern.Bag(true, new Pair[]{
							new Pair(new Pattern.Term("Mul",
								new Pattern.List(false, new Pair[]{
									new Pair(new Pattern.Leaf(type0), "x2"), 
									new Pair(new Pattern.Bag(false, new Pair[]{
										new Pair(new Pattern.Leaf(type1), "v1")}),null)}),
								null),null), 
							new Pair(new Pattern.Leaf(type5), "xs")}),null)}),
					null),
				"s1"), "eq1"), 
			new Pair(new Pattern.Term("Inequality",
				new Pattern.Term("Sum",
					new Pattern.List(false, new Pair[]{
						new Pair(new Pattern.Leaf(type0), "y1"), 
						new Pair(new Pattern.Bag(true, new Pair[]{
							new Pair(new Pattern.Term("Mul",
								new Pattern.List(false, new Pair[]{
									new Pair(new Pattern.Leaf(type0), "y2"), 
									new Pair(new Pattern.Bag(false, new Pair[]{
										new Pair(new Pattern.Leaf(type1), "v2")}),null)}),
								null),null), 
							new Pair(new Pattern.Leaf(type5), "ys")}),null)}),
					null),
				"s2"), "eq2"), 
			new Pair(new Pattern.Leaf(type3), "rest")}),
		null);
	// =========================================================================
	// rules
	// =========================================================================

	public static final InferenceRule[] inferences = new InferenceRule[]{
		new Inference_0(pattern17)
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
		new Reduction_16(pattern16)
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
