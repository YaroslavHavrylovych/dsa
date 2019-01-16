import java.util.Arrays;
import java.util.Random;
import java.util.stream.IntStream;

class BubbleSort {
    fun sort(a: IntArray) {
        for(i in 1 until a.size) {
            for(j in 0 until a.size - i) {
                if(a[j] > a[j+1]) {
                    val tmp = a[j]
                    a[j] = a[j+1]
                    a[j+1] = tmp;
                }
            }
        }
    }
}

fun main(args: Array<String>) {
    println("Bubble sort test")
    println("small random")
    testArraySort(Random().ints(50, 0, 50).toArray())
    println("small sorted")
    testArraySort(IntStream.range(0, 50).toArray())
    println("medium random")
    testArraySort(Random().ints(1000, 0, 50).toArray())
    println("medium sorted")
    testArraySort(IntStream.range(0, 1000).toArray())
    println("big random")
    testArraySort(Random().ints(500_000, 0, 50).toArray())
    println("big sorted")
    testArraySort(IntStream.range(0, 500_000).toArray())
}

fun testArraySort(a: IntArray) {
    val sorter = BubbleSort()
    var time = System.currentTimeMillis()
    sorter.sort(a)
    time = System.currentTimeMillis() - time
    println("Sorted in " + time + "ms")
    val sorted = Arrays.copyOf(a, a.size)
    println("Validation: " +
        if(Arrays.equals(a, sorted)) "SUCCESS" else "FAILED")
}
