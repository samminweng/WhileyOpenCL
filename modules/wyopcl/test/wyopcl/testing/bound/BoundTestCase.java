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
	public void testLower(){		
		Bounds bounds = new Bounds();
		assertNull(bounds.getDomain("x"));
		//Add a lower bound
		bounds.addLowerBound("x", new BigInteger("-10"));
		assertNotNull(bounds.getDomain("x"));
		assertEquals(BigInteger.valueOf(-10), bounds.getLower("x"));
		
		//Add a weak lower bound
		bounds.addLowerBound("x", new BigInteger("-11"));
		assertEquals(BigInteger.valueOf(-10), bounds.getLower("x"));
		
		//Add a strong lower bound
		bounds.addLowerBound("x", new BigInteger("-9"));
		assertEquals(BigInteger.valueOf(-9), bounds.getLower("x"));
		
		//Add a positive and stronger lower bound
		bounds.addLowerBound("x", new BigInteger("9"));
		assertEquals(BigInteger.valueOf(9), bounds.getLower("x"));
		bounds = null;
	}
	
	@Test
	public void testUpper(){
		Bounds bounds = new Bounds();
		assertNull(bounds.getDomain("x"));
		//Add a upper bound
		bounds.addUpperBound("x", new BigInteger("10"));
		assertNotNull(bounds.getDomain("x"));
		assertEquals(BigInteger.valueOf(10), bounds.getUpper("x"));
		
		//Add a weak upper bound
		bounds.addUpperBound("x", new BigInteger("11"));
		assertEquals(BigInteger.valueOf(10), bounds.getUpper("x"));
		
		//Add a strong upper bound
		bounds.addUpperBound("x", new BigInteger("9"));
		assertEquals(BigInteger.valueOf(9), bounds.getUpper("x"));
		
		//Add a negative and stronger lower bound
		bounds.addUpperBound("x", new BigInteger("-9"));
		assertEquals(BigInteger.valueOf(-9), bounds.getUpper("x"));		
		bounds = null;
	}
	
	
	
	@Test
	public void testRightPlus() {
		Bounds bnd = new Bounds();		
		//D(x) = [4..8]
		bnd.addLowerBound("x", BigInteger.valueOf(4));
		bnd.addUpperBound("x", BigInteger.valueOf(8));
		//D(y) = [0..3]
		bnd.addLowerBound("y", BigInteger.valueOf(0));
		bnd.addUpperBound("y", BigInteger.valueOf(3));
		//D(z) = [2..2]
		bnd.addLowerBound("z", BigInteger.valueOf(2));
		bnd.addUpperBound("z", BigInteger.valueOf(2));
		//x = y+z
		RightPlus plus = new RightPlus("x", "y", "z");
		assertTrue(plus.inferBound(bnd));
		assertEquals(new BigInteger("4"), bnd.getLower("x"));
		assertEquals(new BigInteger("5"), bnd.getUpper("x"));
		
		assertEquals(new BigInteger("2"), bnd.getLower("y"));
		assertEquals(new BigInteger("3"), bnd.getUpper("y"));
		
		assertEquals(new BigInteger("2"), bnd.getLower("z"));
		assertEquals(new BigInteger("2"), bnd.getUpper("z"));
		
		plus = null;
		bnd =null;
		
	}
	
	
	@Test
	public void testEqual() {
		Bounds bnd = new Bounds();	
		//D(x) = [-10..10]
		bnd.addLowerBound("x", BigInteger.valueOf(-10));
		bnd.addUpperBound("x", BigInteger.valueOf(10));
		ConstraintList list = new ConstraintList();
		list.addConstraint(new Equals("x", "y"));
		list.addConstraint(new Equals("y","z"));
		assertTrue(list.inferFixPoint(bnd));
		assertEquals(new BigInteger("-10"), bnd.getLower("y"));
		assertEquals(new BigInteger("10"), bnd.getUpper("y"));
		assertEquals(new BigInteger("-10"), bnd.getLower("z"));
		assertEquals(new BigInteger("10"), bnd.getUpper("z"));
		list = null;		
	}
	/***
	 * Constraints: x <= y ^ y <= z
	 * Propagate the lower bounds from x to y and z.
	 */
	@Test
	public void testLessThanEqualsLeft(){
		Bounds bnd = new Bounds();		
		//D(x) = [-10..10]
		bnd.addLowerBound("x", new BigInteger("-10"));
		bnd.addUpperBound("x", new BigInteger("10"));
		ConstraintList list = new ConstraintList();
		//x<=y		
		list.addConstraint(new LessThanEquals("x", "y"));
		//y<=z
		list.addConstraint(new LessThanEquals("y", "z"));
		assertTrue(list.inferFixPoint(bnd));
		//Propagate the lower bound from x to y
		assertEquals(new BigInteger("-10"), bnd.getLower("y"));
		//The upper bound remain the same.
		assertNull(bnd.getUpper("y"));
		//Then propagate the lower bound to z.
		assertEquals(new BigInteger("-10"), bnd.getLower("z"));
		//The upper bound remain the same.
		assertNull(bnd.getUpper("y"));
		
	}
	
	/***
	 * Constraints: x <= y ^ y <= z
	 * Propagate the upper bounds from z to y and x.
	 */
	@Test
	public void testLessThanEqualsRight(){
		Bounds bnd = new Bounds();		
		//D(x) = [-10..10]
		bnd.addLowerBound("z", new BigInteger("-10"));
		bnd.addUpperBound("z", new BigInteger("10"));
		ConstraintList list = new ConstraintList();
		//x<=y		
		list.addConstraint(new LessThanEquals("x", "y"));
		//y<=z
		list.addConstraint(new LessThanEquals("y", "z"));
		assertTrue(list.inferFixPoint(bnd));
		//Propagate the lower bound from x to y
		assertEquals(new BigInteger("10"), bnd.getUpper("y"));
		//The upper bound remain the same.
		assertNull(bnd.getLower("y"));
		//Then propagate the lower bound to z.
		assertEquals(new BigInteger("10"), bnd.getUpper("x"));
		//The upper bound remain the same.
		assertNull(bnd.getLower("x"));
	}

}
