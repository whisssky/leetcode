package IntegertoRoman;

/**
 * Given an integer, convert it to a roman numeral.
 * 
 * Input is guaranteed to be within the range from 1 to 3999.
 * 
 * @author whisssky
 *
 */
public class Solution {

	public String intToRoman(int num) {
		
		String []RomanNum = {"I","IV","V","IX","X","XL","L","XC","C","CD","D","CM","M"};
		int []pnum ={1,4,5,9,10,40,50,90,100,400,500,900,1000};
		StringBuilder romanString = new StringBuilder();
		for(int i=12;i>=0;i--){
			int n = num/pnum[i];
			num = num - n*pnum[i];
			while(n>0){
				romanString.append(RomanNum[i]);
				n--;
			}
			
			
		}
		
		
		
		
		return romanString.toString();

	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Solution s = new Solution();
		System.out.println(s.intToRoman(4));

	}

}
