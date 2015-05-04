package wyopcl.translator.generator;

import static wycc.lang.SyntaxError.internalFailure;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Stack;
import java.util.TreeMap;

import wycc.lang.SyntaxError;
import wyil.attributes.VariableDeclarations;
import wyil.attributes.VariableDeclarations.Declaration;
import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Codes.BinaryOperator;
import wyil.lang.Codes.ListOperator;
import wyil.lang.Codes.Loop;
import wyil.lang.Codes.UnaryOperator;
import wyil.lang.Constant;
import wyil.lang.Type;
import wyil.lang.Type.EffectiveIndexible;
import wyil.lang.WyilFile.FunctionOrMethod;
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
	private final FunctionOrMethod functionOrMethod;
	private final VariableDeclarations var_declarations;
	private String indent="\t";
	private String func_declaration;//function declaration.
	private LinkedHashMap<String, Type> vars;//stores the variable declaration and preserve the insertion orders of variables.
	private ArrayList<String> statements;//store the list of translated C code.	
	private Boolean is_loop_condition;//indicate whether the condition is a loop condition. 
	
	public CodeGenerator(Configuration config, FunctionOrMethod functionOrMethod){
		this.config = config;
		this.functionOrMethod = functionOrMethod;
		this.var_declarations = this.functionOrMethod.attribute(VariableDeclarations.class);
		this.vars = new LinkedHashMap<String, Type>();
		this.statements = new ArrayList<String>();
		this.is_loop_condition = false;
	}
	/**
	 * Add the statements about iterations.
	 *//*
	private void addStartingIteration(String func_name, Code code){
		// Adds the timer to measure the starting time at the main method
		if(func_name.equals("main")&& code instanceof Codes.Invoke){
			//Get the invoke code 
			Codes.Invoke invoked = (Codes.Invoke)code;
			if(invoked.name.name().equals("reverse")){
				//Add the number of iteration
				vars.put("iteration", Type.Int.T_INT);
				//Add variable declaration
				vars.put("start", "clock_t");
				vars.put("end", "clock_t");
				vars.put("diff", "double");
				//Add a file pointer
				vars.put("*fp", "FILE");				
				statements.add(indent + "diff=0;");
				//Initial the return value
				statements.add(indent +prefix+invoked.target()+"=NULL;");
				//Use the for-loop to repeatedly execute the function.
				statements.add(indent + "for(iteration=0;iteration<10;iteration++){");
				increaseIndent();
				//Add the starting timer
				statements.add(indent + "start = clock();");
				//check if the return reg is null. If so, nullify it.
				statements.add(indent +"if("+prefix+invoked.target()+ "!= NULL){ free("+prefix+invoked.target()+");}");			
			}
		}
	}
*/
	/**
	 * Adds a block of code to free any variable whose type is a list as the array in C is allocated by malloc.
	 */
	private void free_varaibles(){
		//Iterate the variables and adds statements to free the list variables.
		for(Map.Entry<String, Type> var: vars.entrySet()){
			//Get variable name
			String var_name = var.getKey();
			Type type = var.getValue();
			//Check if the type is an array (pointer of pointer). 
			if(type !=null && type instanceof Type.List){
				//Free the variable.
				statements.add(indent+"free("+var_name+");");
			}
		}	
	}
	
