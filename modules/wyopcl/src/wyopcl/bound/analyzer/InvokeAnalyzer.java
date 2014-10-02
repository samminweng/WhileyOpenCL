package wyopcl.bound.analyzer;

import java.util.ArrayList;

import wyil.lang.Codes;
import wyil.lang.Type;
import wyil.lang.WyilFile.Case;
import wyil.lang.WyilFile.FunctionOrMethodDeclaration;
import wyopcl.bound.Analyzer;
import wyopcl.bound.Bounds;
import wyopcl.bound.ConstraintList;
import wyopcl.bound.constraint.Equals;
/**
 * Parses the invoke bytecode and adds the constraints to the list.
 * The possible constraints include:
 * - Equals constraint for input parameters. 
 * @author Min-Hsien Weng
 *
 */
public class InvokeAnalyzer extends Analyzer {
	private static InvokeAnalyzer instance;	
	public InvokeAnalyzer(){
	}
	
	/*Implement the 'Singleton' pattern to ensure this class has one instance.*/
	public static InvokeAnalyzer getInstance(){	
		if (instance == null){
			instance = new InvokeAnalyzer();
		}	
		return instance;
	}
	
	public void analyze(Codes.Invoke code, Bounds bnd, ConstraintList list){
		String func_name = code.name.name();
		
		//Get the fun block from module.
		FunctionOrMethodDeclaration functionOrMethod = this.module.functionOrMethod(func_name, code.type());
		int index = 0;
		for(Type paramType: code.type().params()){
			//Get the input parameters of integer type
			if(paramType instanceof Type.Int){
				String param = "%"+code.operand(index);
				//Add the equal constraint for input parameter.
				list.addConstraint(new Equals(param, func_name));
			}
			index++;			
		}
		
		
		//Shall the bytecode in sub-method be executed?
		for(Case mcase: functionOrMethod.cases()){
			
		}
		
		//String target = "%"+code.target();
		
		
		System.out.println(code);
	}
	
}
