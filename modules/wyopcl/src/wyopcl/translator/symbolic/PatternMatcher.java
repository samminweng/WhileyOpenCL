package wyopcl.translator.symbolic;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map.Entry;
import java.util.TreeMap;

import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Codes.Assign;
import wyil.lang.Codes.Comparator;
import wyil.lang.Constant;
import wyil.lang.Code.Block;
import wyil.lang.Codes.BinaryOperatorKind;
import wyil.lang.Type;
import wyil.lang.WyilFile.Case;
import wyil.lang.WyilFile.FunctionOrMethodDeclaration;
import wyopcl.translator.Configuration;
import wyopcl.translator.symbolic.pattern.NullPattern;
import wyopcl.translator.symbolic.pattern.P1;
import wyopcl.translator.symbolic.pattern.P2;
import wyopcl.translator.symbolic.pattern.Pattern;
import wyopcl.translator.symbolic.pattern.Pattern.PART;

/**
 * 
 * This class infers the pattern from a list of code and outputs the pattern object. 
 * This pattern matcher is implemented with <a href="http://www.tutorialspoint.com/design_pattern/factory_pattern.htm">factory pattern</a> 
 *  
 * @author Min-Hsien Weng
 *
 */
public class PatternMatcher {
	private final String prefix = "%";
	private final Configuration config;	
	private List<Class<? extends Pattern>> avail_patterns;//Store the available patterns.

	public PatternMatcher(Configuration config){
		this.config = config;
		this.avail_patterns = new ArrayList<Class<? extends Pattern>>();
		this.avail_patterns.add(P1.class);
		this.avail_patterns.add(P2.class);
	}
	
