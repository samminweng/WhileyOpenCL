package wyopcl.testing.bound;

import static org.junit.Assert.*;

import java.math.BigInteger;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import wyopcl.bound.Bounds;
import wyopcl.bound.Domain;
import wyopcl.bound.constraint.Const;
import wyopcl.bound.constraint.ConstraintList;
import wyopcl.bound.constraint.Equals;
import wyopcl.bound.constraint.LeftPlus;
import wyopcl.bound.constraint.LessThan;
import wyopcl.bound.constraint.LessThanEquals;
import wyopcl.bound.constraint.Negate;
import wyopcl.bound.constraint.RightPlus;
import wyopcl.testing.interpreter.BaseTestUtil;

public class BoundTestCase {

	@Before
	public void setUp() throws Exception {

	}

	@After
	public void tearDown() throws Exception {

	}

	/**
	 * Given D(x)=[-10..null], propagate the lower bound of Domain D(X).
	 * 
	 * @see <a
	 *      href="http://sourceforge.net/p/czt/code/ci/master/tree/zlive/src/test
	 *      /java/net/sourceforge/czt/animation/eval/flatpred/BoundsTest.java#l35">
	 *      net.sourceforge.czt.animation.eval.flatpred.BoundsTest#testLower()</a>
	 */
	@Test
	public void testLower() {
		Bounds bnds = new Bounds();
		// Add a lower bound
		bnds.addLowerBound("x", new BigInteger("-10"));
		assertNotNull(bnds.getDomain("x"));
		assertEquals(new BigInteger("-10"), bnds.getLower("x"));

		// Add a weak lower bound
		bnds.addLowerBound("x", new BigInteger("-11"));
		assertEquals(new BigInteger("-10"), bnds.getLower("x"));

		// Add a strong lower bound
		bnds.addLowerBound("x", new BigInteger("-9"));
		assertEquals(new BigInteger("-9"), bnds.getLower("x"));

		// Add a positive and stronger lower bound
		bnds.addLowerBound("x", new BigInteger("9"));
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
		bnds.addUpperBound("x", new BigInteger("10"));
		assertNotNull(bnds.getDomain("x"));
		assertEquals(new BigInteger("10"), bnds.getUpper("x"));

		// Add a weak upper bound
		bnds.addUpperBound("x", new BigInteger("11"));
		assertEquals(new BigInteger("10"), bnds.getUpper("x"));

		// Add a strong upper bound
		bnds.addUpperBound("x", new BigInteger("9"));
		assertEquals(new BigInteger("9"), bnds.getUpper("x"));

		// Add a negative and stronger lower bound
		bnds.addUpperBound("x", new BigInteger("-9"));
		assertEquals(new BigInteger("-9"), bnds.getUpper("x"));
		bnds = null;
	}

	/**
	 * Given D(x)=[20..20], propagate the bounds for the constraint X = 20
	 * 
	 * @see <a
	 *      href="http://sourceforge.net/p/czt/code/ci/master/tree/zlive/src/test
	 *      /java/net/sourceforge/czt/animation/eval/flatpred/BoundsTest.java#l113">
	 *      net.sourceforge.czt.animation.eval.flatpred.BoundsTest#testConst()</a>
	 */
	@Test
	public void testConst() {
		ConstraintList list = new ConstraintList();
		Bounds bnds = new Bounds();
		list.addConstraint(new Const("x", new BigInteger("20")));
		assertTrue(list.checkBoundConsistency(bnds));
		assertEquals(new BigInteger("20"), bnds.getLower("x"));
		assertEquals(new BigInteger("20"), bnds.getUpper("x"));
	}

