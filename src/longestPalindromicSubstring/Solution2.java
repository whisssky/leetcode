package longestPalindromicSubstring;
//Question 5
//Given a string S, find the longest palindromic substring in S. You may assume that the maximum length of S is 1000, 
//and there exists one unique longest palindromic substring.
//最长回文子串
//中心扩展法
public class Solution2 {

	
	public String longestPalindrome(String s) {
        int longestbegin = 0;
        int length = 1;
        char []arry = s.toCharArray();
        int len = arry.length;
        for(int i=0;i<len;i++)
        {
        	int j=1;
        	int currlen=1;
        	while(i-j>=0 && i+j<len)
        	{
        		if(arry[i-j] == arry[i+j])
        			{
        				currlen = currlen+2;
        				j++;
        			}
        		else
        			break;
        	}
        	if(currlen > length)
        	{
        		longestbegin = i-j+1;
        		length = currlen;
        	}
        }
        for(int i=0;i<len-1;i++)
        {
        	int j=0;
        	int currlen=0;
        	while(i-j>=0 && i+j+1<len)
        	{
        		if(arry[i-j] == arry[i+j+1])
        		{
        			currlen = currlen+2;
        			j++;
        		}
        		else
        			break;
        	}
        	if(currlen >length)
        	{
        		longestbegin = i-j+1;
        		length = currlen;
        	}
        }
        return s.substring(longestbegin, longestbegin+length);
    }

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Solution2 a = new Solution2();
		System.out.println(a.longestPalindrome("awwaddd"));
	}

}
