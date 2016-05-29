// Copyright (c) 2011, David J. Pearce (djp@ecs.vuw.ac.nz)
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//    * Redistributions of source code must retain the above copyright
//      notice, this list of conditions and the following disclaimer.
//    * Redistributions in binary form must reproduce the above copyright
//      notice, this list of conditions and the following disclaimer in the
//      documentation and/or other materials provided with the distribution.
//    * Neither the name of the <organization> nor the
//      names of its contributors may be used to endorse or promote products
//      derived from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL DAVID J. PEARCE BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

package wyjc.runtime;

import java.lang.reflect.Method;
import java.math.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Map;

import static wyil.lang.Type.*;

public class Util {

	/**
	 * This method is used to convert the arguments supplied to main (which have
	 * type <code>String[]</code>) into an appropriate Whiley List.
	 *
	 * @param args
	 * @return
	 */
	public static WyArray fromStringList(String[] args) {
		WyArray r = new WyArray(args.length);
		for(int i=0;i!=args.length;++i) {
			r.add(str2il(args[i]));
		}
		return r;
	}

	/**
	 * Coerce a string into a Whiley int list.
	 * @param str
	 * @return
	 */
	public static WyArray str2il(String str) {
		WyArray r = new WyArray(str.length());
		for(int i=0;i!=str.length();++i) {
			r.add(BigInteger.valueOf(str.charAt(i)));
		}
		return r;
	}

	public static String il2str(WyArray argument) {
		String r = "";
		for(int i=0;i!=argument.size();++i) {
			BigInteger c = (BigInteger) argument.get(i);
			r = r + ((char) c.intValue());
		}
		return r;
	}
	
	/**
	 * This method is used for the special case when the left-hand side of an
	 * equality operation may be null.
	 *
	 * @param o1
	 * @param o2
	 * @return
	 */
	public static boolean equals(Object o1, Object o2) {
		return (o1 != null && o1.equals(o2)) || (o1 == o2);
	}

	public static WyBool equal(Object o1, Object o2) {
		return WyBool.valueOf(equals(o1,o2));
	}
		
	public static WyBool notEqual(Object o1, Object o2) {
		return WyBool.valueOf(!equals(o1,o2));
	}
	
	public static WyBool lessThan(BigInteger i1, BigInteger i2) {
		return WyBool.valueOf(i1.compareTo(i2) < 0);
	}
	
	public static WyBool lessThanEqual(BigInteger i1, BigInteger i2) {
		return WyBool.valueOf(i1.compareTo(i2) <= 0);
	}
	
	public static WyBool greaterThan(BigInteger i1, BigInteger i2) {
		return WyBool.valueOf(i1.compareTo(i2) > 0);
	}
	
	public static WyBool greaterThanEqual(BigInteger i1, BigInteger i2) {
		return WyBool.valueOf(i1.compareTo(i2) >= 0);
	}
	
