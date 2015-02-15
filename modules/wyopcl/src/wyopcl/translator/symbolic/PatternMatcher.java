package wyopcl.translator.symbolic;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import wyil.lang.Code;
import wyil.lang.Code.Block;
import wyil.lang.Codes;
import wyil.lang.Codes.BinaryOperatorKind;
import wyil.lang.Codes.Comparator;
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
	//private final String prefix = "%";
	private final Configuration config;	
	private List<Class<? extends Pattern>> avail_patterns;//Store the available patterns.

	public PatternMatcher(Configuration config){
		this.config = config;
		this.avail_patterns = new ArrayList<Class<? extends Pattern>>();
		this.avail_patterns.add(P1.class);
		this.avail_patterns.add(P2.class);
	}

	/**
	 * Construct  the 'init_pre' and 'init' parts  from one pattern type to another.
	 * @param p1
	 * @param loop_var
	 * @param blk
	 * @return
	 */
	private Codes.Assign getInitAssign(Pattern p, int loop_var, List<Code> blk){
		//Put all the other code in the p's loop header into the code block.
		List<Code> loop_header = p.getPart(PART.LOOP_HEADER.index);
		for(Code code: loop_header){
			if(!(code instanceof Codes.Loop)){
				if(code instanceof Codes.If){
					Codes.If if_code = (Codes.If)code;
					//Get the comparing operand
					if(loop_var==if_code.leftOperand){
						//Construct an assignment for loop variable 
						return Codes.Assign(if_code.type, loop_var, if_code.rightOperand);	
					}else if(loop_var == if_code.rightOperand){
						//Construct an assignment for loop variable 
						return Codes.Assign(if_code.type, loop_var, if_code.leftOperand);
					}
				}
				blk.add(code);
			}
		}		
		return null;
	}


	/**
	 * Construct the loop condition from one pattern type to another
	 * @param p pattern
	 * @param loop_var the loop variable
	 * @param blk the code block
	 * @return the bytecode of loop condition.
	 */
	private Codes.If getLoopCondition(Pattern p, int loop_var, List<Code> blk){
		List<Code> loop_header = p.getPart(PART.LOOP_HEADER.index);
		Codes.Loop loop = (Codes.Loop)loop_header.get(0);
		//Add the loop bytecode
		blk.add(loop);			

		//Add all the code in the 'init_pre'
		blk.addAll(p.getPart(PART.INIT_PRE.index));
		//Get the initial assignment code 
		int init_assignOp = ((Codes.Assign) p.getPart(PART.INIT.index).get(0)).operand(0);
		Codes.If condition = (Codes.If) loop_header.get(loop_header.size()-1);
		
		switch (condition.op){
		case LTEQ:
			return Codes.If(Type.Int.T_INT, loop_var, init_assignOp, Comparator.GTEQ, condition.target);
		case LT:
			return Codes.If(Type.Int.T_INT, loop_var, init_assignOp, Comparator.GT, condition.target);
		case GTEQ:
			return Codes.If(Type.Int.T_INT, loop_var, init_assignOp, Comparator.LTEQ, condition.target);
		case GT:
			return Codes.If(Type.Int.T_INT, loop_var, init_assignOp, Comparator.LT, condition.target);
		default:
			return null;
		}
	}

	/**
	 * Get the increment for P2 pattern or the decrement for P1
	 * @param p1
	 * @param loop_var
	 * @param blk
	 * @return
	 */
	private Codes.BinaryOperator getIncrOrDecr(Pattern p, int loop_var, List<Code> blk){
		List<Code> loopbody_pre = p.getPart(PART.LOOPBODY_PRE.index);
		Codes.BinaryOperator binOp = (Codes.BinaryOperator)loopbody_pre.get(loopbody_pre.size()-1);
		switch(binOp.kind){
		case ADD:
			//Construct a 'sub' bin
			return Codes.BinaryOperator(binOp.type(), binOp.target(), binOp.operand(0), binOp.operand(1), BinaryOperatorKind.SUB);
		case SUB:
			//Construct a 'add' binOp
			return Codes.BinaryOperator(binOp.type(), binOp.target(), binOp.operand(0), binOp.operand(1), BinaryOperatorKind.ADD);
		default:
			return null;	
		}		
	}


	/**
	 * Transform the pattern of P1 or P2 type to the other type.
	 * @param pattern
	 * @return
	 */
	private Pattern transform(Pattern p){
		//No transformation 
		if(p instanceof NullPattern) return p;
		//Store all the bytecode for the new pattern.
		List<Code> blk = new ArrayList<Code>();		
		//Get the loop var
		int loop_var = Integer.parseInt(p.V.replace("%", ""));

		blk.add(getInitAssign(p, loop_var, blk));
		//Get the 'init_post'
		blk.addAll(p.getPart(PART.INIT_POST.index));			

		//Get the loop header
		blk.add(getLoopCondition(p, loop_var, blk));

		//Add the code in the 'loopbody_pre'
		List<Code> loopbody_pre = p.getPart(PART.LOOPBODY_PRE.index);
		int index;
		for(index=0;index<loopbody_pre.size()-1;index++){
			blk.add(loopbody_pre.get(index));
		}
		
		//Get the increment or decrement
		blk.add(getIncrOrDecr(p, loop_var, blk));
		//Add the loop_decr
		blk.addAll(p.getPart(PART.LOOPBODY_DECR.index));
		blk.addAll(p.getPart(PART.LOOPBODY_POST.index));
		blk.addAll(p.getPart(PART.LOOP_EXIT.index));
		//For debugging
		if(config.isVerbose()){
			for(Code code: blk){
				System.out.println(code);
			}
		}
		//Analyze the transformed list of code.
		return analyzePattern(p.param_size, blk);
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
			System.out.println("The original pattern:\n"+pattern);
			Pattern pattern_1 = transform(pattern);
			System.out.println("From "+pattern.getType()+" to "+pattern_1.getType()+", the transformed pattern:\n"+pattern_1);
			Pattern pattern_2 = transform(pattern_1);
			System.out.println("From "+pattern_1.getType()+" to "+pattern_2.getType()+", the transformed pattern:\n"+pattern_2);
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
