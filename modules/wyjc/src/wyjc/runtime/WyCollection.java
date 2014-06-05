package wyjc.runtime;

import java.math.BigInteger;
import java.util.Map;

public class WyCollection {

	public static java.util.Iterator iterator(Object col) {				
		Util.decRefs(col);
		if(col instanceof java.util.Collection) {
			java.util.Collection c = (java.util.Collection) col;
			return c.iterator();
		} else if (col instanceof WyMap) {
			WyMap m = (WyMap) col;
			return m.iterator();
		} else {
			String s = (String) col;
			return new StringIterator(s);
		}
	}
		
	public static BigInteger length(Object col) {				
		Util.decRefs(col);
		if(col instanceof java.util.Collection) {
			java.util.Collection c = (java.util.Collection) col;
			return BigInteger.valueOf(c.size());
		} else if (col instanceof java.util.Map) {
			java.util.Map m = (java.util.Map) col;
			return BigInteger.valueOf(m.size());
		} else {
			String s = (String) col;
			return BigInteger.valueOf(s.length());
		}
	}		
	
	public static final class StringIterator implements java.util.Iterator {
		public final String string;
		public int index;
		
		public StringIterator(String string) {
			this.string = string;
			this.index = 0;
		}
		
		public boolean hasNext() {
			return index < string.length();
		}
		
		public void remove(){
			// never called
		}
		
		public Object next() {
			return string.charAt(index++);			
		}
	}
	
	public static Object indexOf(Object col, Object key) {
		if(col instanceof WyList) {
			WyList l = (WyList) col;
			BigInteger index = (BigInteger) key;
			return l.get(index.intValue());
		} else if(col instanceof WyMap) {
			WyMap d = (WyMap) col;			
			return d.get(key);
		} else {
			String s = (String) col;
			BigInteger index = (BigInteger) key;
			return s.charAt(index.intValue());
		}
	}
}
