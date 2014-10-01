package wyopcl.bound;

import static wycc.lang.SyntaxError.internalFailure;

import java.io.IOException;
import java.util.Collection;
import java.util.Set;

import wybs.lang.Build.Project;
import wybs.lang.Build;
import wybs.lang.Builder;
import wycc.util.Logger;
import wycc.util.Pair;
import wyfs.lang.Path.Entry;
import wyfs.lang.Path.Root;

public class BoundAnalyzer implements Builder{
	private final Build.Project project;
	private String filename;

	/**
	 * For logging information.
	 */
	private Logger logger = Logger.NULL;
	
	public BoundAnalyzer(Project project){
		this.project = project;
	}
	
	@Override
	public Project project() {
		return this.project;
	}

	@Override
	public Set<Entry<?>> build(Collection<Pair<Entry<?>, Root>> delta) throws IOException {
		internalFailure("Not implemented!", "BoundAnalyzer.java", null);
		return null;
	}

}
