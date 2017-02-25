package wyopcl.testing.translator;

import static org.junit.Assert.*;

import java.math.BigInteger;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import wyopcl.translator.bound.BoundBlock;
import wyopcl.translator.bound.Bounds;
import wyopcl.translator.bound.Domain;
import wyopcl.translator.bound.BoundBlock.BlockType;
import wyopcl.translator.bound.constraint.Assign;
import wyopcl.translator.bound.constraint.Const;
import wyopcl.translator.bound.constraint.Equals;
import wyopcl.translator.bound.constraint.GreaterThan;
import wyopcl.translator.bound.constraint.GreaterThanEquals;
import wyopcl.translator.bound.constraint.LeftMultiply;
import wyopcl.translator.bound.constraint.LeftPlus;
import wyopcl.translator.bound.constraint.LessThan;
import wyopcl.translator.bound.constraint.LessThanEquals;
import wyopcl.translator.bound.constraint.Negate;
import wyopcl.translator.bound.constraint.Plus;

public class ConstraintTestCase {

	@Before
	public void setUp() throws Exception {

	}

	@After
	public void tearDown() throws Exception {

	}

	/**
	 * Given D(x)=[-10..inf], propagate the lower bound of Domain D(X).
	 * 
	 * @see <a
	 *      href="http://sourceforge.net/p/czt/code/ci/master/tree/zlive/src/test
	 *      /java/net/sourceforge/czt/animation/eval/flatpred/BoundsTest.java#l35">
	 *      net.sourceforge.czt.animation.eval.flatpred.BoundsTest#testLower()</a>
	 */
	@Test
	public void testLower() {
		Bounds bnds = new Bounds();
		
		bnds.addDomain(new Domain("x", new BigInteger("-10"), null));
		// Add a lower bound
		assertNotNull(bnds.getDomain("x"));
		assertEquals(new BigInteger("-10"), bnds.getLower("x"));

		// Add a weak lower bound [-11... inf]
		bnds.addDomain(new Domain("x", new BigInteger("-11"), null));
		assertEquals(new BigInteger("-10"), bnds.getLower("x"));

		// Add a strong lower bound
		bnds.addDomain(new Domain("x", new BigInteger("-9"), null));
		assertEquals(new BigInteger("-9"), bnds.getLower("x"));

		// Add a positive and stronger lower bound
		bnds.addDomain(new Domain("x", new BigInteger("9"), null));
		assertEquals(new BigInteger("9"), bnds.getLower("x"));
		bnds = null;
	}

	/**
	 * Given D(x)=[null..10], propagate the upper bounds of Domain D(X).
	 * 
	 * @see <a
	 *      href="http://sourceforge.net/p/czt/code/ci/master/tree/zlive/src/test
	 *      /java/net/sourceforge/czt/animation/eval/flatpred/BoundsTest.java#l74">
	 *      net.sourceforge.czt.animation.eval.flatpred.BoundsTest#testUpper()</a>
	 */
	@Test
	public void testUpper() {
		Bounds bnds = new Bounds();
		// Add a upper bound
		bnds.addDomain(new Domain("x", null, new BigInteger("10")));
		//assertNotNull(bnds.getDomain("x"));
		assertEquals(new BigInteger("10"), bnds.getUpper("x"));

		// Add a weak upper bound
		bnds.addDomain(new Domain("x", null, new BigInteger("11")));
		assertEquals(new BigInteger("10"), bnds.getUpper("x"));

		// Add a strong upper bound
		bnds.addDomain(new Domain("x", null, new BigInteger("9")));
		assertEquals(new BigInteger("9"), bnds.getUpper("x"));

		// Add a negative and stronger lower bound
		bnds.addDomain(new Domain("x", null, new BigInteger("-9")));
		assertEquals(new BigInteger("-9"), bnds.getUpper("x"));
		bnds = null;
	}

	/**
	 * Given D(x)=[20..20], propagate the bounds for the constraint X = 20
	 * 
	 */
	@Test
	public void testConst() {		
		Bounds bnd = new Bounds();
		bnd.getDomain("x");
		
		Const constraint = new Const("x", new BigInteger("20"));
		constraint.inferBound(bnd);
		
		//assertTrue(blk.inferFixedPoint());
		assertEquals(new BigInteger("20"), bnd.getLower("x"));
		assertEquals(new BigInteger("20"), bnd.getUpper("x"));
	}

