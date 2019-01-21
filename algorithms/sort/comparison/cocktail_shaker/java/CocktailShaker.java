import java.util.Arrays;
import java.util.Random;
import java.util.stream.IntStream;

public class CocktailShaker {
    public void sort(int[] a) {
        var swaped = false;
        int start = 0, end = a.length;
        do {
            swaped = false;
            for(int i = start + 1; i < end; i++) {
                if(a[i-1] > a[i]) {
                    var tmp = a[i - 1];
                    a[i-1] = a[i];
                    a[i] = tmp;
                    swaped = true;
                }
            }
            if(swaped) swaped = false; 
            else break;
            for(int i = end - 1; i > start; i--) {
                if(a[i-1] > a[i]) {
                    var tmp = a[i - 1];
                    a[i-1] = a[i];
                    a[i] = tmp;
                    swaped = true;
                }
            }
            start++;
            end--;
        } while(swaped);
    }

    public static void main(String[] args) {
        System.out.println("------------------");
        System.out.println("Cocktail shaker sort test");
        System.out.println("small random");
        testArraySort(new Random().ints(50, 0, 50).toArray());
        System.out.println("small sorted");
        testArraySort(IntStream.range(0, 50).toArray());
        System.out.println("small sorted in reverse order");
        testArraySort(IntStream.range(0, 50).map(i -> 50 - i).toArray());
        System.out.println("medium random");
        testArraySort(new Random().ints(1000, 0, 50).toArray());
        System.out.println("medium sorted");
        testArraySort(IntStream.range(0, 1000).toArray());
        System.out.println("medium sorted in reverse order");
        testArraySort(IntStream.range(0, 1000).map(i -> 1000 - i).toArray());
        System.out.println("big random");
        testArraySort(new Random().ints(50_000, 0, 50).toArray());
        System.out.println("big sorted");
        testArraySort(IntStream.range(0, 50_000).toArray());
        System.out.println("big sorted in reverse order");
        testArraySort(IntStream.range(0, 50_000)
                .map(i -> 50_000 - i).toArray());
    }

    private static void testArraySort(int[] a) {
        var sorter = new CocktailShaker();
        long time = System.currentTimeMillis();
        sorter.sort(a);
        time = System.currentTimeMillis() - time;
        System.out.println("Sorted " + a.length + " items in " + time + "ms");
        int[] sorted = Arrays.copyOf(a, a.length);
        Arrays.sort(sorted);
        System.out.println("Validation: "
                + (Arrays.equals(a, sorted) ? "SUCCESS" : "FAILED"));
    }
}
