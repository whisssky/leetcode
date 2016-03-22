package expressionMatching;

import java.util.Timer;

/**
 * 
Implement regular expression matching with support for '.' and '*'.
'.' Matches any single character.
'*' Matches zero or more of the preceding element.
The matching should cover the entire input string (not partial).
The function prototype should be:
bool isMatch(const char *s, const char *p)
Some examples:
isMatch("aa","a") → false
isMatch("aa","aa") → true
isMatch("aaa","aa") → false
isMatch("aa", "a*") → true
isMatch("aa", ".*") → true
isMatch("ab", ".*") → true
isMatch("aab", "c*a*b") → true
 * @author whisssky
 *
 */
public class Solution {

	
	public boolean isMatch(String s, String p) {
	    if (p.isEmpty()) {
	        return s.isEmpty();
	    }

	    if (p.length() == 1 || p.charAt(1) != '*') {
	        if (s.isEmpty() || (p.charAt(0) != '.' && p.charAt(0) != s.charAt(0))) {
	            return false;
	        } else {
	            return isMatch(s.substring(1), p.substring(1));
	        }
	    }

	    //P.length() >=2
	    while (!s.isEmpty() && (s.charAt(0) == p.charAt(0) || p.charAt(0) == '.')) {  
	        if (isMatch(s, p.substring(2))) { 
	            return true;                     
	        }                                    
	        s = s.substring(1);
	    }

	    return isMatch(s, p.substring(2));
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Solution a = new Solution();
		long starTime=System.currentTimeMillis();
		System.out.println(a.isMatch("aaaaaaaaaaaaab","a*a*a*a*a*a*a*a*a*a*c"));
		long endTIme = System.currentTimeMillis();
		System.out.println(endTIme - starTime);

	}

}
