class Solution:
    def jobScheduling(self, startTime: List[int], endTime: List[int], profit: List[int]) -> int:
        jobs = sorted(zip(startTime, endTime, profit), key=lambda x: x[1])
        dp = [(0, 0)]
        
        def bise(res: list, target: int) -> int:
            l, r = 0, len(res) - 1
            while l <= r:
                m = l + (r - l) // 2
                if res[m][0] > target:
                    r = m - 1
                elif res[m][0] == target:
                    return m
                else:
                    l = m + 1
            return r
        
        for st, et, pt in jobs:
            index = bise(dp, st)
            if dp[index][1] + pt > dp[-1][1]:
                dp.append((et, dp[index][1] + pt))

        return dp[-1][1]