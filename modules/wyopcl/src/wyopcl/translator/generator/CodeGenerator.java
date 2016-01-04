package wyopcl.translator.generator;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Optional;
import java.util.function.Consumer;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import wyil.attributes.VariableDeclarations;
import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Codes.Comparator;
import wyil.lang.Codes.Dereference;
import wyil.lang.Codes.IfIs;
import wyil.lang.Codes.ListGenerator;
import wyil.lang.Codes.Loop;
import wyil.lang.Codes.NewObject;
import wyil.lang.Codes.NewRecord;
import wyil.lang.Codes.UnaryOperator;
import wyil.lang.Constant;
import wyil.lang.Type;
import wyil.lang.Type.Union;
import wyil.lang.WyilFile;
import wyil.lang.WyilFile.FunctionOrMethod;
import wyil.transforms.LiveVariablesAnalysis.Env;
import wyopcl.Configuration;
import wyopcl.translator.bound.BasicBlock;
import wyopcl.translator.copy.CopyEliminationAnalyzer;
import wyopcl.translator.deallocate.DeallocationAnalyzer;
import wyopcl.translator.generator.CodeStores.CodeStore;

/**
 * Takes a list of functional byte-code and converts it into C code.
 * 
 * @author Min-Hsien Weng
 *
 */
public class CodeGenerator extends AbstractCodeGenerator {
	private Optional<CopyEliminationAnalyzer> copyAnalyzer = Optional.empty();
	private Optional<DeallocationAnalyzer> deallocatedAnalyzer = Optional.empty();

	/**
	 * Constructor
	 * 
	 * @param config
	 * @param functionOrMethod
	 */
	public CodeGenerator(Configuration config) {
		super(config);
	}

	public CodeGenerator(Configuration config, Optional<CopyEliminationAnalyzer> copyAnalyzer, Optional<DeallocationAnalyzer> deallcAnalyzer) {
		this(config);
		this.copyAnalyzer = copyAnalyzer;
		this.deallocatedAnalyzer = deallcAnalyzer;
	}
	
	
	
	/**
	 * Takes the byte-code and produces the code.
	 * 
	 * @param module
	 */
	public void apply(WyilFile module) {
		// Get and Set up user-defined types
		this.stores = new CodeStores(config, (List<wyil.lang.WyilFile.Type>) module.types());
		
		this.writeIncludes();
		// Defines constants
		this.writeConstants(module.constants());
		
		// Write out user-defined types.
		this.writeUserTypes((List<wyil.lang.WyilFile.Type>) module.types());
		
		// Translate each function
		for (FunctionOrMethod function : module.functionOrMethods()) {
			
			// Iterate and translate each code into the target language.
			this.iterateCodes(function.body().bytecodes(), function);
			// Write the code
			this.writeFunction(function);
			
		}
	}
	

	/**
	 * Given a function, defines and initialize local variables
	 */
	protected List<String> declareVariables(FunctionOrMethod function) {
		
		// Get variable declaration
		VariableDeclarations vars = function.attribute(VariableDeclarations.class);
		// Get code storage
		CodeStore store = stores.getCodeStore(function);
		// The string declaration.
		List<String> declarations = new ArrayList<String>();
		// Iterate over the list of registers.
		int inputs = function.type().params().size();
		String indent = "\t";
		
		for (int reg = inputs; reg < vars.size(); reg++) {
			Type type = vars.get(reg).type();
			// Get the variable name.
			String var = store.getVar(reg);
			String translateType = CodeGeneratorHelper.translateType(type, stores);
			if (type instanceof Type.Array || (type instanceof Type.Reference
					&& ((Type.Reference) type).element() instanceof Type.Array)) {
				// Type declaration and initial value assignment.
				declarations.add(indent + translateType + " " + var + " = NULL;");
				
				// Generate size variables according to the dimensions, e.g. 2D array has two 'size' variables.
				CodeGeneratorHelper.getArraySizeVars(var, type).stream()
				.forEach(size_var -> declarations.add("\tlong long "+size_var+" = 0;"));
				
				// Declare the extra 'has_ownership' boolean variables
				this.deallocatedAnalyzer.ifPresent(a -> declarations.add(indent+ CodeGeneratorHelper.declareOwnership(type, var, this.stores, false)));
				//declarations.add(indent+ CodeGeneratorHelper.declareOwnership(type, var, this.stores, this.deallocatedAnalyzer, false));
			} else if (type instanceof Type.Int) {
				declarations.add(indent + translateType + " " + var + " = 0;");
			} else if (type instanceof Type.Record){
				declarations.add(indent+translateType+ " " + var + ";");
				// Declare the extra 'has_ownership' boolean variables
				this.deallocatedAnalyzer.ifPresent(a -> declarations.add(indent+CodeGeneratorHelper.declareOwnership(type, var, this.stores, false)));
				//declarations.add(indent+CodeGeneratorHelper.declareOwnership(type, var, this.stores, this.deallocatedAnalyzer, false));
			} else if (type instanceof Type.Nominal){
				declarations.add(indent+translateType+ " "+var+";");
				// Declare the extra 'has_ownership' boolean variables
				this.deallocatedAnalyzer.ifPresent(a -> declarations.add(indent+CodeGeneratorHelper.declareOwnership(type, var, this.stores, false)));
				//declarations.add(indent+CodeGeneratorHelper.declareOwnership(type, var, this.stores, this.deallocatedAnalyzer, false));
			} else if (type instanceof Type.Method){
				// Skip translation
			} else if (type instanceof Type.Union){
				if(CodeGeneratorHelper.isIntType(type, stores)){
					// Translate 'nat' type into 'union UNION' type 
					declarations.add("\tunion UNION "+var+";");
				}else{
					declarations.add(indent+translateType+ " " + var + ";");
					// Declare the extra 'has_ownership' boolean variables
					this.deallocatedAnalyzer.ifPresent(a -> declarations.add(indent+CodeGeneratorHelper.declareOwnership(type, var, this.stores, false)));
					//declarations.add(indent+CodeGeneratorHelper.declareOwnership(type, var, this.stores, this.deallocatedAnalyzer, false));
				}
			}else if(type instanceof Type.Null){
				// Skip translation for null-typed variables.
			} else{
				throw new RuntimeException("Not implemented");
			}
		}
		
		return declarations;
	}

	
	/**
	 * Given a function, translates it into function declaration including function name and input parameters, e.g. 
	 * <pre><code>
	 * long long* reverse(long long* ls, long long ls_size)
	 * </code></pre>
	 * where 'reverse' is function name and its input declaration
	 * @param function
	 * @return the function declaration.
	 */
	protected String declareFunction(FunctionOrMethod function) {
		// Function declaration.
		String declaration = "";
		// Get the name
		if (function.name().equals("main")) {
			declaration = "int main(int argc, char** args)";
		} else {
			// Translate function declaration in C
			// Get the code storage
			CodeStore store = stores.getCodeStore(function);
			declaration += CodeGeneratorHelper.translateType(function.type().ret(), stores) + " " + function.name() + "(";
			List<Type> params = function.type().params();
			// Generate input parameters separated by comma
			List<String> parameters = new ArrayList<String>();
			for (int op=0;op<params.size();op++) {
				Type type = params.get(op);
				String var = store.getVar(op);
				parameters.add(CodeGeneratorHelper.translateType(type, stores) + " " + var);
				// Add ownership flag ('_has_ownership') to input parameter
				this.deallocatedAnalyzer.ifPresent(a ->{
					String ownership_flag = CodeGeneratorHelper.declareOwnership(type, var, this.stores);
					if(!ownership_flag.equals("")){
						parameters.add(ownership_flag);
					}
				});
				
				// Add the additional 'size' variable.
				if(type instanceof Type.Array){
					List<String> size_vars = CodeGeneratorHelper.getArraySizeVars(var, type);
					size_vars.forEach(size_var -> parameters.add("long long " + size_var));
				}
			}
			
			declaration += parameters.stream()
						  .map(i->i.toString())
						  .collect(Collectors.joining(", "));
			
			declaration += ")";
		}

		if (config.isVerbose()) {
			System.out.println(declaration);
		}
		return declaration;
	}

