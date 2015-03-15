package wyopcl.translator.generator;

import static wycc.lang.SyntaxError.internalFailure;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Stack;
import java.util.TreeMap;

import wycc.lang.SyntaxError;
import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Codes.BinaryOperator;
import wyil.lang.Codes.ListOperator;
import wyil.lang.Codes.Loop;
import wyil.lang.Codes.StringOperator;
import wyil.lang.Codes.UnaryOperator;
import wyil.lang.Constant;
import wyil.lang.Constant.Strung;
import wyil.lang.Type;
import wyil.lang.Type.EffectiveIndexible;
import wyil.lang.Type.FunctionOrMethod;
import wyil.lang.WyilFile.FunctionOrMethodDeclaration;
import wyopcl.translator.Configuration;
import wyopcl.translator.SymbolController;
import wyopcl.translator.symbolic.PatternMatcher;
import wyopcl.translator.symbolic.PatternTransformer;
/**
 * Takes a list of functional byte-code and converts it into C code.
 * @author Min-Hsien Weng
 *
 */
public class CodeGenerator{
	private final Configuration config;
	private final String prefix = "_";
	private String indent="\t";
	private HashMap<String, String> vars;
	private HashMap<String, Type> params;//A list of input parameters 
	private ArrayList<String> statements;	
	private BinaryOperator loop_condition;
	private String loop_label;
	private Stack<String> assert_labels;	
	private SymbolController sym_ctrl;	

	public CodeGenerator(Configuration config){
		this.config = config;
		this.vars = new HashMap<String, String>();
		this.params = new HashMap<String, Type>();
		this.statements = new ArrayList<String>();		
		this.sym_ctrl = new SymbolController();		
		this.assert_labels = new Stack<String>();
	}
	/**
	 * Add the statements of starting timer and iterations.
	 */
	private void addTimerAndIterations(String func_name){
		// Adds the timer to measure the starting time at the main method
		if(func_name.equals("main")){
			//Add variable declaration
			vars.put("start", "time_t");
			vars.put("end", "time_t");
			vars.put("diff", "double");
			//Add the number of iteration
			vars.put("iteration", "int");
			statements.add(indent + "time(&start);");
			statements.add(indent + "iteration=0;");
			statements.add(indent + "while(iteration<10){");
			increaseIndent();
			statements.add(indent + "iteration++;");
		}
	}

	/**
	 * Adds the ending timer and calculate the execution time
	 * @param func_name
	 */
	private void addEndingTimer(String func_name, Code code){
		//Adds the ending time and calculate and print out the execution time
		if(func_name.equals("main") && code instanceof Codes.Return){
			decreaseIndent();
			//The end of iteration while-loop.
			statements.add(indent + "}");			
			statements.add(indent + "time(&end);");
			statements.add(indent + "diff = difftime(end, start);");
			statements.add(indent + "printf(\"Execution time:%.3lf seconds\", diff/iteration);");
		}
	}


	/**
	 * Iterates over the list of byte-code to generate the corresponding C code.  
	 * @param code_blk
	 * @param func_name
	 */
	public void IterateBytecode(List<Code> code_blk, String func_name){
		addTimerAndIterations(func_name);
		int line = 0;
		for(Code code: code_blk){
			//Get the Block.Entry
			if(config.isVerbose()){
				line = printWyILCode(code, func_name, line);
			}		
			addEndingTimer(func_name, code);
			dispatch(code);
		}
	}



	/**
	 * Prints out each bytecode with the line number and the correct indentation.
	 * @param name
	 * @param line
	 */
	private int printWyILCode(Code code, String name, int line){
		//Print out the bytecode using the format (e.g. 'main.9 [const %12 = 2345 : int]')
		if(code instanceof Codes.Label){
			System.out.println(name+"."+line+" ["+code+"]");
		}else{
			System.out.println(name+"."+line+" [\t"+code+"]");
		}
		return ++line;
	}


