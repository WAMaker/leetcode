class Solution:
    def subsets(self, nums: List[int]) -> List[List[int]]:
        res, n = [], len(nums)
        val = 1 << n

        for i in range(val):
            ret = []
            for j in range(n):
                if i >> j & 1:
                    ret.append(nums[j])
            res.append(ret)

        return res