import java.util.Arrays;

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
        var bubbleSort = new BubbleSort();
        var array = new int[] {9,7,8,5,6,3,4,2,3,1,0};
        System.out.println("Sorting an array: " + Arrays.toString(array));
        bubbleSort.sort(array);
        System.out.println("Sorted array: " + Arrays.toString(array));
    }
}
