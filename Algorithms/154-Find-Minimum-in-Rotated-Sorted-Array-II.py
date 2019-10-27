class Solution:
    def findMin(self, nums: List[int]) -> int:
        l, r = 0, len(nums) - 1
        while l < r and nums[r] == nums[l]:
            r -= 1
        if nums[r] > nums[l]:
            return nums[l]
        
        while l + 1 < r:
            m = l + (r - l) // 2
            if nums[m] >= nums[l]:
                l = m
            else:
                r = m
            
        return nums[r]