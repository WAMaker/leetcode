class Solution:
    def superEggDrop(self, K: int, N: int) -> int:
        memo = {}

        def dp(K: int, N: int) -> int:
            if K == 1:
                return N
            if not N:
                return 0
            if (K, N) in memo:
                return memo[(K, N)]
            
            l, r = 1, N
            while l + 1 < r:
                m = l + ((r - l) >> 1)
                t1 = dp(K, N - m)
                t2 = dp(K - 1, m - 1)
                if t1 < t2:
                    r = m
                elif t1 > t2:
                    l = m
                else:
                    l = r = m

            res = max(dp(K, N - l), dp(K - 1, l - 1)) + 1

            memo[(K, N)] = res
            return res

        return dp(K, N)