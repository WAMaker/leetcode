class Solution:
    def canJump(self, nums: List[int]) -> bool:
        max_step, steps = 0, len(nums)
        for i in range(steps):
            if i > max_step:
                return False
            max_step = max(max_step, i + nums[i])
            if max_step >= steps:
                return True
        return True