	/**
	 * Adds the type declaration for a variable.
	 * @param type the Whiley type
	 * @param var the name of variable
	 */
	private void addDeclaration(Type type, String var){
		if(type instanceof Type.Strung){
			//Check if the variable is given an array size. 
			if(var.contains("[") && var.contains("]")){
				vars.put(var, CodeGeneratorHelper.translate(type));
			}else{
				//If the size is not assigned, use the default size (1024).
				vars.put(var, CodeGeneratorHelper.translate(type));
			}			
		}else if (type instanceof Type.List){
			vars.put(var, CodeGeneratorHelper.translate(type));
			//add the additional parameter 'reg_size' to indicate the array size.
			vars.put(var+"_size", "size_t");
		}else{
			vars.put(var, CodeGeneratorHelper.translate(type));
		}		
	}



	/**
	 * Adds the statement to the list and 
	 * print out the statement if the verbose option is on.
	 * @param code the WyIL code 
	 * @param stat the C code 
	 */
	private void addStatement(Code code, String stat){
		//Add the WyIL code as a comment
		if(code != null){
			if(code instanceof Codes.Label && !(code instanceof Codes.LoopEnd)){
				//No indentation for label bytecode
				statements.add("//"+code.toString());
			}else{
				statements.add(indent+"//"+code.toString());
			}

		}		
		//Add the translated statement.
		if(stat != null){
			if(config.isVerbose()){
				System.out.println(stat);
			}
			statements.add(stat);
		}		
	}
	
	/**
	 * Check if the op is one of the input parameters.
	 * @param op
	 * @return true if op is the input parameter.
	 */
	private boolean isInputParameters(String op){
		if(params.containsKey(op)){
			return true;
		}		
		return false;
	}
	

	/**
	 * Translates the function or method declaration (e.g. <code>int* play(int* _0, int _0_size){</code>)
	 * @param functionOrMethod
	 */
	public String translate(FunctionOrMethodDeclaration functionOrMethod){
		String str = "";
		//Get the name
		String name = functionOrMethod.name();		
		if(name.equals("main")){
			str = "int main(int argc, char** argv";
		}else{
			//Get the return type
			FunctionOrMethod type = functionOrMethod.type();
			Type ret = type.ret();
			str += CodeGeneratorHelper.translate(ret)+" ";
			str += name + "(";
			boolean isfirst = true;
			int index = 0;	
			for(Type param :type.params()){
				if(isfirst){
					str += CodeGeneratorHelper.translate(param);
				}else{
					str += ", " + CodeGeneratorHelper.translate(param);
				}
				String op = prefix+index;
				//Put the input params into the lookup list.
				params.put(op, param);
				//Add the variable names
				str += " "+op;			
				//Add the extra 'size' param for the 'list' type
				if(param instanceof Type.List){
					String op_size = op+"_size";
					str +=", long long "+op_size;
					params.put(op_size, Type.Int.T_INT);
				}		

				isfirst = false;
				index++;
			}
		}	

		str += ")";
		if(config.isVerbose()){
			System.out.println(str);
		}


		return str;
	}
	/**
	 * Increase the indentation.
	 */
	private void increaseIndent(){
		this.indent += "\t";
	}
	/**
	 * Decrease the indentation.
	 */
	private void decreaseIndent(){
		this.indent = this.indent.replaceFirst("\t", "");
	}

	/**
	 * Check if the Bool type is used in the function.
	 * @return
	 */
	public boolean isBoolTypeIntroduced(){
		return sym_ctrl.isBoolTypeUsed();
	}


	public void printoutCode(PrintWriter writer, String function_del){
		//function declaration
		System.out.println(function_del+"{");
		writer.println(function_del+"{");
		//Var declaration
		//Sorts the variable declaration by variable names
		Map<String, String> sortedVars = new TreeMap<String, String>(vars);		
		for(Entry<String, String> var: sortedVars.entrySet()){
			System.out.println("\t"+var.getValue()+" "+var.getKey()+";");
			writer.println("\t"+var.getValue()+" "+var.getKey()+";");
		}
		sortedVars = null;
		//Statments
		for(String stat: statements){
			System.out.println(stat.toString());
			writer.println(stat.toString());
		}
		//Ending clause
		System.out.println("}");
		writer.println("}");
		//clear vars
		vars.clear();
		//Clear statements
		statements.clear();
		//Reset the indent
		indent = "\t";
	}