	/***
	 * Test the constraints: 'x < y' with 
	 * Input: D(x) = [-10..10] D(y) = [0 ... 5]
	 * Output: D1(x) = [-10..4] D1(y) = [0 ..5] 
	 */
	@Test
	public void testLessThan() {
		Bounds bnd = new Bounds();
		
		// D(x) = [-10..10]
		bnd.addDomain(new Domain("x", new BigInteger("-10"), new BigInteger("10")));
		// D(y) = [0 ... 5]
		bnd.addDomain(new Domain("y", new BigInteger("0"), new BigInteger("5")));
		
		// x<y
		LessThan constraint = new LessThan("x", "y");
		constraint.inferBound(bnd);
		
		
		// D1(X) is [-10 ... 4]
		assertEquals(new BigInteger("-10"), bnd.getLower("x"));
		assertEquals(new BigInteger("4"), bnd.getUpper("x"));
		
		// D1(Y) is [0..5]
		assertEquals(new BigInteger("0"), bnd.getLower("y"));
		assertEquals(new BigInteger("5"), bnd.getUpper("y"));
		
	}
	
	/***
	 * Test the constraints: 'x < y' with 
	 * Input: D(x) = [10..inf] D(y) = [5 ... 5]
	 * Output: D1(x) = [empty..empty] D1(y) = [empty ..empty] 
	 */
	@Test
	public void testLessThan_Empty() {
		Bounds bnd = new Bounds();
		
		// D(x) = [10..inf]
		bnd.addDomain(new Domain("x", new BigInteger("10"), null));
		// D(y) = [5 ... 5]
		bnd.addDomain(new Domain("y", new BigInteger("5"), new BigInteger("5")));
		
		// x < y
		LessThan constraint = new LessThan("x", "y");
		constraint.inferBound(bnd);
		
		
		// D1(X) is [empty ... empty]
		assertEquals(true, bnd.getDomain("x").isEmpty());
		assertEquals(null, bnd.getLower("x"));
		assertEquals(null, bnd.getUpper("x"));
		
		// D1(Y) is [empty..empty]
		assertEquals(true, bnd.getDomain("y").isEmpty());
		assertEquals(null, bnd.getLower("y"));
		assertEquals(null, bnd.getUpper("y"));
		
	}

	/***
	 * Test the constraints x <= y with
	 * Input: D(x) = [-10..10] and D(y) = [0 .. 5]
	 * Output: D1(x) = [-10 .. 5]  and D1(y) = [0 .. 5] 
	 */
	@Test
	public void testLessThanEquals() {
		Bounds bnd = new Bounds();
		
		// D(x) = [-10..10]
		bnd.addDomain(new Domain("x", new BigInteger("-10"), new BigInteger("10")));
		// D(y) = [0 ... 5]
		bnd.addDomain(new Domain("y", new BigInteger("0"), new BigInteger("5")));
		
		// x<y
		LessThanEquals constraint = new LessThanEquals("x", "y");
		constraint.inferBound(bnd);
		
		// D1(X) is [-10 ... 4]
		assertEquals(new BigInteger("-10"), bnd.getLower("x"));
		assertEquals(new BigInteger("5"), bnd.getUpper("x"));
		
		// D1(Y) is [0..5]
		assertEquals(new BigInteger("0"), bnd.getLower("y"));
		assertEquals(new BigInteger("5"), bnd.getUpper("y"));
	}
	

