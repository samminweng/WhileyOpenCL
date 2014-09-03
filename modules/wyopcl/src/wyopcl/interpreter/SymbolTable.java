package wyopcl.interpreter;

import java.util.HashMap;

import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Code.Block;


public class SymbolTable implements Comparable<SymbolTable>{
	private final Block block;
	private HashMap<String, Integer> labelLocMap = new HashMap<String, Integer>();		
	private String catchlabel = "";	
	
	public SymbolTable(Block blk){
		this.block = blk;
	}	
		
	public void addLabelLoc(String label, int line){
		labelLocMap.put(label, line);
	}
	
	public int getBlockPosByLabel(String label){
		if(labelLocMap.containsKey(label)){
			return labelLocMap.get(label);
		}
		return -1;
	}
	
	public void addTryCatchLoc(Codes.TryCatch trycatch, int line){				
		catchlabel = trycatch.catches.get(0).second();
	}
	
	public int getCatchPos(){
		return getBlockPosByLabel(catchlabel);
	}

	@Override
	public int compareTo(SymbolTable symbol) {
		if(this.block.hashCode() == symbol.hashCode()){
			return 0;
		}
		return -1;
	}
}