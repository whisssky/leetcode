package generateParentheses;

import java.util.ArrayList;
import java.util.List;
import java.util.Stack;


public class Solution {


	
	 public static void main(String args[]){

	 	Solution solution = new Solution();
		 solution.generateParenthesis(3);
		 System.out.println();
		 


	   }

	public List<String> generateParenthesis(int n) {
	 	List<String> result = new ArrayList<>();

		add("",0,0,1,2*n,result,n,n);
		return result;

	}

	private void add(String str,int s,int st,int i,int max,List<String> result,int left,int right){
	 	if(s==0){
	 		st++;
	 		str = str+"(";
		}
	 	else {
	 		st--;
			str = str+")";

		}
	 	if(st<0){
	 		return;
		}
	 	if(i==max){
	 		if(st==0){
				result.add(str);
			}
	 		return;
		}
	 	if(left>0){
			add(str,0,st,i+1,max,result,left-1,right);
		}
	 	if(right>0){
			add(str,1,st,i+1,max,result,left,right-1);
		}
	}
}