	/**
	 * Generates the code for <code>Codes.Const</code> code.
	 * @param code
	 */
	private void translate(Codes.Const code){
		String stat = null;
		String target = prefix+code.target();
		sym_ctrl.putAttribute(target, "type", code.assignedType());		
		if(code.assignedType() instanceof Type.Strung){
			Strung strung = (Strung) code.constant;
			//vars.put(target+"["+(strung.value.length()+1)+"]" , "char");			
			addDeclaration(Type.Strung.T_STRING, target+"["+(strung.value.length()+1)+"]");

			stat = indent + "strcpy("+target+", \""+strung.value+"\");";
		}else if(code.assignedType() instanceof Type.List){
			Constant.List list = (Constant.List) code.constant;
			//Initialize an array
			if(list.values.isEmpty()){
				stat = indent + target + "=(long long*)malloc(1*sizeof(long long));\n";
				stat += indent + target +"_size = 0;";
			}			
		}else{
			//Declare the variables
			//vars.put(prefix+code.target(), CodeGeneratorHelper.translate(code.assignedType()));
			addDeclaration(code.assignedType(), prefix+code.target());
			stat = indent +target + " = "+ code.constant + ";";
		}

		addStatement(code, stat);		
	}

	/**
	 * Generates the code for <code>Codes.Assign</code> code. For example,
	 * <p>
	 * <codeassign %1 = %10  : [int]</code>
	 * </p>
	 * can be translated into:
	 * <p>
	 * <code>_1 = _10;</code><br>
	 * <code>_1_size = _10_size;</code>
	 * </p>
	 * When we need to assign the input parameter(_0) to the new register, then  
	 * we need to clone the input and return the result pointer. For example,
	 * <p>
	 * <code>assign %4 = %0  : [int]</code>
	 * </p>
	 * can be translated into:
	 * <p>
	 * <code>_4 = clone(_0, _0_size);//call the clone method.</code><br>
	 * <code>_4_size = _0_size;//specify the array size</code><br>
	 * </p>
	 * 
	 * @param code
	 */
	private void translate(Codes.Assign code){
		String target = prefix+code.target();
		String op = prefix+code.operand(0);
		//long long* _11;
		addDeclaration(code.type(), target);
		if(code.type()instanceof Type.List){
			String target_size = target+"_size";
			//long long _11_size;
			addDeclaration(Type.Int.T_INT, target_size);
			String stat = "";
			//Check if the op is the input parameters or not.
			if(isInputParameters(op)){
				//_4 = clone(_0, _0_size);
				stat = indent + target + " = clone("+ op + ", "+ op+"_size);\n";
			}else{
				//_1 = _10;
				stat = indent + target + " = "+op +";\n";
			}			
			//_1_size = _10_size;
			stat += indent + target_size+" = "+op+"_size;";			
			addStatement(code, stat);
		}else{
			String stat = indent + target+ " = "+ op + ";";
			addStatement(code, stat);
		}
	}

	/**
	 * Generates the C code <code>Codes.Length</code> code.
	 * 
	 * @param code
	 */
	private void translate(Codes.LengthOf code){
		//vars.put(prefix+code.target(), CodeGeneratorHelper.translate(code.assignedType()));
		addDeclaration(code.assignedType(), prefix+code.target());		
		String stat = indent + prefix+code.target() + " = "+prefix+code.operand(0)+"_size;";
		addStatement(code, stat);
	}

