package wyopcl.interpreter;

import static wycc.lang.SyntaxError.internalFailure;

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
	private Constant.Decimal decimal;
	private Constant.Decimal num, denum;
	
	public static DecimalFraction V_DecimalFraction(Constant.Decimal num, Constant.Decimal denum){
		return new DecimalFraction(num, denum);
	}
	
	public static DecimalFraction V_DecimalFraction(Constant.Decimal decimal){
		return new DecimalFraction(decimal);
	}
	
	
	private DecimalFraction(Constant.Decimal decimal){
		this.decimal = decimal;
		BigDecimal denum_bigint = BigDecimal.TEN.pow(decimal.value.scale());
		BigDecimal num_bigint = decimal.value.multiply(denum_bigint);
		BigInteger gcd = denum_bigint.toBigInteger().gcd(num_bigint.toBigInteger());
		this.numerator = Constant.V_INTEGER(num_bigint.toBigInteger().divide(gcd));
		this.denominator = Constant.V_INTEGER(denum_bigint.toBigInteger().divide(gcd));
	}
	
	
	private DecimalFraction(Constant.Decimal num, Constant.Decimal denum){
		this.num = num;
		this.denum = denum;
		BigInteger num_bigint = num.value.toBigInteger();
		BigInteger denum_bigint = denum.value.toBigInteger();
		BigInteger gcd = denum_bigint.gcd(num_bigint);
		this.numerator = Constant.V_INTEGER(num_bigint.divide(gcd));
		this.denominator = Constant.V_INTEGER(denum_bigint.divide(gcd));
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
			return this.decimal.toString();
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
