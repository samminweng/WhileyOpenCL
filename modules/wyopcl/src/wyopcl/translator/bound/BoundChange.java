package wyopcl.translator.bound;
/**
 * Keeps track of the change in the ranges of a loop variable. 
 * @author Min-Hsien Weng
 *
 */
public class BoundChange {
	private String name;
	private boolean isUBIncreasing = false;
	private boolean isLBDecreasing = false;
	public BoundChange(String name){
		this.name = name;
		this.isUBIncreasing = false;
		this.isLBDecreasing = false;
	}
	
	public boolean isUBIncreasing() {
		return isUBIncreasing;
	}

	public void setUBIncreasing(boolean isIncreasing) {
		this.isUBIncreasing = isIncreasing;
	}

	public boolean isLBDecreasing() {
		return isLBDecreasing;
	}

	public void setLBDecreasing(boolean isDecreasing) {
		this.isLBDecreasing = isDecreasing;
	}
}
