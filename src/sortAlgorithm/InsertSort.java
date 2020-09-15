package sortAlgorithm;

public class InsertSort {




    public int[] sort(int[] nums){

        for(int i=1;i<nums.length;i++){
            for(int j=i;j>=1;j--){

                if(nums[j]<nums[j-1]){
                    int temp = nums[j-1];
                    nums[j-1] = nums[j];
                    nums[j] = temp;
                }
                else {
                    break;
                }
            }
        }
        return nums;
    }


}
