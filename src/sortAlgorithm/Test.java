package sortAlgorithm;

import java.util.Arrays;

public class Test {

    public static void main(String[] args) {

        int[] nums = {5,7,3,2,55,76,3,6,8,1,9,12};
        int[] nums1 = {5};
        BubbleSort bubbleSort = new BubbleSort();
        nums = bubbleSort.sort(nums);
        System.out.println(Arrays.toString(nums));


    }
}
