import java.util.Arrays;
import java.util.Random;
import java.util.stream.IntStream;

public class Test {
    public static void main(String[] args) {
        System.out.println("------------------");
        System.out.println("Bubble sort test");
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
    }

    private static void testArraySort(int[] a) {
        var sorter = new BubbleSort();
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
