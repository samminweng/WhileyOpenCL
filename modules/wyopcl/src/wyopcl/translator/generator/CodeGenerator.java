package wyopcl.translator.generator;

import static wycc.lang.SyntaxError.internalFailure;

import java.util.ArrayList;
import java.util.HashMap;

import wycc.lang.SyntaxError;
import wyil.lang.Code;
import wyil.lang.Code.Block;
import wyil.lang.Codes;
import wyil.lang.Type;
import wyil.lang.Type.FunctionOrMethod;
import wyil.lang.WyilFile;
import wyil.lang.WyilFile.Case;
import wyil.lang.WyilFile.FunctionOrMethodDeclaration;
import wyopcl.translator.Configuration;
/**
 * Converts the WyIL code into C code.
 * @author Min-Hsien Weng
 *
 */
public class CodeGenerator{
	private final Configuration config;
	private final String prefix = "_";
	private String function_del;
	private HashMap<String, String> vars;
	private ArrayList<Integer> params;
	private ArrayList<String> statements;
	private String loop_condition;
	private String indent="";
	public CodeGenerator(Configuration config){
		this.config = config;
		this.vars = new HashMap<String, String>();
		this.params = new ArrayList<Integer>();
		this.statements = new ArrayList<String>();
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
	 * Translate the WyIL type into the type in C.
	 * @param type the WyIL type
	 * @return the result string
	 */
	private String translate(Type type){
		if(type instanceof Type.Int || type instanceof Type.Bool){
			return "int";
		}
		
		if(type instanceof Type.List){
			Type.List listType = (Type.List)type;
			return translate(listType.element())+"*";
		}		
		
		return null;
		
	}
	
	

	/**
	 * Translates the function or method declaration (e.g. <code>int* play(int* _0, int size){</code>)
	 * @param functionOrMethod
	 */
	private String translate(FunctionOrMethodDeclaration functionOrMethod){
		String str = "";
		//Get the return type
		FunctionOrMethod type = functionOrMethod.type();
		Type ret = type.ret();
		str += translate(ret)+" ";
		//Get the name
		str += functionOrMethod.name();
		//Get the input parameters
		str += "(";
		int var = 0;
		boolean isfirst = true;
		for(Type param :type.params()){
			if(isfirst){
				str += translate(param);
			}else{
				str += ", " + translate(param);
			}
			//Put the input params into the lookup list.
			params.add(var);
			//Add the variable names
			str += " "+prefix+var;			
			//Add the extra 'size' param for the 'list' type
			if(param instanceof Type.List){
				str +=", int size";
			}			
			isfirst = false;
			var++;
		}
		str += "){";
		System.out.println(str);
		return str;
	}
	
	
	/**
	 * Iterate each bytecode of a function block.
	 * @param functionOrMethod the function block
	 */
	public void iterateByteCode(FunctionOrMethodDeclaration functionOrMethod){
		//generate the function declaration.
		function_del = translate(functionOrMethod);		
		for(Case mcase : functionOrMethod.cases()){			
			int line = 0;
			//Parse each byte-code and add the constraints accordingly.
			for(Block.Entry entry :mcase.body()){
				//Get the Block.Entry
				if(config.isVerbose()){
					line = printWyILCode(entry.code, functionOrMethod.name(), line);
				}				
				dispatch(entry);				
			}
		}
	}
	
	
	/**
	 * Generates the code for <code>Codes.Const</code> code.
	 * @param code
	 */
	private void translate(Codes.Const code){
		//Declare the variables
		vars.put(prefix+code.target(), translate(code.assignedType()));		
		String str = indent + prefix+code.target()+ " = "+ code.constant + ";";
		statements.add(str);
		System.out.println(str);
	}
	
	/**
	 * Generates the code for <code>Codes.Assign</code> code.
	 * @param code
	 */
	private void translate(Codes.Assign code){
		vars.put(prefix+code.target(), translate(code.type()));//Var
		String str = indent + prefix+code.target()+ " = "+ prefix+code.operand(0) + ";";
		statements.add(str);
		System.out.println(str);
	}
	
	/**
	 * Generates the C code <code>Codes.Length</code> code.
	 * 
	 * @param code
	 */
	private void translate(Codes.LengthOf code){
		vars.put(prefix+code.target(), "int");
		String str = indent + prefix+code.target() + " = size;";
		statements.add(str);
		System.out.println(str);
	}
	
	/**
	 * Generates the code for <code>Codes.BinaryOperator</code>
	 * @param code
	 */
	private void translate(Codes.BinaryOperator code){
		Type type = code.type();
		String str="";
		switch(code.kind){
		case ADD:
			break;
		case SUB:
			break;
		case MUL:
			break;
		case DIV:
			break;
		case REM:
			break;
		case RANGE:
			vars.put(prefix+code.target(), translate(type));			
			//expression = "range "+ prefix+code.target() + "="+prefix+code.operand(0)+","+prefix+code.operand(1);
			
			loop_condition = prefix+code.target()+"="+prefix+code.operand(0)+";"
					   +prefix+code.target()+"<"+prefix+code.operand(1)+";"
					   +prefix+code.target()+"++";			
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
	}
	
	/**
	 * Generates the code for <code>Codes.ForAll</code> code
	 * @param code
	 */
	private void translate(Codes.ForAll code){
		String str = "";
		if(loop_condition != null){
			str += indent + "for("+loop_condition+"){";
			statements.add(str);
			System.out.println(str);
			//Add the indentation
			indent += "\t";			
			//The expression for element
			vars.put(prefix+code.indexOperand, translate(code.type.element()));
			str = indent + prefix + code.indexOperand + "=" + prefix + code.modifiedOperands[0]+"["+ prefix +code.sourceOperand+"];";
			statements.add(str);
			System.out.println(str);
			loop_condition = null;
		}
	}
	
	
	/**
	 * Generates the code for <code>Codes.Invoke</code> code
	 * @param code
	 */
	private void translate(Codes.Invoke code){
		String str = indent;
		String ret = prefix+code.target();
		vars.put(ret, translate(code.type().ret()));
		str += ret+ "="+code.name.name()+"(";
		//Input parameters
		boolean isFirst = true;
		int index =0;
		for(int operand: code.operands()){
			if(isFirst){
				str+= prefix+operand;
			}else{
				str+= " ,"+prefix+operand;
			}
			//Add the 'size' parameter 
			if(code.type().params().get(index) instanceof Type.List){
				str += " , size";
			}
			isFirst = false;
			index++;
		}
		str += ");";
		statements.add(str);
		System.out.println(str);
	}
	
	/**
	 * Generates the code for <code>Codes.If</code> code
	 * @param code
	 */
	private void translate(Codes.If code){
		String str = indent;
		String left = prefix+code.leftOperand;
		String right = prefix+code.rightOperand;
		str += "if("+left;
		//The condition
		switch(code.op){
		case EQ:
			str+="==";
			break;
		case NEQ:
			str+="!=";
			break;
		case LT:
			str+="<";
			break;
		case LTEQ:
			str+="<=";
			break;
		case GT:
			str+=">";
			break;
		case GTEQ:
			str+=">=";
			break;
		case IN:
			break;
		case SUBSET:
			break;
		case SUBSETEQ:
			break;
		}
		str += right;
		str +="){";
		str += "goto "+code.target+";";
		str +="}";
		statements.add(str);
		System.out.println(str);
	}
	
	private void translate(Codes.AssertOrAssume code){
		String str = indent;		
	}
	
	
	private void translate(Codes.Goto code){
		String str = indent;
		str += "goto "+code.target+";";
		statements.add(str);
		System.out.println(str);
	}
	
	
	private void translate(Codes.Label code){
		String str = code.label+":";
		statements.add(str);
		System.out.println(str);	
	}
	
	private void translate(Codes.Fail code){
		String str = indent+"perror(\""+code+"\");";
		statements.add(str);
		System.out.println(str);
	}
	
	private void translate(Codes.Update code){
		String str = indent;
		//For List type only
		if(code.type() instanceof Type.List){
			str += code.result();
			
			
			statements.add(str);
			System.out.println(str);
		}
		
		
	}
	
	
	/**
	 * Checks the type of the wyil code and dispatches the code to the analyzer for
	 * being executed by the <code>analyze(code)</code> 
	 * @param entry
	 */
	private void dispatch(Block.Entry entry){		
		Code code = entry.code; 
		try{
			//enable the assertion 
			if (code instanceof Codes.AssertOrAssume) {
				translate((Codes.AssertOrAssume)code);
			}else if (code instanceof Codes.Assign) {			
				translate((Codes.Assign)code);
			} else if (code instanceof Codes.BinaryOperator) {			
				translate((Codes.BinaryOperator)code);
			} else if (code instanceof Codes.StringOperator) {
				//StringOperatorInterpreter.getInstance().interpret((Codes.StringOperator)code, stackframe);
			} else if (code instanceof Codes.Convert) {			
				//ConvertInterpreter.getInstance().interpret((Codes.Convert)code, stackframe);
			} else if (code instanceof Codes.Const) {			
				translate((Codes.Const)code);
			} else if (code instanceof Codes.Debug) {
				//DebugInterpreter.getInstance().interpret((Codes.Debug)code, stackframe);
			} else if (code instanceof Codes.Dereference) {
				//DereferenceInterpreter.getInstance().interpret((Codes.Dereference)code, stackframe);
			} else if (code instanceof Codes.Fail) {
				translate((Codes.Fail)code);
			} else if (code instanceof Codes.FieldLoad) {		
				//FieldLoadInterpreter.getInstance().interpret((Codes.FieldLoad)code, stackframe);			
			} else if (code instanceof Codes.ForAll) {				
				translate((Codes.ForAll)code);
			} else if (code instanceof Codes.Goto) {	
				translate((Codes.Goto)code);
			} else if (code instanceof Codes.If) {
				translate((Codes.If)code);			
			} else if (code instanceof Codes.IfIs) {
				//IfIsInterpreter.getInstance().interpret((Codes.IfIs)code, stackframe);
			} else if (code instanceof Codes.IndexOf) {			
				//analyze((Codes.IndexOf)code);
			} else if (code instanceof Codes.IndirectInvoke) {			
				//IndirectInvokeInterpreter.getInstance().interpret((Codes.IndirectInvoke)code, stackframe);
			} else if (code instanceof Codes.Invoke) {			
				translate((Codes.Invoke)code);
			} else if (code instanceof Codes.Invert) {
				//InvertInterpreter.getInstance().interpret((Codes.Invert)code, stackframe);
			} else if (code instanceof Codes.ListOperator) {
				//analyze((Codes.ListOperator)code);
			} else if (code instanceof Codes.Loop) {			
				//analyze((Codes.Loop)code);			
			} else if (code instanceof Codes.LoopEnd) {
				//analyze((Codes.LoopEnd)code);									
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
				//analyze((Codes.NewList)code);
			} else if (code instanceof Codes.NewRecord) {
				//NewRecordInterpreter.getInstance().interpret((Codes.NewRecord)code, stackframe);
			} else if (code instanceof Codes.NewSet) {
				//NewSetInterpreter.getInstance().interpret((Codes.NewSet)code, stackframe);
			} else if (code instanceof Codes.NewTuple) {
				//analyze((Codes.NewTuple)code);
			} else if (code instanceof Codes.Return) {			
				//analyze((Codes.Return)code);
			} else if (code instanceof Codes.NewObject) {
				//NewObjectInterpreter.getInstance().interpret((Codes.NewObject)code, stackframe);
			} else if (code instanceof Codes.Nop) {
				//NopInterpreter.getInstance().interpret((Codes.Nop)code, stackframe);
			} else if (code instanceof Codes.SetOperator){
				//SetOperatorInterpreter.getInstance().interpret((Codes.SetOperator)code, stackframe);
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
				//analyze((Codes.UnaryOperator)code);
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
