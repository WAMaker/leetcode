class Solution:
    def canPartition(self, nums: List[int]) -> bool:
        tot = sum(nums)
        if tot & 1:
            return False

        avg = tot >> 1
        dp = [False] * (avg + 1)
        dp[0] = True

        for num in nums:
            for i in range(avg, num - 1, -1):
                dp[i] = dp[i] or dp[i - num]
            if dp[-1]:
                return True

        return False