	/***
	 * Test the constraints x <= y with
	 * Input: D(x) = [10..inf] and D(y) = [5 .. 5]
	 * Output: D1(x) = [empty .. empty]  and D1(y) = [empty .. empty] 
	 */
	@Test
	public void testLessThanEquals_Empty() {
		Bounds bnd = new Bounds();
		
		// D(x) = [-10..10]
		bnd.addDomain(new Domain("x", new BigInteger("10"), null));
		// D(y) = [0 ... 5]
		bnd.addDomain(new Domain("y", new BigInteger("5"), new BigInteger("5")));
		
		// x<y
		LessThanEquals constraint = new LessThanEquals("x", "y");
		constraint.inferBound(bnd);
		
		// D1(X) is [empty ... empty]
		assertEquals(true, bnd.getDomain("x").isEmpty());
		assertEquals(null, bnd.getLower("x"));
		assertEquals(null, bnd.getUpper("x"));
		
		// D1(Y) is [empty .. empty]
		assertEquals(true, bnd.getDomain("y").isEmpty());
		assertEquals(null, bnd.getLower("y"));
		assertEquals(null, bnd.getUpper("y"));
	}
	
	
	/***
	 * 
	 * Test the bound of constraints x > y with 
	 * Input bound: D(x) = [-inf..0] and D(y) = [5 .. 5]   
	 * Output bound: D1(x) =[empty .. empty] and D1(y) = [empty .. empty]
	 * 
	 */
	@Test
	public void testGreatThan() {
		Bounds bnd = new Bounds();
		// D(x) = [-10..10]
		bnd.addDomain(new Domain("x", null,  new BigInteger("0")));
		// D(y) = [0..5]
		bnd.addDomain(new Domain("y", new BigInteger("5"),  new BigInteger("5")));
		// x > y
		GreaterThan constraint = new GreaterThan("x", "y");
		constraint.inferBound(bnd);
		
		// D1(x) is [empty ... empty]
		assertEquals(true, bnd.getDomain("x").isEmpty());
		assertEquals(null, bnd.getLower("x"));
		assertEquals(null, bnd.getUpper("x"));
		
		// D1(y) is [0 ... 5]
		assertEquals(true, bnd.getDomain("y").isEmpty());
		assertEquals(null, bnd.getLower("y"));
		assertEquals(null, bnd.getUpper("y"));
		
	}
	
	
	/***
	 * 
	 * Test the bound propagation of constraints x > y, with 
	 * Input bound: D(x) = [-inf..0] and D(y) = [5 .. 5]   
	 * Output bound: D1(x) =[empty .. empty] and D1(y) = [empty .. empty]
	 * 
	 */
	@Test
	public void testGreatThan_Empty() {
		Bounds bnd = new Bounds();
		// D(x) = [-10..10]
		bnd.addDomain(new Domain("x", null,  new BigInteger("0")));
		// D(y) = [0..5]
		bnd.addDomain(new Domain("y", new BigInteger("5"),  new BigInteger("5")));
		// x > y
		GreaterThan constraint = new GreaterThan("x", "y");
		constraint.inferBound(bnd);
		
		// D1(x) is [empty...empty]
		assertEquals(true, bnd.getDomain("x").isEmpty());
		assertEquals(null, bnd.getLower("x"));
		assertEquals(null, bnd.getUpper("x"));
		
		// D1(y) is [empty ... empty]
		assertEquals(true, bnd.getDomain("y").isEmpty());
		assertEquals(null, bnd.getLower("y"));
		assertEquals(null, bnd.getUpper("y"));
		
	}
	
	
	
	/***
	 * 
	 * Test the bound propagation of constraints x >= y, with 
	 * Input bound: D(x) = [-10..10] and D(y) = [0 .. 5]   
	 * Output bound: D1(x) =[0.. 10] and D1(y) = [0 .. 5]
	 * 
	 */
	@Test
	public void testGreatThanEquals() {
		Bounds bnd = new Bounds();
		// D(x) = [-10..10]
		bnd.addDomain(new Domain("x", new BigInteger("-10"),  new BigInteger("10")));
		// D(y) = [0..5]
		bnd.addDomain(new Domain("y", new BigInteger("0"),  new BigInteger("5")));
		// x >= y
		GreaterThanEquals constraint = new GreaterThanEquals("x", "y");
		constraint.inferBound(bnd);		
		
		// D1(X) is [0 .. 10]
		assertEquals(new BigInteger("0"), bnd.getLower("x"));
		assertEquals(new BigInteger("10"), bnd.getUpper("x"));
		
		
		// D1(y) is [0 ... 5]
		assertEquals(new BigInteger("0"), bnd.getLower("y"));
		assertEquals(new BigInteger("5"), bnd.getUpper("y"));

		
	}
	
