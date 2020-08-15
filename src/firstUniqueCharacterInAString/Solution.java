package firstUniqueCharacterInAString;

//https://leetcode-cn.com/problems/first-unique-character-in-a-string/

import java.util.HashMap;

public class Solution {

	public int firstUniqChar(String s) {

		HashMap<Character,Integer> traversal = new HashMap();
		char[] chars = s.toCharArray();
		for(Character c : chars){
			if(traversal.containsKey(c)){
				traversal.put(c,traversal.get(c)+1);
			}
			else{
				traversal.put(c,1);
			}
		}
		for(int i=0;i<chars.length;i++){
			if(traversal.get(chars[i])==1){
				return i;
			}
		}
		return -1;
	}
}
