package wyopcl.interpreter;

import static wycc.lang.SyntaxError.internalFailure;

import java.math.BigDecimal;
import java.math.BigInteger;

import wyil.lang.Constant;
/**
 * This class converts a BigDecimal to a fraction (numerator/denominator).
 * @author mw169
 *
 */
public class DecimalFraction extends Constant {
	private long numerator, denominator;	
	private final BigDecimal decimal;
	/**
	 * Reduce num and denum by the greatest common factor.  
	 * @param num
	 * @param denum
	 * @return
	 */
	private void reduceFraction(long num, long denum){
		long gcf = 1;
		long max = Math.max(num, denum);
		long f;
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
	
	public DecimalFraction(Constant.Decimal num, Constant.Decimal denum){
		this.numerator = num.value.longValue();
		this.denominator = denum.value.longValue();
		this.decimal = num.value.divide(denum.value,2, BigDecimal.ROUND_HALF_UP);
	}
	
	public Constant.Integer getDenominator() {
		return Constant.V_INTEGER(BigInteger.valueOf(denominator));
	}

	public Constant.Integer getNumerator() {
		if(this.decimal.signum() == -1){
			return Constant.V_INTEGER(BigInteger.valueOf(-1*numerator));
		}else{
			return Constant.V_INTEGER(BigInteger.valueOf(numerator));
		}
		
	}

	@Override
	public String toString() {
		if(this.denominator == 1){
			return ""+this.decimal.toString();
		}else{			
			if(this.decimal.signum() == -1){
				return "(-"+this.numerator+"/"+this.denominator+")";
			}else{
				return "("+this.numerator+"/"+this.denominator+")";
			}
		}
		
	}

	@Override
	public int compareTo(Constant arg0) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public wyil.lang.Type type() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