	/**
	 * Generates the code for <code>Codes.BinaryOperator</code>
	 * @param code
	 */
	private void translate(Codes.BinaryOperator code){
		Type type = code.type();
		String target = prefix+code.target();
		String left = prefix+code.operand(0);
		String right = prefix+code.operand(1);
		//vars.put(target, CodeGeneratorHelper.translate(type));
		addDeclaration(type, target);
		String stat=indent;
		stat+= target+"="+left;
		switch(code.kind){
		case ADD:			
			stat+= "+"+right+";";
			break;
		case SUB:
			stat+= "-"+right+";";
			break;
		case MUL:
			stat+= "*"+right+";";
			break;
		case DIV:
			stat+= "/"+right+";";
			break;
		case REM:
			stat+= "%"+right+";";
			break;
		case RANGE:
			stat = null;
			//Generate the for-loop condition.		
			loop_condition = code;			
			break;
		case BITWISEOR:
			break;
		case BITWISEXOR:
			break;
		case BITWISEAND:
			break;
		case LEFTSHIFT:
			break;
		case RIGHTSHIFT:
			break;
		}
		addStatement(code, stat);
	}

	/**
	 * Generates the code for <code>Codes.ForAll</code> code
	 * @param code
	 */
	private void translate(Codes.ForAll code){
		String stat = "";
		String index = prefix+code.indexOperand;
		//vars.put(index, CodeGeneratorHelper.translate(code.type.element()));
		addDeclaration(code.type.element(), index);
		if(loop_condition != null){
			//get starting value
			String start = prefix+loop_condition.operand(0);
			String end = prefix+loop_condition.operand(1);
			vars.remove(prefix+code.sourceOperand);
			//The expression for loop condition.
			stat += indent + "for("+index+"="+start+";"+index+"<"+end+";"+index+"++){";						
			loop_condition = null;
		}else{
			//index variable
			//vars.put("index", "long long");
			addDeclaration(Type.Int.T_INT, "index");
			String sourceOp = prefix+code.sourceOperand;
			stat += indent + "for(index=0;index<"+sourceOp+"_size;index++){\n";
			stat += indent + "\t"+index+"="+sourceOp+"[index];\n";
		}
		addStatement(code, stat);
		//Add the indentation
		increaseIndent();
	}

	/**
	 * Generates the code for input parameters of a function call. This functions adds parameters to the parameter list
	 * and check if parameter type is a list add '_size' variable to the parameter list.   
	 * 
	 * @param params the registers
	 * @param paramTypes the parameter types using wildcard type
	 * @return parameter list 
	 */
	private String translateParameters(int[] operands, List<?> paramTypes){
		String stat = "";
		boolean isFirst = true;
		int index =0;
		for(int op: operands){
			String param = prefix+op;			
			if(isFirst){
				stat+= param;
				isFirst = false;
			}else{
				stat+= " ,"+param;
			}
			//Add the '*_size' parameter 
			Type paramType = (Type) paramTypes.get(index);
			if(paramType instanceof Type.List){
				stat += " , "+param+"_size";
			}						
			index++;
		}	
		return stat;
	}

	/**
	 * Generates C code for 'Any.toString' function, which casts one parameter of any type to a string. 
	 * Currently there are two kinds of conversion.  
	 * <ul>
	 * <li>using 'sprinf' function to cast an integer into a list of chars;</li>
	 * <li>using naive 'toString' function to cast a list of integers or booleans into a list of chars.</li>
	 * </ul>
	 * For example, the following WyIL code:
	 * <p><code>invoke %26 = (%26) whiley/lang/Any:toString : function(any) => string</code></p>
	 * can be translated into the C code:
	 * <p><code>sprintf(_26_str, "%lld", _26);</code></p>
	 * Another case is 
	 * <p><code>invoke %17 = (%18) whiley/lang/Any:toString : function(any) => string</code></p>
	 * can be translated into the C code:
	 * <p><code>_17 = (char*)malloc((_18_size)*sizeof(long long));</code><br>
	 * <code>toString(_18 , _18_size, _17);</code></p>
	 * @param code
	 * @return the generated C code for 'Any.ToString' function call.
	 */
	private String transalteWhileyAnyToString(Codes.Invoke code){
		String stat = indent;
		String ret = prefix+code.target();
		Type return_type = code.type().ret();
		//Check if the input parameter is also the return_reg
		String param = prefix+code.operand(0); 
		if(ret.equals(param)){
			//Create a temporary string variable ''	
			ret = ret+"_str";	
		}						
		addDeclaration(return_type, ret);
		//Input parameters
		Type paramType = (Type) sym_ctrl.getAttribute(param, "type");
		//Cast the input as a string				
		if(paramType instanceof Type.Int){

			stat += "sprintf("+ret+", \"%lld\", "+ prefix+code.operand(0)+");";					
		}else{
			//_17 = (char*)malloc((_18_size)*sizeof(long long));
			stat += prefix+code.target()+" = (char*)malloc(("+prefix+code.operand(0)+"_size*sizeof(long long)));\n";
			stat += indent+"toString(";
			//Get type attribute
			stat += translateParameters(code.operands(), (List<?>)sym_ctrl.getAttributes(code.operands(), prefix, "type"));
			stat += ", "+ret+");";
		}
		return stat;
	}


