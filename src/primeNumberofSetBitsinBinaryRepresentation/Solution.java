package primeNumberofSetBitsinBinaryRepresentation;

//https://leetcode-cn.com/problems/prime-number-of-set-bits-in-binary-representation/

public class Solution {

	public int countPrimeSetBits(int L, int R) {

		int count = 0;
		for(int i=L;i<=R;i++){
			int bit = computBit(i);
			if(isZ(bit)){
				count++;
			}
		}
		return count;
	}

	public int computBit(int n){
		int count = 0;
		while(n>0){
			if(n%2==1){
				count++;
			}
			n = n/2;
		}
		return count;
	}

	public boolean isZ(int n){
		if(n==0 || n==1){
			return false;
		}
		for(int i=2;i<=n/2;i++){
			if(n%i==0){
				return false;
			}
		}
		return true;
	}
}