/*
	*//**
	 * Adds the ending timer and calculate the execution time
	 * @param func_name
	 *//*
	private void addEndingIteration(String func_name, Code code){
		//Adds the ending time and calculate and print out the execution time
		if(func_name.equals("main") && code instanceof Codes.Invoke){
			Codes.Invoke invoked = (Codes.Invoke)code;
			if(invoked.name.name().equals("reverse")){
				//Add the ending timer
				statements.add(indent + "end = clock();");
				//Print out .
				//Create a file
				statements.add(indent + "fp= fopen(\"result.txt\", \"a\");");
				//Write out the execution time of each iteration to the txt file.
				//This is hard-coded
				statements.add(indent + "fprintf(fp, \"Array size:%lld\\t"
						+ "Execution time of reverse function(seconds):%.10lf\\n\""
						+ ", _4, ((double)(end - start))/CLOCKS_PER_SEC);");
				//Close the txt file
				statements.add(indent+"fclose(fp);");
				statements.add(indent + "diff += end - start;");	
				decreaseIndent();
				//The end of iteration while-loop.
				statements.add(indent + "}");
				statements.add(indent + "printf(\"Execution time:%.10lf seconds\", diff/(CLOCKS_PER_SEC*iteration));");
			}			
		}
	}*/


	/**
	 * Iterates over the list of byte-code to generate the corresponding C code.  
	 * @param code_blk
	 * @param func_name
	 */
	public void iterateOverCodeBlock(List<Code> code_blk){
		
		int line = 0;
		for(Code code: code_blk){
			//addStartingIteration(func_name, code);
			//Get the Block.Entry
			if(config.isVerbose()){
				line = printWyILCode(code, line);
			}
			dispatch(code);
			//addEndingIteration(func_name, code);
		}
	}



	/**
	 * Prints out each bytecode with the line number and the correct indentation.
	 * @param name
	 * @param line
	 */
	private int printWyILCode(Code code, int line){
		//Print out the bytecode using the format (e.g. 'main.9 [const %12 = 2345 : int]')
		if(code instanceof Codes.Label){
			System.out.println(this.functionOrMethod.name()+"."+line+" ["+code+"]");
		}else{
			System.out.println(this.functionOrMethod.name()+"."+line+" [\t"+code+"]");
		}
		return ++line;
	}


	/**
	 * Adds the type declaration for a variable. But serveral types are not added to the table. For example,
	 * <pre><code>
	 * method(any) -> void
	 * </code></pre>
	 * @param type the Whiley type
	 * @param var the name of variable
	 */
	private void addDeclaration(Type type, String var){
		/*//Check if the type is an unknown type. If so, then do not add the variable.
		if(type instanceof Type.Nominal){
			return;
		}*/
		//Check if the type is a record and its field contains "println" .
		if(type instanceof Type.Record){
			Type.Record record = (Type.Record)type;
			 //If so, then the record loads the "println" from the sys.out.console.
			//At this stage, we dont use this record.
			if(record.field("println")!=null){
				return;
			}
		}
		
		if(type instanceof Type.Method){
			return;
		}
		
		
		if (type instanceof Type.List){
			vars.put(var, type);
			//add the additional parameter 'reg_size' to indicate the array size.
			vars.put(var+"_size", Type.Int.T_INT);
		}else{
			vars.put(var, type);
		}
	}

	/**
	 * Get the variable declaration of the given operand.
	 * @param var
	 * @return Type declaration. Otherwise, return null;
	 */
	private Type getVarDeclaration(String var){
		if(vars.containsKey(var)){
			return vars.get(var);
		}
		return null;
	}
	
	/**
	 * Check if the register is an input parameter of the function. 
	 * @param reg 
	 * @return
	 */
	private boolean isInputParameter(int reg){
		//Check if the register number is less than the input parameter sizes. 
		//If so, then the register is an input.
		if(reg<this.functionOrMethod.type().params().size()){
			return true;
		}		
		return false;
	}
	
	
	/**
	 * Get the variable name of the given register
	 * @param reg the register 
	 * @return the variable name (starting with "_x")
	 */
	private String getVarName(int reg){
		Declaration declaration = var_declarations.get(reg);
		if(declaration != null){
			String name = declaration.name();
			if(name!=null && !name.isEmpty()){
				return prefix+name;
			}
		}
		return prefix+reg;
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
			if(code instanceof Codes.Label){
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
	 * Translates the function or method declaration (e.g. <code>int* play(int* _0, int _0_size){</code>)
	 * @param functionOrMethod the code block of a function
	 * @return func_declartion the function signature.
	 */
	public String declareFunction(){
		//Get the name
		String name = functionOrMethod.name();		
		if(name.equals("main")){
			func_declaration = "int main(int argc, char** argv)";
		}else{
			func_declaration ="";
			//Get the type info
			wyil.lang.Type.FunctionOrMethod type = functionOrMethod.type();
			//Get the return type
			func_declaration += translate(type.ret())+" ";
			func_declaration += name + "(";
			boolean isfirst = true;
			int register = 0;
			for(Type param :type.params()){
				if(isfirst){
					func_declaration += translate(param);
				}else{
					func_declaration += ", " + translate(param);
				}
				String var = getVarName(register);
				//Add the variable names
				func_declaration += " "+var;			
				//If the variable is an array, then add the extra 'size' variable.
				if(param instanceof Type.List){
					String var_size = var+"_size";
					func_declaration +=", long long "+var_size;
				}
				isfirst = false;
				register++;
			}
			func_declaration += ")";
		}	

		if(config.isVerbose()){
			System.out.println(func_declaration);
		}
		return func_declaration;
	}
	/**
	 * Local variables are defined and initialized with values at the top of the code block.
	 */
	public void declareVariables(){
		//Iterate over the list of registers.
		for(int reg=0;reg<var_declarations.size();reg++){
			Declaration declaration = var_declarations.get(reg);
			//Get the variable name.
			String name = getVarName(reg);
			addDeclaration(declaration.type(), name);
		}
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
	 * Write out the generated C code, which starts with variable declarations, followed by 
	 * a list of statements and a list of free statements at the end.
	 * @param writer
	 */
	public void writeCodeToFile(PrintWriter writer){
		//function declaration
		writer.println(func_declaration+"{");
		//Variable declaration with initial values.
		int reg = 0;
		for(Entry<String, Type> var: vars.entrySet()){
			//If the register is not an input.
			if(!isInputParameter(reg)){
				String var_name = var.getKey();
				Type var_type = var.getValue();
				//Assign the initial values for local variables.
				String init = "";
				if(var_type instanceof Type.List){
					init = "NULL";
				}else if(var_type instanceof Type.Int){
					init = "0";
				}
				//Write out the variable declaration.
				writer.println("\t"+translate(var_type)+" "+var_name+" = "+init+";");
			}
			//increment the register.
			reg++;
		}
		//Statments
		for(String stat: statements){
			writer.println(stat.toString());
		}
		//Ending clause
		writer.println("}");
		//clear vars
		vars.clear();
		//Clear statements
		statements.clear();
		//Reset the indent
		indent = "\t";
	}


	/**
	 * Generates the C code for Codes.Const byte-code. For example,
	 * <pre><code>const %1 = 10 : int</code></pre> 
	 * can be translated into:
	 * <pre><code>_1 = 10;</code></pre>
	 * @param code
	 * @see Codes.Const
	 */
	private void translate(Codes.Const code){
		String stat = null;
		String target = getVarName(code.target());	
		if(code.assignedType() instanceof Type.List){
			Constant.List list = (Constant.List) code.constant;
			//Initialize an array
			if(list.values.isEmpty()){
				stat = indent + target + "=(long long*)malloc(1*sizeof(long long));\n";
				stat += indent +"if("+target+" == NULL) {fprintf(stderr,\"fail to malloc\"); exit(0);}\n";
				stat += indent + target +"_size = 0;";
			}			
		}else{
			//Add a statement
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
			is_loop_condition = true;			
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
	 * Produces the code for <code>Codes.Invoke</code> code. For example, the following WyIL code:
	 * <p><code>invoke %18 = (%1) BoolList_Valid_2:play : function([bool]) => [bool]</code></p>
	 * can be translated into the following C code:
	 * <p><code>_18_size=_1_size;
	 * _18=play(_1 , _1_size);</code></p>	  
	 * If the WyIL code calls <code>Any.toString</code>, then use the {@link #transalteWhileyAnyToString(Codes.Invoke)} function.
	 * 
	 * <p>TODO The size of the returned list requires the symbolic analysis.
	 * @param code 
	 */
	private void translate(Codes.Invoke code){		
		String stat = "";
		//The code for calling the whiley.lang.any.toString() function.
		if(code.name.toString().equals("whiley/lang/Any:toString")){
			//stat = transalteWhileyAnyToString(code);		
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
	 * Translated the Whiley comparator into C comparison operators, e.g. EQ := '=='.
	 * If the negated option is provided, then the comparator is first negated and then converted 
	 * into C code. 
	 * @param op Whiley comparator
	 * @param isNegated true if the comparator needs the negation.
	 * @return the C comparsion operator.
	 */
	private String translate(Codes.Comparator op, boolean isNegated){
		if(isNegated){
			//The negated operator
			switch(op){
			case EQ:
				return "!=";
			case NEQ:
				return "==";
			case LT:
				return ">=";
			case LTEQ:
				return ">";
			case GT:
				return "<=";
			case GTEQ:
				return "<";
			default:
				return null;
			}
		}else{
			//The condition
			switch(op){
			case EQ:
				return "==";
			case NEQ:
				return "!=";
			case LT:
				return "<";
			case LTEQ:
				return "<=";
			case GT:
				return ">";
			case GTEQ:
				return ">=";
			default:
				return null;
			}
		}
		
	}
	
	
	/**
	 * Generates the code for <code>Codes.If</code> code. For example, 
	 * <pre><code>
	 * ifge %0, %1 goto blklab0 : int
	 * </code></pre>
	 * can be translated into:
	 * <pre><code>
	 * if( _0 >= _1) { goto blklab0;}
	 * </code></pre>
	 * @param code <code>Codes.If</code> code
	 */
	private void translate(Codes.If code){
		String statement = indent;
		String left = getVarName(code.leftOperand);
		String right = getVarName(code.rightOperand);
		//Check if the condition is a loop condition.
		if(is_loop_condition){
			statement += "while("+left;
			//The negated operator
			statement += translate(code.op, true);
			statement += right;
			statement +="){";
			//Increase the indent
			increaseIndent();
			is_loop_condition = false;
		}else{
			statement += "if("+left;
			//The condition
			statement += translate(code.op, false);
			statement += right;
			statement +="){";
			statement += "goto "+code.target+";";
			statement +="}";
		}
		addStatement(code, statement);
	}

	private void translate(Codes.AssertOrAssume code){
		//Add the starting clause for the assertion
		addStatement(code, indent+"{");
		//Increase the indent
		indent += "\t";
	}


	private void translate(Codes.Goto code){
		String stat = indent;
		stat += "goto "+code.target+";";
		addStatement(code, stat);		
	}

	/**
	 * Translated the <code>Codes.Label</code> byte-code into C code. For example,
	 * <pre><code>
	 * .blklab0
	 * </code></pre>
	 * can be translated into 
	 * <pre><code>
	 * blklab0:
	 * </code></pre>
	 * @param code Codes.Lable byte-code
	 * 
	 */
	private void translate(Codes.Label code){		
		/*//Check if the label is equal to assert_label
		if(assert_labels.contains(code.label)){
			//pop up the label from the stack.
			assert_labels.pop();
			decreaseIndent();
			//Ending clause.
			addStatement(null, indent+"}");
		}*/
		addStatement(code, code.label+":");
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
	/**
	 * Translates the <code>Codes.Return</code> byte-code into C code. For example,
	 * <pre><code>
	 * return %4 : int
	 * </code></pre>
	 * can be translated into 
	 * <pre><code>
	 * return _4;
	 * </code></pre>
	 * @param code
	 */
	private void translate(Codes.Return code){
		String statement = indent;
		//If operand == -1, then no return value.
		if(code.operand != -1){
			statement += "return "+getVarName(code.operand)+";";
		}else{
			free_varaibles();
			//The return value of main function.
			statement += "return -1;";
		}
		addStatement(code, statement);			
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
		String type = translate(code.type());		
		//Allocate the memory for the list
		//vars.put(target, type);
		addDeclaration(code.type(), target);
		//Add the 'target_size' variable to indicate the length of the list
		String target_size = target+"_size";
		//vars.put(target_size, "long long");
		addDeclaration(Type.Int.T_INT, target_size);
		//Statements
		stat = indent + target + "=("+type+")malloc("+(code.operands().length)+"*sizeof("+translate(code.type().element())+"));\n";
		stat += indent + "if("+target+" == NULL) {fprintf(stderr,\"fail to malloc\"); exit(0);}\n";
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
	 * Translates FieldLoad byte-code into C code. At this stage, the field load code that loads <code>System.out.println</code>
	 * is not translated into any C code.
	 * @param code
	 * @throws Exception 
	 */
	private void translate(Codes.FieldLoad code) throws Exception{
		/*Type param = params.get(code.operand(0));
		if(param != null){
			if(param instanceof Type.Record){
				Type.Record record = (Type.Record) param;
				Type fieldType = record.field(code.field);
			}
		}*/
		String field = code.field;
		if(field.equals("out")|| field.equals("println")){
			addStatement(code, null);
		}else{
			throw new Exception("Not implemented!");
		}
		
		
			
	}
	/**
	 * TODO: Not implemented.
	 * @param code
	 */
	private void translate(Codes.Convert code){		
		//Converts Constant to Any type
		if(code.result instanceof Type.Any){
			//sym_ctrl.putAttribute(prefix+code.operand(0), "type", code.type());			
			//Do nothing.			
		}
		addStatement(code, null);
	}

	/**
	 * Generates the C code for <code>Codes.IndirectInvoke</code>. For example, 
	 * <pre><code>
	 * fieldload %2 = %1 println : {method(any) -> void print,method([int]) -> void print_s,method(any) -> void println,method([int]) -> void println_s}
	 * invoke %3 = (%4) IfElse_Valid_2:f : function(int) -> int
	 * indirectinvoke %2 (%3) : method(any) -> void
	 * </code></pre>
	 * can be translated into
	 * <pre><code>
	 * indirect_printf(_3);
	 * </code></pre>
	 * where 'indirect_printf' function is defined in 'Util.c'.
	 * 
	 * @param code Codes.IndirectInvoke byte-code
	 * 
	 */
	private void translate(Codes.IndirectInvoke code){
		String statement = "";
		if(code.type() instanceof Type.FunctionOrMethod){
			String var = getVarName(code.parameter(0));
			//Get input type
			Type type = getVarDeclaration(var);
			if(type instanceof Type.List){
				//Added the additional 'array_size' variable to indicate the length of an array.
				statement += indent + "indirect_printf("+var+", "+var+"_size);\n";
			}else if(type instanceof Type.Int){
				statement += indent + "indirect_printf("+var+");\n";
			}			
		}		
		addStatement(code, statement);
	}


	private void translate(UnaryOperator code) {		
		String target = prefix+code.target();
		//vars.put(target, CodeGeneratorHelper.translate(code.type()));
		addDeclaration(code.type(), target);
		String stat = indent + target+"= -"+prefix+code.operand(0)+";";
		addStatement(code, stat);		
	}

	/**
	 * Iterate over the list of loop byte-code and translate each code into C code. 
	 * @param code
	 */
	private void translate(Loop code) {
		addStatement(code, null);
	}

	/**
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
	}**/

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
	 * Translate the WyIL type into the type in C.
	 * @param type the WyIL type
	 * @return the result string
	 */
	private String translate(Type type){
		if(type instanceof Type.Int || type instanceof Type.Bool){
			return "long long";
		}

		if(type instanceof Type.List){
			Type.List listType = (Type.List)type;
			return translate(listType.element())+"*";
		}		

		if(type instanceof Type.Void){
			return "void";
		}

		if(type instanceof Type.Record){			
			Type.Record record = (Type.Record)type;
			HashMap<String, Type> fields = record.fields();
			if(fields.containsKey("args")){
				return "int argc, char** argv";
			}
			return record.toString();
		}

		/*if(type instanceof Type.Strung){
			return "char*";
		}*/

		return null;
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
			}  else if (code instanceof Codes.SubList) {
				internalFailure("Not implemented!", code.toString() , null);
			} else if (code instanceof Codes.Switch) {
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
