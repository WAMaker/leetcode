class Solution:
    def rob(self, nums: List[int]) -> int:
        if not nums:
            return 0
        count = len(nums)
        if count < 2:
            return nums[0]
        def dp(nums: List[int]) -> int:
            cur, pre = 0, 0
            for num in nums:
                cur, pre = max(pre + num, cur), cur
            return cur
        return max(dp(nums[1:]), dp(nums[:-1]))