package wyopcl.interpreter;

import static wycc.lang.SyntaxError.internalFailure;

import java.math.BigDecimal;
import java.math.BigInteger;

import wyil.lang.Constant;
/**
 * This class converts a Constant.Decimal to a fraction (numerator/denominator).
 * @author mw169
 *
 */
public final class DecimalFraction extends Constant {
	
	private final BigDecimal division;
	private final Constant.Decimal numerator, denominator;	
	
	public static DecimalFraction V_DecimalFraction(Constant.Decimal num, Constant.Decimal denum){
		return new DecimalFraction(num, denum);
	}
	
	/*public static DecimalFraction V_DecimalFraction(Constant.Decimal division){
		return new DecimalFraction(division);
	}
	
	
	private DecimalFraction(Constant.Decimal division){
		this.division = division.value;
		int precision = this.division.precision();
		
		
	}*/
	
	private DecimalFraction(Constant.Decimal num, Constant.Decimal denum){		
		this.division = num.value.divide(denum.value);
		BigDecimal gcd = BigDecimal.valueOf(denum.value.toBigInteger().gcd(num.value.toBigInteger()).longValue());
		this.numerator = Constant.V_DECIMAL(num.value.divide(gcd));
		this.denominator = Constant.V_DECIMAL(denum.value.divide(gcd));
	}
	
	public Constant.Decimal getDenominator() {
		return denominator;
	}

	public Constant.Decimal getNumerator() {
		return numerator;
	}

	@Override
	public String toString() {
		return "("+this.numerator+"/"+this.denominator+")";		
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