	/**
	 * Produces the code for <code>Codes.Invoke</code> code. For example, the following WyIL code:
	 * <p><code>invoke %18 = (%1) BoolList_Valid_2:play : function([bool]) => [bool]</code></p>
	 * can be translated into the following C code:
	 * <p><code>_18_size=_1_size;
	 * _18=play(_1 , _1_size);</code></p>	  
	 * If the WyIL code calls <code>Any.toString</code>, then use the {@link #transalteWhileyAnyToString(Codes.Invoke)} function. 
	 * <p>TODO The size of the returned list requires the symbolic analysis.
	 * @param code 
	 */
	private void translate(Codes.Invoke code){
		String stat = "";
		//The code for calling the whiley.lang.any.toString() function.
		if(code.name.toString().equals("whiley/lang/Any:toString")){
			stat = transalteWhileyAnyToString(code);		
		}else{
			String ret = prefix+code.target();
			Type return_type = code.type().ret();
			addDeclaration(return_type, ret);
			//Assign the value of 'return_size' variable.
			if(return_type instanceof Type.List){
				String ret_size = ret+"_size";
				//Check if any parameter is also a list. 
				stat += indent+ret_size + "=";				
				for(int index=0;index<code.operands().length;index++){
					Type type = code.type().params().get(index);
					if(type instanceof Type.List){
						//Assign both of lists to have the same array size, e.g. '_17_size = _1_size;'
						stat += prefix+code.operand(index)+"_size;\n";
					}
				}				
			}			
			stat += indent + ret+ "="+code.name.name()+"(";
			//input parameters
			stat += translateParameters(code.operands(), code.type().params());
			stat += ");";						
		}
		//add the statement
		addStatement(code, stat);
	}

	/**
	 * Generates the code for <code>Codes.If</code> code
	 * @param code
	 */
	private void translate(Codes.If code){
		String stat = indent;
		String left = prefix+code.leftOperand;
		String right = prefix+code.rightOperand;
		//Check if the condition is a loop condition.
		if(loop_label != null && assert_labels.isEmpty()){
			stat += "while("+left;
			//The negated operator
			switch(code.op){
			case EQ:
				stat+="!=";
				break;
			case NEQ:
				stat+="==";
				break;
			case LT:
				stat+=">=";
				break;
			case LTEQ:
				stat+=">";
				break;
			case GT:
				stat+="<=";
				break;
			case GTEQ:
				stat+="<";
				break;
			case IN:
				break;
			case SUBSET:
				break;
			case SUBSETEQ:
				break;
			}
			stat += right;
			stat +="){";
			//Increase the indent
			increaseIndent();
			loop_label = null;
		}else{
			stat += "if("+left;
			//The condition
			switch(code.op){
			case EQ:
				stat+="==";
				break;
			case NEQ:
				stat+="!=";
				break;
			case LT:
				stat+="<";
				break;
			case LTEQ:
				stat+="<=";
				break;
			case GT:
				stat+=">";
				break;
			case GTEQ:
				stat+=">=";
				break;
			case IN:
				break;
			case SUBSET:
				break;
			case SUBSETEQ:
				break;
			}
			stat += right;
			stat +="){";
			stat += "goto "+code.target+";";
			stat +="}";
		}
		addStatement(code, stat);	

	}

