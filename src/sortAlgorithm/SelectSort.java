package sortAlgorithm;

public class SelectSort {




    public int[] sort(int[] nums){

        for(int i=0;i<nums.length-1;i++){

            int min = nums[i];
            int minIndex = i;
            for(int j=i;j<nums.length;j++){
                if(nums[j]<min){
                    min = nums[j];
                    minIndex = j;
                }
            }
            if(minIndex!=i){
                int temp = nums[i];
                nums[i] = min;
                nums[minIndex] = temp;
            }

        }
        return nums;
    }


}