	/**
	 * The <code>instanceOf</code> method implements a runtime type test.
	 */
	public static boolean instanceOf(Object obj, WyType t) {
		switch(t.kind) {
			case K_ANY:
				return true;
			case K_VOID:
				return false;
			case K_NULL:
				return obj == null;
			case K_BOOL:
				return obj instanceof WyBool;
			case K_BYTE:
				return obj instanceof WyByte;
			case K_INT:
				return obj instanceof BigInteger;
			case K_STRING:
				return obj instanceof String;
			case K_REFERENCE: {
				if(obj instanceof WyObject) {
					WyObject ol = (WyObject) obj;
					WyType.Reference ref = (WyType.Reference) t;
					Object element = ol.state();
					return instanceOf(element,ref.element);
				}
				break;
			}				
			case K_LIST:
			{
				if(obj instanceof WyArray) {
					WyArray ol = (WyArray) obj;
					WyType.List tl = (WyType.List) t;
					if(tl.nonEmpty && ol.isEmpty()) {
						return false;
					}
					WyType el = tl.element;
					if(el.kind == K_ANY) {
						return true;
					} else if(el.kind == K_VOID) {
						return ol.isEmpty();
					} else {
						for(Object elem : ol) {
							if(!instanceOf(elem,el)) {
								return false;
							}
						}
						return true;
					}
				}
				break;
			}
			case K_RECORD:
			{
				if(obj instanceof WyRecord) {
					WyRecord ol = (WyRecord) obj;
					WyType.Record tl = (WyType.Record) t;
					String[] names = tl.names;
					WyType[] types = tl.types;
					if(!tl.isOpen && names.length != ol.size()) {
						return false;
					}
					for(int i=0;i!=names.length;++i) {
						String name = names[i];
						if(ol.containsKey(name)) {
							WyType type = types[i];
							Object val = ol.get(name);
							if(!instanceOf(val,type)) {
								return false;
							}
						} else {
							return false;
						}
					}
					return true;
				}
				break;
			}
			case K_NEGATION:
			{
				WyType.Negation not = (WyType.Negation) t;
				return !instanceOf(obj,not.element);
			}
			case K_UNION:
			{
				WyType.Union un = (WyType.Union) t;
				for(WyType bound : un.bounds) {
					if(instanceOf(obj,bound)) {
						return true;
					}
				}
				break;
			}
			case K_FUNCTION:
			case K_METHOD: {
				// FIXME: this is fundamentally broken, since it does not consider
				// the parameter types of the underlying function. See #552
				return obj instanceof WyLambda;
			}
		}
		return false;
	}

	/**
	 * This method gets called when we're testing a list object against some
	 * type. To reduce the number of cases, we can narrow down the possible
	 * types by a process of deduction. The type cannot be <code>void</code> or
	 * <code>any</code> (since the test would already have been eliminated).
	 * Likewise, it cannot be e.g. a record, since again the test would already
	 * have been eliminated. In fact, the type can only be a list or its
	 * negation.
	 *
	 * @param object
	 *            --- object being tested against.
	 * @param type
	 *            --- type to test against.
	 * @return
	 */
	public static boolean instanceOf(WyArray object, WyType type) {
		if(type instanceof WyType.List) {
			WyType.List tl = (WyType.List) type;
			WyType el = tl.element;
			if(el.kind == K_ANY) {
				return true;
			} else if(el.kind == K_VOID) {
				return object.isEmpty();
			} else {
				for(Object elem : object) {
					if(!instanceOf(elem,el)) {
						return false;
					}
				}
				return true;
			}
		} else {
			return instanceOf((Object)object,type);
		}
	}

	/**
	 * This method gets called when we're testing a record object against some
	 * type. To reduce the number of cases, we can narrow down the possible
	 * types by a process of deduction. The type cannot be <code>void</code> or
	 * <code>any</code> (since the test would already have been eliminated).
	 * Likewise, it cannot be e.g. a list, since again the test would already
	 * have been eliminated. In fact, the type can only be a record or its
	 * negation.
	 *
	 * @param object
	 *            --- object being tested against.
	 * @param type
	 *            --- type to test against.
	 * @return
	 */
	public static boolean instanceOf(WyRecord object, WyType type) {
		if(type instanceof WyType.Record) {
			WyType.Record tl = (WyType.Record) type;
			String[] names = tl.names;
			WyType[] types = tl.types;
			if (!tl.isOpen && names.length != object.size()) {
				return false;
			}
			for(int i=0;i!=names.length;++i) {
				String name = names[i];
				if(object.containsKey(name)) {
					WyType fieldType = types[i];
					Object val = object.get(name);
					if(!instanceOf(val,fieldType)) {
						return false;
					}
				} else {
					return false;
				}
			}
			return true;
		} else {
			return instanceOf((Object)object,type);
		}
	}
	
	public static final Comparator COMPARATOR = new Comparator();

	public static final class Comparator implements java.util.Comparator {
		private Comparator() {}

		public final int compare(Object o1, Object o2) {
			return Util.compare(o1,o2);
		}
	}

