package wyopcl.translator.generator;

import static wycc.lang.SyntaxError.internalFailure;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map.Entry;

import wycc.lang.NameID;
import wycc.lang.SyntaxError;
import wyfs.lang.Path.ID;
import wyil.lang.Code;
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
	private String assert_label;
	private String indent="\t";
	public CodeGenerator(Configuration config){
		this.config = config;
		this.vars = new HashMap<String, String>();
		this.params = new HashMap<String, Type>();
		this.statements = new ArrayList<String>();
		this.list_func = new ArrayList<String>();
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


		return null;

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
		String stat;
		String target = prefix+code.target();
		if(code.assignedType() instanceof Type.Strung){
			Strung strung = (Strung) code.constant;
			stat = indent + "char "+target+"["+(strung.value.length()+1)+"] = \""+strung.value+"\";";
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
		if(loop_condition != null){
			//get starting value
			String start = prefix+loop_condition.operand(0);
			String end = prefix+loop_condition.operand(1);
			String index = prefix+code.indexOperand;
			vars.put(index, translate(code.type.element()));
			vars.remove(prefix+code.sourceOperand);
			//The expression for loop condition.
			stat += indent + "for("+index+"="+start+";"+index+"<"+end+";"+index+"++){";
			addStatement(code, stat);
			//Add the indentation
			indent += "\t";				
			loop_condition = null;
		}
	}


	/**
	 * Generates the code for <code>Codes.Invoke</code> code
	 * TODO The size of the returned list requires the symbolic analysis.
	 * @param code 
	 */
	private void translate(Codes.Invoke code){
		String stat = indent;
		String ret = prefix+code.target();
		Type return_type = code.type().ret();
		
		//The code for calling the whiley.lang.any.toString() function.
		if(code.name.toString().equals("whiley/lang/Any:toString")){
			//Check if the input parameter is also the return 
			String param = prefix+code.operand(0);			
			if(ret.equals(param)){
				//Create a temporary string variable ''	
				ret = ret+"_str";
			}
			vars.put(ret+"[1024]", "char");			
			stat += "sprintf("+ret+", \"%ld\", "+ prefix+code.operand(0)+");";
			addStatement(code, stat);		
			return;
		}		
		vars.put(ret, translate(return_type));
		stat += ret+ "="+code.name.name()+"(";
		//Input parameters
		boolean isFirst = true;
		int index =0;
		String op_size = "";
		for(int operand: code.operands()){
			if(isFirst){
				stat+= prefix+operand;
			}else{
				stat+= " ,"+prefix+operand;
			}
			//Add the '_reg_size' parameter 
			if(code.type().params().get(index) instanceof Type.List){
				op_size = prefix+operand+"_size";
				stat += " , "+op_size;
			}
			isFirst = false;
			index++;
		}
		stat += ");";
		addStatement(code, stat);
		//Add the 'ret_size' variable.
		if(return_type instanceof Type.List){
			String ret_size = ret+"_size";
			vars.put(ret_size, "long long");
			stat = indent+ret_size+"="+op_size+";";
			addStatement(null, stat);
		}		
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
		if(loop_label != null){
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
		assert_label = code.target;
	}


	private void translate(Codes.Goto code){
		String stat = indent;
		stat += "goto "+code.target+";";
		addStatement(code, stat);		
	}


	private void translate(Codes.Label code){		
		//Check if the label is equal to assert_label
		if(assert_label != null && assert_label.equals(code.label)){			
			decreaseIndent();
			//Ending clause.
			addStatement(null, indent+"}");
			assert_label = null;
		}
		addStatement(code, code.label+":;");
	}

	private void translate(Codes.Fail code){
		String stat = indent+"perror(\""+code+"\");";
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
			//Do nothing.			
		}
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
				//analyze((Codes.ListOperator)code);
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
