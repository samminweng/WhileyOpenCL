package wyopcl.translator;

import java.util.ArrayList;
import java.util.List;

import wyil.lang.Code;
import wyil.lang.Code.Block;
import wyil.lang.WyilFile.Case;
import wyil.lang.WyilFile.FunctionOrMethodDeclaration;

/**
 * 
 * Stores the common methods used in all modules of the translator 
 * @author Min-Hsien Weng
 *
 */
public final class TranslatorHelper {

	/**
	 * Get the list of code for a function.
	 * @param functionOrMethod the function or method declaration.
	 * @return the list of code.
	 */
	public static List<Code> getCodeBlock(FunctionOrMethodDeclaration functionOrMethod){
		List<Code> code_blk = new ArrayList<Code>();
		for(Case mcase : functionOrMethod.cases()){
			for(Block.Entry entry :mcase.body()){
				//Get each bytecode and add it to the code_blk.
				code_blk.add(entry.code);		
			}
		}		
		return code_blk;
	}
	
}
