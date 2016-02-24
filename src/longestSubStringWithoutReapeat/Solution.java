package longestSubStringWithoutReapeat;

public class Solution {

	
	public static void main(String []args){
		System.out.println(lengthOfLongestSubstring("qnfenqdq"));
		
	}
	public static int lengthOfLongestSubstring(String s) {
		
		 char []arry = s.toCharArray();
			int maxlen = 0;
			int currlen = 0;
			int laststart = 0;
			int []visit = new int[256];
			for(int i=0;i<256;i++)
			{
				visit[i] = -1;
			}
			for(int i=0;i<arry.length;i++)
			{
				if(visit[arry[i]] == -1)
				{
					currlen++;
					visit[arry[i]] = i;
				}
				else
				{
					if(visit[arry[i]]>= laststart)
					{
						currlen = i-visit[arry[i]];
						laststart = visit[arry[i]]+1;
						visit[arry[i]] = i;
					}
					else
					{
						currlen++;
						visit[arry[i]] = i;
						
					}
				}
				if(currlen>maxlen)
				{
					maxlen = currlen;
				}
			}
			return maxlen;

	}
}
