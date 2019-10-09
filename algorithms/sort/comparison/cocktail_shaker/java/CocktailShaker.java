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
}
