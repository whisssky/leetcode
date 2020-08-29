package maximumSubarray;



/*
    https://leetcode-cn.com/problems/maximum-subarray/
    思路
    maxSum记录遍历到当前位置的时候，目前为止的最大字串和
    subMaxSum记录到遍历到当前位置的时候，以当前位置结尾的最大字串和
 */
public class Solution {
    public int maxSubArray(int[] nums) {
        int maxSum = nums[0];
        int subMaxSum = nums[0];
        for(int i=1;i<nums.length;i++){
            subMaxSum = Math.max(subMaxSum+nums[i],nums[i]);
            maxSum = Math.max(maxSum,subMaxSum);
        }
        return maxSum;
    }

}