	/**
	 * Transform the pattern of P1 or P2 type to the other type.
	 * @param pattern
	 * @return
	 */
	private Pattern transform(Pattern pattern){
		//No transformation 
		if(pattern instanceof NullPattern) return pattern;
		
		if(pattern instanceof P1){
			List<Code> blk = new ArrayList<Code>();
			P1 p1 = (P1) pattern;
			//Get the loop var
			int loop_var = Integer.parseInt(p1.V.replace("%", ""));
			//Construct the 'init_pre' of P2
			//Replace the 'init' of P1 with the constant in 'loop_header' part.  
			//Put all the constants of the P1's loop header into the init_pre part.
			List<Code> loop_header = p1.getPart(PART.LOOP_HEADER.index());
			Comparator comparingOp = null;
			String blklabel = null;
			for(Code code: loop_header){
				if(code instanceof Codes.Const){
					blk.add(code);
				}else if(code instanceof Codes.If){
					Codes.If if_code = (Codes.If)code;
					int op = -1;
					//Get the comparing operand
					if(loop_var==if_code.leftOperand){ 							
						op = if_code.rightOperand;
					}else if(loop_var == if_code.rightOperand){
						op = if_code.leftOperand;
					}					
					if(op >0){						
						comparingOp = if_code.op;
						blklabel = if_code.target;
						//Construct an assignment for loop variable 
						Codes.Assign init_assign = Codes.Assign(Type.T_INT, loop_var, op);
						blk.add(init_assign);
					}
				}
			}
			//Get the 'init_post'
			blk.addAll(p1.getPart(PART.INIT_POST.index()));			
			
			//Construct the loop header for P2 pattern
			//Add the loop bytecode
			for(Code code: loop_header){
				if(code instanceof Codes.Loop){
					Codes.Loop loop = (Codes.Loop)code;
					//Check if loop_var is used in the loop
					for(int op: loop.modifiedOperands){
						if(op == loop_var){
							blk.add(loop);
						}
					}
				}
			}
			//Add all the code in the 'init_pre'
			blk.addAll(p1.getPart(PART.INIT_PRE.index()));
			//Get the initial assignment code 
			int init_assignOp = ((Codes.Assign) p1.getPart(PART.INIT.index()).get(0)).operand(0);
			
			if(comparingOp.equals(Comparator.LTEQ)){
				//Construct a ifge 
				blk.add(Codes.If(Type.Int.T_INT, loop_var, init_assignOp, Comparator.GTEQ, blklabel));
			}else{
				blk.add(Codes.If(Type.Int.T_INT, loop_var, init_assignOp, Comparator.GT, blklabel));
			}
			//Add the code in the 'loopbody_pre'
			List<Code> loopbody_pre = p1.getPart(PART.LOOPBODY_PRE.index());
			int index;
			for(index=0;index<loopbody_pre.size()-1;index++){
				blk.add(loopbody_pre.get(index));
			}
			Codes.BinaryOperator binOp = (Codes.BinaryOperator)loopbody_pre.get(index);
			
			//Construct a 'add' binOp
			blk.add(Codes.BinaryOperator(binOp.type(), binOp.target(), binOp.operand(0), binOp.operand(1), BinaryOperatorKind.ADD));
			
			//Add the loop_decr
			blk.addAll(p1.getPart(PART.LOOPBODY_DECR.index()));
			blk.addAll(p1.getPart(PART.LOOPBODY_POST.index()));
			blk.addAll(p1.getPart(PART.LOOP_EXIT.index()));
			//For debugging
			if(config.isVerbose()){
				for(Code code: blk){
					System.out.println(code);
				}
			}
			//Analyze the transformed list of code.
			return analyzePattern(p1.param_size, blk);
		}else if(pattern instanceof P2){
			
		}
		
		//In other cases, no transformation
		return pattern;
		
	}
	
	
	
	
	/**
	 * Iterate each code of the input function and build up the loop blk.
	 * @param functionOrMethod
	 */
	public void buildCodeBlockAndMatchPattern(FunctionOrMethodDeclaration functionOrMethod){
		int line = 0;
		String func_name = functionOrMethod.name();			
		int param_size = functionOrMethod.type().params().size();
		//Iterate each byte-code of a function block.			
		for(Case mcase : functionOrMethod.cases()){
			//Store the list of code for a function.
			List<Code> code_blk = new ArrayList<Code>();	
			//Begin the function
			System.out.println("\n----------------Start of "+func_name+" function----------------");	
			//Parse each byte-code and add the constraints accordingly.
			for(Block.Entry entry :mcase.body()){
				Code code = entry.code;
				//Print out the bytecode if verbose is enabled.
				if(config.isVerbose()){
					if(code instanceof Codes.Label){
						System.out.println(func_name+"."+(++line)+" ["+code+"]");
					}else{
						System.out.println(func_name+"."+(++line)+" [\t"+code+"]");
					}
				}	
				code_blk.add(code);					
			}			
			Pattern pattern = analyzePattern(param_size, code_blk);
			System.out.println(pattern);
			System.out.println("The transformed pattern:\n"+transform(pattern));
			code_blk = null;
			//End of the function
			System.out.println("\n----------------End of "+func_name+" function----------------\n");
		}		

	}
	
	/**
	 * Takes the list of loop bytecode as input, take the block of loop bytecode, iterate over all available patterns
	 * and check if the given loop is matched with any one of them by using the pattern checker.
	 * @param param_size the size of input parameters.
	 * @param block the code block
	 * @return pattern. If not found, return null.
	 */
	private Pattern analyzePattern(int param_size, List<Code> block){
		Pattern pattern = null;		
		//Iterate over all the available patterns.
		for(Class<? extends Pattern> avail_pattern: avail_patterns){
			try {
				//Get the constructor				
				Constructor<? extends Pattern> constructor = avail_pattern.getConstructor(int.class, List.class);
				if(constructor!=null){
					pattern = constructor.newInstance(param_size, block);
					//Check if the loop block is matched with the pattern. If so, then return the pattern. 
					if(!pattern.isNil()){
						return pattern;
					}					
				}								
			} catch (InstantiationException | IllegalAccessException | IllegalArgumentException
					| InvocationTargetException | NoSuchMethodException | SecurityException e) {				
				e.printStackTrace();
			}
			pattern = null;
		}
		//If no patterns are matched, then return NullPattern.
		if(pattern == null){
			pattern = new NullPattern(param_size, block);
		}		

		return pattern;
	}


}