	/**
	 * Generates the C code for Codes.Const byte-code. For example,
	 * 
	 * <pre>
	 * <code>const %33 = [80,97,115,115,32,115,119,97,112,32,116,101,115,116,32,99,97,115,101] : int[]</code>
	 * </pre>
	 * 
	 * can be translated into:
	 * 
	 * <pre>
	 * <code>_33_size = 19;
	 * _33=(long long*)malloc(19*sizeof(long long));
	 * _33[0] = 80; _33[1] = 97; _33[2] = 115; _33[3] = 115; _33[4] = 32; _33[5] = 115; _33[6] = 119; _33[7] = 97; _33[8] = 112; _33[9] = 32; _33[10] = 116; _33[11] = 101; _33[12] = 115; _33[13] = 116; _33[14] = 32; _33[15] = 99; _33[16] = 97; _33[17] = 115; _33[18] = 101; </code>
	 * </pre>
	 * 
	 * @param code
	 * @see Codes.Const
	 */
	protected void translate(Codes.Const code, FunctionOrMethod function) {
		List<String> statements = new ArrayList<String>();
		CodeStore store = stores.getCodeStore(function);
		String lhs = store.getVar(code.target());
		String indent = store.getIndent();
		if (code.assignedType() instanceof Type.Array) {
			// Convert it into a constant list
			Constant.List list = (Constant.List) code.constant;
			if (!list.values.isEmpty()) {
				if(this.deallocatedAnalyzer.isPresent()){
					statements.add(indent+"_NEW_ARRAY_OWNERSHIP("+lhs+", "+list.values.size()+");");
				}else{
					statements.add(indent+"_NEW_ARRAY("+lhs+", "+list.values.size()+");");
				}
				
				String s = indent;
				for(int i=0;i<list.values.size();i++){
					s += lhs + "["+i+"] = " + list.values.get(i)+"; ";
				}
				statements.add(s);
			}
		} else if (code.assignedType() instanceof Type.Null){
			// Skip translation.
		} else {
			// Add a statement
			statements.add(indent + lhs + " = " + code.constant + ";");
		}
		store.addAllStatements(code, statements);
	}

	/**
	 * Generates the code for <code>Codes.Assign</code> code. For example,
	 * 
	 * <pre>
	 * <code>
	 * assign %4 = %5  : {int move,int[] pieces}
	 * </code>
	 * </pre>
	 * 
	 * can be translated into:
	 * <p>
	 * <code>
	 * _4 = copy_Board(_5);
	 * </code>
	 * </pre>
	 * 
	 * Note that we need to copy input parameter(_5) to ensure value-semantics in Whiley, but the copy can eliminated 
	 * by our copy analyzer. For example,
	 * <p><code> _4 = _5;//Remove the copy.</code></p>
	 * 
	 * Special cases:
	 * <ul>
	 * <li>Referenced array: reference type is free of array copies in nature as it extracts the value from the register
	 * and assigns to target register. But if the referenced value is an array, we still need to propagate the array
	 * size to new register.</li>
	 * 
	 * </ul>
	 * 
	 * @param code
	 */
	protected void translate(Codes.Assign code, FunctionOrMethod function) {
		CodeStore store = stores.getCodeStore(function);
		String lhs = store.getVar(code.target());
		// Get the actual type for lhs variable.
		Type lhs_type = store.getRawType(code.target());
		String indent = store.getIndent();
		List<String> statement = new ArrayList<String>();
		String rhs = store.getVar(code.operand(0));
		Type rhs_type = store.getRawType(code.operand(0));
		boolean isCopyEliminated = isCopyEliminated(code.operand(0), code, function);
		if(!CodeGeneratorHelper.isCompoundType(lhs_type, stores)){
			statement.add(indent + lhs + " = " + rhs + ";");
		}else{
			this.deallocatedAnalyzer.ifPresent(a -> statement.add(indent + CodeGeneratorHelper.addDeallocatedCode(lhs, lhs_type, stores)));
			// Special cases for NULL type
			if(code.type()instanceof Type.Null){
				// Assign lhs to NULL values by 
				statement.add(indent + lhs + " = NULL;");
				// Transfer out the ownership of lhs variable
				this.deallocatedAnalyzer.ifPresent(a -> statement.add(indent + CodeGeneratorHelper.removeOwnership(lhs_type, lhs, this.stores)));
			}else{
				statement.addAll(CodeGeneratorHelper.generateArrayAssignment(lhs_type, indent, lhs, rhs, isCopyEliminated, stores));
				if(isCopyEliminated){
					// Transfer the ownership from rhs variable to lhs variable
					this.deallocatedAnalyzer.ifPresent(a -> statement.add(indent + CodeGeneratorHelper.addOwnership(lhs_type, lhs, stores)));
					this.deallocatedAnalyzer.ifPresent(a -> statement.add(indent + CodeGeneratorHelper.removeOwnership(rhs_type, rhs, stores)));
				}else{
					// Assigned the ownership
					this.deallocatedAnalyzer.ifPresent(a -> statement.add(indent + CodeGeneratorHelper.addOwnership(lhs_type, lhs, stores)));
					this.deallocatedAnalyzer.ifPresent(a -> statement.add(indent + CodeGeneratorHelper.addOwnership(rhs_type, rhs, stores)));
				}
			}
		}
		
		// Add the statement to the list of statements.
		store.addAllStatements(code, statement);
	}

	/**
	 * Generates the C code <code>Codes.Length</code> code. For example,
	 * 
	 * <pre>
	 * <code>
	 * lengthof %4 = %0 : [int]
	 * </code>
	 * </pre>
	 * 
	 * can be translated into
	 * 
	 * <pre>
	 * <code>
	 * _4 = _0_size;
	 * </code>
	 * </pre>
	 * 
	 * @param code
	 */
	protected void translate(Codes.LengthOf code, FunctionOrMethod function) {
		CodeStore store = stores.getCodeStore(function);
		String stat = store.getIndent() + store.getVar(code.target()) + " = " + store.getVar(code.operand(0))
		+ "_size;";
		store.addStatement(code, stat);
	}

