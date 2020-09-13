package kSum;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.HashMap;
import java.util.Map;
//https://leetcode-cn.com/problems/3sum/
//q15

public class threeSum {


	public List<List<Integer>> threeSum(int[] nums) {
		List<List<Integer>> result = new ArrayList<>();
		Arrays.sort(nums);
		boolean zeroResult = false;
		for(int i=0;i<nums.length-2;i++){
			if(nums[i]>0){
				break;
			}
			if(i-1>=0 && nums[i]==nums[i-1]){
				continue;
			}

			if(nums[i]==0 && !zeroResult){
				if(nums[i+1]==0 && nums[i+2]==0){
					result.add(Arrays.asList(0,0,0));
					zeroResult = true;
				}
			}
			else {
				List<List<Integer>> tempResults = twoSum(nums,i+1,-nums[i]);
				for(List<Integer> tempResult : tempResults){
					tempResult.add(nums[i]);
				}
				result.addAll(tempResults);
			}
		}

		return result;
	}

	public List<List<Integer>> twoSum(int[] nums,int start,int target){

		List<List<Integer>> result = new ArrayList<>();
		int left = start;
		int right = nums.length-1;
		while (left<right){

			if(left-1>=start && nums[left-1] == nums[left]){
				left++;
				continue;
			}
			if(right+1<=nums.length-1 && nums[right+1] == nums[right]){
				right--;
				continue;
			}
			if(nums[left]+nums[right]>target){
				right--;
			}
			else if(nums[left]+nums[right]<target){
				left++;
			}
			else {
				List<Integer> temp = new ArrayList<>();
				temp.add(nums[left]);
				temp.add(nums[right]);
				result.add(temp);
				left++;
			}
		}
		return result;

	}

}
