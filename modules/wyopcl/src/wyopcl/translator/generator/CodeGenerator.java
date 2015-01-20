package wyopcl.translator.generator;

import static wycc.lang.SyntaxError.internalFailure;

import java.io.PrintWriter;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map.Entry;
import java.util.Stack;

import wycc.lang.NameID;
import wycc.lang.SyntaxError;
import wyfs.lang.Path.ID;
import wyil.lang.Code;
import wyil.lang.Codes.ListOperator;
import wyil.lang.Constant;
import wyil.lang.Code.Block;
import wyil.lang.Codes;
import wyil.lang.Codes.BinaryOperator;
import wyil.lang.Codes.Loop;
import wyil.lang.Codes.StringOperator;
import wyil.lang.Codes.UnaryOperator;
import wyil.lang.Constant.Strung;
import wyil.lang.Type;
import wyil.lang.Type.EffectiveIndexible;
import wyil.lang.Type.FunctionOrMethod;
import wyil.lang.WyilFile.FunctionOrMethodDeclaration;
import wyopcl.translator.Configuration;
import wyopcl.translator.bound.Symbol;
/**
 * Converts the WyIL code into C code.
 * @author Min-Hsien Weng
 *
 */
public class CodeGenerator{
	public ArrayList<String> list_func;//A list of function declaration. 
	private final Configuration config;
	private final String prefix = "_";
	private HashMap<String, String> vars;
	private HashMap<String, Type> params;//A list of input parameters 
	private ArrayList<String> statements;	
	private BinaryOperator loop_condition;
	private String loop_label;
	private Stack<String> assert_labels;
	private String indent="\t";
	//The symbol table of variables
	private HashMap<String, Symbol> symbols;

	public CodeGenerator(Configuration config){
		this.config = config;
		this.vars = new HashMap<String, String>();
		this.params = new HashMap<String, Type>();
		this.statements = new ArrayList<String>();
		this.list_func = new ArrayList<String>();
		this.symbols = new HashMap<String, Symbol>();
		this.assert_labels = new Stack<String>();
	}
	/**
	 * Get the symbol info for a variable.
	 * @param name
	 * @return
	 */
	private Symbol getSymbol(String name){
		if(!symbols.containsKey(name)){
			Symbol var = new Symbol(name);
			symbols.put(name, var);
		}
		return symbols.get(name);
	}

	/**
	 * Get the attribute of a variable
	 * @param name
	 * @param att_name
	 * @return the attribute value. Return null if the variable does not contain the attribute.
	 */
	private Object getAttribute(String name, String att_name){
		Symbol symbol = getSymbol(name);
		return symbol.getAttribute(att_name);
	}
	
	/**
	 * Get a list of attributes from symbol table
	 * @param ops a list of operands
	 * @param att_name the attribute name
	 * @return
	 */
	private List<Object> getAttributes(int[] ops, String att_name){
		List<Object> list = new ArrayList<Object>();
		for(int op: ops){
			list.add(getAttribute(prefix+op, att_name));
		}		
		return list;
	}
	

	/**
	 * Add the variable attribute to the hashmap.
	 * @param name the variable name
	 * @param att_name the attribute name
	 * @param att_value the attribute value
	 * @return
	 */
	private void putAttribute(String name, String att_name, Object att_value){
		Symbol symbol = getSymbol(name);
		symbol.setAttribute(att_name, att_value);
	}

	/**
	 * Prints out each bytecode with the line number and the correct indentation.
	 * @param name
	 * @param line
	 */
	public int printWyILCode(Code code, String name, int line){
		//Print out the bytecode using the format (e.g. 'main.9 [const %12 = 2345 : int]')
		if(code instanceof Codes.Label){
			System.out.println(name+"."+line+" ["+code+"]");
		}else{
			System.out.println(name+"."+line+" [\t"+code+"]");
		}
		return ++line;
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
		
		if(type instanceof Type.Strung){
			return "char";
		}
		
		return null;
	}
	