	/***
	 * Given D(x) = [-10..10] Test the constraints: x < y ^ y < z
	 * @see <a
	 *      href="http://sourceforge.net/p/czt/code/ci/master/tree/zlive/src/test
	 *      /java/net/sourceforge/czt/animation/eval/flatpred/BoundsTest.java#l142">
	 *      net.sourceforge.czt.animation.eval.flatpred.BoundsTest#testLessThanLeft()</a>
	 */
	@Test
	public void testLessThanLeft() {
		Bounds bnd = new Bounds();
		// D(x) = [-10..10]
		bnd.addLowerBound("x", new BigInteger("-10"));
		bnd.addUpperBound("x", new BigInteger("10"));
		ConstraintList list = new ConstraintList();
		// x<=y
		list.addConstraint(new LessThan("x", "y"));
		// y<=z
		list.addConstraint(new LessThan("y", "z"));
		assertTrue(list.checkBoundConsistency(bnd));
		// Propagate the lower bound from x to y
		assertEquals(new BigInteger("-9"), bnd.getLower("y"));
		// The upper bound remain the same.
		assertNull(bnd.getUpper("y"));
		// Then propagate the lower bound to z.
		assertEquals(new BigInteger("-8"), bnd.getLower("z"));
		// The upper bound remain the same.
		assertNull(bnd.getUpper("y"));

		// Check if the bounds of x have not changed.
		assertEquals(new BigInteger("-10"), bnd.getLower("x"));
		assertEquals(new BigInteger("10"), bnd.getUpper("x"));

		bnd = null;
	}
	
	/***
	 * Given D(z) = [-10..10] Test the constraints: x < y ^ y < z
	 * @see <a
	 *      href="http://sourceforge.net/p/czt/code/ci/master/tree/zlive/src/test
	 *      /java/net/sourceforge/czt/animation/eval/flatpred/BoundsTest.java#l163">
	 *      net.sourceforge.czt.animation.eval.flatpred.BoundsTest#testLessThanRight()</a>
	 */
	@Test
	public void testLessThanRight() {
		Bounds bnd = new Bounds();
		// D(z) = [-10..10]
		bnd.addLowerBound("z", new BigInteger("-10"));
		bnd.addUpperBound("z", new BigInteger("10"));
		ConstraintList list = new ConstraintList();
		// x<=y
		list.addConstraint(new LessThan("x", "y"));
		// y<=z
		list.addConstraint(new LessThan("y", "z"));
		assertTrue(list.checkBoundConsistency(bnd));
		// Propagate the upper bound from z to y
		assertNull(bnd.getLower("y"));
		assertEquals(new BigInteger("9"), bnd.getUpper("y"));
	
		// Then propagate the lower bound to z to x
		assertNull(bnd.getLower("x"));
		assertEquals(new BigInteger("8"), bnd.getUpper("x"));

		// Check if the bounds of x have not changed.
		assertEquals(new BigInteger("-10"), bnd.getLower("z"));
		assertEquals(new BigInteger("10"), bnd.getUpper("z"));

		bnd = null;
	}

	/***
	 * Given D(x) = [-10..10] and constraints x <= y ^ y <= z, propagate the lower bounds from x to y and z.
	 * @see <a
	 *      href="http://sourceforge.net/p/czt/code/ci/master/tree/zlive/src/test
	 *      /java/net/sourceforge/czt/animation/eval/flatpred/BoundsTest.java#l184">
	 *      net.sourceforge.czt.animation.eval.flatpred.BoundsTest#testLessThanEqualsLeft()</a>  
	 */
	@Test
	public void testLessThanEqualsLeft() {
		ConstraintList list = new ConstraintList();
		Bounds bnd = new Bounds();
		// D(x) = [-10..10]
		bnd.addLowerBound("x", new BigInteger("-10"));
		bnd.addUpperBound("x", new BigInteger("10"));

		// x<=y
		list.addConstraint(new LessThanEquals("x", "y"));
		// y<=z
		list.addConstraint(new LessThanEquals("y", "z"));
		assertTrue(list.checkBoundConsistency(bnd));
		// Propagate the lower bound from x to y
		assertEquals(new BigInteger("-10"), bnd.getLower("y"));
		// The upper bound remain the same.
		assertNull(bnd.getUpper("y"));
		// Then propagate the lower bound to z.
		assertEquals(new BigInteger("-10"), bnd.getLower("z"));
		// The upper bound remain the same.
		assertNull(bnd.getUpper("y"));

		// Check if the bounds of x have not changed.
		assertEquals(new BigInteger("-10"), bnd.getLower("x"));
		assertEquals(new BigInteger("10"), bnd.getUpper("x"));
	}

