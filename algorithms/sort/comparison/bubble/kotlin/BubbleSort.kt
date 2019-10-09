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
