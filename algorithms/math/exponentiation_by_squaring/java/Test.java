public class Test {
    public static void main(String[] args) {
        System.out.println("------------------");
        System.out.println("Exponentiation by squaring");
        var math = new Exponentiation();
        var r1 = math.pow(5,10);
        var r2 = math.pow(2,20);
        System.out.println("5^10=" + r1);
        System.out.println("2^20=" + r2);
        System.out.println("VALIDATION " + 
                ((r1 == Math.pow(5,10) && r2 == Math.pow(2,20)) 
                ? "SUCCESS" : "FAILED"));
    }
}
