class Solution:
    def cuttingRope(self, n: int) -> int:
        mp = {2: 1, 3: 2, 4: 4}
        if n in mp:
            return mp[n]
        res = 1
        while n:
            if n <= 4:
                res *= n
                n -= n
            else:
                res *= 3
                n -= 3
        return res % 1000000007