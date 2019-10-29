class Solution:
    def containsNearbyAlmostDuplicate(self, nums: List[int], k: int, t: int) -> bool:
        sorted_nums = sorted([(v, i) for (i, v) in enumerate(nums)])
        for i in range(1, len(nums)):
            j = i - 1
            while j >= 0 and abs(sorted_nums[i][0] - sorted_nums[j][0]) <= t:
                if abs(sorted_nums[i][1] - sorted_nums[j][1]) <= k:
                    return True
                j -= 1
        return False