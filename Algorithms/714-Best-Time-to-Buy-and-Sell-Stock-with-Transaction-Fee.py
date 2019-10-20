class Solution:
    def maxProfit(self, prices: List[int], fee: int) -> int:
        if not len(prices):
            return 0
        dp_i_0, dp_i_1 = 0, float('-inf')
        for p in prices:
            tmp = dp_i_0
            dp_i_0 = max(dp_i_0, dp_i_1 + p - fee)
            dp_i_1 = max(dp_i_1, tmp - p)
        return dp_i_0