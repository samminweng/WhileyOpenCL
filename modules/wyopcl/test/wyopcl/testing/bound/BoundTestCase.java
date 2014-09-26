package wyopcl.testing.bound;

import static org.junit.Assert.*;

import java.math.BigInteger;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import wyopcl.bound.Bounds;
import wyopcl.bound.Domain;
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

	@Test
	public void testLower() {
		Bounds bnd = new Bounds();
		assertNull(bnd.getDomain("x"));
		// Add a lower bound
		bnd.addLowerBound("x", new BigInteger("-10"));
		assertNotNull(bnd.getDomain("x"));
		assertEquals(new BigInteger("-10"), bnd.getLower("x"));

		// Add a weak lower bound
		bnd.addLowerBound("x", new BigInteger("-11"));
		assertEquals(new BigInteger("-10"), bnd.getLower("x"));

		// Add a strong lower bound
		bnd.addLowerBound("x", new BigInteger("-9"));
		assertEquals(new BigInteger("-9"), bnd.getLower("x"));

		// Add a positive and stronger lower bound
		bnd.addLowerBound("x", new BigInteger("9"));
		assertEquals(new BigInteger("9"), bnd.getLower("x"));
		bnd = null;
	}

	@Test
	public void testUpper() {
		Bounds bnd = new Bounds();
		assertNull(bnd.getDomain("x"));
		// Add a upper bound
		bnd.addUpperBound("x", new BigInteger("10"));
		assertNotNull(bnd.getDomain("x"));
		assertEquals(new BigInteger("10"), bnd.getUpper("x"));

		// Add a weak upper bound
		bnd.addUpperBound("x", new BigInteger("11"));
		assertEquals(new BigInteger("10"), bnd.getUpper("x"));

		// Add a strong upper bound
		bnd.addUpperBound("x", new BigInteger("9"));
		assertEquals(new BigInteger("9"), bnd.getUpper("x"));

		// Add a negative and stronger lower bound
		bnd.addUpperBound("x", new BigInteger("-9"));
		assertEquals(new BigInteger("-9"), bnd.getUpper("x"));
		bnd = null;
	}

	@Test
	public void testRightPlus() {
		Bounds bnd = new Bounds();
		// D(x) = [4..8]
		bnd.addLowerBound("x", new BigInteger("4"));
		bnd.addUpperBound("x", new BigInteger("8"));
		// D(y) = [0..3]
		bnd.addLowerBound("y", new BigInteger("0"));
		bnd.addUpperBound("y", new BigInteger("3"));
		// D(z) = [2..2]
		bnd.addLowerBound("z", new BigInteger("2"));
		bnd.addUpperBound("z", new BigInteger("2"));
		// x = y+z
		assertTrue(new RightPlus("x", "y", "z").inferBound(bnd));
		assertEquals(new BigInteger("4"), bnd.getLower("x"));
		assertEquals(new BigInteger("5"), bnd.getUpper("x"));

		assertEquals(new BigInteger("2"), bnd.getLower("y"));
		assertEquals(new BigInteger("3"), bnd.getUpper("y"));

		assertEquals(new BigInteger("2"), bnd.getLower("z"));
		assertEquals(new BigInteger("2"), bnd.getUpper("z"));

		bnd = null;
	}

	@Test
	public void testEqual() {
		ConstraintList list = new ConstraintList();
		Bounds bnd = new Bounds();
		// D(x) = [-10..10]
		bnd.addLowerBound("x", new BigInteger("-10"));
		bnd.addUpperBound("x", new BigInteger("10"));

		list.addConstraint(new Equals("x", "y"));
		list.addConstraint(new Equals("y", "z"));
		assertTrue(list.inferFixPoint(bnd));
		assertEquals(new BigInteger("-10"), bnd.getLower("y"));
		assertEquals(new BigInteger("10"), bnd.getUpper("y"));
		assertEquals(new BigInteger("-10"), bnd.getLower("z"));
		assertEquals(new BigInteger("10"), bnd.getUpper("z"));

		// Add the stronger bounds on z [0..5]
		bnd.addLowerBound("z", new BigInteger("0"));
		bnd.addUpperBound("z", new BigInteger("5"));

		assertTrue(list.inferFixPoint(bnd));
		assertEquals(new BigInteger("0"), bnd.getLower("x"));
		assertEquals(new BigInteger("5"), bnd.getUpper("x"));
		assertEquals(new BigInteger("0"), bnd.getLower("y"));
		assertEquals(new BigInteger("5"), bnd.getUpper("y"));
		assertEquals(new BigInteger("0"), bnd.getLower("z"));
		assertEquals(new BigInteger("5"), bnd.getUpper("z"));

		bnd = null;
	}

	/***
	 * Constraints: x < y ^ y < z Propagate the bounds of x to y and z.
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
		assertTrue(list.inferFixPoint(bnd));
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
		assertTrue(list.inferFixPoint(bnd));
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
		assertTrue(list.inferFixPoint(bnd));
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
