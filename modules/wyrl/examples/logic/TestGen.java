public class TestGen {
    public static void main(String[] args) {
	for(int i=0;i!=1000;++i) {
	    System.out.print("Not(");
	}
	System.out.print("True");
	for(int i=0;i!=1000;++i) {
	    System.out.print(")");
	}
    }
}