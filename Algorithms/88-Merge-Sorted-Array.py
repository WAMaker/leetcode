class Solution:
    def merge(self, nums1: List[int], m: int, nums2: List[int], n: int) -> None:
        """
        Do not return anything, modify nums1 in-place instead.
        """
        cur = m + n - 1
        cur1, cur2 = m - 1, n - 1
        while cur1 >= 0 and cur2 >= 0:
            if nums1[cur1] > nums2[cur2]:
                nums1[cur] = nums1[cur1]
                cur1 -= 1
            else:
                nums1[cur] = nums2[cur2]
                cur2 -= 1
            cur -= 1
        nums1[:cur2 + 1] = nums2[:cur2 + 1]