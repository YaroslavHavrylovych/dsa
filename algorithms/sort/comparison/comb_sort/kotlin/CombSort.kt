import java.util.Arrays;
import java.util.Random;
import java.util.stream.IntStream;

fun sort(a: IntArray) {
    var gap = a.size
    var sorted: Boolean
    var shrinkMultiplier = 0.7f
    do {
        gap = Math.max(Math.round(gap * shrinkMultiplier), 1)
        sorted = gap == 1
        for(i in 0..(a.size - gap - 1)) {
            if(a[i] > a[i + gap]) {
                var tmp = a[i + gap];
                a[i + gap] = a[i];
                a[i] = tmp;
                sorted = false;
            }
        }
    } while(!sorted)
}

fun main(args: Array<String>) {
    println("------------------");
    println("Comb sort test")
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
    println("big random")
    testArraySort(Random().ints(50_000, 0, 50).toArray())
    println("big sorted")
    testArraySort(IntArray(50_000, {i -> i}))
    println("big sorted in reverse order")
    testArraySort(IntArray(50_000, {i -> 50_000-i}))
}

fun testArraySort(a: IntArray) {
    var time = System.currentTimeMillis()
    sort(a)
    time = System.currentTimeMillis() - time
    println("Sorted " + a.size + " items in " + time + "ms")
    val sorted = Arrays.copyOf(a, a.size)
    Arrays.sort(sorted)
    println("Validation: " +
        if(Arrays.equals(a, sorted)) "SUCCESS" else "FAILED")
}
