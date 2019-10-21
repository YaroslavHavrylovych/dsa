/**
 * Exponentiating by squaring is a general method for fast computation 
 * of large positive integer powers of a number.
 * <br/>
 * For more info please visit
 * {@link https://en.wikipedia.org/wiki/Exponentiation_by_squaring}
 */
public class Exponentiation {
    public long pow(long val, long exp) {
        long res = 1;
        while(exp != 0) {
            if((exp & 1) == 1) res *= val;
            val *= val;
            exp >>= 1;
        }
        return res;
    }
}