	/***
	 * Given D(z) = [-10..10] and constraints x <= y ^ y <= z, propagate the upper bounds from z to y and x.
	 * @see <a
	 *      href="http://sourceforge.net/p/czt/code/ci/master/tree/zlive/src/test
	 *      /java/net/sourceforge/czt/animation/eval/flatpred/BoundsTest.java#l205">
	 *      net.sourceforge.czt.animation.eval.flatpred.BoundsTest#testLessThanEqualsRight()</a> 
	 */
	@Test
	public void testLessThanEqualsRight() {
		ConstraintList list = new ConstraintList();
		Bounds bnd = new Bounds();
		// D(z) = [-10..10]
		bnd.addLowerBound("z", new BigInteger("-10"));
		bnd.addUpperBound("z", new BigInteger("10"));

		// x<=y
		list.addConstraint(new LessThanEquals("x", "y"));
		// y<=z
		list.addConstraint(new LessThanEquals("y", "z"));
		assertTrue(list.checkBoundConsistency(bnd));
		// Propagate the lower bound from x to y
		assertEquals(new BigInteger("10"), bnd.getUpper("y"));
		// The upper bound remain the same.
		assertNull(bnd.getLower("y"));
		// Then propagate the lower bound to z.
		assertEquals(new BigInteger("10"), bnd.getUpper("x"));
		// The upper bound remain the same.
		assertNull(bnd.getLower("x"));

		// Check if the bounds of z have not changed.
		assertEquals(new BigInteger("-10"), bnd.getLower("z"));
		assertEquals(new BigInteger("10"), bnd.getUpper("z"));
	}

	/**
	 * Given D(x) =[-10..10] Test the constraints ( x == y ^ y == z)
	 * 
	 * @see <a
	 *      href="http://sourceforge.net/p/czt/code/ci/master/tree/zlive/src/test
	 *      /java/net/sourceforge/czt/animation/eval/flatpred/BoundsTest.java#l226">
	 *      net.sourceforge.czt.animation.eval.flatpred.BoundsTest#testEquals()</a>
	 */
	@Test
	public void testEquals() {
		ConstraintList list = new ConstraintList();
		Bounds bnd = new Bounds();
		// D(x) = [-10..10]
		bnd.addLowerBound("x", new BigInteger("-10"));
		bnd.addUpperBound("x", new BigInteger("10"));

		list.addConstraint(new Equals("x", "y"));
		list.addConstraint(new Equals("y", "z"));
		assertTrue(list.checkBoundConsistency(bnd));
		assertEquals(new BigInteger("-10"), bnd.getLower("y"));
		assertEquals(new BigInteger("10"), bnd.getUpper("y"));
		assertEquals(new BigInteger("-10"), bnd.getLower("z"));
		assertEquals(new BigInteger("10"), bnd.getUpper("z"));

		// Add the stronger bounds on z [0..5]
		bnd.addLowerBound("z", new BigInteger("0"));
		bnd.addUpperBound("z", new BigInteger("5"));

		assertTrue(list.checkBoundConsistency(bnd));
		assertEquals(new BigInteger("0"), bnd.getLower("x"));
		assertEquals(new BigInteger("5"), bnd.getUpper("x"));
		assertEquals(new BigInteger("0"), bnd.getLower("y"));
		assertEquals(new BigInteger("5"), bnd.getUpper("y"));
		assertEquals(new BigInteger("0"), bnd.getLower("z"));
		assertEquals(new BigInteger("5"), bnd.getUpper("z"));

		bnd = null;
	}
	
