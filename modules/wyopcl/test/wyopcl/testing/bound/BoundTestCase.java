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
import wyopcl.bound.constraint.LessThan;
import wyopcl.bound.constraint.LessThanEquals;
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
	 * Given D(x)=[-10..null]
	 * Test the lower bound of Domain D(X).
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
	 * Given D(x)=[null..10]
	 * Test the upper bounds of Domain D(X).
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
	 * Given D(x)=[20..20]
	 * Test the constraint X == 20
	 */
	@Test
	public void testConst(){
		ConstraintList list = new ConstraintList();
		Bounds bnds = new Bounds();
		list.addConstraint(new Const("x", new BigInteger("20")));
		assertTrue(list.checkBoundConsistency(bnds));
		assertEquals(new BigInteger("20"), bnds.getLower("x"));
		assertEquals(new BigInteger("20"), bnds.getUpper("x"));
	}
	
	
	
	/**
	 * Given D(x)=[4..8] D(y)=[0..3] D(z)=[2..2]
	 * Test the equality X=Y+Z
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

	/**
	 * Given D(x) =[-10..10]
	 * Test the constraints ( x == y ^ y == z)
	 */
	@Test
	public void testEqual() {
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

	/***
	 * Given D(x) = [-10..10]
	 * Test the constraints: x < y ^ y < z
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
	 * Constraints: x <= y ^ y <= z Propagate the lower bounds from x to y and
	 * z.
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
	 * Constraints: x <= y ^ y <= z Propagate the upper bounds from z to y and
	 * x.
	 */
	@Test
	public void testLessThanEqualsRight() {
		ConstraintList list = new ConstraintList();
		Bounds bnd = new Bounds();
		// D(x) = [-10..10]
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

}