	private void translate(Codes.AssertOrAssume code){
		//Add the starting clause for the assertion
		addStatement(code, indent+"{");
		//Increase the indent
		indent += "\t";
		assert_labels.push(code.target);
	}


	private void translate(Codes.Goto code){
		String stat = indent;
		stat += "goto "+code.target+";";
		addStatement(code, stat);		
	}


	private void translate(Codes.Label code){		
		//Check if the label is equal to assert_label
		if(assert_labels.contains(code.label)){
			//pop up the label from the stack.
			assert_labels.pop();
			decreaseIndent();
			//Ending clause.
			addStatement(null, indent+"}");
		}
		addStatement(code, code.label+":;");
	}

	/**
	 * Prints out the message and Generates the stderr, followed by exit  
	 * @param code
	 */
	private void translate(Codes.Fail code){		
		String stat = indent+"fprintf(stderr,\""+code+"\");\n";
		stat += indent+"exit(0);";
		addStatement(code, stat);		
	}

	private void translate(Codes.Update code){
		String stat = indent;
		//For List type only
		if(code.type() instanceof Type.List){
			stat += prefix+code.target()+"["+prefix+code.operand(0)+"] = "+prefix+code.result()+";";
			addStatement(code, stat);				
		}		
	}

	private void translate(Codes.Nop code){
		//Do nothing
		String stat = indent+";";
		addStatement(code, stat);	
	}

	private void translate(Codes.LoopEnd code){
		//decrease the indent
		indent = indent.replaceFirst("\t", "");
		addStatement(code, indent+"}");
		loop_label= null;
	}

	private void translate(Codes.Return code){
		String stat = indent;
		//If operand == -1, then no return value.
		if(code.operand != -1){
			stat += "return "+prefix+code.operand+";";
		}else{
			//The return value of main function.
			stat += "return -1;";
		}
		addStatement(code, stat);			
	}

	private void translate(Codes.IndexOf code){
		EffectiveIndexible type = code.type();
		//vars.put(prefix+code.target(), CodeGeneratorHelper.translate(type.element()));
		addDeclaration(type.element(), prefix+code.target());

		String stat = indent;
		stat += prefix+code.target() + "="+prefix+code.operand(0)
				+"["+prefix+code.operand(1)+"];";
		addStatement(code, stat);		
	}


	private void translate(Codes.NewList code){		
		String stat = indent;
		String target = prefix+code.target();
		String type = CodeGeneratorHelper.translate(code.type());		
		//Allocate the memory for the list
		//vars.put(target, type);
		addDeclaration(code.type(), target);
		//Add the 'target_size' variable to indicate the length of the list
		String target_size = target+"_size";
		//vars.put(target_size, "long long");
		addDeclaration(Type.Int.T_INT, target_size);
		//Statements
		stat = indent + target + "=("+type+")malloc("+(code.operands().length)+"*sizeof("+CodeGeneratorHelper.translate(code.type().element())+"));\n";
		stat += indent + target_size+"="+ code.operands().length+";";
		addStatement(code, stat);
		//Initialize the all the elements.
		int index = 0;
		for(int operand: code.operands()){
			stat = indent+target+"["+index+"]="+prefix+operand+";";
			addStatement(code, stat);
			index++;
		}

	}
	/**
	 * TODO: Not implemented.
	 * @param code
	 */
	private void translate(Codes.FieldLoad code){
		/*Type param = params.get(code.operand(0));
		if(param != null){
			if(param instanceof Type.Record){
				Type.Record record = (Type.Record) param;
				Type fieldType = record.field(code.field);
			}
		}*/
		String field = code.field;
		Type fieldType = code.fieldType();
		params.put(prefix+code.target(), fieldType);
		addStatement(code, null);		
	}
	/**
	 * TODO: Not implemented.
	 * @param code
	 */
	private void translate(Codes.Convert code){		
		//Converts Constant to Any type
		if(code.result instanceof Type.Any){
			sym_ctrl.putAttribute(prefix+code.operand(0), "type", code.type());			
			//Do nothing.			
		}
		addStatement(code, null);
	}

