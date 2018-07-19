package stringToInteger;

/*
 * 第8题
 * Implement atoi to convert a string to an integer.
   Hint: Carefully consider all possible input cases. 
   If you want a challenge, please do not see below 
   and ask yourself what are the possible input cases.
 */
public class Solution {
	public int myAtoi(String str) {
		
		
		char []strArray = str.toCharArray();
		int length = strArray.length;
		long result=0;
		int ifMinus=1;
		int i=0;
		if(length==0)
			return 0;
		while(strArray[i] == ' ')
		{
			i++;

		}
		if(strArray[i] == '-' || strArray[i]== '+')
		{
			ifMinus = (strArray[i] == '+')? 1 : -1;
			i++;
		}
		while(i<length && strArray[i]>='0' && strArray[i]<='9')
		{
			result = result*10 + (strArray[i] - '0');
			if(result*ifMinus > Integer.MAX_VALUE || result*ifMinus < Integer.MIN_VALUE)
				return (ifMinus==1)? Integer.MAX_VALUE : Integer.MIN_VALUE;
			i++;
		}
		return (int) (result*ifMinus);

	}
	public int myAtoi2(String str)
	{
		if ("".equals(str)) {return 0;}
	    int i = 0, sign = 1, length = str.length();
	    double base = 0;
	    while (str.charAt(i) == ' ') {i++;}
	    if (str.charAt(i) == '-' || str.charAt(i) == '+') {
	      sign = str.charAt(i++) == '-' ? -1 : 1;
	    }
	    while (i < length && str.charAt(i) >= '0' && str.charAt(i) <= '9') {
	      if ((base = base * 10 + (str.charAt(i++) - '0')) > Integer.MAX_VALUE) {
	        return sign == 1 ? Integer.MAX_VALUE : Integer.MIN_VALUE;
	      }
	    }
	    return sign * (int)base;
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Solution a = new Solution();
		System.out.println(a.myAtoi(""));

	}

}
