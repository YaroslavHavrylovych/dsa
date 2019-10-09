class CocktailShaker {
    fun sort(a: IntArray) {
       var swaped:Boolean
       var start = 0;
       var end = a.size - 1
       do {
           swaped = false
           for(i in (start + 1)..end) {
               if(a[i-1] > a[i]) {
                   var tmp = a[i-1]
                   a[i-1] = a[i]
                   a[i] = tmp
                   swaped = true
               }
           }
           if (swaped) swaped = false
           else break
           for(i in end downTo start + 1) {
               if(a[i-1] > a[i]) {
                   var tmp = a[i-1]
                   a[i-1] = a[i]
                   a[i] = tmp
                   swaped = true
               }
           }
           start++
           end--
       } while(swaped)
    }
}
