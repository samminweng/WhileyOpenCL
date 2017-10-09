package wyopcl.translator.cfg;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import wyil.lang.Code;
import wyil.lang.CodeBlock;


/**
 * The basic block of building the control flow graph (CFG) is used in live variable analyzer.
 * 
 * In constract to bound block, basic block contains a list of parent and child nodes.   
 * 
 * 
 * 
 * @author Min-Hsien Weng
 *
 */
public class BasicBlock implements Comparable<BasicBlock> {
	// Prefix of the variable
	protected final String prefix = "_";
	private List<Code> codeBlock;// A list of byte-code for a block
	
	private List<BasicBlock> childNodes = null;// A list of child nodes
	private List<BasicBlock> parentNodes = null;// A list of parent nodes
	// The branch name
	private String label;
	private BlockType type;
	
	public enum BlockType {
		ENTRY(0) {
			public String toString() {
				return "ENTRY";
			}
		},
		ASSERT(1) {
			public String toString() {
				return "ASSERT";
			}
		},
		ASSUME(2) {
			public String toString() {
				return "ASSUME";
			}
		},
		BLOCK(3) {
			public String toString() {
				return "BLOCK";
			}
		},
		LOOP_HEADER(4) {
			public String toString() {
				return "LOOP_HEADER";
			}
		},
		LOOP_BODY(5) {
			public String toString() {
				return "LOOP_BODY";
			}
		},
		LOOP_EXIT(6) {
			public String toString() {
				return "LOOP_EXIT";
			}
		},
		// The condition
		COND(7){
			public String toString() {
				return "CONDITION";
			}
		},
		IF_BRANCH(8) {
			public String toString() {
				return "IF";
			}
		},
		ELSE_BRANCH(9) {
			public String toString() {
				return "ELSE";
			}
		},
		// Store function call code only.
		INVOKE(10){
			public String toString(){
				return "INVOKE";
			}
		},
		// Store update code only.
		UPDATE(11){
			public String toString(){
				return "UPDATE";
			}
		},		
		// Store return code only.
		RETURN(12){
			public String toString(){
				return "RETURN";
			}
		},		
		EXIT(13) {
			public String toString() {
				return "EXIT";
			}
		};
		public int order;

		private BlockType(int order) {
			this.order = order;
		}
	}

	/**
	 * Private constructor
	 */
	private BasicBlock() {
		this.codeBlock = new ArrayList<Code>();
	}

	/**
	 * Constructing a basic block with a specific name and block type.
	 * 
	 * @param label
	 *            the name of blk
	 * @param type
	 *            the type of blk
	 */
	public BasicBlock(String label, BlockType type) {
		// Use the nested constructor to create the BasicBlock object.
		this();
		this.label = label;
		this.type = type;		
	}

	

	/**
	 * Add Wyil code to the block
	 * 
	 * @param code
	 */
	public void addCode(Code code) {
		this.codeBlock.add(code);
	}
	/**
	 * Get the list of codes.
	 * @return
	 */
	public List<Code> getCodeBlock(){
		return this.codeBlock;
	}
	
	/**
	 * Adds a child node to the current node and also add the current node to
	 * the parent list of its child nodes.
	 * 
	 * @param blk
	 *            the child node.
	 */
	public void addChild(BasicBlock child) {
		if (childNodes == null) {
			childNodes = new ArrayList<BasicBlock>();
		}

		// Check if the child node has been added before.
		if (!childNodes.contains(child)) {
			childNodes.add(child);
			// set the parent-child rel to the child node.
			child.addParent(this);
		}

	}

	private void addParent(BasicBlock parent) {
		if (parentNodes == null) {
			parentNodes = new ArrayList<BasicBlock>();
		}
		parentNodes.add(parent);
	}

	

	/**
	 * Check if the block is the leaf node.
	 * 
	 * @return
	 */
	public boolean isLeaf() {
		if (childNodes == null) {
			return true;
		}
		return false;
	}

	/**
	 * Check if the blk has the parent nodes.
	 * 
	 * @return true if blk has parent. Otherwise, return false.
	 */
	public boolean hasParent() {
		if (parentNodes == null) {
			return false;
		}
		return true;
	}

	/**
	 * Return the blk label.
	 * 
	 * @return the name of blk.
	 */
	public String getLabel() {
		return this.label;
	}
	/**
	 * Set the block label.
	 * @param label
	 */
	public void setLabel(String label){
		this.label = label;
	}
	
	/**
	 * Return the block type.
	 * 
	 * @return
	 */
	public BlockType getType() {
		return this.type;
	}

	/**
	 * Return a list of child blks.
	 * 
	 * @return
	 */
	public List<? extends BasicBlock> getChildNodes() {
		return childNodes;
	}

	/**
	 * Return a list of parent blks.
	 * 
	 * @return the list of blocks. If no parents is found, return an immutable
	 *         empty list.
	 */
	public List<BasicBlock> getParentNodes() {
		if (parentNodes == null) {
			// Return an immutable list
			return Collections.emptyList();
		}

		return parentNodes;
	}

	
	@Override
	public String toString() {
		//String str = "-------------------------------\n";
		String str = "";
		str += String.format("%s [%s] ", this.label, this.type);
		//Display the list of byte-code
		if(this.codeBlock.size()>0){
			str += "\n-------------------------------";
			int index=0;
			for(Code code: this.codeBlock){
				str += "\nl."+index+":"+code;
				index++;
			}
			str += "\n-------------------------------";
		}
		
		return str;
	}

	@Override
	public boolean equals(Object obj) {
		if (!(obj instanceof BasicBlock)) {
			return false;
		}
		BasicBlock blk = (BasicBlock) obj;
		if (this.getLabel().equals(blk.getLabel())) {
			if (this.getType().equals(blk.getType())) {
				return true;
			}
		}
		return false;
	}

	
	/**
	 * Implements for sorting the elements in the list.
	 */
	@Override
	public int compareTo(BasicBlock blk) {
		return this.type.order - blk.type.order;
	}

	/**
	 * Extract the register from the variable name 
	 * 
	 * @param var
	 * @return
	 */
	public int toRegister(String var){
		return Integer.parseInt(var.split(prefix)[1]);
	}
	
}
