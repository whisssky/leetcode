package removeDuplicates;

import java.sql.Array;

public class removeDuplicates {
	
	
	 public static void main(String args[]){ 
	       
		 int[] Array = {1,2,2,3,4}; 
		 
		 int a = solve(Array);
		 System.out.println(a);
		 
	   } 
	 
	 public static int solve(int []a)
	 {
		 
		 if((a.length == 0 )||(a.length==1))
		 {
			 return a.length;
		 }
		 int length = 1;
		 int i=1;
		 for(int j=1;j<a.length;j++)
		 {
			 if(a[j] != a[j-1])
			 {
				 a[i] = a[j];
				 i++;
				 length++;
			 }
			 
		 }
		 
		 return length;
	 }

}
