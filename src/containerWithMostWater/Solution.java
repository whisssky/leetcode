package containerWithMostWater;


/**
 * 第11题
 * Given n non-negative integers a1, a2, ..., an, where each represents a point at coordinate (i, ai). n vertical lines are drawn such that the two endpoints of line i is at (i, ai) and (i, 0). 
 * Find two lines, which together with x-axis forms a container, such that the container contains the most water.

Note: You may not slant the container.
 * @author whisssky
 *
 */
public class Solution {

	public int maxArea1(int[] height) {
//暴力法 		
		int num = height.length;
		int max = 0;
		int currArea = 0;
		for(int i=0;i<num;i++)
		{
			for(int j=i+1;j<num;j++)
			{
				currArea = ((height[i]>height[j])? height[j] : height[i])*(j-i);
				if(currArea > max)
					max = currArea;
			}
		}
		return max;

	}
	public int maxArea(int[] height){
		
		int right = height.length-1;
		int left = 0;
		int max = 0;
		int curren = 0;
		while(left<right)
		{
			curren = (height[left]>height[right] ? height[right]*(right-left) : height[left]*(right-left));
			if(curren>max)
				max = curren;
			if(height[left]>height[right])
				right--;
			else
				left++;
		}
		return max;
		
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Solution a = new Solution();
		int []b = {1,2,3,4,5,66,78};
		System.out.println(a.maxArea(b));

	}

}
