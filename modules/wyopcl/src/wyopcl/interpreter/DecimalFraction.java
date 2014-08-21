package wyopcl.interpreter;

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
	 * Find the greatest common factor of num and denum 
	 * @param num
	 * @param denum
	 * @return
	 */
	private int reduceFraction(int num, int denum){
		int gcf = 1;
		int max = Math.max(num, denum);
		int f;
		for(f=max; f>=1;f++){
			if (num%f == 0 && denum%f==0){
				gcf = f;
				break;
			}
		}		
		return gcf;
	}
	
	public DecimalFraction(BigDecimal decimal){
		this.decimal = decimal;
		this.denominator = (int) Math.pow(10.0, (double)this.decimal.precision());
		this.numerator = (int) (this.decimal.doubleValue()*denominator);		
		int factor = reduceFraction(numerator, denominator);
		numerator = numerator/factor;
		denominator = denominator/factor;
	}
	
	public int getDenominator() {
		return denominator;
	}

	public int getNumerator() {
		return numerator;
	}

	
	
	
}
