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
import wyopcl.translator.bound.constraint.Const;
import wyopcl.translator.bound.constraint.Equals;
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
	 * @see <a
	 *      href="http://sourceforge.net/p/czt/code/ci/master/tree/zlive/src/test
	 *      /java/net/sourceforge/czt/animation/eval/flatpred/BoundsTest.java#l113">
	 *      net.sourceforge.czt.animation.eval.flatpred.BoundsTest#testConst()</a>
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
	 * Given D(x) = [-10..10]
	 * 
	 * Test the constraints: 'x < y' 'y < z'
	 * 
	 * @see <a
	 *      href="http://sourceforge.net/p/czt/code/ci/master/tree/zlive/src/test
	 *      /java/net/sourceforge/czt/animation/eval/flatpred/BoundsTest.java#l142">
	 *      net.sourceforge.czt.animation.eval.flatpred.BoundsTest#testLessThanLeft()</a>
	 */
	@Test
	public void testLessThanLeft() {
		Bounds bnd = new Bounds();
		
		// D(x) = [-10..10]
		bnd.addDomain(new Domain("x", new BigInteger("-10"), new BigInteger("10")));
		// D(y) = [-inf ... inf]
		bnd.addDomain(new Domain("y", null, null));
		// D(z) = [-inf ... inf]
		bnd.addDomain(new Domain("z", null, null));
		
		// x<y
		LessThan constraint = new LessThan("x", "y");
		constraint.inferBound(bnd);
		
		// Propagate the lower bound from x to y
		assertEquals(new BigInteger("-9"), bnd.getLower("y"));
		
		// y<z
		LessThan constraint1 = new LessThan("y", "z");
		constraint1.inferBound(bnd);
		
		// Then propagate the lower bound to z.
		assertEquals(new BigInteger("-8"), bnd.getLower("z"));

		// x domain should remain the same
		assertEquals(new BigInteger("-10"), bnd.getLower("x"));
		assertEquals(new BigInteger("10"), bnd.getUpper("x"));

		
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
		
		// D(x) = [-inf ... inf] 
		bnd.addDomain(new Domain("x", null, null));
		// D(y) = [-inf ... inf]
		bnd.addDomain(new Domain("y", null, null));
		
		// D(z) = [-10..10]
		bnd.addDomain(new Domain("z",  new BigInteger("-10"), new BigInteger("10")));
		
		// y < z
		LessThan constraint = new LessThan("y", "z");
		constraint.inferBound(bnd);
		
		// x < y
		LessThan constraint1 = new LessThan("x", "y");
		constraint1.inferBound(bnd);
		
		
		// Check max_y is 9
		assertEquals(new BigInteger("9"), bnd.getUpper("y"));
	
		// Check max_x is 8
		assertEquals(new BigInteger("8"), bnd.getUpper("x"));

		// Check if the bounds of x have not changed.
		assertEquals(new BigInteger("-10"), bnd.getLower("z"));
		assertEquals(new BigInteger("10"), bnd.getUpper("z"));
		
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
		Bounds bnd = new Bounds();
		// D(x) = [-10..10]
		bnd.addDomain(new Domain("x", new BigInteger("-10"),  new BigInteger("10")));
		// D(y) = [-inf..inf]
		bnd.addDomain(new Domain("y", null, null));
		// D(z) = [-inf..inf]
		bnd.addDomain(new Domain("z", null, null));
		// x<=y
		LessThanEquals constraint = new LessThanEquals("x", "y");
		constraint.inferBound(bnd);
		// y<=z
		LessThanEquals constraint1 = new LessThanEquals("y", "z");
		constraint1.inferBound(bnd);
		
		// Propagate the lower bound from x to y
		assertEquals(new BigInteger("-10"), bnd.getLower("y"));
		// The upper bound of 'y' is infinity
		assertNull(bnd.getUpper("y"));
		// Propagate the lower bound to z.
		assertEquals(new BigInteger("-10"), bnd.getLower("z"));
		// The upper bound 'z' is infinity
		assertNull(bnd.getUpper("y"));

		// Check if the bounds of x have not changed.
		assertEquals(new BigInteger("-10"), bnd.getLower("x"));
		assertEquals(new BigInteger("10"), bnd.getUpper("x"));
	}
	
	/***
	 * Given D(x) = [-10..10] and constraints x <= y ^ y <= z
	 * 
	 * propagate the lower bounds from z to y and x.
	 *  
	 */
	@Test
	public void testLessThanEqualsRight() {
		Bounds bnd = new Bounds();
		// D(x) = [-inf..inf]
		bnd.addDomain(new Domain("x", null, null));
		// D(y) = [-inf..inf]
		bnd.addDomain(new Domain("y", null, null));
		// D(z) = [-10..10]
		bnd.addDomain(new Domain("z", new BigInteger("-10"), new BigInteger("10")));
		// y<=z
		LessThanEquals constraint1 = new LessThanEquals("y", "z");
		constraint1.inferBound(bnd);
		// x<=y
		LessThanEquals constraint = new LessThanEquals("x", "y");
		constraint.inferBound(bnd);
		
		// 'x' is [-inf ... 10]
		assertEquals(new BigInteger("10"), bnd.getUpper("x"));
		assertNull(bnd.getLower("x"));
		
		// 'y' is [-inf ... 10] 
		assertEquals(new BigInteger("10"), bnd.getUpper("y"));
		assertNull(bnd.getLower("y"));

		// 'z' is [-10..10]
		assertEquals(new BigInteger("-10"), bnd.getLower("z"));
		assertEquals(new BigInteger("10"), bnd.getUpper("z"));
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
		BoundBlock blk = new BoundBlock("code", BlockType.BLOCK);
		// D(x) = [-10..10]
		blk.addBounds("x", new BigInteger("-10"), new BigInteger("10"));

		blk.addConstraint(new Equals("x", "y"));
		blk.addConstraint(new Equals("y", "z"));
		
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
		
		BoundBlock blk = new BoundBlock("code", BlockType.BLOCK);
		// D(x) = [1..5]
		blk.addBounds("x", new BigInteger("1"), new BigInteger("5"));

		blk.addConstraint(new Negate("x", "y"));
		//assertTrue(blk.inferFixedPoint());
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
		BoundBlock blk = new BoundBlock("code", BlockType.BLOCK);		
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
		
		BoundBlock blk = new BoundBlock("code", BlockType.BLOCK);
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
		
		BoundBlock blk = new BoundBlock("code", BlockType.BLOCK);
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
		
		BoundBlock blk = new BoundBlock("code", BlockType.BLOCK);
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
		Bounds bnd = new Bounds();
		// D(x)=[0..5]
		bnd.addDomain(new Domain("x", new BigInteger("0"), new BigInteger("5")));		
		// D(y)=[3..4]
		bnd.addDomain(new Domain("y", new BigInteger("3"), new BigInteger("4")));
		// D(z)=[-10..10]
		bnd.addDomain(new Domain("z", new BigInteger("-10"), new BigInteger("10")));
		// Add the constraint 'x+y = z'
		LeftPlus constraint = new LeftPlus("x", "y", "z");
		constraint.inferBound(bnd);
		
		//assertTrue(blk.inferFixedPoint());
		assertEquals(new BigInteger("0"), bnd.getLower("x"));
		assertEquals(new BigInteger("5"), bnd.getUpper("x"));

		assertEquals(new BigInteger("3"), bnd.getLower("y"));
		assertEquals(new BigInteger("4"), bnd.getUpper("y"));

		assertEquals(new BigInteger("3"), bnd.getLower("z"));
		assertEquals(new BigInteger("9"), bnd.getUpper("z"));

	}


	/**
	 * Given D(x)=[4..8] D(y)=[0..3] D(z)=[2..2] Test the equality X=Y+Z
	 * 
	 * @see Figure3.11
	 */
	/*@Test
	public void testPlus() {
		BoundBlock blk = new BoundBlock("code", BlockType.BLOCK);
		// D(x) = [4..8]
		blk.addBounds("x", new BigInteger("4"), new BigInteger("8"));
		// D(y) = [0..3]
		blk.addBounds("y", new BigInteger("0"), new BigInteger("3"));
		// D(z) = [2..2]
		blk.addBounds("z", new BigInteger("2"), new BigInteger("2"));
		// x = y+z
		blk.addConstraint(new Plus("x", "y", "z"));
		assertTrue(blk.inferFixedPoint());
		assertEquals(new BigInteger("2"), blk.getLower("x"));
		assertEquals(new BigInteger("5"), blk.getUpper("x"));

		assertEquals(new BigInteger("2"), blk.getLower("y"));
		assertEquals(new BigInteger("6"), blk.getUpper("y"));

		assertEquals(new BigInteger("1"), blk.getLower("z"));
		assertEquals(new BigInteger("8"), blk.getUpper("z"));
	}
	*/
	
	
	

}
