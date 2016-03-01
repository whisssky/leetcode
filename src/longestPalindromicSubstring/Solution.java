package longestPalindromicSubstring;
//Question 5
//Given a string S, find the longest palindromic substring in S. You may assume that the maximum length of S is 1000, 
//and there exists one unique longest palindromic substring.
//最长回文子串
//暴力法
public class Solution {

	
	public String longestPalindrome(String s) {
        String longest = null;
        int length = 0;
        char[] arry = s.toCharArray();
        for(int i=0;i<arry.length;i++)
        {
        	for(int j=arry.length-1;j>i;j--)
        	{
        		int left = i,right = j;
        		while(arry[left] == arry[right])
        		{
        			left++;
        			right--;
        			if(left>=right)
        				break;
        		}
        		if(left>=right && j-i+1 >length)
        		{
        			length = j-i+1;
        			longest=s.substring(i, j+1);
        		}
        	}
        }
        return longest;
    }
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Solution a = new Solution();
		System.out.println(a.longestPalindrome("cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc"));

	}

}
