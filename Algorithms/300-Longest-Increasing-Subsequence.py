# 动归 + 二分
# 思路来自 https://leetcode-cn.com/problems/longest-increasing-subsequence/solution/zui-chang-shang-sheng-zi-xu-lie-dong-tai-gui-hua-2/
class Solution:
    def lengthOfLIS(self, nums: List[int]) -> int:
        tails, res = [0] * len(nums), 0
        for num in nums:
            l, r = 0, res
            while l < r:
                m = l + (r - l) // 2
                if tails[m] < num:
                    l = m + 1
                else:
                    r = m
            tails[r] = num
            if r == res:
                res += 1
        return res