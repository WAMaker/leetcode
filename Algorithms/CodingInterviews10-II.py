class Solution:
    def numWays(self, n: int) -> int:
        if n == 0 or n == 1:
            return 1
        
        pre, ppre = 1, 1
        while n - 2:
            pre, ppre = pre + ppre, pre
            n -= 1
        
        return (pre + ppre) % 1000000007