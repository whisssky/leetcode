package kSum;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class twoSum {

	
	public static int[] twosum(int[] nums, int target) {
		
		int num1,num2;
		int []result = new int[2];
		for(int i=0;i<nums.length-1;i++)
		{
			num1 = nums[i];
			num2 = target - nums[i];
			for(int j=i+1;j<nums.length;j++)
			{
				if(num2 == nums[j])
				{
					result[0] = i+1;
					result[1] = j+1;
					return result;
				}
			}
		}
		return null;
		
        
    }
	public static int[] twosum2(int[]nums,int target){
		
		Map<Integer, Integer> map = new HashMap<Integer, Integer>();
		int x;
		int []result = new int[2];
		for(int i=0;i<nums.length;i++){
			x = nums[i];
			if(map.containsKey(target - x))
			{
				result[0] = (int) map.get(target - x)+1;
				result[1] = i+1;
				return result;
			}
			else
				map.put(nums[i], i);
		}
		return null;
		
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int []test = new int[10000000];
		for(int i=0;i<test.length;i++)
		{
			test[i] = i+1;
		}

		Date date1 = new Date();
		
		Long start = date1.getTime();
		int []result = new int[2];
		System.out.println();

		result = twosum(test,1000);
		
		Date date2 = new Date();
		Long end = date2.getTime();
		System.out.println(end-start);
		System.out.println(result[0]+","+result[1]);
		

	}

}
