package reverseInteger;
/*
 * 第7题
 * Reverse digits of an integer.

Example1: x = 123, return 321
Example2: x = -123, return -321
 */
public class Solution {

	public int reverse(int x) {
		int flag=1;
		int result=0;

		if(x<0)
		{
			flag = -1;
			x = -x;
		}
		while(x>0)
		{
			int pre =result;
			result = 10*result + x%10;
			//若发生溢出，返回0
			if((result-x%10)/10 != pre)
				return 0;
			
			x = x/10;
		}
		return result*flag;

	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Solution a = new Solution();
		System.out.println(a.reverse(112456789));

	}

}