	public static int compare(Object o1, Object o2) {
		if(o1 == null) {
			return o2 == null ? 0 : -1;
		} else if(o1 instanceof BigInteger) {
			return compare((BigInteger)o1,o2);
		} else if(o1 instanceof WyArray) {
			return compare((WyArray)o1,o2);
		} else if(o1 instanceof WyRecord) {
			return compare((WyRecord)o1,o2);
		} else {
			throw new IllegalArgumentException("Invalid object passed to comparator: " + o1);
		}
	}

	public static int compare(BigInteger o1, Object o2) {
		if(o2 == null || o2 instanceof Boolean) {
			return 1;
		} else if(o2 instanceof BigInteger) {
			BigInteger b2 = (BigInteger) o2;
			return o1.compareTo(b2);
		} else {
			return -1;
		}
	}

	public static int compare(WyArray o1, Object o2) {
		if (o2 == null || o2 instanceof Boolean || o2 instanceof BigInteger) {
			return 1;
		} else if (o2 instanceof WyArray) {
			return compare(o1, (WyArray) o2);
		} else {
			return -1;
		}
	}

	public static int compare(WyArray o1, WyArray o2) {
		int s1_size = o1.size();
		int s2_size = o2.size();
		if(s1_size < s2_size) {
			return -1;
		} else if(s1_size > s2_size) {
			return 1;
		} else {
			for(int i=0;i!=s1_size;++i) {
				Object e1 = o1.get(i);
				Object e2 = o2.get(i);
				int c = compare(e1,e2);
				if(c != 0) {
					return c;
				}
			}
			return 0;
		}
	}

	public static int compare(WyRecord o1, Object o2) {
		if (o2 == null || o2 instanceof Boolean || o2 instanceof BigInteger) {
			return 1;
		} else if (o2 instanceof WyRecord) {
			return compare(o1, (WyRecord) o2);
		} else {
			return -1;
		}
	}

	public static int compare(WyRecord o1, WyRecord o2) {
		ArrayList<String> mKeys = new ArrayList<String>(o1.keySet());
		ArrayList<String> tKeys = new ArrayList<String>(o2.keySet());
		Collections.sort(mKeys);
		Collections.sort(tKeys);

		for(int i=0;i!=Math.min(mKeys.size(),tKeys.size());++i) {
			String mk = mKeys.get(i);
			String tk = tKeys.get(i);
			int c = mk.compareTo(tk);
			if(c != 0) {
				return c;
			}
			String mv = o1.get(mk).toString();
			String tv = o2.get(tk).toString();
			c = mv.compareTo(tv);
			if(c != 0) {
				return c;
			}
		}

		if(mKeys.size() < tKeys.size()) {
			return -1;
		} else if(mKeys.size() > tKeys.size()) {
			return 1;
		} else {
			return 0;
		}
	}

	public static void print(WyArray argument) {
		for(int i=0;i!=argument.size();++i) {
			BigInteger c = (BigInteger) argument.get(i);
			System.out.print((char) c.intValue());
		}
	}
	
	public static void println(WyArray argument) {
		print(argument);
		System.out.println();
	}

	public static WyRecord systemConsole(String[] args) {
		WyRecord sysout = new WyRecord();

		sysout.put("print_s", new WyLambda((Object[]) null) {
			public Object call(Object[] arguments) {
				print((WyArray) arguments[0]);						
				return null;
			}
		});
		sysout.put("println_s", new WyLambda((Object[]) null) {
			public Object call(Object[] arguments) {
				println((WyArray) arguments[0]);								
				return null;
			}
		});
		sysout.put("print", new WyLambda((Object[]) null) {
			public Object call(Object[] arguments) {
				System.out.print(arguments[0]);					
				return null;
			}
		});
		sysout.put("println", new WyLambda((Object[]) null) {
			public Object call(Object[] arguments) {
				System.out.println(arguments[0]);								
				return null;
			}
		});
		
		WyRecord console = new WyRecord();
		console.put("out", sysout);
		console.put("args",fromStringList(args));
		return console;
	}

}