	/**
	 * Generates the C code for <code>Codes.IndirectInvoke</code>.
	 * TODO : generalize the code generation.
	 * @param code
	 */
	private void translate(Codes.IndirectInvoke code){
		String stat = "";
		if(code.type() instanceof Type.FunctionOrMethod){
			//Hard-coded temporarily.
			String op = prefix+code.parameter(0);
			stat += indent + "printf(\"%s\\n\","+op+");\n";
			//free the malloc of op
			stat += indent + "free("+op+");";
		}		
		addStatement(code, stat);		
	}


	private void translate(UnaryOperator code) {		
		String target = prefix+code.target();
		//vars.put(target, CodeGeneratorHelper.translate(code.type()));
		addDeclaration(code.type(), target);
		String stat = indent + target+"= -"+prefix+code.operand(0)+";";
		addStatement(code, stat);		
	}

	private void translate(Loop code) {		
		loop_label = code.target;
		addStatement(code, null);
	}

	private void translate(StringOperator code) {
		String stat = "";
		String target = prefix+code.target();
		//vars.put(target+"[1024]", "char");		
		addDeclaration(code.type(), target);

		String left = prefix+code.operand(0);
		String right = prefix+code.operand(1);

		//Check the operator
		switch (code.kind){
		case APPEND:
			stat += indent + "strcpy("+target+", "+left+");\n";
			stat += indent + "strcat("+target+", "+right+"_str);";
			break;
		case LEFT_APPEND:

			break;
		case RIGHT_APPEND:

		default:
			break;
		}
		addStatement(code, stat);
	}

	/**
	 * Translates the append byte-code. For example, 
	 * <p>
	 * <code>append %10 = %1, %9 : [int]</code>
	 * </p>
	 * can be translated into:
	 * <p>
	 * <code>_10_size = _1_size+_9_size;//new array size.</code><br>
	 * <code>_10=append(_1, _1_size,_9, _9_size);//call the 'append' function.<code><br>
	 * <code>free(_9);</code>
	 * </p>
	 * 
	 * @param code
	 */
	private void translate(ListOperator code) {
		String target = prefix+code.target();
		//long long* _10;
		addDeclaration((Type) code.type(), target);
		//long long _10_size; 
		addDeclaration(Type.Int.T_INT, target+"_size");
		
		//_10_size = _1_size+_9_size;
		String stat = indent+target+"_size = ";
		boolean isFirst = true;
		for(int operand: code.operands()){
			String op = prefix + operand;
			if(isFirst){
				stat += op+"_size";
			}else{
				stat += "+"+op+"_size";
			}
			isFirst = false;
		}
		stat +=";\n";
		//Calls the append function.
		stat += indent + target+ "=append(";
		isFirst = true;
		for(int operand: code.operands()){
			String op = prefix + operand;
			if(isFirst){
				stat += op+", "+op+"_size";
			}else{
				stat += ","+op+", "+op+"_size";
			}
			isFirst = false;
		}
		stat += ");\n";
		
		//Free the op_2, because op_2 has been appended to the op_1. 
		stat += indent+"free("+prefix+code.operand(1)+");";
		
		//Put it to the statement list.
		addStatement(code, stat);
	}