	/**
	 * Adds the type declaration for a variable.
	 * @param type the Whiley type
	 * @param var the name of variable
	 */
	private void addDeclaration(Type type, String var){
		if(type instanceof Type.Strung){
			vars.put(var+"[1024]", translate(type));
		}else if (type instanceof Type.List){
			vars.put(var, translate(type));
			//add the additional parameter 'reg_size' to indicate the array size.
			vars.put(var+"_size", "size_t");
		}else{
			vars.put(var, translate(type));
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
			str += translate(ret)+" ";
			str += name + "(";
			boolean isfirst = true;
			int index = 0;	
			for(Type param :type.params()){
				if(isfirst){
					str += translate(param);
				}else{
					str += ", " + translate(param);
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
		//Add the function declaration to the list
		list_func.add(str);		
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

	public boolean isBoolTypeIntroduced(){
		//Check if any symbol is bool type
		Boolean isBoolType = false;
		for(String var_name:symbols.keySet()){
			Type type = (Type) getAttribute(var_name, "type");
			if(type instanceof Type.Bool){
				isBoolType = true;				
			}			
		}		
		return isBoolType;
	}


	public void printoutCode(PrintWriter writer, String function_del){
		//function declaration
		System.out.println(function_del+"{");
		writer.println(function_del+"{");
		//Var declaration
		for(Entry<String, String> var: vars.entrySet()){
			System.out.println("\t"+var.getValue()+" "+var.getKey()+";");
			writer.println("\t"+var.getValue()+" "+var.getKey()+";");
		}
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
		putAttribute(target, "type", code.assignedType());		
		if(code.assignedType() instanceof Type.Strung){
			Strung strung = (Strung) code.constant;
			vars.put(target+"["+(strung.value.length()+1)+"]" , "char");			
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
			vars.put(prefix+code.target(), translate(code.assignedType()));		
			stat = indent +target + " = "+ code.constant + ";";
		}

		addStatement(code, stat);		
	}

	/**
	 * Generates the code for <code>Codes.Assign</code> code.
	 * @param code
	 */
	private void translate(Codes.Assign code){
		String target = prefix+code.target();
		String op = prefix+code.operand(0);
		vars.put(target, translate(code.type()));//Var
		if(code.type()instanceof Type.List){
			String target_size = target+"_size";			
			String stat = indent + target+ " = clone("+ op + ", "+ op+"_size);";
			addStatement(code, stat);
			//Add the '_return_size' variable.
			vars.put(target_size, "long long");
			stat = indent + target_size+" = "+op+"_size;";
			addStatement(null, stat);
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
		vars.put(prefix+code.target(), translate(code.assignedType()));
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
		vars.put(target, translate(type));
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
		vars.put(index, translate(code.type.element()));
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
			vars.put("index", "long long");
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
		Type paramType = (Type) getAttribute(param, "type");
		//Cast the input as a string				
		if(paramType instanceof Type.Int){
			stat += "sprintf("+ret+", \"%lld\", "+ prefix+code.operand(0)+");";					
		}else{
			stat += "toString(";
			//Get type attribute
			stat += translateParameters(code.operands(), getAttributes(code.operands(), "type"));
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
		vars.put(prefix+code.target(), translate(type.element()));
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
		vars.put(target, type);
		stat = indent + target + "=("+type+")malloc("+(code.operands().length)+"*sizeof("+translate(code.type().element())+"));";
		addStatement(code, stat);
		//Add the 'target_size' variable to indicate the length of the list
		String target_size = target+"_size";
		vars.put(target_size, "long long");
		stat = indent + target_size+"="+ code.operands().length+";";
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
			putAttribute(prefix+code.operand(0), "type", code.type());			
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
		String stat = indent;
		if(code.type() instanceof Type.FunctionOrMethod){
			//Hard-coded the 'str' var
			vars.put("str[1024]","char");			
			//Hard-coded the invoked (temporarily).
			String op = prefix+code.parameter(0);
			Type paramType = code.type().params().get(0);
			if(vars.containsKey(op)){
				stat += "printf(\"%s\\n\",toString("+op+", "+op+"_size, str));";
			}else{
				stat += "printf(\"%s\\n\","+op+");";
			}

		}		
		addStatement(code, stat);		
	}


	private void translate(UnaryOperator code) {		
		String target = prefix+code.target();
		vars.put(target, translate(code.type()));
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
		vars.put(target+"[1024]", "char");		
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


	private void translate(ListOperator code) {
		String target = prefix+code.target();
		vars.put(target, translate(code.type().element())+"*");
		vars.put(target+"_size", "long long");
		String stat = "";
		stat += indent+target+"_size = ";
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
		//Allocate the array
		stat += indent+target+"=("+translate(code.type().element())+"*)malloc("+target+"_size*sizeof("+translate(code.type().element())+"));\n";
		stat += indent+"append(";
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
		stat += ", "+target+");\n";
		addStatement(code, stat);
	}

	/**
	 * Checks the type of the wyil code and dispatches the code to the analyzer for
	 * being executed by the <code>analyze(code)</code> 
	 * @param entry
	 */
	public void dispatch(Block.Entry entry){		
		Code code = entry.code; 
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
				//DebugInterpreter.getInstance().interpret((Codes.Debug)code, stackframe);
			} else if (code instanceof Codes.Dereference) {
				//DereferenceInterpreter.getInstance().interpret((Codes.Dereference)code, stackframe);
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
				//IfIsInterpreter.getInstance().interpret((Codes.IfIs)code, stackframe);
			} else if (code instanceof Codes.IndexOf) {			
				translate((Codes.IndexOf)code);
			} else if (code instanceof Codes.IndirectInvoke) {			
				translate((Codes.IndirectInvoke)code);
			} else if (code instanceof Codes.Invoke) {			
				translate((Codes.Invoke)code);
			} else if (code instanceof Codes.Invert) {
				//InvertInterpreter.getInstance().interpret((Codes.Invert)code, stackframe);
			} else if (code instanceof Codes.ListOperator) {
				translate((Codes.ListOperator)code);
			} else if (code instanceof Codes.Loop) {			
				translate((Codes.Loop)code);			
			} else if (code instanceof Codes.LoopEnd) {
				translate((Codes.LoopEnd)code);									
			} else if (code instanceof Codes.Label) {
				translate((Codes.Label)code);
			} else if (code instanceof Codes.Lambda) {
				//LambdaInterpreter.getInstance().interpret((Codes.Lambda)code, stackframe);
			} else if (code instanceof Codes.LengthOf) {			
				translate((Codes.LengthOf)code);
			}  else if (code instanceof Codes.Move) {
				internalFailure("Not implemented!", "", entry);
			} else if (code instanceof Codes.NewMap) {
				//analyze((Codes.NewMap)code);
			} else if (code instanceof Codes.NewList) {			
				translate((Codes.NewList)code);
			} else if (code instanceof Codes.NewRecord) {
				//NewRecordInterpreter.getInstance().interpret((Codes.NewRecord)code, stackframe);
			} else if (code instanceof Codes.NewSet) {
				//NewSetInterpreter.getInstance().interpret((Codes.NewSet)code, stackframe);
			} else if (code instanceof Codes.NewTuple) {
				//analyze((Codes.NewTuple)code);
			} else if (code instanceof Codes.Return) {			
				translate((Codes.Return)code);
			} else if (code instanceof Codes.NewObject) {
				//NewObjectInterpreter.getInstance().interpret((Codes.NewObject)code, stackframe);
			} else if (code instanceof Codes.Nop) {
				translate((Codes.Nop)code);
			} else if (code instanceof Codes.SetOperator){
				//SetOperatorInterpreter.getInstance().interpret((Codes.SetOperator)code, stackframe);
			} else if (code instanceof Codes.StringOperator) {
				translate((Codes.StringOperator)code);
			} else if (code instanceof Codes.SubList) {
				//analyze((Codes.SubList)code);
			} else if (code instanceof Codes.SubString) {
				//SubStringInterpreter.getInstance().interpret((Codes.SubString)code, stackframe);
			} else if (code instanceof Codes.Switch) {
				//SwitchInterpreter.getInstance().interpret((Codes.Switch)code, stackframe);
			} else if (code instanceof Codes.Throw) {
				//ThrowInterpreter.getInstance().interpret((Codes.Throw)code, stackframe);
			} else if (code instanceof Codes.TryCatch) {
				//TryCatchInterpreter.getInstance().interpret((Codes.TryCatch)code, stackframe);
			} else if (code instanceof Codes.TupleLoad) {
				//analyze((Codes.TupleLoad)code);
			} else if (code instanceof Codes.UnaryOperator){
				translate((Codes.UnaryOperator)code);
			} else if (code instanceof Codes.Update) {
				translate((Codes.Update)code);
			} else {
				internalFailure("unknown wyil code encountered (" + code + ")", "", entry);
			}		

		} catch (SyntaxError ex) {
			throw ex;	
		} catch (Exception ex) {		
			internalFailure(ex.getMessage(), "", entry, ex);
		}

	}







}
