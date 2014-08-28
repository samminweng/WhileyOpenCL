package wyopcl.interpreter;

import static wycc.lang.SyntaxError.internalFailure;

import java.math.BigDecimal;
/**
 * This class converts a BigDecimal to a fraction (numerator/denominator).
 * @author mw169
 *
 */
public class DecimalFraction {
	private int numerator, denominator;	
	private final BigDecimal decimal;
	/**
	 * Reduce num and denum by the greatest common factor.  
	 * @param num
	 * @param denum
	 * @return
	 */
	private void reduceFraction(int num, int denum){
		int gcf = 1;
		int max = Math.max(num, denum);
		int f;
		for(f=max; f>=1;f--){
			if (num%f == 0 && denum%f==0){
				gcf = f;
				break;
			}
		}
		
		this.numerator = numerator/gcf;
		this.denominator = denominator/gcf;
	}
	
	public DecimalFraction(BigDecimal decimal){
		this.decimal = decimal;
		this.denominator = (int) Math.pow(10.0, (double)this.decimal.scale());
		this.numerator = (int)(this.decimal.doubleValue()*denominator);	
		if(this.decimal.signum() == -1){
			this.numerator = this.numerator*(-1);	
		}
		
		reduceFraction(numerator, denominator);
	}
	
	public String getDenominator() {
		return Integer.toString(denominator);
	}

	public String getNumerator() {
		if(this.decimal.signum() == -1){
			return Integer.toString(-1*numerator);
		}else{
			return Integer.toString(numerator);
		}
		
	}

	@Override
	public String toString() {
		if(this.denominator == 1){
			return ""+this.decimal.doubleValue();
		}else{			
			if(this.decimal.signum() == -1){
				return "(-"+this.numerator+"/"+this.denominator+")";
			}else{
				return "("+this.numerator+"/"+this.denominator+")";
			}
		}
		
	}
	
	
}
