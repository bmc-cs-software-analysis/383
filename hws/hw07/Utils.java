import java.util.ArrayList;

public class Utils {

    /*
     * Returns the middle element, as specified by compareTo.
     */
    public static <E extends Comparable<E>> E median(E l, E r, E m) {

    }

    /*
     * Implements the median-of-tree pivot selection. 
     * @param arr   the array to select three elements from 
     * @param lo    the location of the first element
     * @param hi    the location of the second element 
     * @return      the index of the meidan element (lo, hi, or mid)
     */
    public static <E extends Comparable<E>> int medianOfThree(ArrayList<E> arr, int lo, int hi) {

    }

    /*
     * Swaps the elements in locations i and j in arr
     */
    public static  <E extends Comparable<E>>void swap(ArrayList<E> arr, int i, int j) {
        
    }

    /*
     * Given an arr, find a pivot using the medianOfThree method.
     * Follow the quicksort algorithm using leftHigh and rightLow markers.
     */
    public  static <E extends Comparable<E>> int partitionPivot(ArrayList<E> arr, int lo, int hi) {
        int pivot = medianOfThree(arr, lo, hi);
        
        int leftHigh = lo;
        int rightLow = hi;

        while (rightLow > leftHigh) {
            
        }

    }

    public static <E extends Comparable<E>> void quickSort(ArrayList<E> arr, int left, int right) {
        if (left < right) {
            int pivot = partitionPivot(arr, left, right);
            quickSort(arr, left, pivot-1);
            quickSort(arr, pivot+1, right);
        }
    }

    public static <E extends Comparable<E>> void quickSort(ArrayList<E> arr) {
        quickSort(arr, 0, arr.size()-1);
    }
}
