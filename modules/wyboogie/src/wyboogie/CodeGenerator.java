package wyboogie;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import wyil.attributes.VariableDeclarations;
import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Codes.ArrayGenerator;
import wyil.lang.Codes.AssertOrAssume;
import wyil.lang.Codes.Assign;
import wyil.lang.Codes.BinaryOperator;
import wyil.lang.Codes.Comparator;
import wyil.lang.Codes.Const;
import wyil.lang.Codes.Convert;
import wyil.lang.Codes.Debug;
import wyil.lang.Codes.Dereference;
import wyil.lang.Codes.Fail;
import wyil.lang.Codes.FieldLoad;
import wyil.lang.Codes.Goto;
import wyil.lang.Codes.If;
import wyil.lang.Codes.IfIs;
import wyil.lang.Codes.IndexOf;
import wyil.lang.Codes.IndirectInvoke;
import wyil.lang.Codes.Invoke;
import wyil.lang.Codes.Label;
import wyil.lang.Codes.Lambda;
import wyil.lang.Codes.LengthOf;
import wyil.lang.Codes.Loop;
import wyil.lang.Codes.NewArray;
import wyil.lang.Codes.NewObject;
import wyil.lang.Codes.NewRecord;
import wyil.lang.Codes.Nop;
import wyil.lang.Codes.Return;
import wyil.lang.Codes.UnaryOperator;
import wyil.lang.Codes.Update;
import wyil.lang.Constant;
import wyil.lang.Type;
import wyil.lang.WyilFile;
import wyil.lang.WyilFile.FunctionOrMethod;

/**
 * Takes a list of functional byte-code and converts it into C code.
 * 
 * @author Min-Hsien Weng
 * @author Mark Utting
 *
 */
public class CodeGenerator extends AbstractCodeGenerator {

	/**
	 * Constructor
	 */
	public CodeGenerator() {
	}

	@Override
	protected void apply(WyilFile module) {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected void translate(Update code, FunctionOrMethod function) {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected void translate(UnaryOperator code, FunctionOrMethod function) {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected void translate(Nop code, FunctionOrMethod function) {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected void translate(Return code, FunctionOrMethod function) {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected void translate(NewRecord code, FunctionOrMethod function) {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected void translate(LengthOf code, FunctionOrMethod function) {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected void translate(Label code, FunctionOrMethod function) {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected void translate(Loop code, FunctionOrMethod function) {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected void translate(IndirectInvoke code, FunctionOrMethod function) {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected void translate(Invoke code, FunctionOrMethod function) {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected void translate(IndexOf code, FunctionOrMethod function) {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected void translate(If code, FunctionOrMethod function) {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected void translate(Goto code, FunctionOrMethod function) {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected void translate(FieldLoad code, FunctionOrMethod function) {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected void translate(Fail code, FunctionOrMethod function) {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected void translate(Const code, FunctionOrMethod function) {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected void translate(Convert code, FunctionOrMethod function) {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected void translate(BinaryOperator code, FunctionOrMethod function) {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected void translate(Assign code, FunctionOrMethod function) {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected void translate(AssertOrAssume code, FunctionOrMethod function) {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected String declareFunction(FunctionOrMethod function) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected List<String> declareVariables(FunctionOrMethod function) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected void translate(Debug code, FunctionOrMethod function) {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected void translate(Lambda code, FunctionOrMethod function) {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected void translate(NewArray code, FunctionOrMethod function) {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected void translate(ArrayGenerator code, FunctionOrMethod function) {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected void translate(NewObject code, FunctionOrMethod function) {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected void translate(Dereference code, FunctionOrMethod function) {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected void translate(IfIs code, FunctionOrMethod function) {
		// TODO Auto-generated method stub
		
	}

}
