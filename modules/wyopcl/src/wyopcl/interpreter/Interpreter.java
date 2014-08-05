package wyopcl.interpreter;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Stack;

import wycc.util.Logger;
import wyil.lang.Code.Block;
import wyil.lang.Codes;
import wyil.lang.Constant;
import wyil.lang.WyilFile;

/*Declare the abstract Interpreter class, methods and variables. */
public abstract class Interpreter {
	protected static HashMap<String, Block> blocktable = new HashMap<String, Block>();
	protected static Stack<StackFrame> blockstack = new Stack<StackFrame>();
	protected static HashMap<Block, SymbolTable> symboltable = new HashMap<Block, SymbolTable>();
	protected static boolean verbose = false;
	protected static boolean verify = false;
	protected static WyilFile module;
	protected String[] args;
	
	/**
	 * Passing the additional arguments from console to the interpreter.
	 */
	public String[] getArgs() {
		return args;
	}

	public void setArgs(String[] args) {
		this.args = args;
	}
	
	
	public static boolean isVerify() {
		return verify;
	}

	public void setVerify(boolean verify) {
		Interpreter.verify = verify;
	}
	
	public static WyilFile getModule() {
		return module;
	}
	
	public void setModule(WyilFile module) {
		Interpreter.module = module;
	}


	public static boolean isVerbose() {
		return verbose;
	}
	
	public void setVerbose(boolean verbose) {
		Interpreter.verbose = verbose;
	}


	public class StackFrame {
		private final Block block;
		private String name;// Remove it
		private int line;				
		private int return_reg;
		private int depth;
		private Constant[] registers  = new Constant[0];
		
		public StackFrame(int depth, Block block, int line,
				String name, int return_reg){
			this.depth = depth;
			this.block = block;
			this.name = name;
			this.line = line;			
			this.return_reg = return_reg;
		}

		public int getLine() {
			return line;
		}
		
		public void setLine(int line){
			this.line = line;
		}		
		
		public Block getBlock(){
			return block;
		}
		
		public void setReturn_reg(int return_reg) {
			this.return_reg = return_reg;
		}
		
		public int getReturn_reg() {
			return return_reg;
		}				
		
		public String getName() {
			return name;
		}
		
		public Constant getRegister(int reg){
			if(reg>=registers.length){
				return null;
			}
			
			return registers[reg];
		}
		
		public void setRegister(int reg, Constant constant){
			if(reg>=registers.length){
				//Expand the array.
				registers = Arrays.copyOf(registers, reg+1);
			}
			
			registers[reg] = constant;
		}
		
		
		public int getRegisterLength(){
			return registers.length;
		}

		@Override
		public String toString() {			
			return "Block:"+block.hashCode()+" Line:"+line;
		}

		public int getDepth() {
			return depth;
		}

		public void setDepth(int depth) {
			this.depth = depth;
		}		
	}
	
	public class SymbolTable implements Comparable<SymbolTable>{
		private final Block block;
		private HashMap<String, Integer> labelLocMap = new HashMap<String, Integer>();		
		
		public class TryCatchBlock{
			int start;
			int end;
		}
		private HashMap<String, TryCatchBlock> trycatchMap = new HashMap<String, TryCatchBlock>(); 
		
		public SymbolTable(Block blk){
			this.block = blk;
		}	
			
		public void addLabelLoc(String label, int line){
			labelLocMap.put(label, line);
		}
		
		public int getBlockPosByLabel(String label){
			int line = -1;
			
			if(labelLocMap.containsKey(label)){
				line = labelLocMap.get(label);
			}
			return line;
		}
		
		public void addTryCatchLoc(String label, int line){
			TryCatchBlock trycatchblk = null;
			if(trycatchMap.get(label)==null){
				trycatchblk = new TryCatchBlock();
				trycatchblk.start = line;
			}else{
				trycatchblk = trycatchMap.get(label);
				trycatchblk.end = line;
			}
			
			trycatchMap.put(label, trycatchblk);
		}
		
		public int getThrowPos(int linenumber){
			Iterator<TryCatchBlock> iterator = trycatchMap.values().iterator();
			while(iterator.hasNext()){
				TryCatchBlock next = iterator.next();
				if(linenumber >= next.start && linenumber <=next.end){
					return next.end;
				}
			}
			
			return -1;
		}

		@Override
		public int compareTo(SymbolTable symbol) {
			if(this.block.hashCode() == symbol.hashCode()){
				return 0;
			}
			return -1;
		}
	}
	
	
	public void printMessage(StackFrame stackframe, String input, String output){
		if(verbose){
			System.out.println(stackframe.getDepth()+" "+stackframe.getName()+"."+stackframe.getLine()
					+" ["+input+"] "+output+"\n");
		}
		
	}

	public void printVerificationMessage(StackFrame stackframe, String input, String output){
		System.err.println(stackframe.getDepth()+" "+stackframe.getName()+"."+stackframe.getLine()
					+" ["+input+"] "+output+"\n");
		System.exit(-1);
	}
}
