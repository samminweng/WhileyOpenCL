package wyopcl.interpreter;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.PriorityQueue;
import java.util.Stack;

import sun.misc.Queue;
import wybs.lang.Build;
import wycc.util.Logger;
import wyil.lang.Code;
import wyil.lang.Code.Label;
import wyil.lang.CodeBlock.Entry;
import wyil.lang.CodeBlock;
import wyil.lang.Constant;
import wyil.lang.Constant.Strung;
import wyil.lang.WyilFile;
import wyil.lang.WyilFile.Block;

/*Declare the abstract class, methods and variables. */
public abstract class Interpreter {
	
	public class StackFrame {
		private final CodeBlock block;
		private String name;// Remove it
		private int line;				
		private final int return_reg;
		private Constant[] registers  = new Constant[0];
		
		public StackFrame(CodeBlock block, int line, String name, int return_reg){
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
		
		public CodeBlock getBlock(){
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
		private final CodeBlock block;
		//private HashMap<String, Constant> registers = new HashMap<String, Constant>();
		private HashMap<String, Integer> labelLocMap = new HashMap<String, Integer>();		
		
		public SymbolTable(CodeBlock blk){
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
	
	
	
	protected static HashMap<String, CodeBlock> blocktable = new HashMap<String, CodeBlock>();
	protected static Stack<StackFrame> blockstack = new Stack<StackFrame>();
	protected static HashMap<CodeBlock, SymbolTable> symboltable = new HashMap<CodeBlock, SymbolTable>();
	
}
