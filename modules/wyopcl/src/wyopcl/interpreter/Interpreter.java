package wyopcl.interpreter;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Stack;

import wycc.util.Logger;
import wyil.lang.Code.Block;
import wyil.lang.Codes;
import wyil.lang.Constant;

/*Declare the abstract Interpreter class, methods and variables. */
public abstract class Interpreter {
	protected static HashMap<String, Block> blocktable = new HashMap<String, Block>();
	protected static Stack<StackFrame> blockstack = new Stack<StackFrame>();
	protected static HashMap<Block, SymbolTable> symboltable = new HashMap<Block, SymbolTable>();
	protected boolean verbose = true;
	
	public void setVerbose(boolean verbose) {
		this.verbose = verbose;
	}


	public class StackFrame {
		private final Block block;
		private String name;// Remove it
		private int line;				
		private final int return_reg;
		private Constant[] registers  = new Constant[0];
		
		public StackFrame(Block block, int line, String name, int return_reg){
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
	}
	
	public class SymbolTable implements Comparable<SymbolTable>{
		private final Block block;
		private HashMap<String, Integer> labelLocMap = new HashMap<String, Integer>();		
		
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
		

		@Override
		public int compareTo(SymbolTable symbol) {
			if(this.block.hashCode() == symbol.hashCode()){
				return 0;
			}
			return -1;
		}
	}
	
	
	public void printMessage(StackFrame stackframe, String code, String output){
		if(verbose){
			System.out.println(stackframe.getName()+"."+stackframe.getLine()
					+" ["+code+"] "+output);
		}
		
	}


}
