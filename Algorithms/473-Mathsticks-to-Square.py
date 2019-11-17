class Solution:
    def makesquare(self, nums: List[int]) -> bool:
        tot = sum(nums)
        if tot % 4:
            return False
        length = tot // 4
        used = [False] * len(nums)
        nums = list(reversed(sorted(nums)))
        for i in range(3):
            if self.dfs(nums, used, length, 0):
                continue
            else:
                return False
        return True
    
    def dfs(self, nums: List[int], used: List[bool], left: int, idx: int) -> bool:
        for i in range(idx, len(nums)):
            if used[i] or nums[i] > left:
                continue
            used[i] = True
            if nums[i] == left:
                return True
            if self.dfs(nums, used, left - nums[i], i + 1):
                return True
            used[i] = False
        return False