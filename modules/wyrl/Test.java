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

public final class Test {
	// term Var(^string)
	public final static int K_Var = 0;
	public final static int Var(Automaton automaton, String r0) {
		int r1 = automaton.add(new Automaton.Strung(r0));
		return automaton.add(new Automaton.Term(K_Var, r1));
	}

	// term True
	public final static int K_True = 1;
	public final static Automaton.Term True = new Automaton.Term(K_True);

	// term False
	public final static int K_False = 2;
	public final static Automaton.Term False = new Automaton.Term(K_False);

	// term $7<And(^{|^BExpr...|}[^BExpr...])>
	public final static int K_And = 3;
	public final static int And(Automaton automaton, int... r0) {
		int r1 = automaton.add(new Automaton.Bag(r0));
		return automaton.add(new Automaton.Term(K_And, r1));
	}
	public final static int And(Automaton automaton, List<Integer> r0) {
		int r1 = automaton.add(new Automaton.Bag(r0));
		return automaton.add(new Automaton.Term(K_And, r1));
	}

	// =========================================================================
	// Schema
	// =========================================================================

	public static final Schema SCHEMA = new Schema(new Schema.Term[]{
		// Var(^string)
		Schema.Term("Var",Schema.String),
		// True
		Schema.Term("True"),
		// False
		Schema.Term("False"),
		// $7<And(^{|^BExpr...|}[^BExpr...])>
		Schema.Term("And",Schema.Bag(true))
	});

	// =========================================================================
	// Types
	// =========================================================================


	// =========================================================================
	// Patterns
	// =========================================================================

	// =========================================================================
	// rules
	// =========================================================================

	public static final InferenceRule[] inferences = new InferenceRule[]{

	};
	public static final ReductionRule[] reductions = new ReductionRule[]{

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
