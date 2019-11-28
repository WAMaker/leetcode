class Solution:
    def permute(self, nums: List[int]) -> List[List[int]]:
        res = []
        def backtrack(nums: List[int], pre: List[int]):
            if not nums:
                res.append(pre)
                return
            for i, n in enumerate(nums):
                backtrack(nums[:i] + nums[i + 1:], pre + [n])
        backtrack(nums, [])
        return res