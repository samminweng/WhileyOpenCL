package wyopcl.testing.bound;

import static org.junit.Assert.*;

import java.math.BigInteger;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import wyopcl.bound.Bounds;
import wyopcl.bound.Domain;
import wyopcl.bound.Equal;
import wyopcl.bound.RightPlus;
import wyopcl.testing.interpreter.BaseTestUtil;

public class BoundTestCase {
	private Bounds bounds;
	@Before
	public void setUp() throws Exception {
		
	}

	@After
	public void tearDown() throws Exception {
		
	}
	
	
	@Test
	public void testLower(){
		bounds = new Bounds();
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
		bounds = new Bounds();
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
		RightPlus plus = new RightPlus();
		//D(x) = [4..8]
		plus.addLowerBound("x", BigInteger.valueOf(4));
		plus.addUpperBound("x", BigInteger.valueOf(8));
		//D(y) = [0..3]
		plus.addLowerBound("y", BigInteger.valueOf(0));
		plus.addUpperBound("y", BigInteger.valueOf(3));
		//D(z) = [2..2]
		plus.addLowerBound("z", BigInteger.valueOf(2));
		plus.addUpperBound("z", BigInteger.valueOf(2));
		
		assertTrue(plus.inferBound("x", "y", "z"));
		assertEquals(new BigInteger("4"), plus.getLower("x"));
		assertEquals(new BigInteger("5"), plus.getUpper("x"));
		
		assertEquals(new BigInteger("2"), plus.getLower("y"));
		assertEquals(new BigInteger("3"), plus.getUpper("y"));
		
		assertEquals(new BigInteger("2"), plus.getLower("z"));
		assertEquals(new BigInteger("2"), plus.getUpper("z"));
		
		plus = null;
		
	}
	
	
	@Test
	public void testEqual() {
		Equal eq = new Equal();
		//D(x) = [-10..10]
		eq.addLowerBound("x", BigInteger.valueOf(-10));
		eq.addUpperBound("x", BigInteger.valueOf(10));
		
		assertTrue(eq.inferBound("x", "y"));
		assertEquals(new BigInteger("-10"), eq.getLower("y"));
		assertEquals(new BigInteger("10"), eq.getUpper("y"));
		
		assertTrue(eq.inferBound("y", "z"));
		assertEquals(new BigInteger("-10"), eq.getLower("z"));
		assertEquals(new BigInteger("10"), eq.getUpper("z"));
		
		
		eq = null;
		
	}

}
