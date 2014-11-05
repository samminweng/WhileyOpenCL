package wyopcl.testing.bound;

import static org.junit.Assert.*;

import java.math.BigInteger;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import wyopcl.bound.BasicBlock;
import wyopcl.bound.BasicBlock.BlockType;
import wyopcl.bound.Bounds;
//import wyopcl.bound.ConstraintList;
import wyopcl.bound.Domain;
import wyopcl.bound.constraint.Const;
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
		BasicBlock blk = new BasicBlock("code", BlockType.BLOCK);
		blk.addConstraint(new Const("x", new BigInteger("20")));		
		assertTrue(blk.inferFixedPoint());
		assertEquals(new BigInteger("20"), blk.getBounds().getLower("x"));
		assertEquals(new BigInteger("20"), blk.getBounds().getUpper("x"));
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
		BasicBlock blk = new BasicBlock("code", BlockType.BLOCK);
		// D(x) = [-10..10]
		blk.addBounds("x", new BigInteger("-10"), new BigInteger("10"));
		// x<=y
		blk.addConstraint(new LessThan("x", "y"));
		// y<=z
		blk.addConstraint(new LessThan("y", "z"));
		assertTrue(blk.inferFixedPoint());
		// Propagate the lower bound from x to y
		assertEquals(new BigInteger("-9"), blk.getLower("y"));
		// The upper bound remain the same.
		assertNull(blk.getUpper("y"));
		// Then propagate the lower bound to z.
		assertEquals(new BigInteger("-8"), blk.getLower("z"));
		// The upper bound remain the same.
		assertNull(blk.getUpper("y"));

		// Check if the bounds of x have not changed.
		assertEquals(new BigInteger("-10"), blk.getLower("x"));
		assertEquals(new BigInteger("10"), blk.getUpper("x"));

		
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
		BasicBlock blk = new BasicBlock("code", BlockType.BLOCK);
		// D(z) = [-10..10]
		blk.addBounds("z",  new BigInteger("-10"), new BigInteger("10"));
		
		// x<=y
		blk.addConstraint(new LessThan("x", "y"));
		// y<=z
		blk.addConstraint(new LessThan("y", "z"));
		
		assertTrue(blk.inferFixedPoint());
		// Propagate the upper bound from z to y
		assertNull(blk.getLower("y"));
		assertEquals(new BigInteger("9"), blk.getUpper("y"));
	
		// Then propagate the lower bound to z to x
		assertNull(blk.getLower("x"));
		assertEquals(new BigInteger("8"), blk.getUpper("x"));

		// Check if the bounds of x have not changed.
		assertEquals(new BigInteger("-10"), blk.getLower("z"));
		assertEquals(new BigInteger("10"), blk.getUpper("z"));
		
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
		BasicBlock blk = new BasicBlock("code", BlockType.BLOCK);
		// D(x) = [-10..10]
		blk.addBounds("x", new BigInteger("-10"),  new BigInteger("10"));
		// x<=y
		blk.addConstraint(new LessThanEquals("x", "y"));
		// y<=z
		blk.addConstraint(new LessThanEquals("y", "z"));
		assertTrue(blk.inferFixedPoint());
		// Propagate the lower bound from x to y
		assertEquals(new BigInteger("-10"), blk.getLower("y"));
		// The upper bound remain the same.
		assertNull(blk.getUpper("y"));
		// Then propagate the lower bound to z.
		assertEquals(new BigInteger("-10"), blk.getLower("z"));
		// The upper bound remain the same.
		assertNull(blk.getUpper("y"));

		// Check if the bounds of x have not changed.
		assertEquals(new BigInteger("-10"), blk.getLower("x"));
		assertEquals(new BigInteger("10"), blk.getUpper("x"));
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
		BasicBlock blk = new BasicBlock("code", BlockType.BLOCK);
		// D(z) = [-10..10]
		blk.addBounds("z", new BigInteger("-10"), new BigInteger("10"));

		// x<=y
		blk.addConstraint(new LessThanEquals("x", "y"));
		// y<=z
		blk.addConstraint(new LessThanEquals("y", "z"));
		assertTrue(blk.inferFixedPoint());
		// Propagate the lower bound from x to y
		assertEquals(new BigInteger("10"), blk.getUpper("y"));
		// The upper bound remain the same.
		assertNull(blk.getLower("y"));
		// Then propagate the lower bound to z.
		assertEquals(new BigInteger("10"), blk.getUpper("x"));
		// The upper bound remain the same.
		assertNull(blk.getLower("x"));

		// Check if the bounds of z have not changed.
		assertEquals(new BigInteger("-10"), blk.getLower("z"));
		assertEquals(new BigInteger("10"), blk.getUpper("z"));
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
		BasicBlock blk = new BasicBlock("code", BlockType.BLOCK);
		// D(x) = [-10..10]
		blk.addBounds("x", new BigInteger("-10"), new BigInteger("10"));

		blk.addConstraint(new Equals("x", "y"));
		blk.addConstraint(new Equals("y", "z"));
		assertTrue(blk.inferFixedPoint());
		assertEquals(new BigInteger("-10"), blk.getLower("y"));
		assertEquals(new BigInteger("10"), blk.getUpper("y"));
		assertEquals(new BigInteger("-10"), blk.getLower("z"));
		assertEquals(new BigInteger("10"), blk.getUpper("z"));

		// Add the stronger bounds on z [0..5]
		blk.addBounds("z", new BigInteger("0"), new BigInteger("5"));

		assertTrue(blk.inferFixedPoint());
		assertEquals(new BigInteger("0"), blk.getLower("x"));
		assertEquals(new BigInteger("5"), blk.getUpper("x"));
		assertEquals(new BigInteger("0"), blk.getLower("y"));
		assertEquals(new BigInteger("5"), blk.getUpper("y"));
		assertEquals(new BigInteger("0"), blk.getLower("z"));
		assertEquals(new BigInteger("5"), blk.getUpper("z"));
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
		
		BasicBlock blk = new BasicBlock("code", BlockType.BLOCK);
		// D(x) = [1..5]
		blk.addBounds("x", new BigInteger("1"), new BigInteger("5"));

		blk.addConstraint(new Negate("x", "y"));
		assertTrue(blk.inferFixedPoint());
		assertEquals(new BigInteger("1"), blk.getLower("x"));
		assertEquals(new BigInteger("5"), blk.getUpper("x"));
		assertEquals(new BigInteger("-5"), blk.getLower("y"));
		assertEquals(new BigInteger("-1"), blk.getUpper("y"));

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
		BasicBlock blk = new BasicBlock("code", BlockType.BLOCK);		
		// D(x) = [1..5]
		blk.addBounds("x", new BigInteger("1"), new BigInteger("5"));
		// D(y) = [-10..10]
		blk.addBounds("y", new BigInteger("-10"), new BigInteger("10"));
		
		blk.addConstraint(new Negate("x", "y"));
		assertTrue(blk.inferFixedPoint());
		assertEquals(new BigInteger("1"), blk.getLower("x"));
		assertEquals(new BigInteger("5"), blk.getUpper("x"));
		assertEquals(new BigInteger("-5"), blk.getLower("y"));
		assertEquals(new BigInteger("-1"), blk.getUpper("y"));

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
		
		BasicBlock blk = new BasicBlock("code", BlockType.BLOCK);
		// D(x) = [1..5]
		blk.addBounds("x", new BigInteger("1"), new BigInteger("5"));
		// D(y) = [-4..-2]
		blk.addBounds("y", new BigInteger("-4"),  new BigInteger("-2"));
		
		blk.addConstraint(new Negate("x", "y"));
		assertTrue(blk.inferFixedPoint());
		assertEquals(new BigInteger("2"), blk.getLower("x"));
		assertEquals(new BigInteger("4"), blk.getUpper("x"));
		assertEquals(new BigInteger("-4"), blk.getLower("y"));
		assertEquals(new BigInteger("-2"), blk.getUpper("y"));
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
		
		BasicBlock blk = new BasicBlock("code", BlockType.BLOCK);
		// D(x) = [1..5]
		blk.addBounds("x", new BigInteger("-5"), new BigInteger("-1"));
		// D(y) = [-10..10]
		blk.addBounds("y", new BigInteger("-10"), new BigInteger("10"));
		
		blk.addConstraint(new Negate("x", "y"));
		assertTrue(blk.inferFixedPoint());
		assertEquals(new BigInteger("-5"), blk.getLower("x"));
		assertEquals(new BigInteger("-1"), blk.getUpper("x"));
		assertEquals(new BigInteger("1"), blk.getLower("y"));
		assertEquals(new BigInteger("5"), blk.getUpper("y"));

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
		
		BasicBlock blk = new BasicBlock("code", BlockType.BLOCK);
		// D(x) = [1..5]
		blk.addBounds("x", new BigInteger("-4"), new BigInteger("-2"));
		// D(y) = [-10..10]
		blk.addBounds("y", new BigInteger("1"), new BigInteger("5"));
		
		blk.addConstraint(new Negate("x", "y"));
		assertTrue(blk.inferFixedPoint());
		assertEquals(new BigInteger("-4"), blk.getLower("x"));
		assertEquals(new BigInteger("-2"), blk.getUpper("x"));
		assertEquals(new BigInteger("2"), blk.getLower("y"));
		assertEquals(new BigInteger("4"), blk.getUpper("y"));

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
		BasicBlock blk = new BasicBlock("code", BlockType.BLOCK);		
		// D(x)=[0..5]
		blk.addBounds("x", new BigInteger("0"), new BigInteger("5"));		
		// D(y)=[3..4]
		blk.addBounds("y", new BigInteger("3"), new BigInteger("4"));
		// D(z)=[-10..10]
		blk.addBounds("z", new BigInteger("-10"), new BigInteger("10"));
		// x+y = z
		blk.addConstraint(new LeftPlus("x", "y", "z"));
		assertTrue(blk.inferFixedPoint());
		assertEquals(new BigInteger("0"), blk.getLower("x"));
		assertEquals(new BigInteger("5"), blk.getUpper("x"));

		assertEquals(new BigInteger("3"), blk.getLower("y"));
		assertEquals(new BigInteger("4"), blk.getUpper("y"));

		assertEquals(new BigInteger("3"), blk.getLower("z"));
		assertEquals(new BigInteger("9"), blk.getUpper("z"));

	}

	/**
	 * Given D(x)=[0..10] D(y)=[2..3] D(z)=[7..8] Test the equality X+Y=Z
	 * 
	 * @see <a href="http://sourceforge.net/p/czt/code/ci/master/tree/zlive/src/test/java/net/sourceforge/
	 * czt/animation/eval/flatpred/BoundsTest.java#l394 ">net.sourceforge.czt.animation.eval.flatpred.BoundsTest#testPlusLeft()</a>
	 */
	@Test
	public void testLeftPlus2() {
		BasicBlock blk = new BasicBlock("code", BlockType.BLOCK);
		// D(x) = [0..10]
		blk.addBounds("x", new BigInteger("0"), new BigInteger("10"));
		
		// D(y) = [2..3]
		blk.addBounds("y", new BigInteger("2"), new BigInteger("3"));

		// D(z) = [7..8]
		blk.addBounds("z", new BigInteger("7"), new BigInteger("8"));
		// x+y=z
		blk.addConstraint(new LeftPlus("x", "y", "z"));
		assertTrue(blk.inferFixedPoint());
		assertEquals(new BigInteger("4"), blk.getLower("x"));
		assertEquals(new BigInteger("6"), blk.getUpper("x"));

		assertEquals(new BigInteger("2"), blk.getLower("y"));
		assertEquals(new BigInteger("3"), blk.getUpper("y"));

		assertEquals(new BigInteger("7"), blk.getLower("z"));
		assertEquals(new BigInteger("8"), blk.getUpper("z"));

	}

	/**
	 * Given D(x)=[4..8] D(y)=[0..3] D(z)=[2..2] Test the equality X=Y+Z
	 * 
	 * @see Figure3.11
	 */
	@Test
	public void testRightPlus() {
		BasicBlock blk = new BasicBlock("code", BlockType.BLOCK);
		// D(x) = [4..8]
		blk.addBounds("x", new BigInteger("4"), new BigInteger("8"));
		// D(y) = [0..3]
		blk.addBounds("y", new BigInteger("0"), new BigInteger("3"));
		// D(z) = [2..2]
		blk.addBounds("z", new BigInteger("2"), new BigInteger("2"));
		// x = y+z
		blk.addConstraint(new RightPlus("x", "y", "z"));
		assertTrue(blk.inferFixedPoint());
		assertEquals(new BigInteger("4"), blk.getLower("x"));
		assertEquals(new BigInteger("5"), blk.getUpper("x"));

		assertEquals(new BigInteger("2"), blk.getLower("y"));
		assertEquals(new BigInteger("3"), blk.getUpper("y"));

		assertEquals(new BigInteger("2"), blk.getLower("z"));
		assertEquals(new BigInteger("2"), blk.getUpper("z"));

	}

}
