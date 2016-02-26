package medianOfTwoSortedArrays;

//There are two sorted arrays nums1 and nums2 of size m and n respectively. Find the median of the two sorted arrays.
//The overall run time complexity should be O(log (m+n)).

public class Solution {

	public static void main(String[] args) {

		int []nums1 = {};
		int []nums2 = {2,3};
		Solution a = new Solution();
		System.out.println(a.findMedianSortedArrays(nums1, nums2));
	}
	public double findMedianSortedArrays(int[] nums1, int[] nums2) {
        
		double median=0;
		int len1=nums1.length;
		int len2=nums2.length;
		int len = len1+len2;
		if(len%2 == 0)
		{
			median =(double) (findKth(nums1,nums2,0,0,len1,len2,len/2) + findKth(nums1,nums2,0,0,len1,len2,len/2 + 1))/2;
		}
		else
		{
			median = findKth(nums1,nums2,0,0,len1,len2,len/2 + 1); 
		}
			
		return median;
    }
	public int findKth(int[] s1,int[] s2,int start1,int start2,int len1,int len2,int k)
	{
		if(len1 > len2)
		{
			return findKth(s2,s1,start2,start1,len2,len1,k);
		}
		if(len1==0)
		{
			return s2[start2+k-1];
		}
		if(k==1)
		{
			return Math.min(s1[start1], s2[start2]);
		}
		int p = Math.min(k/2, len1);
		int q = k-p;
		if(s1[start1+p-1] < s2[start2+q-1])
		{
			return findKth(s1,s2,start1+p,start2,len1-p,len2,k-p);
		}
		else if(s1[start1+p-1] > s2[start2+q-1])
		{
			return findKth(s1,s2,start1,start2+q,len1,len2-q,k-q);
		}
		else
		{
			return s1[start1+p-1];
		}
		
	}

}
