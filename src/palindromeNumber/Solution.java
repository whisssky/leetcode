package palindromeNumber;

/*
 * 第九题 
 * Determine whether an integer is a palindrome. Do this without extra space.
 */
public class Solution {
	public boolean isPalindrome(int x) {
		int prenum = x;
		int result = 0;

		if (x < 0) {
			return false;
		}
		while (x > 0) {
			int pre = result;
			result = 10 * result + x % 10;
			// 若发生溢出，返回0
			if ((result - x % 10) / 10 != pre)
				return false;

			x = x / 10;
		}
		if(result == prenum)
			return true;
		else
			return false;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Solution a = new Solution();
		System.out.println(a.isPalindrome(1234543212));

	}

}
