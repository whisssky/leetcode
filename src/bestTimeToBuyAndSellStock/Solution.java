package bestTimeToBuyAndSellStock;

//https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock/


public class Solution {

	public int maxProfit(int[] prices) {
		if(prices.length==0 ||prices.length==1){
			return 0;
		}
		int[] dp = new int[prices.length];
		int minPrice = prices[0];
		for(int i=1;i<prices.length;i++){
			dp[i] = Math.max(dp[i-1],prices[i]-minPrice);
			minPrice = Math.min(minPrice,prices[i]);
		}
		return dp[prices.length-1];
	}
}
