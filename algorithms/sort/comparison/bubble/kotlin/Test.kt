import java.util.Arrays;
import java.util.Random;
import java.util.stream.IntStream;

fun main(args: Array<String>) {
    println("------------------");
    println("Bubble sort test")
    println("small random")
    testArraySort(Random().ints(50, 0, 50).toArray())
    println("small sorted")
    testArraySort(IntArray(50, {i -> i}))
    println("small sorted in reverse order")
    testArraySort(IntArray(50, {i -> 50-i}))
    println("medium random")
    testArraySort(Random().ints(1000, 0, 50).toArray())
    println("medium sorted")
    testArraySort(IntArray(1000, {i -> i}))
    println("medium sorted in reverse order")
    testArraySort(IntArray(1000, {i -> 1000-i}))
}

fun testArraySort(a: IntArray) {
    var time = System.currentTimeMillis()
    BubbleSort().sort(a)
    time = System.currentTimeMillis() - time
    println("Sorted " + a.size + " items in " + time + "ms")
    val sorted = Arrays.copyOf(a, a.size)
    Arrays.sort(sorted)
    println("Validation: " +
        if(Arrays.equals(a, sorted)) "SUCCESS" else "FAILED")
}
