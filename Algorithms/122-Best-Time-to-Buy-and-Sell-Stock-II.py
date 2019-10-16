class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        if len(prices) == 0:
            return 0
        dp_i_0, dp_i_1 = 0, float('-inf')
        for price in prices:
            tmp = dp_i_0
            dp_i_0 = max(dp_i_0, dp_i_1 + price)
            dp_i_1 = max(dp_i_1, tmp - price)
        return dp_i_0