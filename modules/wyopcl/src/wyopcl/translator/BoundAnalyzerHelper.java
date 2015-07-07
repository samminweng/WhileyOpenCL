package wyopcl.translator;

import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map.Entry;

import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Type;
import wyopcl.translator.bound.BasicBlock;
import wyopcl.translator.bound.CFGController;
import wyopcl.translator.bound.Bounds;
import wyopcl.translator.bound.Domain;

/**
 * Utility class for bound analyzer.
 * @author Min-Hsien Weng
 *
 */
public final class BoundAnalyzerHelper {
	private static String prefix = "%";
	//The boolean flag is used to show whether the code is inside an assertion or assumption.	
	private static String assertOrAssume_label = null;
	//Color code
	private static String GRAY = (char)27 +"[30;1m";
	private static String BLUE = (char)27 +"[34;1m";
	private static String RED = (char)27 + "[31;1m";
	private static String RESET = (char)27 + "[0m";	
	
	private BoundAnalyzerHelper(){

	}
	
	/**
	 * Prints out each bytecode with line number and indentation.
	 * @param name
	 * @param line
	 * @see <a href="http://en.wikipedia.org/wiki/ANSI_escape_code">ANSI escape code</a>
	 */
	protected static int printWyILCode(Code code, String name, int line, CFGController blk_ctrl){
		//Print out the bytecode with the format (e.g. 'main.9 [const %12 = 2345 : int]')
		String font_color_start = "";
		String font_color_end = "";
		//Use the ANSI escape color to distinguish the set of bytecode of the assertion.
		if(blk_ctrl.checkInvariant()){
			font_color_start = GRAY;
			font_color_end = RESET;
		}
		if(code instanceof Codes.Label){
			//System.out.println(font_color_start+name+"."+line+"."+depth+" ["+code+"]"+font_color_end);
			System.out.println(font_color_start+name+"."+line+" ["+code+"]"+font_color_end);
		}else{
			//System.out.println(font_color_start+name+"."+line+"."+depth+" [\t"+code+"]"+font_color_end);
			System.out.println(font_color_start+name+"."+line+" [\t"+code+"]"+font_color_end);
		}
		return ++line;
	}
	
	/**
	 * Outputs the control flow graphs (*.dot).
	 * @param blks the list of block
	 * @param filename the name of input file.
	 * @param func_name the name of function.
	 */
	protected static void printCFG(List<BasicBlock> blks, String filename, String func_name){
		//Sort the blks.
		//blk_ctrl.sortedList();
		String dot_string= "digraph "+func_name+"{\n";		

		for(BasicBlock blk: blks){
			if(!blk.isLeaf()){
				for(BasicBlock child: blk.getChildNodes()){
					dot_string += "\""+blk.getBranch()+" [" +blk.getType()+"]\"->\""+ child.getBranch() +" ["+child.getType() + "]\";\n";
				}
			}
		}
		dot_string += "\n}";
		//Write out the CFG-function_name.dot
		try {
			PrintWriter cfg_writer = new PrintWriter(filename+"-"+func_name+".dot", "UTF-8");
			cfg_writer.println(dot_string);
			cfg_writer.close();
		} catch (FileNotFoundException | UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

	/**
	 * Extract the function name.
	 * @param functionOrMethod
	 * @return
	 *//*
	protected static String castDeclarationtoString(FunctionOrMethodDeclaration functionOrMethod){
		String declaration = functionOrMethod.type().ret() + " "+functionOrMethod.name()+"(";
		if(!functionOrMethod.name().equals("main")){			
			boolean isFirst = true;
			int index=0;
			for(Type paramType : functionOrMethod.type().params()){
				//input parameter
				if(isFirst){
					declaration += paramType+" "+prefix+index;
				}else{
					declaration += ", "+paramType+ " "+prefix+index;
				}
				isFirst = false;
				index++;
			}		
		}else{
			boolean isFirst = true;
			Type.Record paramType = (Type.Record) functionOrMethod.type().params().get(0);
			for(Entry<String, Type> entry :paramType.fields().entrySet()){
				if(isFirst){
					declaration += entry.getValue() + " "+entry.getKey();
				}else{
					declaration += ", " +entry.getValue() + " "+entry.getKey();
				}
				isFirst = false;
			}			
		}
		declaration +=")";
		return declaration;
	}*/

	/**
	 * Check if the type is instance of Integer by inferring the type from 
	 * <code>wyil.Lang.Type</code> objects, including the effective collection types.
	 * @param type 
	 * @return true if the type is or contains an integer type. 
	 */
	public static boolean isIntType(Type type){
		if(type instanceof Type.Int){
			return true;
		}

		/*if(type instanceof Type.Map){
			Type.Map map = (Type.Map)type;
			//Check the type of values in the map.
			return isIntType(map.key()) || isIntType(map.value());			
		}*/

		if(type instanceof Type.List){
			return isIntType(((Type.List)type).element());
		}

		if (type instanceof Type.Tuple){
			//Check the type of value field. 
			Type element = ((Type.Tuple)type).element(1);
			return isIntType(element);	
		}

		return false;
	}

	

	
	

}