	/**
	 * Given D(x) =[1..5] Test the constraints '!x = y'
	 * 
	 * @see <a
	 *      href="http://sourceforge.net/p/czt/code/ci/master/tree/zlive/src/test
	 *      /java/net/sourceforge/czt/animation/eval/flatpred/BoundsTest.java#l258">
	 *      net.sourceforge.czt.animation.eval.flatpred.BoundsTest#testNegateRightNone()</a>
	 */
	@Test
	public void testNegateRightNone() {
		
		Bounds bnd = new Bounds();
		// D(x) = [1..5]
		bnd.addLowerBound("x", new BigInteger("1"));
		bnd.addUpperBound("x", new BigInteger("5"));
		
		ConstraintList list = new ConstraintList();
		list.addConstraint(new Negate("x", "y"));
		assertTrue(list.checkBoundConsistency(bnd));
		assertEquals(new BigInteger("1"), bnd.getLower("x"));
		assertEquals(new BigInteger("5"), bnd.getUpper("x"));
		assertEquals(new BigInteger("-5"), bnd.getLower("y"));
		assertEquals(new BigInteger("-1"), bnd.getUpper("y"));

		bnd = null;
	}

	/**
	 * Given D(x) =[1..5] D(y)=[-10..10], propagate the bounds for the constraint '!x = y'
	 * 
	 * @see <a
	 *      href="http://sourceforge.net/p/czt/code/ci/master/tree/zlive/src/test
	 *      /java/net/sourceforge/czt/animation/eval/flatpred/BoundsTest.java#l276">
	 *      net.sourceforge.czt.animation.eval.flatpred.BoundsTest#testNegateRightLoose()</a>
	 */
	@Test
	public void testNegateRightLoose() {
		
		Bounds bnd = new Bounds();
		// D(x) = [1..5]
		bnd.addLowerBound("x", new BigInteger("1"));
		bnd.addUpperBound("x", new BigInteger("5"));
		// D(y) = [-10..10]
		bnd.addLowerBound("y", new BigInteger("-10"));
		bnd.addUpperBound("y", new BigInteger("10"));
		
		ConstraintList list = new ConstraintList();
		list.addConstraint(new Negate("x", "y"));
		assertTrue(list.checkBoundConsistency(bnd));
		assertEquals(new BigInteger("1"), bnd.getLower("x"));
		assertEquals(new BigInteger("5"), bnd.getUpper("x"));
		assertEquals(new BigInteger("-5"), bnd.getLower("y"));
		assertEquals(new BigInteger("-1"), bnd.getUpper("y"));

		bnd = null;
	}
	
	/**
	 * Given D(x) =[1..5] D(y)=[-4..-2], propagate the bounds for the constraint '!x = y'
	 * 
	 * @see <a
	 *      href="http://sourceforge.net/p/czt/code/ci/master/tree/zlive/src/test
	 *      /java/net/sourceforge/czt/animation/eval/flatpred/BoundsTest.java#l276">
	 *      net.sourceforge.czt.animation.eval.flatpred.BoundsTest#testNegateRightTight()</a>
	 */
	@Test
	public void testNegateRightTight() {
		
		Bounds bnd = new Bounds();
		// D(x) = [1..5]
		bnd.addLowerBound("x", new BigInteger("1"));
		bnd.addUpperBound("x", new BigInteger("5"));
		// D(y) = [-10..10]
		bnd.addLowerBound("y", new BigInteger("-4"));
		bnd.addUpperBound("y", new BigInteger("-2"));
		
		ConstraintList list = new ConstraintList();
		list.addConstraint(new Negate("x", "y"));
		assertTrue(list.checkBoundConsistency(bnd));
		assertEquals(new BigInteger("2"), bnd.getLower("x"));
		assertEquals(new BigInteger("4"), bnd.getUpper("x"));
		assertEquals(new BigInteger("-4"), bnd.getLower("y"));
		assertEquals(new BigInteger("-2"), bnd.getUpper("y"));

		bnd = null;
	}
	
