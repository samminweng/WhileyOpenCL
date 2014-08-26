package wyopcl.interpreter;

import wyil.lang.Constant;

public class Closure extends Constant {
	

	public final Constant.Lambda lambda;
	public Constant.Tuple parameters;
	public final Constant.Type returntype;
	
	public Closure(Constant.Lambda lambda, Constant.Tuple parameters, Constant.Type returntype){
		this.lambda = lambda;
		this.parameters = parameters;
		this.returntype = returntype;
	}
	
	public Constant.Tuple parameters(){
		return parameters;
	}
	
	public Constant.Lambda lambda(){
		return lambda;
	}
	
	@Override
	public String toString() {
		return "Closure [lambda=" + lambda + ", parameters=" + parameters + ", returntype=" + returntype + "]";
	}


	@Override
	public int compareTo(Constant o) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public wyil.lang.Type type() {
		// TODO Auto-generated method stub
		return null;
	}
}
