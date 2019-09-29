class Solution:
    def findDuplicate(self, nums: List[int]) -> int:
        q, s = nums[0], nums[0]
        while True:
            q = nums[nums[q]]
            s = nums[s]
            if q == s:
                break
        q = nums[0]
        while q != s:
            q = nums[q]
            s = nums[s]
        return q