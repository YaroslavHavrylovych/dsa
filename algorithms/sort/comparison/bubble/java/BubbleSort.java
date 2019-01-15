import java.util.Arrays;
import java.util.Random;
import java.util.stream.IntStream;

public class BubbleSort {
    public void sort(int[] a) {
        for(int i = 1; i < a.length; i++) {
            for(int j = 0; j < a.length - i; j++) {
                if(a[j] > a[j+1]) {
                    var tmp = a[j];
                    a[j] = a[j+1];
                    a[j+1] = tmp;
                }
            }
        }
    }

    public static void main(String[] args) {
        System.out.println("Bubble sort test");
        System.out.println("small random");
        testArraySort(new Random().ints(50, 0, 50).toArray());
        System.out.println("small sorted");
        testArraySort(IntStream.range(0, 50).toArray());
        System.out.println("medium random");
        testArraySort(new Random().ints(1000, 0, 50).toArray());
        System.out.println("medium sorted");
        testArraySort(IntStream.range(0, 1000).toArray());
        System.out.println("big random");
        testArraySort(new Random().ints(500_000, 0, 50).toArray());
        System.out.println("big sorted");
        testArraySort(IntStream.range(0, 500_000).toArray());
    }

    private static void testArraySort(int[] a) {
        var sorter = new BubbleSort();
        long time = System.currentTimeMillis();
        sorter.sort(a);
        time = System.currentTimeMillis() - time;
        System.out.println("Sorted in " + time + "ms");
        int[] sorted = Arrays.copyOf(a, a.length);
        System.out.println("Validation: "
                + (Arrays.equals(a, sorted) ? "SUCCESS" : "FAILED"));
    }
}
