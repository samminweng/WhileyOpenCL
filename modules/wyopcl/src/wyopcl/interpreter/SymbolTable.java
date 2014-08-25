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
		int line = -1;
		
		if(labelLocMap.containsKey(label)){
			line = labelLocMap.get(label);
		}
		return line;
	}
	
	public void addTryCatchLoc(Code code, int line){
		 if(code instanceof Codes.TryCatch){				
			Codes.TryCatch trycatch = (Codes.TryCatch)code;	
			catchlabel = trycatch.catches.get(0).second();
		}
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