	/**
	 * Checks the type of the wyil code and dispatches the code to the analyzer for
	 * being executed by the <code>analyze(code)</code> 
	 * @param entry
	 */
	public void dispatch(Code code){
		try{
			//enable the assertion 
			if (code instanceof Codes.AssertOrAssume) {
				translate((Codes.AssertOrAssume)code);
			}else if (code instanceof Codes.Assign) {			
				translate((Codes.Assign)code);
			} else if (code instanceof Codes.BinaryOperator) {			
				translate((Codes.BinaryOperator)code);
			}  else if (code instanceof Codes.Convert) {			
				translate((Codes.Convert)code);
			} else if (code instanceof Codes.Const) {			
				translate((Codes.Const)code);
			} else if (code instanceof Codes.Debug) {
				internalFailure("Not implemented!", code.toString() , null);
			} else if (code instanceof Codes.Dereference) {
				internalFailure("Not implemented!", code.toString() , null);
			} else if (code instanceof Codes.Fail) {
				translate((Codes.Fail)code);
			} else if (code instanceof Codes.FieldLoad) {		
				translate((Codes.FieldLoad)code);			
			} else if (code instanceof Codes.ForAll) {				
				translate((Codes.ForAll)code);
			} else if (code instanceof Codes.Goto) {	
				translate((Codes.Goto)code);
			} else if (code instanceof Codes.If) {
				translate((Codes.If)code);			
			} else if (code instanceof Codes.IfIs) {
				internalFailure("Not implemented!", code.toString() , null);
			} else if (code instanceof Codes.IndexOf) {			
				translate((Codes.IndexOf)code);
			} else if (code instanceof Codes.IndirectInvoke) {			
				translate((Codes.IndirectInvoke)code);
			} else if (code instanceof Codes.Invoke) {			
				translate((Codes.Invoke)code);
			} else if (code instanceof Codes.Invert) {
				internalFailure("Not implemented!", code.toString() , null);
			} else if (code instanceof Codes.ListOperator) {
				translate((Codes.ListOperator)code);
			} else if (code instanceof Codes.Loop) {			
				translate((Codes.Loop)code);			
			} else if (code instanceof Codes.LoopEnd) {
				translate((Codes.LoopEnd)code);									
			} else if (code instanceof Codes.Label) {
				translate((Codes.Label)code);
			} else if (code instanceof Codes.Lambda) {
				internalFailure("Not implemented!", code.toString() , null);
			} else if (code instanceof Codes.LengthOf) {			
				translate((Codes.LengthOf)code);
			}  else if (code instanceof Codes.Move) {
				internalFailure("Not implemented!", code.toString() , null);
			} else if (code instanceof Codes.NewMap) {
				internalFailure("Not implemented!", code.toString() , null);
			} else if (code instanceof Codes.NewList) {			
				translate((Codes.NewList)code);
			} else if (code instanceof Codes.NewRecord) {
				internalFailure("Not implemented!", code.toString() , null);
			} else if (code instanceof Codes.NewSet) {
				internalFailure("Not implemented!", code.toString() , null);
			} else if (code instanceof Codes.NewTuple) {
				internalFailure("Not implemented!", code.toString() , null);
			} else if (code instanceof Codes.Return) {			
				translate((Codes.Return)code);
			} else if (code instanceof Codes.NewObject) {
				internalFailure("Not implemented!", code.toString() , null);
			} else if (code instanceof Codes.Nop) {
				translate((Codes.Nop)code);
			} else if (code instanceof Codes.SetOperator){
				internalFailure("Not implemented!", code.toString() , null);
			} else if (code instanceof Codes.StringOperator) {
				translate((Codes.StringOperator)code);
			} else if (code instanceof Codes.SubList) {
				internalFailure("Not implemented!", code.toString() , null);
			} else if (code instanceof Codes.SubString) {
				internalFailure("Not implemented!", code.toString() , null);
			} else if (code instanceof Codes.Switch) {
				internalFailure("Not implemented!", code.toString() , null);
			} else if (code instanceof Codes.Throw) {
				internalFailure("Not implemented!", code.toString() , null);
			} else if (code instanceof Codes.TryCatch) {
				internalFailure("Not implemented!", code.toString() , null);
			} else if (code instanceof Codes.TupleLoad) {
				internalFailure("Not implemented!", code.toString() , null);
			} else if (code instanceof Codes.UnaryOperator){
				translate((Codes.UnaryOperator)code);
			} else if (code instanceof Codes.Update) {
				translate((Codes.Update)code);
			} else {
				internalFailure("unknown wyil code encountered (" + code + ")", "", null);
			}		

		} catch (SyntaxError ex) {
			throw ex;	
		} catch (Exception ex) {		
			internalFailure(ex.getMessage(), "", null, ex);
		}

	}







}