	/**
	 * Generates the code for <code>Codes.BinaryOperator</code> code. For example,
	 * 
	 * <pre>
	 * <code>
	 * add %8 = %2, %1 : int
	 * </code>
	 * </pre>
	 * 
	 * can be translated into
	 * 
	 * <pre>
	 * <code>
	 * _8=_2+_1;
	 * </code>
	 * </pre>
	 * 
	 * @param code
	 */
	protected void translate(Codes.BinaryOperator code, FunctionOrMethod function) {
		CodeStore store = stores.getCodeStore(function);	
		String lhs = store.getVar(code.target());
		String rhs0 = store.getVar(code.operand(0));
		// Append 'integer' member for union type
		if(store.getRawType(code.operand(0)) instanceof Type.Union){
			rhs0 += ".integer";
		}
		String rhs1 = store.getVar(code.operand(1));
		// Append 'integer' member
		if(store.getRawType(code.operand(1)) instanceof Type.Union){
			rhs1 += ".integer";
		}
		
		String stat = store.getIndent();
		stat += lhs + "=" + rhs0;
		switch (code.kind) {
		case ADD:
			stat += "+" + rhs1 + ";";
			break;
		case SUB:
			stat += "-" + rhs1 + ";";
			break;
		case MUL:
			stat += "*" + rhs1 + ";";
			break;
		case DIV:
			stat += "/" + rhs1 + ";";
			break;
		case REM:
			stat += "%" + rhs1 + ";";
			break;
			/*
			 * case RANGE: // Assign the range with input code for the translation of 'forall' // byte-code. // this.range =
			 * code; stat = null; break;
			 */
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
		store.addStatement(code, stat);
	}

	/**
	 * Checks if the copy of given register is needed or not, based on liveness information.
	 * @param register
	 * @param code
	 * @param function
	 * @return
	 */
	private boolean isCopyEliminated(int register, Code code, FunctionOrMethod function){
		if(this.copyAnalyzer.isPresent()){
			return this.copyAnalyzer.get().isCopyEliminated(register, code, function);
		}
		
		return false;
	}
	

	/**
	 * Given one line of code, get (copy) analysis results to produce optimized C code. 
	 * If copy analysis is not enabled, return naive (copy) C code.
	 *
	 * 
	 * @param reg
	 *            the register of the variable
	 * @param code
	 *            the byte-code.
	 * @param function
	 *            the function
	 * @return the generated C code with/without copying 
	 */
	private String optimizeCode(int op, Code code, FunctionOrMethod function) {
		CodeStore store = stores.getCodeStore(function);
		
		List<String> statement = new ArrayList<String>();
		String var = store.getVar(op);
		Type type = store.getRawType(op);
		
		String indent = store.getIndent();
		
		boolean isCopyEliminated = isCopyEliminated(op, code, function);
		if (code instanceof Codes.Invoke){
			statement.add(CodeGeneratorHelper.generateCopyUpdateCode(type, stores, var, isCopyEliminated)); 
		}else{
			if(code instanceof Codes.Assign){
				// Transfer the ownership if the copy is not needed, i.e. the variable does not own this object.
				if(isCopyEliminated){
					this.deallocatedAnalyzer.ifPresent(a ->statement.add(indent+ CodeGeneratorHelper.removeOwnership(type, var, stores)));
				}else{
					this.deallocatedAnalyzer.ifPresent(a ->statement.add(indent + CodeGeneratorHelper.addOwnership(type, var, stores)));
				}
			}else if (code instanceof Codes.FieldLoad){
				Codes.FieldLoad fieldload = (Codes.FieldLoad)code;
				// Access the member
				String member = CodeGeneratorHelper.accessMember(var, fieldload.field, type);
				statement.add(CodeGeneratorHelper.generateCopyUpdateCode(fieldload.fieldType(), stores, member, isCopyEliminated)+";");
			}else if(code instanceof Codes.NewRecord){
				statement.add(CodeGeneratorHelper.generateCopyUpdateCode(type, stores, var, isCopyEliminated)+";"); 
				// Transfer the ownership if the copy is not needed, i.e. the variable does not own this object.
				if(isCopyEliminated){
					this.deallocatedAnalyzer.ifPresent(a ->{
						statement.add(indent+ CodeGeneratorHelper.removeOwnership(type, var, stores));
					});
					
				}else{
					this.deallocatedAnalyzer.ifPresent(a ->{
						// Assign ownership to variable as the copy is made.
						statement.add(indent + CodeGeneratorHelper.addOwnership(type, var, stores));
					});
					
					
				}
			} else{
				throw new RuntimeException("Not implemented");
			}
			
		}
		return (String) statement.stream().collect(Collectors.joining());
	}

	/**
	 * Translate the lhs of a function call.
	 * 
	 * @param code
	 * @param f
	 * @return
	 */
	private String translateLHSFunctionCall(Codes.Invoke code, FunctionOrMethod f) {
		CodeStore store = stores.getCodeStore(f);
		String indent = store.getIndent();
		
		String statement = "";
		// Translate the return value of a function call.
		// If no return value, no needs for translation.
		if (code.target() >= 0) {
			Type return_type = code.type().ret();
			String ret = store.getVar(code.target());
			// Assign both of lists to have the same array size, e.g. '_12_size=_xs_size;'
			if (return_type instanceof Type.Array) {
				// Get input Array
				for (int index = 0; index < code.operands().length; index++) {
					Type type = code.type().params().get(index);
					if (type instanceof Type.Array) {
						String var = store.getVar(code.operand(index));
						Type var_type = store.getRawType(code.operand(index));
						statement += indent + CodeGeneratorHelper.generateArraySizeAssign(var_type, ret, var);
					}
				}
			}
			// Call the function and assign the return value to lhs register.
			statement += indent + ret + " = ";
		}
		return statement;
	}





	/**
	 * Translate the rhs of a function call
	 * 
	 * @param code
	 * @param f
	 * @return
	 */
	private String translateRHSFunctionCall(Codes.Invoke code, FunctionOrMethod f) {
		// Get code store of f function
		CodeStore store = stores.getCodeStore(f);
		List<String> statement = new ArrayList<String>();
		for (int index = 0; index < code.operands().length; index++) {
			int register = code.operand(index);
			String var = store.getVar(register);
			Type type = store.getRawType(register);
			
			if(type instanceof Type.Int){
				statement.add(var);
			}else if(type instanceof Type.Union){
				// Access the 'integer' member for union-typed variable
				statement.add(var + ".integer");
			}else if (type instanceof Type.Nominal && ((Type.Nominal)type).name().name().equals("Console")){
				statement.add("stdout");
			}else if(type instanceof Type.Array || type instanceof Type.Record || type instanceof Type.Nominal){
				statement.add(optimizeCode(register, code, f));
				// pass the ownership flag
				this.deallocatedAnalyzer.ifPresent(a ->statement.add(CodeGeneratorHelper.passOwnershipToFunction(type, stores, this.copyAnalyzer)));
				// pass the '*_size' parameter
				statement.add(CodeGeneratorHelper.generateArraySizeVars(var, type));
			}else {
				throw new RuntimeException("Not Implemented");
			}
		}
		
		return statement.stream()
			   .filter(s -> !s.equals(""))
			   .map(s -> s.toString())
			   .collect(Collectors.joining(", "));
	}

	/**
	 * Produces the code for <code>Codes.Invoke</code> code. For example, the following WyIL code:
	 * 
	 * <pre>
	 * <code>invoke %12 = (%1) While_Valid_1:reverse : function([int]) -> [int]</code>
	 * </pre>
	 * 
	 * can be translated into the following C code:
	 * 
	 * <pre>
	 * <code>
	 * _12_size=_xs_size;
	 * _12=reverse(copy(_xs, _xs_size), _xs_size);
	 * </code>
	 * </pre>
	 * 
	 * Before invoking the function, copy the array ('xs') first and then pass the cloned array to the function. So
	 * that the original array will not be overwritten and its value is safely preserved.
	 * 
	 * Special cases:
	 * <ul>
	 * <li>Parse Integer<br>
	 * <code>invoke %5 = (%8) whiley/lang/Int:parse : function(whiley/lang/ASCII:string) -> null|int</code><br>
	 * can translate this into <br>
	 * <code>_5=parseInteger(_8);</code>
	 * <li>Slice Array<br>
	 * <code>invoke %16 = (_items, _start, _pivot) whiley/lang/Array:slice : function(int[],int,int) -> int[]<code><br>
	 * can translate this into <br>
	 * <code>
	 * _16 = slice(_items, _items_size, _start,  _pivot);<br>
	 * _16_size = _pivot - _start;
	 * </code>
	 * <li>Any.toString<br>
	 * <code>invoke %18 = (%1) whiley/lang/Any:toString </code>
	 * 
	 * 
	 * @param code
	 *            the Invoked Wyil code
	 * 
	 */
	protected void translate(Codes.Invoke code, FunctionOrMethod function) {
		CodeStore store = stores.getCodeStore(function);
		List<String> statement = new ArrayList<String>();
		String indent = store.getIndent();
		// Check if the called function is whiley/lang/Int
		if (code.name.module().toString().contains("whiley/lang")) {
			String lhs = store.getVar(code.target());
			
			switch (code.name.name()) {
			// Parse a string into an integer.
			case "parse":
				statement.add(indent + lhs + " = " + "parseInteger("+ store.getVar(code.operand(0)) + ");");
				break;
				// Slice an array into a new sub-array at given starting and ending index.
			case "slice":
				Type lhs_type = store.getRawType(code.target());
				this.deallocatedAnalyzer.ifPresent(a -> statement.add(indent + CodeGeneratorHelper.addDeallocatedCode(lhs, lhs_type, stores)));
				// Call the 'slice' function.
				String arr_name = store.getVar(code.operand(0));
				String start = store.getVar(code.operand(1));
				String end = store.getVar(code.operand(2));
				// Add 'slice' function call.
				statement.add(indent + lhs + " = slice(" + arr_name + ", " + arr_name + "_size, " + start + "," + end + ");");
				// Add array size.
				statement.add(indent + lhs + "_size = " + end + " - " + start + ";");
				// Assign ownership
				this.deallocatedAnalyzer.ifPresent(a -> statement.add(indent +  CodeGeneratorHelper.addOwnership(lhs_type, lhs, this.stores)));
				break;
			case "toString":
				statement.add(indent + lhs + " = " + code.operand(0) + ";");
				break;
			default:
				throw new RuntimeException("Un-implemented code:" + code);
			}
		} else {
			// Translate the function call, e.g.
			String lhs = store.getVar(code.target());
			Type lhs_type = store.getRawType(code.target());
			// Free lhs 
			this.deallocatedAnalyzer.ifPresent(a -> statement.add(indent + CodeGeneratorHelper.addDeallocatedCode(lhs, lhs_type, stores)));
			// call the function/method, e.g. '_12=reverse(_xs , _xs_size);'
			statement.add(translateLHSFunctionCall(code, function) + code.name.name() + "("+ translateRHSFunctionCall(code, function)+");");
			
			// Transfer out the registers that does not have the copy
			for(int op: code.operands()){
				String member = store.getVar(op);
				Type op_type = store.getRawType(op);
				if(CodeGeneratorHelper.isCompoundType(op_type, stores)){
					if(isCopyEliminated(op, code, function)){
						this.deallocatedAnalyzer.ifPresent(a -> statement.add(indent + CodeGeneratorHelper.removeOwnership(op_type, member, stores)));
					}
				}			
			}
			
			
			// Assign ownership to lhs
			this.deallocatedAnalyzer.ifPresent(a -> statement.add(indent + CodeGeneratorHelper.addOwnership(lhs_type, lhs, this.stores)));
		}
		// add the statement
		store.addAllStatements(code, statement);
	}

	/**
	 * Translated the Whiley comparator into C comparison operators, e.g. EQ := '=='. If the negated option is provided,
	 * then the comparator is first negated and then converted into C code.
	 * 
	 * @param op
	 *            Whiley comparator
	 * @param isNegated
	 *            true if the comparator needs the negation.
	 * @return the C comparsion operator.
	 */
	private String translate(Codes.Comparator op, boolean isNegated) {
		if (isNegated) {
			// The negated operator
			switch (op) {
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
		} else {
			// The condition
			switch (op) {
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
	 *  For example, the byte-code: <code> ifeq %1, %38 goto blklab2 : [int]</code> can be translated into C code: 
	 *  <code>_IFEQ_ARRAY(_1, _38, blklab2);</code>
	 * 
	 * Note that _IFEQ_ARRAY macro checks if both of arrays are the same (1: true, 0:false).
	 * <pre>
	 * <code>
	 * ifge %0, %1 goto blklab0 : int
	 * </code>
	 * </pre>
	 * 
	 * can be translated into:
	 * 
	 * <pre>
	 * <code>
	 * if( _0 >= _1) { goto blklab0;}
	 * </code>
	 * </pre>
	 * 
	 * @param code
	 *            <code>Codes.If</code> code
	 */
	protected void translate(Codes.If code, FunctionOrMethod function) {
		CodeStore store = stores.getCodeStore(function);
		String statement = store.getIndent();
		String lhs = store.getVar(code.leftOperand);
		String rhs = store.getVar(code.rightOperand);

		// Added a special case to compare two arrays.
		if (code.type instanceof Type.Array) {
			if (code.op.equals(Comparator.EQ)) {
				// Use the '_IFEQ_ARRAY' macro to compare two arrays
				statement += "_IFEQ_ARRAY("+lhs+", "+rhs+", "+code.target+");";
				
				// get the type of left/right
				/*Type left_type = store.getRawType(code.leftOperand);
				Type right_type = store.getRawType(code.rightOperand);
				// Check the left type is an array of integers.
				if (CodeGeneratorHelper.isIntType(left_type)) {
					statement += "if(isArrayEqual(" + lhs + ", " + lhs + "_size";
				} else {
					// If not, use type casting.
					statement += "if(isArrayEqual((" + CodeGeneratorHelper.translateType(right_type, stores) + ")" + lhs + ", " + lhs + "_size";
				}

				// Check the right type is an array
				if (CodeGeneratorHelper.isIntType(right_type)) {
					statement += "," + rhs + ", " + rhs + "_size)==1";
				} else {
					// Cast the right to an array.
					statement += ", (" + CodeGeneratorHelper.translateType(left_type, stores) + ")" + rhs + ", " + rhs + "_size)==1";
				}*/
			}
		} else {
			statement += "if(" + lhs;
			// The condition
			statement += translate(code.op, false);
			// Check type rhs operand
			Type rhs_type = store.getRawType(code.rightOperand);
			if(rhs_type instanceof Type.Union){
				statement += rhs+".integer";
			}else{
				statement += rhs;
			}
			// The goto statement
			statement += "){";
			statement += "goto " + code.target + ";";
			statement += "}";

		}

		

		store.addStatement(code, statement);
	}

	/**
	 * Translates the <code>Codes.AssertOrAssume</code> byte-code. This function iterates over the list of byte-code in
	 * each assertion or assumption and translated each byte-code. The translated C code is surrounded by two brackets
	 * ('{' and '}') with an indentation.
	 * 
	 * @param code
	 */
	protected void translate(Codes.AssertOrAssume code, FunctionOrMethod function) {
		CodeStore store = stores.getCodeStore(function);
		// Add the starting clause for the assertion
		store.addStatement(code, store.getIndent() + "{");
		// Increase the indent
		store.increaseIndent();
		iterateCodes(code.bytecodes(), function);
		store.decreaseIndent();
		store.addStatement(code, store.getIndent() + "}");

	}

	protected void translate(Codes.Goto code, FunctionOrMethod function) {
		CodeStore store = stores.getCodeStore(function);
		String stat = store.getIndent() + "goto " + code.target + ";";
		store.addStatement(code, stat);
	}

	/**
	 * Translated the <code>Codes.Label</code> byte-code into C code. For example,
	 * 
	 * <pre>
	 * <code>
	 * .blklab0
	 * </code>
	 * </pre>
	 * 
	 * can be translated into
	 * 
	 * <pre>
	 * <code>
	 * blklab0:
	 * </code>
	 * </pre>
	 * 
	 * @param code
	 *            Codes.Lable byte-code
	 * 
	 */
	protected void translate(Codes.Label code, FunctionOrMethod function) {
		CodeStore store = stores.getCodeStore(function);
		store.addStatement(code, code.label + ":;");
	}

	/**
	 * Prints out the message and Generates the stderr, followed by exit
	 * 
	 * @param code
	 */
	protected void translate(Codes.Fail code, FunctionOrMethod function) {
		CodeStore store = stores.getCodeStore(function);
		String indent = store.getIndent();
		String stat = indent + "fprintf(stderr,\"" + code + "\");\n";
		stat += indent + "exit(-1);";// Exit value (-1) means the failure of assertions.
		store.addStatement(code, stat);
	}

	/**
	 * Translates the update byte-code into C code. For example,
	 * 
	 * <pre>
	 * <code>
	 * update %0.pieces[%1] = %7 : {int move,[int] pieces} -> {int move,[int] pieces}
	 * </code>
	 * </pre>
	 * 
	 * can be translated into:
	 * 
	 * <pre>
	 * <code>
	 * _0.pieces[_1] = _7;
	 * </code>
	 * </pre>
	 * 
	 * 
	 * Special cases
	 * <ul>
	 * <li>Referenced array: the update of reference is different, for example,
	 * <code>update (*%0)[%6] = %51 : &[int] -> &[int]</code> can transform this to: <code>(*_0)[_6] = _51;</code>
	 * 
	 * 
	 * @param code
	 */
	protected void translate(Codes.Update code, FunctionOrMethod function) {
		CodeStore store = stores.getCodeStore(function);
		String indent = store.getIndent();
		String s = "";
		String lhs = store.getVar(code.target());
		Type lhs_type = store.getRawType(code.target());
		if (lhs_type instanceof Type.Nominal){
			lhs_type = stores.getNominalType((Type.Nominal)lhs_type);
		}
		
		// For List type only
		if (lhs_type instanceof Type.Array) {
			s += indent + lhs;
			// Iterates operands to increase the depths. 
			for(int i=0;i<code.operands().length-1;i++){
				s += "[" + store.getVar(code.operand(i)) + "]";
			}
		} else if (lhs_type instanceof Type.Record || lhs_type instanceof Type.Union) {
			String member = code.fields.get(0);
			s += indent + CodeGeneratorHelper.accessMember(lhs, member, lhs_type);
			// check if there are two or more operands. If so, then add 'index' operand.
			if (code.operands().length > 1) {
				s += "[" + store.getVar(code.operand(0)) + "]";
			}
		} else {
			throw new RuntimeException("Not implemented" + code);
		}

		s += " = " + store.getVar(code.result()) + ";";
		store.addStatement(code, s);
	}

	protected void translate(Codes.Nop code, FunctionOrMethod function) {
		// Do nothing
		CodeStore store = stores.getCodeStore(function);
		store.addStatement(code, store.getIndent() + ";");
	}

	/**
	 * Translates the <code>Codes.Return</code> byte-code into C code. For example,
	 * 
	 * <pre>
	 * <code>
	 * return %4 : int
	 * </code>
	 * </pre>
	 * 
	 * can be translated into
	 * 
	 * <pre>
	 * <code>
	 * return _4;
	 * </code>
	 * </pre>
	 * 
	 * @param code
	 */
	protected void translate(Codes.Return code, FunctionOrMethod function) {
		CodeStore store = stores.getCodeStore(function);
		List<String> statements = new ArrayList<String>();
		String indent = store.getIndent();
		
		if (function.name().equals("main")) {
			this.deallocatedAnalyzer.ifPresent(a -> statements.addAll(CodeGeneratorHelper.generateDeallocatedCode(a.getOwnerships(function), function, stores)));
			// If the method is "main", then add a simple exit code with value
			statements.add(indent + "exit(0);");
		}else{
			if (code.operand >= 0) {
				this.deallocatedAnalyzer.ifPresent(a -> statements.addAll(CodeGeneratorHelper.generateDeallocatedCode(a.getOwnerships(function), function, stores)));
				// Return the structure.
				statements.add(indent + "return " + store.getVar(code.operand) + ";");
			}
		}
		
		store.addAllStatements(code, statements);
	}

	/**
	 * Translates the <code>Codes.IndexOf</code> byte-code. For example,
	 * 
	 * <pre>
	 * <code>
	 * indexof %11 = %0, %1 : [int]
	 * </code>
	 * </pre>
	 * 
	 * can be translated into:
	 * 
	 * <pre>
	 * <code>
	 * _11=_ls[_i];
	 * </code>
	 * </pre>
	 * 
	 * @param code
	 */
	protected void translate(Codes.IndexOf code, FunctionOrMethod function) {
		CodeStore store = stores.getCodeStore(function);
		String stat = store.getIndent() + store.getVar(code.target()) + "=" + store.getVar(code.operand(0)) + "[";
		// Get rhs type
		Type rhs_type = store.getRawType(code.operand(1));
		if(rhs_type instanceof Type.Union){
			stat += store.getVar(code.operand(1)) + ".integer];";
		}else{
			stat += store.getVar(code.operand(1)) + "];";
		}
		
		store.addStatement(code, stat);
	}

	/**
	 * Translates the <code>Codes.NewList</code> byte-code. For example,
	 * 
	 * <pre>
	 * <code>
	 * newlist %10 = (%1, %2, %3, %4, %5, %6, %7, %8, %9) : int[]
	 * </code>
	 * </pre>
	 * 
	 * can be translated into:
	 * 
	 * <pre>
	 * <code>
	 * _10_size = 9;
	 * _10 = malloc(_10_size*sizeof(long long));
	 * _10[0] = _1; _10[1] = _2; _10[2] = _3; _10[3] = _4; _10[4] = _5; _10[5] = _6; _10[6] = _7; _10[7] = _8; _10[8] = _9;
	 * </code>
	 * </pre>
	 *      
	 * 
	 * Note that if the new list is an empty list, then its element type is a 'void', which is not supposed to store any
	 * value. For example,
	 * 
	 * <pre>
	 * <code>
	 * newlist %5 = () : [void]
	 * </code>
	 * </pre>
	 * 
	 * In this case, the void type is converted into integer type by default because there is no type mapping to the
	 * 'void' type in C. And there is no translation either.
	 * 
	 * @param code
	 */
	protected void translate(Codes.NewList code, FunctionOrMethod function) {
		CodeStore store = stores.getCodeStore(function);
		String indent = store.getIndent();
		
		// Get array names
		String lhs = store.getVar(code.target());
		//Type lhs_type = store.getRawType(code.target());
		List<String> statement = new ArrayList<String>();
		int length = code.operands().length;
		if(length > 0 ){			
			if(this.deallocatedAnalyzer.isPresent()){
				// Construct an array using '_NEW_ARRAY_OWNERSHIP' macro
				statement.add(indent+"_NEW_ARRAY_OWNERSHIP("+lhs+", "+length+");");
			}else{
				// Construct an array using '_NEW_ARRAY' macro
				statement.add(indent+"_NEW_ARRAY("+lhs+", "+length+");");
			}
			
			String s = indent; 
			// Initialize the array
			for (int i=0; i<code.operands().length;i++) {
				s += lhs+"["+i+"] = "+store.getVar(code.operand(i))+"; ";
			}
			statement.add(s);
		}
		
		store.addAllStatements(code, statement);
	}

	/**
	 * Translates FieldLoad byte-code into C code, e.g.
	 * 
	 * <pre>
	 * <code>
	 * fieldload %14 = %1 pieces : {int move,[int] pieces}
	 * </code>
	 * </pre>
	 * 
	 * can be translated into
	 * 
	 * <pre>
	 * <code>
	 * _14 = _1.pieces;
	 * </code>
	 * </pre>
	 * 
	 * Special case:
	 * <ul>
	 * <li>Note that at this stage, the field load code that loads <code>System.out.println</code> is not translated
	 * into any C code.</li>
	 * <li>The field code, that loads <code>fieldload %6 = %0 args</code> is translated into
	 * <code>_6 = convertArgsToIntArray(argc, args, _6_size);</code>
	 * 
	 * @param code
	 * @throws Exception
	 */
	protected void translate(Codes.FieldLoad code, FunctionOrMethod function) {
		String field = code.field;
		CodeStore store = stores.getCodeStore(function);
		String lhs = store.getVar(code.target());
		Type lhs_type = store.getRawType(code.target());
		Type rhs_type = store.getRawType(code.operand(0));
		String indent = store.getIndent();
		List<String> statement = new ArrayList<String>();
		// Skip printing statements, e.g. 'print_s'
		if (field.equals("out") || field.equals("print") || field.equals("println") || field.equals("print_s") || field.equals("println_s")) {
			// Load the field to the target register.
			store.loadField(code.target(), field);
		} else if (field.equals("args")) {
			// Convert the arguments into an array of integer array (long long**).
			statement.add(indent + lhs + " = convertArgsToIntArray(argc, args);");
			statement.add(indent + lhs + "_size = argc - 1;");
		} else {
			String rhs = CodeGeneratorHelper.accessMember(store.getVar(code.operand(0)), code.field, rhs_type);
			this.deallocatedAnalyzer.ifPresent(a -> statement.add(indent + CodeGeneratorHelper.addDeallocatedCode(lhs, lhs_type, stores)));
			boolean isCopyEliminated = isCopyEliminated(code.operand(0), code, function);
			statement.addAll(CodeGeneratorHelper.generateArrayAssignment(lhs_type, indent, lhs, rhs, isCopyEliminated, stores));
			if(isCopyEliminated){
				this.deallocatedAnalyzer.ifPresent(a -> CodeGeneratorHelper.addOwnership(lhs_type, lhs, stores));
				this.deallocatedAnalyzer.ifPresent(a -> CodeGeneratorHelper.removeOwnership(rhs_type, rhs, stores));
			}else{
				// Assigned the ownership
				this.deallocatedAnalyzer.ifPresent(a -> CodeGeneratorHelper.addOwnership(lhs_type, lhs, stores));
				this.deallocatedAnalyzer.ifPresent(a -> CodeGeneratorHelper.addOwnership(rhs_type, rhs, stores));
			}
		}
		store.addAllStatements(code, statement);
	}

	/**
	 * TODO: Not implemented.
	 * 
	 * @param code
	 */
	protected void translate(Codes.Convert code, FunctionOrMethod function) {
		CodeStore store = stores.getCodeStore(function);
		store.addStatement(code, null);
	}



	/**
	 * Generates the C code for <code>Codes.IndirectInvoke</code>. For example,
	 * 
	 * <pre>
	 * <code>
	 * fieldload %2 = %1 println : {method(any) -> void print,method([int]) -> void print_s,method(any) -> void println,method([int]) -> void println_s}
	 * invoke %3 = (%4) IfElse_Valid_2:f : function(int) -> int
	 * indirectinvoke %2 (%3) : method(any) -> void
	 * </code>
	 * </pre>
	 * 
	 * can be translated into
	 * 
	 * <pre>
	 * <code>
	 * indirect_printf(_3);
	 * </code>
	 * </pre>
	 * 
	 * where 'indirect_printf' function is defined in 'Util.c'.
	 * 
	 * If the input type is an instance of user defined type, then get the type declaration first and convert it into
	 * the corresponding type.
	 * 
	 * @param code
	 *            Codes.IndirectInvoke byte-code
	 * 
	 */
	protected void translate(Codes.IndirectInvoke code, FunctionOrMethod function) {
		CodeStore store = stores.getCodeStore(function);
		String statement = store.getIndent();
		if (code.type() instanceof Type.FunctionOrMethod) {
			// Get the function name, e.g. 'printf'.
			String print_name = store.getField(code.operand(0));
			// Get the input
			String input = store.getVar(code.operand(1));
			switch (print_name) {
			case "print":
				statement += "printf(\"%d\\n\", " + input + ");";
				break;
			case "print_s":
				// E.g. 'println("%s", str);'
				statement += "printf_s(" + input + ", " + input + "_size);";
				break;
			case "println_s":
				statement += "println_s(" + input + ", " + input + "_size);";
				break;
			case "println":
				// Check input's type to call different println function.
				Type type = store.getRawType(code.operand(1));
				if (type instanceof Type.Int) {
					statement += "printf(\"%d\\n\", " + input + ");";
				} else if (type instanceof Type.Array) {
					// Print out an array with given array size.
					statement += "printf_array(" + input + ", " + input + "_size);";
				} else if (type instanceof Type.Nominal) {
					Type.Nominal nominal = (Type.Nominal) type;
					// Print out a user-defined type structure
					statement += "printf_" + nominal.name().name() + "(" + input + ");";
				} else if (type instanceof Type.Union){
					statement += "printf(\"%d\\n\", " + input + ".integer);";
				} else {
					throw new RuntimeException("Not implemented." + code);
				}
				break;
			default:
				throw new RuntimeException("Not implemented." + code);
			}

		}
		store.addStatement(code, statement);
	}

	protected void translate(UnaryOperator code, FunctionOrMethod function) {
		CodeStore store = stores.getCodeStore(function);
		String target = prefix + code.target();
		String stat = store.getIndent() + target + "= -" + prefix + code.operand(0) + ";";
		store.addStatement(code, stat);
	}


	/**
	 * Iterate over the list of loop byte-code and translate each code into C code. To separate the bytecode inside a
	 * loop from the main byte-code, the loop flag is enabled and the indentation is increased.
	 * 
	 * @param code
	 */
	protected void translate(Loop code, FunctionOrMethod function) {
		CodeStore store = stores.getCodeStore(function);

		String indent = store.getIndent();
		String statement = indent + "while(true){";
		store.addStatement(code, statement);


		// Increase the indent for loop body.
		store.increaseIndent();
		// Translate the loop body
		iterateCodes(code.bytecodes(), function);

		// Decrease the indentation after loop body.
		store.decreaseIndent();
		// Add the ending bracket.
		store.addStatement(null, store.getIndent() + "}");
	}


	/**
	 * Translates the new record byte-code. For example,
	 * 
	 * <pre>
	 * <code>newrecord a = (b, c) : {int move,[int] pieces}</code>
	 * </pre>
	 * 
	 * can be translated into:
	 * 
	 * <pre>
	 * <code>
	 * a = create_Board();
	 * a.move = b;
	 * a.pieces = c;
	 * a.pieces_size = c_size;
	 * </code>
	 * </pre>
	 * 
	 * @TODO Fix the sequence of fields in a record type as the order of fields is in the reversed direction of
	 *       operands.
	 * 
	 * @param code
	 */
	protected void translate(NewRecord code, FunctionOrMethod function) {
		CodeStore store = stores.getCodeStore(function);
		String indent = store.getIndent();
		String lhs = store.getVar(code.target());
		List<String> statement = new ArrayList<String>();
		WyilFile.Type user_type = stores.getRecordType((Type.Record)store.getRawType(code.target()));
		Type lhs_type = user_type.type();
		// Add deallocation code to lhs structure
		this.deallocatedAnalyzer.ifPresent(a -> statement.add(indent + CodeGeneratorHelper.addDeallocatedCode(lhs, lhs_type, stores)));
		
		// Call 'create_Board()' to create a new structure
		statement.add(indent + lhs + " = create_" + user_type.name()+"();");
	
		// Assign lhs structure members with rhs member, e.g. 'a.pieces = copy(b, b_size);' 
		List<String> members = CodeGeneratorHelper.getMemebers(code.type());
		
		int[] operands = code.operands();
		for(int i=0;i<operands.length; i++){
			// Get operand 
			String rhs = store.getVar(operands[i]);
			String member = members.get(i);
			String lhs_member = CodeGeneratorHelper.accessMember(lhs, member, lhs_type);
			//Type type = store.getVarType(code.operand(i));
			Type type = code.type().field(member);
			// Propagate '_size' variable.
			if (type instanceof Type.Array) {
				statement.add(indent + CodeGeneratorHelper.generateArraySizeAssign(type, lhs_member, rhs));
				statement.add(indent + lhs_member + " = " + optimizeCode(operands[i], code, function));
			}else if(type instanceof Type.Int){
				statement.add(indent + lhs_member + " = " + rhs + ";");
			}else {
				throw new RuntimeException("Not Implemented!");
			}
		}
		
		// Assign ownership to lhs 
		this.deallocatedAnalyzer.ifPresent(a -> statement.add(indent + CodeGeneratorHelper.addOwnership(lhs_type, lhs, this.stores)));
		
		// Get the set of field names and convert it to an array of string.
		store.addAllStatements(code, statement);
	}

	/**
	 * Write out the generated C code, which starts with variable declarations, followed by a list of statements and a
	 * list of free statements at the end.
	 * 
	 * @param writer
	 */
	protected void writeFunction(FunctionOrMethod function) {
		// Get the code store
		CodeStore store = stores.getCodeStore(function);
		// Write out the header file
		
		// Function header
		List<String> function_header = new ArrayList<String>();
		function_header.add(this.declareFunction(function) + ";");
		String file_name = config.getFilename();
		try {
			// Create a new one or over-write an existing one.
			Files.write(Paths.get(file_name+".h"), function_header, StandardOpenOption.APPEND);
		} catch (IOException e) {
			throw new RuntimeException("Errors occur in writeIncludes()");
		}
		
		
		
		// Function body
		List<String> function_body = new ArrayList<String>();
		function_body.add(this.declareFunction(function) + "{");
		function_body.addAll(this.declareVariables(function));
		function_body.addAll(store.getStatements());
		function_body.add("}\n");
		
		
		try {
			// Create a new one or over-write an existing one.
			Files.write(Paths.get(file_name+".c"), function_body, StandardOpenOption.APPEND);
		} catch (IOException e) {
			throw new RuntimeException("Errors occur in writeIncludes()");
		}
		
	}


	/**
	 * Translate ifis Wyil code into C code. This code checks that the register is the given value.
	 * 
	 * For example, the ifis Wyil code <code>ifis %1, null goto blklab6 : null|int</code> can be translated int C code
	 * <code>if(_1 == NULL) {goto blklab6;}
	 * 
	 */
	@Override
	protected void translate(IfIs code, FunctionOrMethod function) {
		CodeStore store = stores.getCodeStore(function);
		String statement = "";
		// The ifis code checks if the register is NULL or not.
		if (code.rightOperand instanceof Type.Null) {
			// Get lhs type
			Type lhs_type = store.getRawType(code.operand);
			String lhs = store.getVar(code.operand);
			String indent = store.getIndent();
			if(CodeGeneratorHelper.isIntType(lhs_type, stores)){
				statement = indent + "if(" + lhs + ".null == NULL) { goto " + code.target+ ";}";
			}else{
				statement = indent + "if(" + lhs + " == NULL) { goto " + code.target+ ";}";
			}
		} else {
			throw new RuntimeException("Not implemented!" + code);
		}
		store.addStatement(code, statement);
	}

	/**
	 * Translate deference Wyil code into C code. Deference in C is to use '*' operator to get the value of lhs operand
	 * and assign it to rhs operand.
	 * 
	 * For example, <code>
	 * deref %16 = %0 : &[int]
	 * </code> can translate this into <code>
	 * _16 = *(_0);
	 * </code>
	 * 
	 * 
	 * @param code
	 *            Dereference Wyil code
	 * @param function
	 *            function
	 */
	@Override
	protected void translate(Dereference code, FunctionOrMethod function) {
		CodeStore store = stores.getCodeStore(function);
		String statement = store.getIndent() + store.getVar(code.target()) + " = *(" + store.getVar(code.operand(0))
		+ ");";
		// Check if the value in the rhs register is an array.
		if (code.type().element() instanceof Type.Array) {
			// Assign the array size to lhs register
			statement += "\n" + store.getIndent() + store.getVar(code.target()) + "_size = "
					+ store.getVar(code.operand(0)) + "_size;";
		}
		store.addStatement(code, statement);
	}

	/**
	 * Translate newobject Wyil code into C code. The newObject code creates a new object from the value of 'rhs' and
	 * assign the address of new object to 'lhs'.
	 * 
	 * For example, <code>
	 * newobject %4 = %3 : &[void]
	 * </code> can translate this into <code>
	 * long long* _3_value = copy(_3, _3_size);
	 * _4 =(void**)&(_3_value);
	 * _4_size = _3_size;
	 * </code>
	 * 
	 * 
	 */
	@Override
	protected void translate(NewObject code, FunctionOrMethod function) {
		CodeStore store = stores.getCodeStore(function);
		String statement = "";
		// Check that the given value is an array.
		if (code.type().element() instanceof Type.Array) {
			String rhs = store.getVar(code.operand(0));
			statement += optimizeCode(code.operand(0), code, function);
			// Get the address of rhs and assign it to lhs with type casting.
			String lhs = store.getVar(code.target());
			Type lhs_type = store.getRawType(code.target());
			// _4 =(void**)&(_3_value);
			statement += store.getIndent() + lhs + " = (" + CodeGeneratorHelper.translateType(lhs_type, stores) + ")" + "&(" + rhs + "_value);\n";
			// Propagate array size from rhs to lhs
			statement += store.getIndent() + lhs + "_size = " + rhs + "_size;";
		} else {
			throw new RuntimeException("Not implemented! " + code);
		}
		store.addStatement(code, statement);
	}



	/***
	 *  Generates a multi-dimensional array with 'genXDArray' built-in C function in C, e.g.
	 * <pre>
	 * <code>
	 * listgen a = [b; c] : int[][]
	 * </code> 
	 * </pre>
	 * can translate this into
	 * <pre><code>
	 * a_size = c;
	 *	if(a_has_ownership){free2DArray(a, a_size); a_has_ownership = false;}
	 * a_size_size = __size;
	 * a = gen2DArray(b, a_size, a_size_size);
	 * a_has_ownership = true;
	 * </code></pre>
	 *  Creates a 2D array ( _11*_10_size) with initial '_10' value.
	 */
	@Override
	protected void translate(ListGenerator code, FunctionOrMethod function) {
		CodeStore store = stores.getCodeStore(function);
		String indent = store.getIndent();
		String lhs = store.getVar(code.target());
		String rhs = store.getVar(code.operand(0));
		String size = store.getVar(code.operand(1));
		List<String> statements = new ArrayList<String>();
		List<String> lhs_sizes = CodeGeneratorHelper.getArraySizeVars(lhs, code.type());
		List<String> rhs_sizes = CodeGeneratorHelper.getArraySizeVars(rhs, code.type());
		
		// Propagate array sizes 
		statements.add(indent + lhs_sizes.get(0) + " = " + size+";");
		// Deallocate lhs
		this.deallocatedAnalyzer.ifPresent(a -> statements.add(indent + CodeGeneratorHelper.addDeallocatedCode(lhs, code.type(), stores)));
		// Propagate the remaining lhs sizes
		IntStream.range(1, lhs_sizes.size())
		.forEach(i-> statements.add(indent + lhs_sizes.get(i) + " = " + rhs_sizes.get(i-1) + ";"));
		
		// Call 'genXArray' function to create an array with given sizes.
		statements.add(indent + lhs + " = gen"+lhs_sizes.size()+"DArray("+rhs + ", " + CodeGeneratorHelper.generateArraySizeVars(lhs, code.type())+");");
		
		// Assign ownership
		this.deallocatedAnalyzer.ifPresent(a -> statements.add(indent + CodeGeneratorHelper.addOwnership(code.type(), lhs, this.stores)));
		
		store.addAllStatements(code, statements);
	}



	/**
	 * Write the user defined data types to *.h file, e.g. <code>
	 * typedef struct{
	 *		Square* pieces;
	 *		long long pieces_size;
	 * 		nat move;
	 * } Board;<br>
	 * </code> Also, add a 'print' function to print out the structure.
	 */
	protected void writeUserTypes(List<wyil.lang.WyilFile.Type> userTypes) {
		String filename = this.config.getFilename();
		List<String> structs = new ArrayList<String>();
		List<String> statements = new ArrayList<String>();

		// Iterate each user type and write out code to source and header files.
		for (wyil.lang.WyilFile.Type userType : userTypes) {
			String type_name = userType.name();
			Type type = userType.type();
			// Check if userType is a typedef structure.
			if(type instanceof Type.Int){
				structs.add("typedef " + CodeGeneratorHelper.translateType(type, stores) + " " + type_name + ";");
			}else if(type instanceof Type.Record || type instanceof Type.Union){
				structs.addAll(CodeGeneratorHelper.generateStructDef(type, stores));
				statements.addAll(CodeGeneratorHelper.generateStructFunction(type, stores));
			}else{
				throw new RuntimeException("Not Implemented!");
			}
		}

		// Write out user-defined structures to *.h
		try {
			Files.write(Paths.get(filename + ".h"), structs, StandardOpenOption.APPEND);
		} catch (IOException e) {
			throw new RuntimeException("Errors occurs in writing "+structs+" to "+filename+".h");
		}

		// Write out statements to *.c
		try {
			Files.write(Paths.get(filename + ".c"), statements, StandardOpenOption.APPEND);
		} catch (IOException e) {
			throw new RuntimeException("Errors in writing "+statements+" to "+filename + ".c");
		}
	}

	/**
	 * Defines constants, e.g. <code>
	 * #define BLANK 0
	 * </code>
	 * 
	 * 
	 */
	protected void writeConstants(Collection<WyilFile.Constant> constants) {
		// Generates declarations
		List<String> declarations = new ArrayList<String>();
		constants.forEach(c -> declarations.add("#define " + c.name() + " " + c.constant()));

		String filename = config.getFilename();
		try {
			Files.write(Paths.get(filename + ".h"), declarations, StandardOpenOption.APPEND);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


	/**
	 * Write out 'includes' both in 'test_case.c' and 'test_case.h'
	 */
	protected void writeIncludes() {
		String file_name = this.config.getFilename();
		// Writes out #include "Util.h" to test_case.h 
		String includes = "#include \"Util.h\"\n";
		try {
			// Create a new one or over-write an existing one.
			Files.write(Paths.get(file_name+".h"), includes.getBytes(), StandardOpenOption.CREATE, StandardOpenOption.TRUNCATE_EXISTING);
		} catch (IOException e) {
			throw new RuntimeException("Errors occur in writeIncludes()");
		}

		// Writes out #include "test_case.h" to test_case.c
		includes = "#include \""+file_name+".h\"\n";
		try {
			Files.write(Paths.get(file_name+".c"), includes.getBytes(), StandardOpenOption.CREATE, StandardOpenOption.TRUNCATE_EXISTING);
		} catch (IOException e) {
			throw new RuntimeException("Errors occur in writeIncludes()");
		}
	}
}