	/***
	 * 
	 * Test the bound propagation of constraints x >= y, with 
	 * Input bound: D(x) = [-inf..0] and D(y) = [5 .. 5]   
	 * Output bound: D1(x) =[empty .. empty] and D1(y) = [empty .. empty]
	 * 
	 */
	@Test
	public void testGreatThanEquals_Empty() {
		Bounds bnd = new Bounds();
		// D(x) = [-inf .. 0]
		bnd.addDomain(new Domain("x", null,  new BigInteger("0")));
		// D(y) = [5 .. 5]
		bnd.addDomain(new Domain("y", new BigInteger("5"),  new BigInteger("5")));
		// x >= y
		GreaterThanEquals constraint = new GreaterThanEquals("x", "y");
		constraint.inferBound(bnd);		
		
		// D1(X) is [empty .. empty]
		assertEquals(true, bnd.getDomain("x").isEmpty());
		assertEquals(null, bnd.getLower("x"));
		assertEquals(null, bnd.getUpper("x"));
		
		
		// D1(y) is [5 ... 5]
		assertEquals(true, bnd.getDomain("y").isEmpty());
		assertEquals(null, bnd.getLower("y"));
		assertEquals(null, bnd.getUpper("y"));

		
	}
	
	
	/**
	 * Given D(x) =[-10..10] Test the constraints ( x == y ^ y == z)
	 * 
	 * @see <a
	 *      href="http://sourceforge.net/p/czt/code/ci/master/tree/zlive/src/test/java/net/sourceforge/czt/animation/eval/flatpred/BoundsTest.java#l226">
	 *      net.sourceforge.czt.animation.eval.flatpred.BoundsTest#testEquals()</a>
	 */
	@Test
	public void testEquals() {
		Bounds bnd = new Bounds();
		// D(x) = [-10..10]
		bnd.addDomain(new Domain("x", new BigInteger("-10"), new BigInteger("10")));
		// D(y) = [-inf..inf]
		bnd.addDomain(new Domain("y", null, null));
		// D(z) = [-inf..inf]
		bnd.addDomain(new Domain("z", null, null));
		
		Equals constraint = new Equals("x", "y");
		constraint.inferBound(bnd);
		
		Equals constraint1 = new Equals("y", "z");
		constraint1.inferBound(bnd);
		
		// D(y)' is [-10..10]
		assertEquals(new BigInteger("-10"), bnd.getLower("y"));
		assertEquals(new BigInteger("10"), bnd.getUpper("y"));
		
		// D(z)' is [-10..10]
		assertEquals(new BigInteger("-10"), bnd.getLower("z"));
		assertEquals(new BigInteger("10"), bnd.getUpper("z"));
	}
	
	/**
	 * Given D(x) =[-10..10] D(x) =[0..5] Test the constraints ( y := x)
	 * 
	 */
	@Test
	public void testAssign() {
		Bounds bnd = new Bounds();
		// D(x) = [-10..10]
		bnd.addDomain(new Domain("x", new BigInteger("-10"), new BigInteger("10")));
		// D(y) = [0..5]
		bnd.addDomain(new Domain("y", new BigInteger("0"), new BigInteger("5")));
		// D(z) = [1..1]
		bnd.addDomain(new Domain("z", new BigInteger("1"), new BigInteger("1")));
		
		// x:= y
		Assign constraint = new Assign("x", "y");
		constraint.inferBound(bnd);
		
		// D(Y) = 
		assertEquals(new BigInteger("0"), bnd.getLower("x"));
		assertEquals(new BigInteger("5"), bnd.getUpper("x"));
		
		// D(z)' is [-5..5]
		assertEquals(new BigInteger("0"), bnd.getLower("y"));
		assertEquals(new BigInteger("5"), bnd.getUpper("y"));
	}
		
	/**
	 * Given D(x) =[-5..-1] D(y)=[-10..10]
	 * 
	 *  the constraint 'y := !x'
	 * 
	 * @see <a
	 *      href="http://sourceforge.net/p/czt/code/ci/master/tree/zlive/src/test
	 *      /java/net/sourceforge/czt/animation/eval/flatpred/BoundsTest.java#l334">
	 *      net.sourceforge.czt.animation.eval.flatpred.BoundsTest#testNegateLeftLoose()</a>
	 */
	@Test
	public void testNegate() {
		
		Bounds bnd = new Bounds();
		// D(x) = [-5..-1]
		bnd.addDomain(new Domain("x", new BigInteger("-5"), new BigInteger("-1")));
		// D(y) = [-10..10]
		bnd.addDomain(new Domain("y", new BigInteger("-10"), new BigInteger("10")));
		
		// y:= !x
		Negate constraint = new Negate("x", "y");
		constraint.inferBound(bnd);
		
		// D(y)' is [1 .. 5]
		assertEquals(new BigInteger("1"), bnd.getLower("y"));
		assertEquals(new BigInteger("5"), bnd.getUpper("y"));
		
		// D(x)' NOT change
		assertEquals(new BigInteger("-5"), bnd.getLower("x"));
		assertEquals(new BigInteger("-1"), bnd.getUpper("x"));
		

	}
	
	
	