	/**
	 * Given D(x) =[-5..-1] D(y)=[-10..10], propagate the bounds for the constraint '!x = y'
	 * 
	 * @see <a
	 *      href="http://sourceforge.net/p/czt/code/ci/master/tree/zlive/src/test
	 *      /java/net/sourceforge/czt/animation/eval/flatpred/BoundsTest.java#l334">
	 *      net.sourceforge.czt.animation.eval.flatpred.BoundsTest#testNegateLeftLoose()</a>
	 */
	@Test
	public void testNegateLeftLoose() {
		
		Bounds bnd = new Bounds();
		// D(x) = [1..5]
		bnd.addLowerBound("x", new BigInteger("-5"));
		bnd.addUpperBound("x", new BigInteger("-1"));
		// D(y) = [-10..10]
		bnd.addLowerBound("y", new BigInteger("-10"));
		bnd.addUpperBound("y", new BigInteger("10"));
		
		ConstraintList list = new ConstraintList();
		list.addConstraint(new Negate("x", "y"));
		assertTrue(list.checkBoundConsistency(bnd));
		assertEquals(new BigInteger("-5"), bnd.getLower("x"));
		assertEquals(new BigInteger("-1"), bnd.getUpper("x"));
		assertEquals(new BigInteger("1"), bnd.getLower("y"));
		assertEquals(new BigInteger("5"), bnd.getUpper("y"));

		bnd = null;
	}
	
	/**
	 * Given D(x) =[-4..-2] D(y)=[1..5], propagate the bounds for the constraint '!x = y'
	 * 
	 * @see <a
	 *      href="http://sourceforge.net/p/czt/code/ci/master/tree/zlive/src/test
	 *      /java/net/sourceforge/czt/animation/eval/flatpred/BoundsTest.java#l334">
	 *      net.sourceforge.czt.animation.eval.flatpred.BoundsTest#testNegateLeftLoose()</a>
	 */
	@Test
	public void testNegateLeftTight() {
		
		Bounds bnd = new Bounds();
		// D(x) = [1..5]
		bnd.addLowerBound("x", new BigInteger("-4"));
		bnd.addUpperBound("x", new BigInteger("-2"));
		// D(y) = [-10..10]
		bnd.addLowerBound("y", new BigInteger("1"));
		bnd.addUpperBound("y", new BigInteger("5"));
		
		ConstraintList list = new ConstraintList();
		list.addConstraint(new Negate("x", "y"));
		assertTrue(list.checkBoundConsistency(bnd));
		assertEquals(new BigInteger("-4"), bnd.getLower("x"));
		assertEquals(new BigInteger("-2"), bnd.getUpper("x"));
		assertEquals(new BigInteger("2"), bnd.getLower("y"));
		assertEquals(new BigInteger("4"), bnd.getUpper("y"));

		bnd = null;
	}
	
	/***
	 * Given D(x)=[0..5] D(y)=[3..4] D(z)=[-10..10] and the constraint X+Y=Z,
	 * propagate bounds among x, y and z.
	 * 
	 * @see <a
	 *      href="http://sourceforge.net/p/czt/code/ci/master/tree/zlive/src/test
	 *      /java/net/sourceforge/czt/animation/eval/flatpred/BoundsTest.java#l372">
	 *      net.sourceforge.czt.animation.eval.flatpred.BoundsTest#testPlusRight</a>
	 */
	@Test
	public void testLeftPlus() {
		ConstraintList list = new ConstraintList();
		Bounds bnds = new Bounds();
		// D(x)=[0..5]
		bnds.addLowerBound("x", new BigInteger("0"));
		bnds.addUpperBound("x", new BigInteger("5"));
		// D(y)=[3..4]
		bnds.addLowerBound("y", new BigInteger("3"));
		bnds.addUpperBound("y", new BigInteger("4"));
		// D(z)=[-10..10]
		bnds.addLowerBound("z", new BigInteger("-10"));
		bnds.addUpperBound("z", new BigInteger("10"));
		// x+y = z
		list.addConstraint(new LeftPlus("x", "y", "z"));
		assertTrue(list.checkBoundConsistency(bnds));
		assertEquals(new BigInteger("0"), bnds.getLower("x"));
		assertEquals(new BigInteger("5"), bnds.getUpper("x"));

		assertEquals(new BigInteger("3"), bnds.getLower("y"));
		assertEquals(new BigInteger("4"), bnds.getUpper("y"));

		assertEquals(new BigInteger("3"), bnds.getLower("z"));
		assertEquals(new BigInteger("9"), bnds.getUpper("z"));

		bnds = null;
	}

