package wyopcl.interpreter;

import java.math.BigDecimal;
import java.math.BigInteger;

import wyil.lang.Constant;
/**
 * This class converts two Constant.Decimals to a decimal fraction (numerator/denominator).
 * @author mw169
 *
 */
public final class DecimalFraction extends Constant {
	private Constant.Integer numerator, denominator;	
	private Constant.Decimal quotient;	
	
	public static DecimalFraction V_DecimalFraction(Constant.Decimal num, Constant.Decimal denum){
		return new DecimalFraction(num, denum);
	}
	
	public static DecimalFraction V_DecimalFraction(Constant.Decimal decimal){
		return new DecimalFraction(decimal);
	}
	
	private void reduceFraction(BigInteger num, BigInteger denum){
		BigInteger gcd = denum.gcd(num);
		this.numerator = Constant.V_INTEGER(num.divide(gcd));
		this.denominator = Constant.V_INTEGER(denum.divide(gcd));
	}	
	
	private DecimalFraction(Constant.Decimal quotient){
		this.quotient = quotient;
		BigDecimal denum = BigDecimal.TEN.pow(quotient.value.scale());
		BigDecimal num = quotient.value.multiply(denum);
		reduceFraction(num.toBigInteger(), denum.toBigInteger());
	}	
	
	private DecimalFraction(Constant.Decimal numerator, Constant.Decimal denominator){
		reduceFraction(numerator.value.toBigInteger(), denominator.value.toBigInteger());
	}
	
	public Constant.Integer getDenominator() {
		return denominator;
	}

	public Constant.Integer getNumerator() {
		return numerator;
	}

	@Override
	public String toString() {
		if(this.denominator.value.compareTo(BigInteger.ONE)==0){
			return this.quotient.toString();
		}else{
			return "("+this.numerator+"/"+this.denominator+")";	
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
