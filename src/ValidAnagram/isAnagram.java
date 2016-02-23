package ValidAnagram;

import java.util.Arrays;

public class isAnagram {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println(solve("abc","aSbc"));

	}
	public static Boolean solve(String s,String t){
		
		char a[] = s.toCharArray();
		char b[] = t.toCharArray();
		Arrays.sort(a);
		Arrays.sort(b);
		if(Arrays.equals(a, b))
			return true;
		else
			return false;
		
	}

}