	/**
	 * Given D(x)=[0..10] D(y)=[2..3] D(z)=[7..8] Test the equality X+Y=Z
	 * 
	 * @see <a href="http://sourceforge.net/p/czt/code/ci/master/tree/zlive/src/test/java/net/sourceforge/
	 * czt/animation/eval/flatpred/BoundsTest.java#l394 ">net.sourceforge.czt.animation.eval.flatpred.BoundsTest#testPlusLeft()</a>
	 */
	@Test
	public void testLeftPlus2() {
		ConstraintList list = new ConstraintList();
		Bounds bnds = new Bounds();
		// D(x) = [0..10]
		bnds.addLowerBound("x", new BigInteger("0"));
		bnds.addUpperBound("x", new BigInteger("10"));
		// D(y) = [2..3]
		bnds.addLowerBound("y", new BigInteger("2"));
		bnds.addUpperBound("y", new BigInteger("3"));
		// D(z) = [7..8]
		bnds.addLowerBound("z", new BigInteger("7"));
		bnds.addUpperBound("z", new BigInteger("8"));
		// x+y=z
		list.addConstraint(new LeftPlus("x", "y", "z"));
		assertTrue(list.checkBoundConsistency(bnds));
		assertEquals(new BigInteger("4"), bnds.getLower("x"));
		assertEquals(new BigInteger("6"), bnds.getUpper("x"));

		assertEquals(new BigInteger("2"), bnds.getLower("y"));
		assertEquals(new BigInteger("3"), bnds.getUpper("y"));

		assertEquals(new BigInteger("7"), bnds.getLower("z"));
		assertEquals(new BigInteger("8"), bnds.getUpper("z"));

		bnds = null;
	}

	/**
	 * Given D(x)=[4..8] D(y)=[0..3] D(z)=[2..2] Test the equality X=Y+Z
	 * 
	 * @see Figure3.11
	 */
	@Test
	public void testRightPlus() {
		ConstraintList list = new ConstraintList();
		Bounds bnds = new Bounds();
		// D(x) = [4..8]
		bnds.addLowerBound("x", new BigInteger("4"));
		bnds.addUpperBound("x", new BigInteger("8"));
		// D(y) = [0..3]
		bnds.addLowerBound("y", new BigInteger("0"));
		bnds.addUpperBound("y", new BigInteger("3"));
		// D(z) = [2..2]
		bnds.addLowerBound("z", new BigInteger("2"));
		bnds.addUpperBound("z", new BigInteger("2"));
		// x = y+z
		list.addConstraint(new RightPlus("x", "y", "z"));
		assertTrue(list.checkBoundConsistency(bnds));
		assertEquals(new BigInteger("4"), bnds.getLower("x"));
		assertEquals(new BigInteger("5"), bnds.getUpper("x"));

		assertEquals(new BigInteger("2"), bnds.getLower("y"));
		assertEquals(new BigInteger("3"), bnds.getUpper("y"));

		assertEquals(new BigInteger("2"), bnds.getLower("z"));
		assertEquals(new BigInteger("2"), bnds.getUpper("z"));

		bnds = null;
	}

}
