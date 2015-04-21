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

package wyfs.util;

import java.io.*;
import java.util.*;
import java.util.jar.*;

import wyfs.lang.Content;
import wyfs.lang.Path;
import wyfs.lang.Content.Type;

/**
 * Provides an implementation of <code>Path.Root</code> for representing the
 * contents of a jar file.
 *
 * @author David J. Pearce
 *
 */
public final class JarFileRoot extends AbstractRoot<JarFileRoot.Folder> implements Path.Root {
	private final File dir;
	private Path.Item[] jfContents;

	public JarFileRoot(String dir, Content.Registry contentTypes) throws IOException {
		super(contentTypes);
		this.dir = new File(dir);
		refresh();
	}

	public JarFileRoot(File dir, Content.Registry contentTypes) throws IOException {
		super(contentTypes);
		this.dir = dir;
		refresh();
	}

	@Override
	public <T> Path.Entry<T> create(Path.ID id, Content.Type<T> ct) throws IOException {
		throw new UnsupportedOperationException();
	}

	@Override
	public void flush() {
		// no-op, since jar files are read-only.
	}

	@Override
	public void refresh() throws IOException {
		JarFile jf = new JarFile(dir);
		Enumeration<JarEntry> entries = jf.entries();
		this.jfContents = new Path.Item[jf.size()];
		int i = 0;
		while (entries.hasMoreElements()) {
			JarEntry e = entries.nextElement();
			String filename = e.getName();
			int lastSlash = filename.lastIndexOf('/');
			Trie pkg = lastSlash == -1 ? Trie.ROOT : Trie.fromString(filename.substring(0, lastSlash));
			if(!e.isDirectory()) {
				int lastDot = filename.lastIndexOf('.');
				String name = lastDot >= 0 ? filename.substring(lastSlash + 1, lastDot) : filename;
				String suffix = lastDot >= 0 ? filename.substring(lastDot + 1) : null;
				Trie id = pkg.append(name);
				Entry pe = new Entry(id, jf, e);
				contentTypes.associate(pe);
				jfContents[i++] = pe;
			} else {
				// folder
				jfContents[i++] = new Folder(pkg);
			}
		}
	}

	@Override
	protected Folder root() {
		return new Folder(Trie.ROOT);
	}

	public String toString() {
		return dir.getPath();
	}


	/**
	 * Represents a directory on a physical file system.
	 *
	 * @author David J. Pearce
	 *
	 */
	public final class Folder extends AbstractFolder {
		public Folder(Path.ID id) {
			super(id);
		}

		@Override
		protected Path.Item[] contents() throws IOException {
			// This algorithm is straightforward. I use a two loops instead of a
			// single loop with ArrayList to avoid allocating on the heap.
			int count = 0 ;
			for(int i=0;i!=jfContents.length;++i) {
				Path.Item item = jfContents[i];
				if(item.id().parent() == id) {
					count++;
				}
			}

			Path.Item[] myContents = new Path.Item[count];
			count=0;
			for(int i=0;i!=jfContents.length;++i) {
				Path.Item item = jfContents[i];
				if(item.id().parent() == id) {
					myContents[count++] = item;
				}
			}

			return myContents;
		}

		@Override
		public <T> wyfs.lang.Path.Entry<T> create(Path.ID id, Content.Type<T> ct) {
			throw new UnsupportedOperationException();
		}
	}

	private static final class Entry<T> extends AbstractEntry<T> implements Path.Entry<T> {
		private final JarFile parent;
		private final JarEntry entry;

		public Entry(Trie mid, JarFile parent, JarEntry entry) {
			super(mid);
			this.parent = parent;
			this.entry = entry;
		}

		public String location() {
			return parent.getName();
		}

		public long lastModified() {
			return entry.getTime();
		}

		public boolean isModified() {
			// cannot modify something in a Jar file.
			return false;
		}

		public void touch() {
			throw new UnsupportedOperationException();
		}

		public String suffix() {
			String suffix = "";
			String filename = entry.getName();
			int pos = filename.lastIndexOf('.');
			if (pos > 0) {
				suffix = filename.substring(pos + 1);
			}
			return suffix;
		}

		public InputStream inputStream() throws IOException {
			return parent.getInputStream(entry);
		}

		public OutputStream outputStream() throws IOException {
			throw new UnsupportedOperationException();
		}

		public void write(T contents) {
			throw new UnsupportedOperationException();
		}
	}
}
