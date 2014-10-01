package wyopcl.bound;

import static wycc.lang.SyntaxError.internalFailure;

import java.io.IOException;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import wybs.lang.Build.Project;
import wybs.lang.Build;
import wybs.lang.Builder;
import wycc.util.Logger;
import wycc.util.Pair;
import wyfs.lang.Path;
import wyfs.lang.Path.Entry;
import wyfs.lang.Path.Root;
import wyil.lang.WyilFile;
import wyopcl.WyopclBuilder;

public class BoundAnalyzer implements WyopclBuilder{
	private final Build.Project project;
	private String filename;

	/**
	 * For logging information.
	 */
	protected Logger logger = Logger.NULL;
	
	public BoundAnalyzer(Project project){
		this.project = project;
	}
	
	@Override
	public Project project() {
		return this.project;
	}
	
	@Override
	public void setLogger(Logger logger) {
		this.logger = logger;		
	}

	@Override
	public Set<Entry<?>> build(Collection<Pair<Entry<?>, Root>> delta) throws IOException {
		Runtime runtime = Runtime.getRuntime();
		long start = System.currentTimeMillis();
		long memory = runtime.freeMemory();

		HashSet<Path.Entry<?>> generatedFiles = new HashSet<Path.Entry<?>>();
		for(Pair<Path.Entry<?>,Path.Root> p : delta) {
			//Path.Root dst = p.second();
			Path.Entry<WyilFile> sf = (Path.Entry<WyilFile>) p.first();
			WyilFile module = sf.read();
			//setModule(module);
			this.filename = module.filename();
			//this.preprocessor(module);
			//Get started with the main method.
			//this.interpret(module);
		}

		long endTime = System.currentTimeMillis();
		logger.logTimedMessage("Wyil interpreter completed.\nFile:" + filename,
				(endTime - start), memory - runtime.freeMemory());
		return generatedFiles;
	}

	@Override
	public void setVerbose(boolean verbose) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void setArgs(String[] arguments) {
		// TODO Auto-generated method stub
		
	}

	

}
