package longestPalindromicSubstring;
//Question 5
//Given a string S, find the longest palindromic substring in S. You may assume that the maximum length of S is 1000, 
//and there exists one unique longest palindromic substring.
//最长回文子串
//动态规划
//dp[i][j]表示i-j的字串是否为回文串
public class Solution3 {


	public String longestPalindrome(String s) {

		char[] chars = s.toCharArray();
		int start = 0;
		int maxLength = 0;
		int length = chars.length;
		boolean[][] dp = new boolean[length][length];

		for(int i=0;i<length;i++){
			dp[i][i] = true;
			start=i;
			maxLength = 1;
		}

		for(int j=1;j<length;j++){
			for(int i=0;i<j;i++){
				if(chars[i]!=chars[j]){
					dp[i][j] = false;
				}
				else if(j-i <3){
					dp[i][j] = true;

				}
				else{
					dp[i][j] = dp[i+1][j-1];
				}

				if(dp[i][j]==true){
					int curLength = j-i+1;
					if(curLength>maxLength){
						maxLength = curLength;
						start = i;
					}
				}
			}
		}
		return s.substring(start,start+maxLength);
	}
}