	/***
	 * Given D(x)=[-10..10] D(y)=[0..5] D(z)=[1..1] and the constraint
	 * X:=Y+Z
	 */
	@Test
	public void testLeftPlus() {
		Bounds bnd = new Bounds();
		// D(x)=[-10..10]
		bnd.addDomain(new Domain("x", new BigInteger("-10"), new BigInteger("10")));		
		// D(y)=[0..5]
		bnd.addDomain(new Domain("y", new BigInteger("0"), new BigInteger("5")));
		// D(z)=[1..1]
		bnd.addDomain(new Domain("z", new BigInteger("1"), new BigInteger("1")));
		// Add the constraint 'x:=y+z'
		LeftPlus constraint = new LeftPlus("y", "z", "x");
		constraint.inferBound(bnd);
		
		//D1(X) = [1..6]
		assertEquals(new BigInteger("1"), bnd.getLower("x"));
		assertEquals(new BigInteger("6"), bnd.getUpper("x"));

		//D1(Y) = [0..5]
		assertEquals(new BigInteger("0"), bnd.getLower("y"));
		assertEquals(new BigInteger("5"), bnd.getUpper("y"));
		
		//D1(Z) = [1..1]
		assertEquals(new BigInteger("1"), bnd.getLower("z"));
		assertEquals(new BigInteger("1"), bnd.getUpper("z"));

	}


	/**
	 * Given D(x)=[-10..10] D(y)=[0..5] D(z)=[1..1] 
	 * 
	 * Test the constraint z := x * y
	 * 
	 */
	@Test
	public void testLeftMultiply() {
		Bounds bnd = new Bounds();
		// D(x) = [-10..10]
		bnd.addDomain(new Domain("x", new BigInteger("-10"), new BigInteger("10")));
		// D(y) = [0..5]
		bnd.addDomain(new Domain("y", new BigInteger("0"), new BigInteger("5")));
		// D(z) = [1..1]
		bnd.addDomain(new Domain("z", new BigInteger("1"), new BigInteger("1")));
		// x := y*z
		LeftMultiply constraint = new LeftMultiply("y", "z", "x");
		constraint.inferBound(bnd);
		
		// D(x)' = [0..5] 
		assertEquals(new BigInteger("0"), bnd.getLower("x"));
		assertEquals(new BigInteger("5"), bnd.getUpper("x"));

		// D(y)' = [0..5] NOT changed
		assertEquals(new BigInteger("0"), bnd.getLower("y"));
		assertEquals(new BigInteger("5"), bnd.getUpper("y"));
		
		// D(z)' = [1..1]
		assertEquals(new BigInteger("1"), bnd.getLower("z"));
		assertEquals(new BigInteger("1"), bnd.getUpper("z"));
	}
	
	/**
	 * Given D(x)=[0..3] D(y)=[-2..2] D(z)=[4..8] 
	 * 
	 * Test the constraint z := x * y
	 * 
	 */
	@Test
	public void testLeftMultiply2() {
		Bounds bnd = new Bounds();
		// D(x) = [0..3]
		bnd.addDomain(new Domain("x", new BigInteger("0"), new BigInteger("3")));
		// D(y) = [-2..2]
		bnd.addDomain(new Domain("y", new BigInteger("-2"), new BigInteger("2")));
		// D(z) = [4..8]
		bnd.addDomain(new Domain("z", new BigInteger("4"), new BigInteger("8")));
		// z = x * y
		LeftMultiply constraint = new LeftMultiply("x", "y", "z");
		constraint.inferBound(bnd);
		
		// D(z)' = [-6..6]
		assertEquals(new BigInteger("-6"), bnd.getLower("z"));
		assertEquals(new BigInteger("6"), bnd.getUpper("z"));

		// D(x)' = [0..3] NOT changed 
		assertEquals(new BigInteger("0"), bnd.getLower("x"));
		assertEquals(new BigInteger("3"), bnd.getUpper("x"));
		
		// D(y)' = [-2..2] NOT changed
		assertEquals(new BigInteger("-2"), bnd.getLower("y"));
		assertEquals(new BigInteger("2"), bnd.getUpper("y"));
	}
	
	

}
